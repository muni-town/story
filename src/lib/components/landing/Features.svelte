<script lang="ts">
	import jdThoughts from '$lib/assets/jd-thoughts.png?enhanced';
	import jdDeer from '$lib/assets/jd-deer.png?enhanced';
	import jdGroup from '$lib/assets/jd-group.png?enhanced';
	import Button from '$lib/components/ui/Button.svelte';
</script>

<div class="tagline">
	<h2>Roomy is an open platform for cozy communities</h2>
	<p>No ads, no selling your data, no lock in.</p>
	<p>A step towards resilience.</p>
<Button href="https://roomy.space" class="w-full max-w-80 mx-auto py-3 no-underline mt-8"
		>Open Roomy</Button
	>
</div>


<section class="feature grid-layout">
	<div class="copy">
		<h2>A tool for collective thinking</h2>
		<p>
			Organise and remix conversations into searchable threads with message forwarding and moving
		</p>
	</div>
	<enhanced:img
		class="alpha"
		src={jdThoughts}
		alt="diagram of a thought becoming chats, gathered into threads and condensed into articles"
	/>
</section>

<section class="feature flip grid-layout">
	<div class="copy">
		<h2>Migrate from Discord at your pace</h2>
		<p>
			Install the bridge on your Discord server for bidirectional sync, so you can try Roomy without
			missing a beat
		</p>
	</div>
	<enhanced:img class="alpha" src={jdDeer} alt="line drawing of a deer with flowers" />
</section>

<section class="feature grid-layout">
	<div class="copy">
		<h2>Built for interconnections</h2>
		<p>
			Roomy spaces are extensible and can federate channels with each other, creating intercommunal
			portals
		</p>
	</div>
	<enhanced:img
		class="alpha"
		src={jdGroup}
		alt="colourful scattered flower and star shapes connecting"
	/>
</section>

<style>
	.tagline {
		text-align: center;
		margin-top: 6rem;
	}

	.tagline h2 {
		font-size: var(--text-step-5);
		margin-inline: auto;
		line-height: 110%;
	}

	.tagline p {
		margin: 0;
	}

	.feature {
		margin-top: 7rem;
		align-items: center;
	}

	.feature h2 {
		font-size: var(--text-step-4);
	}

	@media (width >= 1024px) {
		.feature {
			--cols: 5fr 6fr;
		}

		.feature.flip .copy {
		    text-align: right;
			order: 2;

			h2 {
			    max-width: 400px;
				margin-left: auto;
			}
		}

		.feature :global(picture) {
			width: 100%;
		}
	}

	.feature :global(picture) {
		justify-self: center;
	}

	.feature :global(picture img) {
		max-width: 100%;
	}

	@media (width < 1024px) {
		.feature :global(picture:has(img.alpha)) {
			display: flex;
			justify-content: flex-end;
			width: fit-content;
			margin-left: auto;
		}

		.feature :global(picture:has(img.alpha) img) {
			max-width: min(31.25rem, 100%);
		}
	}

	.copy p {
		max-width: 30rem;
	}
</style>
