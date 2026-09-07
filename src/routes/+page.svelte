<script lang="ts">
	import Hero from '$lib/components/landing/Hero.svelte';
	import Features from '$lib/components/landing/Features.svelte';
	import CTASection from '$lib/components/landing/CTASection.svelte';
	import Pricing from '$lib/components/landing/Pricing.svelte';
	import FAQ from '$lib/components/landing/FAQ.svelte';
</script>

<svelte:head>
	<title>Roomy — Your community needs its own space</title>
	<meta
		name="description"
		content="Roomy is an open platform for cozy communities. No ads, no selling your data, no lock in."
	/>
</svelte:head>

<Hero />
<Features />
<CTASection />
<Pricing />
<FAQ />
