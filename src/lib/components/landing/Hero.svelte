<script lang="ts">
	import { resolve } from '$app/paths';
	import roomyCircle from '$lib/assets/roomy-circle.png?enhanced';
	import roomy1 from '$lib/assets/roomy-1.png?enhanced';
	import roomy2 from '$lib/assets/roomy-2.png?enhanced';
	import roomy3 from '$lib/assets/roomy-3.png?enhanced';

	const slides = [
		{ src: roomy1, alt: 'Roomy app showing the AtmosphereConf community sidebar and chat feed' },
		{ src: roomy2, alt: 'Roomy app showing threads view' },
		{ src: roomy3, alt: 'Roomy app showing a community space' }
	];

	let current = $state(0);

	$effect(() => {
		const interval = setInterval(() => {
			current = (current + 1) % slides.length;
		}, 5000);
		return () => clearInterval(interval);
	});
</script>

<header class="header">
	<div class="spacer"></div>
	<a href={resolve('/')} class="wordmark">Roomy</a>
	<a
		href="https://roomy.space"
		target="_blank"
		rel="noopener noreferrer"
		class="logo"
		aria-label="Roomy home"
	>
		<enhanced:img src={roomyCircle} alt="Roomy logo" />
	</a>
</header>

<div class="hero">
	<h1>Your community needs its own space.</h1>

	<div class="carousel">
		{#each slides as slide, i (slide.src)}
			<div class="slide" class:active={i === current} aria-hidden={i !== current}>
				<enhanced:img src={slide.src} alt={slide.alt} />
			</div>
		{/each}
	</div>

	<div class="dots" role="tablist" aria-label="Screenshots">
		{#each [0, 1, 2] as i (i)}
			<button
				type="button"
				role="tab"
				aria-selected={i === current}
				aria-label={'Screenshot ' + (i + 1)}
				class="dot"
				class:active={i === current}
				onclick={() => (current = i)}
			></button>
		{/each}
	</div>
</div>

<style>
	.header {
		display: flex;
		align-items: center;
		justify-content: flex-end;
		gap: 0.75rem;
		max-width: 64rem;
		margin-inline: auto;
		padding: 1.25rem 1rem;
	}

	.spacer {
		flex: 1;
	}

	.wordmark {
		font-family: var(--font-serif);
		font-size: var(--text-step-2);
		font-weight: 700;
		color: var(--brown);
		text-decoration: none;
	}

	.logo :global(img) {
		width: 2.125rem;
		height: 2.125rem;
		border-radius: 9999px;
		display: block;
	}

	.hero {
		max-width: 64rem;
		margin-inline: auto;
		padding: 4.5rem 1rem 0;
	}

	h1 {
		font-family: var(--font-serif);
		font-size: var(--text-step-5);
		line-height: 1.1;
		text-wrap: balance;
		text-align: center;
		margin: 0 0 2.5rem;
	}

	.carousel {
		position: relative;
		max-width: 49.5rem;
		margin-inline: auto;
	}

	.slide {
		position: absolute;
		inset: 0;
		opacity: 0;
		transition: opacity 1.2s ease;
		pointer-events: none;
	}

	.slide.active {
		position: relative;
		opacity: 1;
		pointer-events: auto;
	}

	.slide :global(img) {
		width: 100%;
		border-radius: 12px;
		box-shadow: 4px 5px 1px rgba(0, 0, 0, 0.2);
	}

	.dots {
		display: flex;
		justify-content: center;
		gap: 0.5rem;
		padding: 1rem 0 0;
	}

	.dot {
		width: 0.625rem;
		height: 0.625rem;
		border-radius: 9999px;
		border: none;
		background: #e8c9a0;
		padding: 0;
		cursor: pointer;
	}

	.dot.active {
		background: #d9a75e;
	}
</style>
