#!/bin/bash
# download music from youtube, soundcloud, etc
# pipe a list of links into this script to download them
xargs -n1 youtube-dl -i --extract-audio --audio-format mp3 --add-metadata
