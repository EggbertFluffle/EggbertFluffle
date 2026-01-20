<script lang="ts">
	import { currentTheme } from "../themes.js";

	export let name: string;
	export let description: string;
	export let link: string;
</script>

<a href={link} target="_blank">
	<li class="entry">
		<h4>{name}</h4>
		<p>{description}</p>
	</li>
</a>

<style>
	a {
		text-decoration: none;
		margin-right: 0.25rem;
	}

	h4 {
		font-size: 1.75rem;
		text-align: left;
	}

	li {
		display: flex;	
		flex-direction: column;
		border: solid var(--foreground) 2px;
		padding: 0.75rem;
		color: var(--foreground);
	}

	p {
		text-decoration: none;
		font-size: 1.35rem;
		text-indent: 3rem;
		margin-left: 2rem;
	}

	@media (max-width: 666px) {
		h4 {
			font-size: 1.25rem;
		}

		p {
			margin-top: 1rem;
			margin-left: 1rem;
			font-size: 1rem;
		}
	}
</style>
