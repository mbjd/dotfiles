#!/bin/sh

cmd=$(IFS=:; find $PATH -maxdepth 1 -executable -type f 2> /dev/null | fzf)

st -t floating -e "$cmd" &
