#!/usr/bin/env bash

bgpath=/home/balduin/pics/desk.jpg

if [ "$1" = -p -o "$1" = --permanent ]; then
	shift 1
	newbg="$1"
	ln -sf "$newbg" $bgpath
	feh --bg-fill "$newbg"
else
	feh --bg-fill "${1:-$bgpath}"
fi

