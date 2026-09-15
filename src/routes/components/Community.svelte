<script lang="ts">
    import { currentTheme } from "../themes";

	// const youtubeChannels: string[] = [
	// 	"theprimeagen",
	// 	"ThePrimeTimeagen",
	// 	"TsodingDaily",
	// 	"lowlevellearning",
	// 	"DistroTube",
	// 	"Fireship",
	// 	"SebastianLague",
	// 	"Kofybrek",
	// 	"jdh",
	// 	"TheCodingTrain",
	// 	"MichaelMJD"
	// ];
</script>

<section id="community" style="--foreground: {$currentTheme.foreground}; --orange: {$currentTheme.orange}; --background2: {$currentTheme.background2}; --yellow: {$currentTheme.yellow}; --purple: {$currentTheme.purple};">
	<h2>&lt;<span>Community</span>&gt;</h2>
	<ul>
		<li><a target="_blank" href="https://lunarflame.dev/">LunarFlame Studios</a> - Independant game dev team responsible for  the endlessly entertaining <a target="_blank" href="https://lunarflame.dev/projects/project-leo">Project Leo</a></li>
		<li><a target="_blank" href="https://squi.bid">Squibid</a> - Personal projects, blogs from the one, the only, Squibid</li>
		<li><a target="_blank" href="https://www.onocu.com">_Orange</a> - Three oranges in a trench coat, and great tea connoisseur</li>
		<li><a target="_blank" href="https://raw-footage.art">lafayette°</a> - Electric classmate and <a target="_blank" href="https://www.instagram.com/lafayette.degrees/">graphic design hobbyist</a></li>
		<li><a target="_blank" href="https://andrynasief.github.io/andrynasief/">bomba</a> - Egyptian React dev... nuff said</li>
	</ul>
</section>


<style>
	section {
		color: var(--foreground);
		margin-inline: 15%;
	}

	h2 {
		margin-top: 2rem;
		font-size: 5rem;
	}

	ul {
		margin-inline: 5rem;
		list-style: none;
	}

	li {
		margin-block: 0.5rem;
	}

	span {
		color: var(--purple);
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

		li {
			text-indent: 2rem;
		}
	}
</style>
