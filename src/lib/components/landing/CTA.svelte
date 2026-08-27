<script lang="ts">
	import Image from '$lib/components/ui/Image.svelte';
	import Button from '$lib/components/ui//Button.svelte';

	import deer from '$lib/assets/deer.png';
</script>

<div class="grid-layout">
	<Button href="https://roomy.space" class="w-full max-w-80 mx-auto py-3 mt-6 no-underline">
	Launch Roomy
	</Button>
</div>

<Image src={deer} class="mx-auto no-margin translate-y-1" alt="deer " />
