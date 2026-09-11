<script lang="ts">
	import Button from '$lib/components/ui/Button.svelte';

	const tiers = [
		{
			name: 'Free',
			cta: { label: 'Open Roomy', href: 'https://roomy.space' },
			features: [
				[{ text: 'All standard Roomy features' }],
				[{ text: 'Bridge Discord guild up to ' }, { text: '50 members', bold: true }],
				[{ text: 'Community support' }]
			]
		},
		{
			name: 'Pro',
			cta: { label: 'Sign Up', href: 'https://roomy.space' },
			features: [
				[{ text: 'Bridge Discord guild up to ' }, { text: '1000 members', bold: true }],
				[
					{ text: 'Access to ' },
					{ text: 'members area', bold: true },
					{ text: ' with chat-based staff support' }
				],
				[{ text: 'Help us survive as an open source community chat app!' }]
			],
			price: { old: '$60', current: '$30', per: '/month' }
		},
		{
			name: 'Custom',
			features: [
				[{ text: 'Bridge Discord guilds with ' }, { text: '100k+ members', bold: true }],
				[{ text: 'Priority support', bold: true }, { text: ' with migration, uptime' }],
				[{ text: 'Bespoke features and integrations' }]
			],
			cta: { label: 'Talk to us', href: 'mailto:hello@roomy.space' }
		}
	];
</script>

<div class="grid-layout pricing">
	<h2>A bridge for your community</h2>
	<p class="intro">
		Roomy is open source and our hosted instance is free to use. We also provide a Discord Bridge
		with a free tier, and you can subscribe to bridge bigger communities.
	</p>

	<div class="cards">
		{#each tiers as tier (tier.name)}
			<article class="card">
				<h3>{tier.name}</h3>
				<ul>
					{#each tier.features as feature (feature)}
					<li>
						<svg
							xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24"
							fill="none"
							stroke="currentColor"
							stroke-width="2.5"
							stroke-linecap="round"
							stroke-linejoin="round"
							aria-hidden="true"
						>
							<path d="M20 6 9 17l-5-5" />
						</svg>
						<span>
							{#each feature as part (part.text)}<span class:bold={part.bold}>{part.text}</span
								>{/each}
						</span>
					</li>
					{/each}
				</ul>
				{#if tier.price}
					<p class="price">
						<del>{tier.price.old}</del>
						<strong>{tier.price.current}</strong>
						<span>{tier.price.per}</span>
					</p>
				{/if}
				{#if tier.cta}
					<Button href={tier.cta.href} class="cta no-underline">
						{tier.cta.label}
						<svg
							xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24"
							fill="none"
							stroke="currentColor"
							stroke-width="2.5"
							stroke-linecap="round"
							stroke-linejoin="round"
							aria-hidden="true"
						>
							<path d="M5 12h14" />
							<path d="m12 5 7 7-7 7" />
						</svg>
					</Button>
				{/if}
			</article>
		{/each}
	</div>
</div>

<style>
	.pricing {
		text-align: center;
		margin-top: 6rem;
	}

	h2 {
		font-size: var(--text-step-5);
		margin-inline: auto;
	}

	.intro {
		max-width: 44rem;
		margin-inline: auto;
		font-family: var(--font-sans);
		font-size: var(--text-step-1);
	}

	.cards {
		display: grid;
		gap: 2rem;
		grid-template-columns: 1fr;
		margin-top: 3rem;
		max-width: 62rem;
		margin-inline: auto;
	}

	@media (width >= 768px) {
		.cards {
			grid-template-columns: repeat(3, 1fr);
			align-items: stretch;
		}
	}

	.card {
		background: var(--card);
		border: 1px solid var(--brown);
		border-radius: 12px;
		padding: 2rem 1.75rem 2.5rem;
		text-align: center;
		display: flex;
		flex-direction: column;
	}

	@media (width >= 768px) {
		.card {
			text-align: left;
		}
	}

	.card ul {
		margin-bottom: 2rem;
	}

	.card .price {
		margin-top: auto;
	}

	h3 {
		font-family: var(--font-serif);
		font-size: var(--text-step-3);
		text-align: center;
		margin: 0 0 1.5rem;
	}
	li {
		font-family: var(--font-sans);
		font-size: var(--text-step-0);
		line-height: 1.45;
		display: flex;
		align-items: flex-start;
		gap: 0.5rem;
	}

	li svg {
		flex-shrink: 0;
		width: 1rem;
		height: 1rem;
		margin-top: 0.2em;
		color: var(--pink);
	}

	ul {
		list-style: none;
		margin: 0;
		padding: 0;
		display: grid;
		gap: 1rem;
	}

	@media (width < 768px) {
		li {
			font-size: var(--text-step-1);
		}
	}

	li :global(span.bold) {
		font-weight: 700;
	}

	.card .price {
		margin: 0 0 1.5rem;
		text-align: center;
	}

	.price del {
		color: var(--brown);
		opacity: 0.55;
		font-family: var(--font-sans);
		margin-right: 0.5rem;
	}

	.price strong {
		font-size: var(--text-step-3);
	}

	.card :global(.cta) {
		margin-top: auto;
		align-self: center;
	}
</style>
