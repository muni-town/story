<script lang="ts">
	import Image from '$lib/components/ui/Image.svelte';

	import data_platform from '$lib/assets/data_platform.png';
	import apps from '$lib/assets/apps.png';
	import group from '$lib/assets/group.png';
</script>

<div class="grid-layout mt-8">
	<h2>Welcome to the Atmosphere</h2>

	<p>
		A better way to understand this is how Big Tech handles our data. All of our data is tighly
		coupled to the platform.
	</p>
</div>

<Image
	src={apps}
	class="crispy mx-auto"
	alt="closed circles with famous social media apps, representing their nature of locking userdata at one place on their platform."
/>

<div class="grid-layout">
	<p>
		Now, imagine you stopped using your favorite microblogging platform and moved to a different
		one. It kept all your posts, pictures, and followers intact. That would be amazing, no?
	</p>
</div>

<Image
	src={data_platform}
	class="crispy mx-auto"
	alt="two groups, one is group of folks in a circle 'data' and other being 'platform' "
/>

<div class="grid-layout">
	<p>That's exactly what you can do using Bluesky, an atproto alternative with 45 Million users.</p>

	<p>
		Roomy aims to solve the problem that larger real-time communication platforms face: portable
		data that doesn't care about where you come from.
	</p>
</div>

<Image
	src={group}
	class="crispy mx-auto"
	alt="open nature of at-protocol allowing many apps to coexist and share their data from a single source."
/>

<div class="grid-layout">
	<p>
		Roomy gives you a way to design your community while tinkering with apps you like from the
		ecosystem, providing the tools to build and cultivate your community.
	</p>

	<p>Oh, and did we mention that you can use one account for all of this?</p>
</div>
