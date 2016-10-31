#!/bin/bash

# Makes symlinks all over $HOME that point to the correct dotfiles
# Not guaranteed to work or anything, only tested on OS X
# Dependencies: fish, vim, tmux, cmus

if [ "${PWD##*/}" != "config" ]; then
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

# echo 'Setting up fish config file...'
# mkdir -p ~/.config/fish
# ln -sf "$(pwd)/fish/config.fish" ~/.config/fish/config.fish
# ln -sf "$(pwd)/fish/functions" ~/.config/fish/

ln -sf "$(pwd)/scripts" ~

if [ "$(uname)" == "Darwin" ]; then
	echo "Detected Mac OS"

	echo 'linking .kwm/kwmrc'
	ln -sf "$(pwd)/kwmrc" ~/.kwm/kwmrc

	echo ' - Linking .bash_profile...'
	ln -sf ~/.bashrc ~/.bash_profile

	echo ' - Linking .pystartup.py...'
	ln -sf "$(pwd)/pystartup-mac.py" ~/.pystartup.py
else
	echo "Not Mac OS; assuming Linux"
	echo ' - Linking .pystartup.py...'
	ln -sf "$(pwd)/pystartup-linux.py" ~/.pystartup.py

	echo " - Linking i3config"
	ln -s $(pwd)/i3config ~/.config/i3/config

	echo " - Setting up st..."
	if [ -d ~/code/st ]; then
		ln -sf $(pwd)/st-config.h ~/code/st/config.h
		echo "   - st config.h linked, now compile & install"
	else
		echo "   - ~/code/st doesn't exist, skipping st's config.h" > /dev/stderr
	fi

    echo " - Downloading input mono font..."

    # curl 'http://input.fontbureau.com/build/?fontSelection=whole&a=ss&g=ss&i=serif&l=serif&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email=' > input-mono.zip
    # unzip input-mono.zip -d inputmono > /dev/null
    # echo " - Installing input mono font, please give password"
    # sudo cp -r inputmono/Input_Fonts /usr/share/fonts
    # rm -r input-mono.zip inputmono
fi

echo 'Done!'

