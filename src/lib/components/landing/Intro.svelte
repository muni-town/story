<script lang="ts">
	import Image from '$lib/components/ui/Image.svelte';

	import space_channel from '$lib/assets/space_channel.png';
	import ss from '$lib/assets/ss_paint.webp';
</script>

<div class="grid-layout mt-10">
	<p>
		Humans are social creatures. We crave bonding and social connections. In our digital world, our
		common social space is a campfire, which is the <i>group chat</i>.
	</p>

	<p>It starts out something like this:</p>
</div>

<Image
	src={space_channel}
	class="crispy mx-auto"
	alt="two sections with small section on left being 'space' and remaining space taken by 'channel' section."
/>

<div class="grid-layout">
	<p>That's roughly what it has looked like since the 90's.</p>

	<p>
		Roomy uses a familiar structure because we believe group chat is the minimum-viable-everything
		of community building.
	</p>

	<p>
		Chatting is like a pencil sketch; we express the first thought that comes to mind without
		dwelling on straightened lines.
	</p>
</div>

<Image
	src={ss}
	class="drop vanilla"
	caption="Building for and <i>with</i> communities."
	alt="chat interface of roomy"
/>

<div class="grid-layout">
	<p class="text-step-0 mb-0 ">
		Narrated by
		<a href="https://jaydip.me" target="_blank" rel="noopener noreferrer" class="text-pink"> Jaydip Sanghani </a>
	</p>
</div>
