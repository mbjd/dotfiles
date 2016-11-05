#!/bin/bash
# Print a playing/pause indicator and the song name

status=$(mpc status '%name%')

(
	echo "$status" | awk 'NR==2 {print}' | sed 's/].*$//g;s/playing/>/g;s/paused/|/g;s/$/] /g'
	echo "$status" | head -1
) | tr -d '\n'
