#!/bin/sh

# Makes symlinks all over $HOME that point to the correct dotfiles
# Not guaranteed to work or anything, only tested on OS X
# Dependencies: fish, vim, tmux, cmus

if [ "${PWD##*/}" != "dotfiles" ]; then
	echo "Script must be executed in parent directory of dotfiles repo"
	exit 1
fi

ln -sf "$(pwd)/bashrc" ~/.bashrc
ln -sf "$(pwd)/tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/vimrc" ~/.vimrc
ln -sf "$(pwd)/inputrc" ~/.inputrc

mkdir -p ~/.config/cmus
ln -sf "$(pwd)/cmusrc" ~/.config/cmus/rc

mkdir -p ~/.config/fish
ln -sf "$(pwd)/fish/config.fish" ~/.config/fish/config.fish
ln -sf "$(pwd)/fish/functions" ~/.config/fish/

ln -sf "$(pwd)/scripts" ~

if [ "$(uname)" == "Darwin" ]; then
	ln -sf ~/.bashrc ~/.bash_profile
	ln -sf "$(pwd)/pystartup.py" ~/.pystartup.py
fi

