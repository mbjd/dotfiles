#!/usr/bin/env bash

bgpath=/home/balduin/pics/desk.jpg

if [ "$1" = -p -o "$1" = --permanent ]; then
	shift 1
	newbg="$1"
	feh --bg-fill "$newbg" || exit
	ln -sf "$newbg" $bgpath
else
	feh --bg-fill "${1:-$bgpath}"
fi
