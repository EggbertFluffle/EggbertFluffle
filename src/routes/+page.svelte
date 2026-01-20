<script lang="ts">
    import { currentTheme } from "./themes.js";

    import Hero from "./components/Hero.svelte";
    import WhoAmI from "./components/WhoAmI.svelte";
    import Projects from "./components/Projects.svelte";
    import Blogs from "./components/Blogs.svelte";
    import Contact from "./components/Contact.svelte";
    import Community from "./components/Community.svelte";
    import ThemePicker from "./components/ThemePicker.svelte";
</script>

<ThemePicker />
<Hero />
<WhoAmI/>
<Projects />
<Blogs />
<Community />
<Contact />
