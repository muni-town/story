<script lang="ts">
	const faqs: { q: string; a: string }[] = [
		{
			q: 'Does Roomy support private spaces?',
			a: "Yes! You can create invite-only spaces. We don't yet support media uploads in private spaces — that's coming soon."
		},
		{
			q: 'Is Roomy encrypted?',
			a: 'No, but it\'s something we would very much like to build with your support. If we do, it will be based on some variant of <a href="https://www.ietf.org/archive/id/draft-ietf-mls-architecture-12.html" target="_blank" rel="noopener noreferrer">MLS</a>. In the meantime please check out our friends at <a href="https://www.germnetwork.com/" target="_blank" rel="noopener noreferrer">Germ</a>.'
		},
		{
			q: 'Can I self-host Roomy?',
			a: 'Yes, but there is work to do on a few fronts to make this simpler. The easiest starting place for now is to host your own client — and hack on it too, if you want.'
		},
		{
			q: 'Where is my data stored?',
			a: 'Right now, primarily on our server. We\'re in the process of moving to a fully <a href="https://atproto.com/" target="_blank" rel="noopener noreferrer">ATProto</a>-based system as permissioned data gets rolled out. What this will enable is every user having control over the hosting of their own messages and media, with admins having access to the full space archive. Users signing up with us have their data on our personal data server, but can move it elsewhere whenever they like.'
		},
		{
			q: 'Do I need a Bluesky account?',
			a: 'No. You can sign up directly on Roomy. If you do have an existing Bluesky account (or other Atmosphere account), you can use that to keep your data in one place.'
		},
		{
			q: 'What is the Atmosphere?',
			a: 'The ecosystem of apps built around AT Protocol, which exists to put users in control of their data instead of monopoly social media companies — Bluesky is the biggest example of such an app.'
		},
		{
			q: 'Who makes Roomy?',
			a: 'Three of us at the core — Erlend, Zicklag and Meri — as well as a crew of other casual and community contributors. We like to hang out in a space called <a href="https://roomy.space/did:plc:4moccs43r5v2xzkynae3xk2u" target="_blank" rel="noopener noreferrer">Muni Town</a>, which is a community of people who care about making the web better and more empowering for humans.'
		},
		{
			q: 'Can I contribute?',
			a: 'Yes! Join <a href="https://roomy.space/did:plc:4moccs43r5v2xzkynae3xk2u" target="_blank" rel="noopener noreferrer">Muni Town</a> or <a href="https://roomy.space/did:plc:gnwy2zbm3hu4gfdawzxmpb2s" target="_blank" rel="noopener noreferrer">Roomy Space</a> and chat to us about what you\'re interested in working on. If you\'re a dev, please chat to us in there before making any big PRs. You can find our code on <a href="https://github.com/muni-town/roomy" target="_blank" rel="noopener noreferrer">Github</a> or <a href="https://tangled.org/roomy.space/roomy" target="_blank" rel="noopener noreferrer">Tangled</a>.'
		}
	];

	let open = $state<number | null>(0);
</script>

<section class="faq grid-layout" aria-labelledby="faq-heading">
	<h2 id="faq-heading">Frequently asked questions</h2>

	<ul>
		{#each faqs as item, i (item.q)}
			<li>
				<h3>
					<button
						type="button"
						aria-expanded={open === i}
						aria-controls="faq-panel-{i}"
						onclick={() => (open = open === i ? null : i)}
					>
						{item.q}
						<span class="indicator" aria-hidden="true">{open === i ? '–' : '+'}</span>
					</button>
				</h3>
				{#if open === i}
					<div class="panel" id="faq-panel-{i}">
						<p>{@html item.a}</p>
					</div>
				{/if}
			</li>
		{/each}
	</ul>
</section>

<style>
	.faq {
		margin-top: 6rem;
		margin-bottom: 4rem;
	}

	h2 {
		font-size: var(--text-step-4);
		margin-inline: auto;
		text-align: center;
	}

	ul {
		list-style: none;
		margin: 2.5rem 0 0;
		padding: 0;
		display: grid;
		gap: 1rem;
		max-width: 44rem;
		margin-inline: auto;
		width: 100%;
	}

	li {
		background: var(--card);
		border: 1px solid var(--brown);
		border-radius: 12px;
		overflow: hidden;
	}

	h3 {
		margin: 0;
	}

	button {
		width: 100%;
		display: flex;
		align-items: center;
		justify-content: space-between;
		gap: 1rem;
		text-align: left;
		background: none;
		border: none;
		padding: 1.25rem 1.5rem;
		font-family: var(--font-serif);
		font-size: var(--text-step-1);
		font-weight: 500;
		color: var(--brown);
		cursor: pointer;
	}

	.indicator {
		font-family: var(--font-sans);
		font-weight: 400;
		flex-shrink: 0;
	}

	.panel p {
		margin: 0;
		padding: 0 1.5rem 1.5rem;
		font-size: var(--text-step-0);
		line-height: 1.5;
	}
</style>
