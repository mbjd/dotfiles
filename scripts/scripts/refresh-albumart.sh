#!/bin/bash

# Tries to find the album art for the song currently playing in mpd
# and copies it to /tmp/albumart.jpg so it can be displayed and stuff

target='/tmp/albumart.jpg'

# Extract the album art of the current song & write to $target
# song=$(mpc --format %file% current)
song=$MPD_SONG_URI
if [ -n "$song" ]; then

	file="/home/balduin/music/$song"

	# Look for an image file in the folder of the current song
	cover=$(find $(dirname $file) -type f -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' | head -1)
	if [ -n "$cover" ]; then
		# Copy and exit if there is one
		ln -sf "$cover" $target && exit
	else
		# If it doesn't exist, try to extract it from the song
		cover=$(dirname $file)/cover.jpg
		yes | ffmpeg -loglevel quiet -i "$file" "$cover" > /dev/null 2> /dev/null
		# If was successful, use that file, otherwise
		[ $? -eq 0 ] && ln -sf "$cover" $target && exit
	fi
fi

# On failure, fall back to an 'empty album art' image
ln -sf /home/balduin/pics/misc/no-albumart.jpg $target
