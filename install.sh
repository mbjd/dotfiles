#!/bin/bash

# Makes symlinks all over $HOME that point to the correct dotfiles
# Not guaranteed to work or anything, only tested on OS X
# Dependencies: fish, vim, tmux, cmus

if [ "${PWD##*/}" != "dotfiles" ]; then
	echo "Script must be executed in parent directory of dotfiles repo"
	exit 1
fi

echo 'Linking .bashrc...'
ln -sf "$(pwd)/bashrc" ~/.bashrc

echo 'Linking .tmux.conf...'
ln -sf "$(pwd)/tmux.conf" ~/.tmux.conf

echo 'Linking .vimrc...'
ln -sf "$(pwd)/vimrc" ~/.vimrc

echo 'Linking .inputrc...'
ln -sf "$(pwd)/inputrc" ~/.inputrc

echo 'Setting up cmus config file...'
mkdir -p ~/.config/cmus
ln -sf "$(pwd)/cmusrc" ~/.config/cmus/rc

echo 'Setting up fish config file...'
mkdir -p ~/.config/fish
ln -sf "$(pwd)/fish/config.fish" ~/.config/fish/config.fish
ln -sf "$(pwd)/fish/functions" ~/.config/fish/

ln -sf "$(pwd)/scripts" ~

if [ "$(uname)" == "Darwin" ]; then
	echo "Detected Mac OS"
	echo ' - Linking .bash_profile...'
	ln -sf ~/.bashrc ~/.bash_profile
	echo ' - Linking .pystartup.py...'
	ln -sf "$(pwd)/pystartup-mac.py" ~/.pystartup.py
else
	echo "Not Mac OS; assuming Linux"
	echo ' - Linkiing .pystartup.py...'
	ln -sf "$(pwd)/pystartup-linux.py" ~/.pystartup.py
fi

echo 'Done!'

