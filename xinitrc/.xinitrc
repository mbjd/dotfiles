#!/bin/sh

# --- Keyboard mappings etc ------------------------------------- {{{
xset r rate 180 70
setxkbmap eu -option 'caps:ctrl_modifier'

sxhkd &
xcape -e '#66=Escape'
# }}}

# Set background & start redshift {{{
feh --bg-fill /home/balduin/pics/desk.jpg
redshift &
# }}}

# other stuff {{{
# mpdcron --kill
mpdcron
mpd &

# Synchronize clipboards
autocutsel &
autocutsel -s PRIMARY &

nm-applet &

xrdb .Xresources
# }}}

exec i3
