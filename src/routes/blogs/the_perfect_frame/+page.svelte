<h1 id="the-perfect-frame">The Perfect Frame</h1>
<p>“Wayland is a replacement for the X11 window system protocol and
architecture with the aim to be easier to develop, extend, and
maintain.”</p>
<p>This is generally a true sentiment, but it does not mean that a
Wayland based compositor is <em>easy</em> to develop by a long shot. A
feature most modern desktop users take for granted are perfect frames.
This is a general term for the most part, but encompases several smaller
features, which all need to be organized together. What do I mean by
this?</p>
<p>First, we need to understand the abstract approach to how Wayland
“compositors” operate.</p>
<h2 id="wayland-compositors">Wayland Compositors</h2>
<figure>
<img src="/images/desktop_stack_wayland.png"
alt="Wayland desktop stack diagram" />
</figure>
<p>The diagram above shows the separation of powers in the average
Wayland-based, graphical desktop stack. We wan’t to focus on how the
“compositor” interacts with the clients. The “compositor”, in this case,
is actually the display server, window manager, and wayland compositor,
but for simplicity, we call this program the “compositor”. It is
responsible for orchestrating the connected clients, or windows. The way
Wayland operates, clients are given almost no liberties, with the
exception of a graphics buffer they can fill however they like. Under
this format, a client cannot reposition, resize, go fullscreen or hide
itself, among many others. If a client wishes to do or modify nearly
anything, it must request that the compositor do it for them. Not only
does the compositor do a lot of heavy lifting, but it also has the final
say whether anything will get done or not.</p>
<h2 id="client-configures">Client Configures</h2>
<p>Nothing seems too complex yet, and under the currently described
procedure, getting perfect frames to appear should be easy. Don’t
forget, the compositor decides everything about all clients, except the
contents of their buffers. This means that, if the compositor tiles a
client to a new size, the client needs to react by changing the contents
of its buffer to make sense at the new size. If the compositor doesn’t
tell the client about size changes, the compositor must instead either
crop parts of the buffer, or introduce visual artifacts for padding.
This is, of course, horrible if the goal is to achieve
<strong>true</strong> perfect frames.</p>
<p>Luckily, the Wayland ecosystem has “client configures”, which are
used to communicate relevant changes to clients, so they can react
accordingly. Most notably this includes telling clients their dimensions
and their fullscreen status. In a moment, you will understand why these
two alone require dominion over many more facets of the client state,
but first, what does a configure look like?</p>
<p>Below is the signature of the function used to resize clients in <a
href="https://gitlab.freedesktop.org/wlroots/wlroots">wlroots</a>.</p>
<div class="sourceCode" id="cb1"><pre class="sourceCode c"><code class="sourceCode c"><span id="cb1-1"><a href="#cb1-1" aria-hidden="true" tabindex="-1"></a><span class="dt">uint32_t</span> wlr_xdg_toplevel_set_size<span class="op">(</span></span>
<span id="cb1-2"><a href="#cb1-2" aria-hidden="true" tabindex="-1"></a>    <span class="kw">struct</span> wlr_xdg_toplevel <span class="op">*</span>toplevel<span class="op">,</span></span>
<span id="cb1-3"><a href="#cb1-3" aria-hidden="true" tabindex="-1"></a>    <span class="dt">int32_t</span> width<span class="op">,</span></span>
<span id="cb1-4"><a href="#cb1-4" aria-hidden="true" tabindex="-1"></a>    <span class="dt">int32_t</span> height</span>
<span id="cb1-5"><a href="#cb1-5" aria-hidden="true" tabindex="-1"></a><span class="op">);</span></span></code></pre></div>
<p>The return value here is called the <em>configure serial</em>. When
we make a call to <code>wlr_xdg_toplevel_set_size</code>, we immediately
resize the client’s buffer in the compositor, while also sending a
message to the client about this new size. The client needs time to
react to this new size, and will later call the compositor with a
<code>configure_ack</code>. It will pass this same serial to the
<code>configure_ack</code> to notify the compositor that the client has
handled the new size and is ready to be rendered.</p>
<p>The compositor never stopped rendering the client, and resized it
immediately before telling it about the new size. Oh no. That must mean…
there must have been… IMPERFECT FRAMES!!!</p>
<h2 id="orchestration-and-synchronization">Orchestration and
Synchronization</h2>
<p>Ok ok ok, calm down. We can fix this. We just need to make a copy of
the client’s buffer before configuring it to resize. Then we can hide
the real client’s buffer while its resizing, and show the copy in its
place. Once the client is ready, we swap its real and copy buffers, and
everything is good! Welllll, not quite. One thing we forgot to consider
is that some clients may handle their configures faster than others, and
it’s possible some might not handle them at all. In the case of the
former, this is especially noticeable with tiling window managers, where
the size and position of clients are often dependent on each other. With
this kind of synchronization, resizing windows in a tiling layout would
be a disastrous cascade of windows finally catching up with their
proper, true to size buffers.</p>
<p>Instead of waiting for clients to resize individually before
revealing, we should wait for all clients to handle configures before
revealing all of them at once! That works too, but it also requires us
to make all of the configures at the same time, so that we can make all
the copy buffers at the same time as well. How can we make sure that all
of these configures happen simultaneously?</p>
<h2 id="state-state-state-and-more-state">State, state, state and more
state</h2>
<p>Things are getting quite out of hand. To synchronize the changing of
client state, we should instead collect all the state changes that want
to be made to clients and mark them as “pending”. Once all the desired
changes are queued, we apply all the new states at once, with a bit of
nuance. First, we don’t need to tell clients about requested state
changes if they aren’t changes at all. So we will check the client’s
current state, take size for example, and if the proposed new size is
the same, don’t even bother telling the client about the new size we
want it to be. Second, if the state of the client we want to change
doesn’t require the client to know, wait till later in order to set that
state. Notably, this includes the client position. But why doesn’t the
client need to know its position?</p>
<p>The client’s only job is to change the contents of its buffer. It’s
important for it to know its size, so that the contents can reflect
that, but the position of the client doesn’t change the contents of the
buffer at all. A client will render the same at the top left of the
screen compared to the bottom right. Therefore, changes to a clients
position can be done instantaneously on the compositor end, since no
configure needs to be made. But if there is a change in position at the
same time as a change in size, the geometry of our windows is
unsynchronized again, and the perfection of tiling window managers will
suffer.</p>
<h2 id="pending-and-sending">Pending and Sending</h2>
<p>To circumvent this, we split our state synchronization into two
steps: apply pending, and apply sending. We already spoke about apply
pending, when all the configure reliant client state changes are made at
once. These types of state changes are all now marked as “sending”. This
indicates to the compositor that we have told the client about these
state change requests, and that we are waiting for them all to
acknowledge the configures. Once all the clients acknowledge the
configures, we move onto apply sending. This is where instantaneous
changes can be made, such as position of clients and changing their
borders. Keep in mind that when we apply pending changes, we must make
copies of all the clients to show while we wait for their buffers to
catch up. This means in application sending, we should delete the copies
and reveal the true client buffers as well.</p>
<h2 id="the-loop">The Loop</h2>
<p>There are a couple more bits a pieces to this, like when manipulating
the scene graph or creating new clients, but this is the general form
and has been working very well in <a
href="https://github.com/MezzalunaWM/Mezzaluna">Mezzaluna</a> so far. To
recap, here are the high level steps:</p>
<ol type="1">
<li>Accumulate all requested state changes as “pending” state</li>
<li>Make a copy of all the client buffers, hide the clients, and show
the copies</li>
<li>Apply pending changes to all clients at once, only making the
configure reliant changes (resize, fullscreen, etc.)</li>
<li>Wait for all clients to acknowledge all of their configures</li>
<li>Apply all the sending changes, only making the configure independant
changes (position, enabled/disabled, etc.)</li>
<li>Show the true client buffers and delete the old buffer copies</li>
<li>Repeat</li>
</ol>
<p>If you have any questions at all, I’d be happy to respond at
hdiambrosio@gmail.com. The implementation for Mezzaluna was heavily
based on <a href="https://isaacfreund.com/">IFreund’s</a> approach with
<a href="https://codeberg.org/river/river-classic">river</a> (now
river-classic).</p>
