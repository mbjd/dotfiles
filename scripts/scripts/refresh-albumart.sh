#!/bin/bash

# Extract the album art of the current song & write to $target
# song=$(mpc --format %file% current)
song=$MPD_SONG_URI
if [ -n "$song" ]; then
	file="/home/balduin/music/$song"
	target='/tmp/albumart.jpg'
	yes | ffmpeg -loglevel quiet -i "$file" $target > /dev/null 2> /dev/null && exit

	# If that failed, search for an image in the directory of the album
	cover=$(find $(dirname $file) -type f -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' | head -1)
	if [ -n "$cover" ]; then
		cp "$cover" $target
		exit
	fi
fi

# On failure, fall back to an 'empty album art' image
cp /home/balduin/pics/misc/no-albumart.png $target
