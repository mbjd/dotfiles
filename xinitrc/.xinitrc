#!/bin/sh

# --- Keyboard mappings etc ------------------------------------- {{{
xset r rate 180 70
setxkbmap eu-tweaked -option 'caps:ctrl_modifier'

sxhkd -r /dev/stdout | ts %.s >> /var/log/sxhkd.log &
xcape -e '#66=Escape'
# }}}

# Set background
feh --bg-scale /home/balduin/pics/desk.jpg

# mpdcron --kill
mpdcron

# Synchronize clipboards
autocutsel -selection CLIPBOARD -fork 2> /dev/null > /dev/null &

exec i3
