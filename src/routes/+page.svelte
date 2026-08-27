<script lang="ts">
	import Image from '$lib/components/ui/Image.svelte';

	import Atmosphere from '$lib/components/landing/Atmosphere.svelte';
	import Intro from '$lib/components/landing/Intro.svelte';
	import Structure from '$lib/components/landing/Structure.svelte';
	import CTA from '$lib/components/landing/CTA.svelte';

	import campfire from '$lib/assets/computer_lady.webp';
</script>

<div class="grid-layout">
	<Image
		src={campfire}
		class="crispy mt-4"
		alt="a lady typing on computer"
	/>
</div>

<Intro />
<Structure />
<Atmosphere />
<CTA/>
