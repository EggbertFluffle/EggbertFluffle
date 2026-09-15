<h1 id="presentations-in-typst">Presentations in Typst</h1>
<p>I recently made a presentation that I called “Clicks to Pix”. It was
a detailed guide on how information travels from a single keystroke over
USB to a computer. Then how the modern desktop stack is organized and
deals with the input. And finally, how the new outputs are generated and
rendered within the linux kernel over HDMI.</p>
<p>Regardless, I had previously made a presentation for the same club,
and used <a href="https://tools.suckless.org/sent/">sent</a> for slides.
It was a bit of a sad experience to put it lightly. It’s very walled in
and inflexible which is why I yearned for more.</p>
<h2 id="enter-typst">Enter Typst</h2>
<p>I had my eye on <a href="https://typst.app/home/">Typst</a> for a
while up until a while ago. Many many many theoretical computer science
and math classes later and I figured it was time to stop doing
everything by hand. In all honesty, I prefer to do my work by hand, but
it got to a point where I needed to make so many edits to my work, that
I was either running out of erasers or hand strength. Typst it was. The
decision wasn’t even hard. Briefly, while in class, I had the
displeasure of seeing my professor’s latex editor. I was mortified. The
<em>foul</em> overuse of backslashes devastated me. The typst tooling
was easy to get and use without much setup.</p>
<p>Obviously typst is great at typesetting documents. In the past couple
weeks, I rewrote my resume, and decided typst would be my medium. The
experience was great, leading me to ponder the prospect of presentations
in typst. I was pleasantly surprised.</p>
<h2 id="presentation-format">Presentation Format</h2>
<p>To begin the presentation all you need is one line:
<code>#set page("presentation-16-9")</code>. If you don’t use 16:9 you
can specify a custom size. For example, I used
<code>#set page(width: 340mm, height: 220mm)</code>. This just tells
typst how big each slide should be, as you can probably guess. This you
can use all the normal typst patterns to create the slides. The only
other gotcha is that you denote pagebreaks with
<code>#pagebreak()</code>. This ends up giving nice dividers in the
source between the content of each slide. I really found joy in the
creation of the presentation, which I can’t say is true for other
presentation software.</p>
<h2 id="small-example">Small Example</h2>
<p>Below is a small exmaple along with the produced PDF. The
<code>#set</code> and <code>#show</code> rules are for text sizing, and
some other small style choices.</p>
<div class="sourceCode" id="cb1"><pre
class="sourceCode typst"><code class="sourceCode typst"><span id="cb1-1"><a href="#cb1-1" aria-hidden="true" tabindex="-1"></a><span class="kw">#set</span> <span class="va">page</span><span class="op">(</span>width<span class="op">:</span> <span class="fl">340mm</span><span class="op">,</span> height<span class="op">:</span> <span class="fl">220mm</span><span class="op">)</span></span>
<span id="cb1-2"><a href="#cb1-2" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-3"><a href="#cb1-3" aria-hidden="true" tabindex="-1"></a><span class="kw">#set</span> <span class="va">text</span><span class="op">(</span>size<span class="op">:</span> <span class="fl">2.5em</span><span class="op">)</span></span>
<span id="cb1-4"><a href="#cb1-4" aria-hidden="true" tabindex="-1"></a><span class="kw">#show</span> heading<span class="op">.</span>where<span class="op">(</span>level<span class="op">:</span> <span class="dv">1</span><span class="op">):</span> <span class="kw">set</span> <span class="va">text</span><span class="op">(</span>size<span class="op">:</span> <span class="fl">2em</span><span class="op">)</span></span>
<span id="cb1-5"><a href="#cb1-5" aria-hidden="true" tabindex="-1"></a><span class="kw">#show</span> heading<span class="op">.</span>where<span class="op">(</span>level<span class="op">:</span> <span class="dv">2</span><span class="op">):</span> <span class="kw">set</span> <span class="va">text</span><span class="op">(</span>size<span class="op">:</span> <span class="fl">1.25em</span><span class="op">)</span></span>
<span id="cb1-6"><a href="#cb1-6" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-7"><a href="#cb1-7" aria-hidden="true" tabindex="-1"></a><span class="kw">#</span>align<span class="op">(</span>horizon<span class="op">)[</span></span>
<span id="cb1-8"><a href="#cb1-8" aria-hidden="true" tabindex="-1"></a><span class="fu">  = `Clicks` $arrow$ #text(red)[P]#text(green)[i]#text(blue)[x] \</span></span>
<span id="cb1-9"><a href="#cb1-9" aria-hidden="true" tabindex="-1"></a>  By: Harrison DiAmbrosio</span>
<span id="cb1-10"><a href="#cb1-10" aria-hidden="true" tabindex="-1"></a><span class="op">]</span></span>
<span id="cb1-11"><a href="#cb1-11" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-12"><a href="#cb1-12" aria-hidden="true" tabindex="-1"></a><span class="kw">#</span>pagebreak<span class="op">()</span></span>
<span id="cb1-13"><a href="#cb1-13" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-14"><a href="#cb1-14" aria-hidden="true" tabindex="-1"></a><span class="fu">== &gt; Where do we start?</span></span>
<span id="cb1-15"><a href="#cb1-15" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-16"><a href="#cb1-16" aria-hidden="true" tabindex="-1"></a>*There are three parts we need to keep track of*</span>
<span id="cb1-17"><a href="#cb1-17" aria-hidden="true" tabindex="-1"></a>+ The peripherals (keyboard, mouse, laptop lids, etc.)</span>
<span id="cb1-18"><a href="#cb1-18" aria-hidden="true" tabindex="-1"></a>+ The desktop stack</span>
<span id="cb1-19"><a href="#cb1-19" aria-hidden="true" tabindex="-1"></a>+ Display / Output</span>
<span id="cb1-20"><a href="#cb1-20" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-21"><a href="#cb1-21" aria-hidden="true" tabindex="-1"></a><span class="kw">#</span>pagebreak<span class="op">()</span></span>
<span id="cb1-22"><a href="#cb1-22" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-23"><a href="#cb1-23" aria-hidden="true" tabindex="-1"></a><span class="fu">= Chapter 1</span></span>
<span id="cb1-24"><a href="#cb1-24" aria-hidden="true" tabindex="-1"></a><span class="fu">== _Clickity click clack_</span></span>
<span id="cb1-25"><a href="#cb1-25" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-26"><a href="#cb1-26" aria-hidden="true" tabindex="-1"></a><span class="kw">#</span>pagebreak<span class="op">()</span></span>
<span id="cb1-27"><a href="#cb1-27" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-28"><a href="#cb1-28" aria-hidden="true" tabindex="-1"></a><span class="fu">== Clarifying Assumptions</span></span>
<span id="cb1-29"><a href="#cb1-29" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-30"><a href="#cb1-30" aria-hidden="true" tabindex="-1"></a>We assume the following:</span>
<span id="cb1-31"><a href="#cb1-31" aria-hidden="true" tabindex="-1"></a>+ Input devices communicate over *USB*</span>
<span id="cb1-32"><a href="#cb1-32" aria-hidden="true" tabindex="-1"></a>+ Output&#39;s communicate over *HDMI*</span>
<span id="cb1-33"><a href="#cb1-33" aria-hidden="true" tabindex="-1"></a>+ Using the *Linux* kernel</span>
<span id="cb1-34"><a href="#cb1-34" aria-hidden="true" tabindex="-1"></a>+ Using the *Wayland* protocol</span>
<span id="cb1-35"><a href="#cb1-35" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-36"><a href="#cb1-36" aria-hidden="true" tabindex="-1"></a>These assumptions are made for simplicity</span>
<span id="cb1-37"><a href="#cb1-37" aria-hidden="true" tabindex="-1"></a></span>
<span id="cb1-38"><a href="#cb1-38" aria-hidden="true" tabindex="-1"></a>Fundamentally identical process in other environments</span></code></pre></div>
<p><img src="/images/clicks_to_pix1.png"
alt="First presentation slide" /> <img src="/images/clicks_to_pix2.png"
alt="Second presentation slide" /> <img src="/images/clicks_to_pix3.png"
alt="Third presentation slide" /> <img src="/images/clicks_to_pix4.png"
alt="Fourth presentation slide" /></p>
