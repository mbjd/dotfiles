#!/bin/sh

# --- Keyboard mappings etc ------------------------------------- {{{
xset r rate 180 70
setxkbmap eu-tweaked -option 'caps:ctrl_modifier'

sxhkd
xcape -e '#66=Escape'
# }}}

# Set background
feh --bg-fill /home/balduin/pics/desk.jpg

# mpdcron --kill
mpdcron
mpd &

# Synchronize clipboards
autocutsel -selection CLIPBOARD -fork 2> /dev/null > /dev/null &

xrdb .Xresources

exec i3
