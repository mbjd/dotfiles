#!/bin/bash

# Extract the album art of the current song & write to $target
file="/home/balduin/music/$(mpc --format %file% current)"
target='/tmp/albumart.jpg'
yes | ffmpeg -loglevel quiet -i "$file" $target > /dev/null 2> /dev/null

# On failure, fall back to an 'empty album art' image
status=$?
[ $status -ne 0 ] || cp /home/balduin/pics/misc/no-albumart.png $target
