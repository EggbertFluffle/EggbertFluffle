<h1 id="a-love-letter-to-lua-tables">A Love Letter to Lua Tables</h1>
<p>Have you ever seen a work of art so elegant it made you cry? Have you
ever regarded extreme simplicity with the utmost respect? If so, you
know <em>exactly</em> how I feel. In recent months I have been more
attentative to language details. This doesn’t only mean syntax, but
general handling and developer experience. When I say I have never met a
more immaculate language construction than the Lua table, I speak the
sincerest truth. If you have used Lua tables but don’t see the magic, or
haven’t used them and want in on it, I’m here to tell you everything you
need to know to love high programming art.</p>
<h2 id="table">┬──┬ (table)</h2>
<p>I don’t intend to explain the table at a basic level since that has
been done, and I don’t intend for this to be a tutorial. If you
<em>don’t</em> know how the Lua table works, you can look <a
href="https://www.lua.org/manual/5.4/manual.html#2.1">here</a>. Let’s
take a look at this lovely invention table first, I promise it’s love at
first sight. Here it is: <code>{"{"}}</code>. I KNOW, absolutely stunning.
Since they are associative arrays, Lua allows you to index a table with
<em><strong>any</strong></em> other type in the language. This goes
beyond the classing integer or string to include decimals, booleans,
functions, and even other tables. Some of you may have turned your heads
at the end, I did too, and to be honest I still don’t know why I would
index a table with either. When indexing with tables or functions, the
table is actually indexed with the pointer associated with the
index.</p>
<h2 id="jack-of-all-trades-master-of-all-trades">Jack of all trades,
master of all trades</h2>
<p>The beauty of tables lies in their environment. The table is the only
data structure present in Lua (unless you consider functions
collections). This means that the table has to pick up a lot of slack
and be good at wearing several hats. Luckily, the table’s hat collection
is quite expansive: arrays, hash maps, stacks, queues, linked lists,
trees, graphs, classes, vectors, and so many more.</p>
<p>Another great reason to love tables is they are largely the reason
for Lua’s impressively shallow learning curve. You only need to learn
the syntax for tables in order to understand nearly all of the language!
Not only is there only one language feature to learn, but it’s all that
Lua gives you. There’s no large standard library to memorize, thick
documentation to reference, or analysis paralysis when choosing a data
structure. The <a href="https://www.lua.org/about.html">Lua page</a>
itself describes the language as “provid(ing) meta-mechanisms for
implementing features, instead of providing a host of features
directly”.</p>
<h2 id="yeah.-and-what">Yeah. And what?</h2>
<p>Let’s take a step back to appreciate what Lua has done here. The
developers have created a successful and embeddable programming language
powering entire <a href="https://about.roblox.com/">game engines</a>, <a
href="https://en.wikipedia.org/wiki/Category:Lua_(programming_language)-scripted_video_games">modding
environments</a>, <a href="https://neovim.io/">text editors</a>, and <a
href="https://github.com/MezzalunaWM/Mezzaluna">Wayland compositors</a>.
At the center of all of these projects is the humble table, unassuming
containing with unprecedented power. It is not to be scoffed at, rather
hailed for being a radiant example of good and approachable language
design. By now you should understand what makes tables great. If you
don’t, I encourage you to spend some time with one. Get to know it, and
know it well. If you show the table appreciation, it will make your time
worth every second, repaying you many times over. To conclude, a
haiku.</p>
<hr />
<h3 id="title-beauty-incarnate---harrison-diambrosio">{"{"} title = “beauty
incarnate” } - Harrison DiAmbrosio</h3>
<p><em><em>elegant in form</em></em></p>
<p><em><em>index to a heart’s content</em></em></p>
<p><em><em>raise to high regard</em></em></p>
