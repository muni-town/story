#!/usr/bin/env bash
#
# dev-container.sh — run the Roomy dev server inside a Node container.
#
# Why this exists: node_modules installed on macOS contains darwin native
# binaries (rolldown, tailwindcss-oxide, sharp, lightningcss), which a Linux
# container cannot load. This script removes any stale node_modules, installs
# dependencies inside a node:24 container (matching CI), then starts the Vite
# dev server with the port mapped back to the host.
#
# Usage:
#   ./dev-container.sh              # install if needed, then start dev server
#   ./dev-container.sh --reinstall  # force a clean reinstall
#   ./dev-container.sh --port 6000  # map a different host port
#
# The site is served at http://localhost:5173 (or $PORT). Ctrl+C stops the
# container. node_modules stays container-compatible, so later runs skip the
# install. If you run `pnpm install` on the host again, the script detects the
# darwin binaries and reinstalls on the next run.

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE="node:24"
PORT="${PORT:-5173}"
FORCE_REINSTALL=0

usage() {
	cat <<'EOF'
Usage: ./dev-container.sh [--reinstall] [--port PORT]

Runs the dev server in a node:24 container, reinstalling dependencies first
when node_modules is missing, stale, or contains macOS (darwin) binaries.

Options:
  --reinstall   Remove node_modules and reinstall from scratch
  --port PORT   Host port to expose the dev server on (default: 5173)
  -h, --help    Show this help
EOF
}

while [ $# -gt 0 ]; do
	case "$1" in
		--reinstall) FORCE_REINSTALL=1 ;;
		--port) PORT="${2:?--port requires a value}"; shift ;;
		-h|--help) usage; exit 0 ;;
		*) echo "unknown argument: $1" >&2; usage >&2; exit 1 ;;
	esac
	shift
done

command -v docker >/dev/null 2>&1 || { echo "error: docker not found on PATH" >&2; exit 1; }

# Decide whether node_modules needs a container-side (re)install.
needs_install=0
if [ ! -d "$PROJECT_DIR/node_modules" ] || [ -z "$(ls -A "$PROJECT_DIR/node_modules" 2>/dev/null)" ]; then
	needs_install=1
elif find "$PROJECT_DIR/node_modules" -name '*.node' -path '*darwin*' 2>/dev/null | grep -q .; then
	needs_install=1
elif [ "$PROJECT_DIR/package.json" -nt "$PROJECT_DIR/node_modules" ] || \
     [ "$PROJECT_DIR/pnpm-lock.yaml" -nt "$PROJECT_DIR/node_modules" ]; then
	needs_install=1
fi
[ "$FORCE_REINSTALL" = 1 ] && needs_install=1

# Interactive flags only when attached to a terminal.
TTY_FLAGS=()
[ -t 0 ] && TTY_FLAGS=(-it)

# Persistent pnpm/corepack cache, mounted over /tmp so any uid can write it.
STORE_VOLUME="$(basename "$PROJECT_DIR")-pnpm-store"

if [ "$needs_install" = 1 ]; then
	echo "==> Removing stale node_modules..."
	rm -rf "$PROJECT_DIR/node_modules"
	echo "==> Installing dependencies inside the container (Linux binaries)..."
	docker run --rm "${TTY_FLAGS[@]}" \
		-v "$PROJECT_DIR:/app" -w /app \
		-v "$STORE_VOLUME:/tmp" -e HOME=/tmp \
		-u "$(id -u):$(id -g)" \
		"$IMAGE" \
		bash -c 'corepack pnpm install'
	echo "==> node_modules is now container-compatible."
else
	echo "==> node_modules looks container-compatible; skipping install."
fi

echo "==> Starting dev server at http://localhost:$PORT"
exec docker run --rm --init "${TTY_FLAGS[@]}" \
	-v "$PROJECT_DIR:/app" -w /app \
	-v "$STORE_VOLUME:/tmp" -e HOME=/tmp \
	-u "$(id -u):$(id -g)" \
	-p "$PORT:5173" \
	"$IMAGE" \
	bash -c 'corepack pnpm dev --host 0.0.0.0 --port 5173'
