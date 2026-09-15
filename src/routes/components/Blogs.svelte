<script lang="ts">
	import { currentTheme } from "../themes.js";

	let blogs = [
		{
			date: "07/10/2026",
			raw: "/blogs/the_perfect_frame",
			name: "The Perfect Frame",
		},
		{
			date: "04/07/2026",
			raw: "/blogs/presentations_in_typst",
			name: "Presentations in Typst",
		},
		{
			date: "03/21/2026",
			raw: "/blogs/a_love_letter_to_lua_tables",
			name: "A Love Letter to Lua Tables",
		},
		{
			date: "12/26/2025",
			raw: "/blogs/server_client_architecture",
			name: "In Praise of the Client Server Architecture"
		},
		{
			date: "11/27/2025",
			raw: "/blogs/mezzaluna:_the_penultimate_step",
			name: "Mezzaluna: The Penultimate Step"
		},
		{
			date: "10/14/2025",
			raw: "/blogs/neovim_configuration_an_empirical_analysis",
			name: "Neovim Configuration: An Empirical Analysis"
		},
		{
			date: "10/07/2025",
			raw: "/blogs/oh_zig_my_beloved",
			name: "Oh Zig me Beloved"
		},
		{
			date: "02/11/2025",
			raw: "/blogs/hello_is_anyone_there",
			name: "Hello? Is anyone there?"
		},
		{
			date: "12/19/2024",
			raw: "/blogs/advent_of_code:_how_its_going",
			name: "Advent of Code: How its Going"
		},
		{
			date: "11/20/2024",
			raw: "/blogs/get_ready_for_advent_of_code",
			name: "Get Ready for Advent of Code"
		},
		{
			date: "09/08/2024",
			raw: "/blogs/linux_on_a_laptop_pt2",
			name: "Linux on a Laptop: My Experience (pt.2)"
		},
		{
			date: "06/02/2024",
			raw: "/blogs/linux_on_a_laptop_pt1",
			name: "Linux on a Laptop: My Experience (pt.1)"
		},
		{
			date: "05/09/2024",
			raw: "/blogs/minecraft_clone",
			name: "Minecraft Clone (maybe pt.1)"
		},
		{
			date: "03/22/2024",
			raw: "/blogs/neocities",
			name: "Neocities"
		},
		{
			date: "02/19/2024",
			raw: "/blogs/wolfenstein_terminal_raycaster",
			name: "Wolfenstein-style Terminal Raycast Renderer"
		},
		{
			date: "01/14/2024",
			raw: "/blogs/introduction",
			name: "Introduction"
		},
		{
			date: "10/14/2023",
			raw: "/blogs/terminal_based_3d_graphics",
			name: "Terminal Based 3D Graphics"
		}
	];

	let expanded = false;
</script>

<section id="blog" style="--foreground: {$currentTheme.foreground}; --orange: {$currentTheme.orange}; --background2: {$currentTheme.background2}; --yellow: {$currentTheme.yellow};">
	<h2>&lt;<span>Blog</span>&gt;</h2>
	<ul>
		{#each blogs.slice(0, expanded ? blogs.length : 7) as blog (blog.raw)}
			<li>{blog.date}: <a href={blog.raw}>{blog.name}</a></li>
		{/each}
		<a on:click={() => { expanded = !expanded }}>{expanded ? "See less" : "See more"}</a>
	</ul>
</section>


<style>
	section{
		color: var(--foreground);
		margin-inline: 15%;
	}

	ul {
		margin-inline: 5rem;
		list-style: none;
		
	}

	ul > a {
		cursor: pointer;
		font-size: 1.25rem;
	}

	ul > a:hover {
		text-decoration: underline;
	}

	li {
		margin-block: 0.5rem;
	}

	h2 {
		margin-top: 2rem;
		font-size: 5rem;
	}

	span {
		color: var(--orange);
	}

	a {
		color: var(--yellow);
	}

	a:visited {
		color: var(--orange);
	}

	@media (max-width: 666px) {
		section {
			margin-inline: 0px;
		}

		h2 {
			margin-top: 2rem;
			font-size: 3rem;
			text-align: center;
		}

		ul {
			margin-inline: 2rem;
		}
	}
</style>
