#!/bin/bash
# Update the tmux status bar, if running in tmux
if [[ -n $TMUX ]]; then
  tmux refresh-client -S
fi
