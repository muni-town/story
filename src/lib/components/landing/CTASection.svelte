<script lang="ts">
	import Button from '$lib/components/ui/Button.svelte';
</script>

<div class="grid-layout cta">
	<p>If you’re on Bluesky or the Atmosphere, you already have an account</p>
	<Button href="https://roomy.space" class="w-full max-w-80 mx-auto py-3 no-underline"
		>Launch Roomy</Button
	>
</div>

<style>
	.cta {
		text-align: center;
		margin-top: 6rem;
	}

	.cta p {
		max-width: 44rem;
		margin-inline: auto;
		font-size: var(--text-step-0);
		color: color-mix(in srgb, var(--brown) 70%, var(--bg));
	}
</style>
