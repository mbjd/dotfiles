#!/bin/bash

file="/home/balduin/music/$(mpc --format %file% current)"

yes | ffmpeg -loglevel quiet -i "$file" /tmp/albumart.jpg > /dev/null 2> /dev/null
