#!/bin/bash

debug_fifo=/dev/null
target='/tmp/albumart.jpg'

# Extract the album art of the current song & write to $target
# song=$(mpc --format %file% current)
song=$MPD_SONG_URI
if [ -n "$song" ]; then
	echo song = $song > $debug_fifo

	file="/home/balduin/music/$song"

	# Look for an image file in the folder of the current song
	cover=$(find $(dirname $file) -type f -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' | head -1)
	echo cover = "$cover" > $debug_fifo
	if [ -n "$cover" ]; then
		# Copy and exit if there is one
		cp "$cover" $target
		echo cp "$cover" $target > $debug_fifo
		exit
	fi

	echo found no image file, trying embedded album art > $debug_fifo
	yes | ffmpeg -loglevel quiet -i "$file" $target > /dev/null 2> /dev/null && exit
	echo found no embedded album art > $debug_fifo
fi

echo song is empty > $debug_fifo
# On failure, fall back to an 'empty album art' image
cp /home/balduin/pics/misc/no-albumart.jpg $target
