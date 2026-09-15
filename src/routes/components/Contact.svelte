<script>
    import { currentTheme } from "../themes";
</script>

<section id="contact" style="--foreground: {$currentTheme.foreground}; --orange: {$currentTheme.orange}; --background2: {$currentTheme.background2}; --yellow: {$currentTheme.yellow}; --cyan: {$currentTheme.cyan};">
	<h2>&lt;<span>Contact</span>&gt;</h2>
	<ul>
		<li>Resume: <a href="/HarrisonDiAmbrosio-Resume.pdf">HarrisonDiAmbrosio-Resume.pdf</a></li>
		<li>Github: <a href="https://github.com/EggbertFluffle/">EggbertFluffle</a></li>
		<li>E-Mail (personal): <a href="mailto:hdiambrosio@gmail.com">hdiambrosio@gmail.com</a></li>
		<li>E-Mail (school): <a href="mailto:hadiambrosio@wpi.edu">hadiambrosio@wpi.edu</a></li>
		<li>JabberID: eggbert@eggbert.xyz</li>
		<li>LinkedIn: <a href="https://www.linkedin.com/in/harrison-diambrosio-505443229/">Harrison DiAmbrosio</a></li>
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
		color: var(--cyan);
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
