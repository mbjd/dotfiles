#!/bin/bash

# Get a nice description of what's playing in cmus within the tmux status bar
# ===========================================================================
#
# To make it work, do the following things:
#
# - Insert the following into your ~/.tmux.conf:
#   set -g status-right '#(~/path/to/this/script/cmus-tmuxbar.sh)'
#   This will set the tmux status to the description of the currently playing
#   song.
#
# - Insert the following into ~/.config/cmus/rc:
#   set status_display_program=~/path/to/other/script/cmus-status.sh
#   This causes the helper script to run each time cmus changes its status,
#   so that the tmux bar is refreshed when the song description has to change.


# for a coloured song display in tmux, use:
# o_start='#[bg=blue]'
# o_end='#[bg=default]'

o_start='['
o_end=']'

# Convert the status to a play/pause sign (status is "playing" or "paused",
# when it's "stopped" this function shouldn't be called)
playpause () {
	if [ $1 = "playing" ]; then
		printf '>'
	else
		printf '|'
	fi
}

# If cmus-remote returns 0, i.e. if cmus is running...
if cmus-remote -Q > /dev/null 2> /dev/null; then

	# Get the information we need
	cmus_status=$(cmus-remote -Q)
	status=$(echo "$cmus_status" | grep status | head -n 1 | cut -d' ' -f2-)
	artist=$(echo "$cmus_status" | grep 'tag artist' | tail -n 1 | cut -d' ' -f3-)
	title=$(echo  "$cmus_status" | grep 'tag title'  | cut -d' ' -f3-)

	# if the song has a title tag, take that
	if [ -n "$title" ]; then
		output="${o_start}$(playpause $status) ${artist} - ${title}${o_end}"

	# If there's no title, check if anything is playing, and if that's the case,
	# display the file name in place of the title
	else
		if [ $status = "stopped" ]; then
			output="${o_start} - ${o_end}"
		# if status is paused or playing, display the song
		elif [ -n "$status" ]; then
			# Take file name as titl
			file=$(echo "${cmus_status}" | grep 'file /Users/' | cut -d' ' -f2-)
			title=$(basename "$file")

			# Set the title with artist if available
			if [ -n "$artist" ]; then
				output="$artist - $title"
			else
				output="$title"
			fi

			# include play/pause sign and start/end strings
			output="${o_start}$(playpause $status) ${output}${o_end}"

		# If there's no file name either, nothing is playing
		else
			output="${o_start} - ${o_end}"
		fi
	fi
else # cmus is not running
	output="${o_start} x ${o_end}"
fi

printf "$output"

