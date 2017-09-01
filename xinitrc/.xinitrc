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
autocutsel &
autocutsel -s PRIMARY &

nm-applet &

xrdb .Xresources

exec i3
