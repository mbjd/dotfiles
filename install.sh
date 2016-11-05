#!/bin/bash

# Makes symlinks all over $HOME that point to the correct dotfiles
# Not guaranteed to work or anything, only tested on OS X
# Dependencies: fish, vim, tmux, cmus

if [ "${PWD##*/}" != "config" ]; then
	echo "Script must be executed in parent directory of dotfiles repo"
	exit 1
fi

echo 'Linking .bashrc...'
ln -s "$(pwd)/bashrc" ~/.bashrc

echo 'Linking .tmux.conf...'
ln -s "$(pwd)/tmux.conf" ~/.tmux.conf

echo 'Linking .vimrc...'
ln -s "$(pwd)/vimrc" ~/.vimrc

echo 'Linking .inputrc...'
ln -s "$(pwd)/inputrc" ~/.inputrc

echo 'Setting up cmus config file...'
mkdir -p ~/.config/cmus
ln -s "$(pwd)/cmusrc" ~/.config/cmus/rc

# echo 'Setting up fish config file...'
# mkdir -p ~/.config/fish
# ln -sf "$(pwd)/fish/config.fish" ~/.config/fish/config.fish
# ln -sf "$(pwd)/fish/functions" ~/.config/fish/

ln -sf "$(pwd)/scripts" ~

if [ "$(uname)" == "Darwin" ]; then
	echo "Detected Mac OS"

	echo 'linking .kwm/kwmrc'
	ln -s "$(pwd)/kwmrc" ~/.kwm/kwmrc

	echo ' - Linking .bash_profile...'
	ln -s ~/.bashrc ~/.bash_profile

	echo ' - Linking .pystartup.py...'
	ln -s "$(pwd)/pystartup-mac.py" ~/.pystartup.py
else
	echo "Not Mac OS; assuming Linux"
	echo ' - Linking .pystartup.py...'
	ln -s "$(pwd)/pystartup-linux.py" ~/.pystartup.py

	echo " - Linking i3config"
	mkdir -p ~/.config/i3
	ln -s $(pwd)/i3config ~/.config/i3/config

	echo " - Linking i3blocks config"
	mkdir -p ~/.config/i3blocks
	ln -s $(pwd)/i3blocks ~/.config/i3blocks/config

	echo " - Linking .xbindkeysrc..."
	ln -s $(pwd)/xbindkeysrc ~/.xbindkeysrc
fi

echo 'Done!'

