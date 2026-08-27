<script lang="ts">
	import Image from '$lib/components/ui/Image.svelte';

	import thoughts from '$lib/assets/thoughts.png';
	import threads from '$lib/assets/threads.webp';
</script>

<div class="grid-layout mt-8">
	<h2>In search of structure</h2>

	<p>
		The thing about group chat is that it wants conversation to keep moving. It's like a river,
		always flowing forward.
	</p>

	<p>
		Structurally, old school forums just worked better for this reason. All of the relevant
		conversations were grouped together by topics listed orderly in index boards.
	</p>

	<p>
		Each conversation on forums is contained under a topic. This seemingly simple design choice
		curates info really nicely.
	</p>

	<p>
		Modern Discord is not meaningfully better at knowledge-management. For groups engaged in
		knowledge work, revisiting conversation is important.
	</p>

	<Image
		src={thoughts}
		class="crispy"
		caption="Thought starts the chain which creates a flourishing foray of plantlife."
		alt="thought is born. which in turn end up as conversation which being chats. we can gather this into an coherent block as 'threads'. this in turn helps us to compile down into condensed shapes such as article."
	/>

	<p>Thought starts the chain which creates a flourishing foray of plantlife.</p>

	<p>
		When larger spaces of discourse grow more complex, Roomy's UI opens up gradually, keeping
		everything orderly. We can simply create a thread and keep chatting.
	</p>
</div>

<Image
	class="drop"
	src={threads}
	caption="we're <i>proud</i> of this 🥹"
	alt="thread interface of roomy. a toggle at top allows quickly switch between chat and threads intuitively."
/>

<div class="grid-layout">
	<p>
		A few existing community apps exist in this paradigm already. Where Roomy differs is in being an
		atmospheric web application.
	</p>
</div>
