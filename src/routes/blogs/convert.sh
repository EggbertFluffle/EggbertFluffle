#! /bin/bash

pandoc *.md | sed s/{/\{\"{\"\}/g > +page.svelte

echo "Don't forget to add alt properties to <img> tags"
echo "Opening nvim for this now..."
sleep 2
nvim "+page.svelte"
