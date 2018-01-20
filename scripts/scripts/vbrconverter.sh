#!/usr/bin/env bash
# converts the mp3 file "$1" to vbr and removes album art to save space
# (be sure to copy it to the folder first with ffmpeg -i song.mp3 cover.jpg)

# avg range   option
# 320	320-320 -b:a 320k
# 245	220-260	-q:a 0
# 225	190-250	-q:a 1
# 190	170-210	-q:a 2
# 175	150-195	-q:a 3
# 165	140-185	-q:a 4
# 130	120-150	-q:a 5
# 115	100-130	-q:a 6
# 100	80-120	-q:a 7
# 85	70-105	-q:a 8
# 65	45-85	-q:a 9

if [ ! -e "$1" ]; then
	echo File "'$1'" doesn\'t exist.
	exit
fi

echo Starting "$1"...
tmp=$(mktemp --dry-run --tmpdir XXXXXXXXXXXX.mp3)

original_size=$(du -sb "$1" | cut -f1)

ffmpeg -loglevel fatal -i "$1" -q:a 0 -map a $tmp && mv $tmp "$1"

new_size=$(du -sb "$1" | cut -f1)

echo Finished "$1"!
printf 'Saved Size: %.2f MiB = %.2f %%\n' $(echo "($original_size - $new_size) / 1024^2" | bc -l) $(echo "100*(1-($new_size / $original_size))" | bc -l)
