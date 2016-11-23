#!/bin/sh

short_length=1

rev_dirs=$(pwd | sed "s|$HOME|~|g" | tr / '\n' | tac)

(
	echo "$rev_dirs" | tail -n+2 | cut -c1-$short_length | tac
	echo "$rev_dirs" | head -1
) | tr '\n' '/' | sed 's|/$||'


# awk -v RS='/' -v ORS='/' "END {print} {print substr(\$0,0,$short_length)}" | head -1 | tr -d '\n'
