# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
# PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/scripts"
PATH="$PATH:$HOME/scripts/colorscripts"
# PATH="$PATH:/usr/local/bin"

export PYTHONSTARTUP="$HOME/.pystartup.py"
export CLICOLOR=1
export XDG_CONFIG="$HOME/.config"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_RUNTIME_DIR="$HOME/.config"
export HISTCONTROL=ignoredups
export GTK_THEME=arc-gtk-theme

# https://github.com/in0rdr/diary/
export DIARY_DIR="$HOME/.diary"

# Tensorflow GPU dependencies
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib64"
export CUDA_HOME='/opt/cuda/'

# Infinite history
HISTSIZE='9999999999'
HISTFILESIZE='9999999999'

# Fancy coloured PS1
bold=$(tput setaf 1; tput bold)
blue=$(tput setaf 4)
reset=$(tput sgr0)
# export PS1="\[$bold\]\u@\H:\$(/home/balduin/scripts/prompt_pwd.sh) \$\[$reset\] "
export PS1="\[$bold\]\u@\H:\w ――――\[$reset\] "
# export PS1="\[$bold\]\u@\H:\w \$\[$reset\] "

export LANG='en_US.UTF-8'
export LESS='-Ri -x4'
export EDITOR='nvim'

# Basic aliases
alias ls="ls -F --color=auto --time-style=long-iso"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lal="ll -a"

alias newest="command ls -t | head -1"

alias desk='cd ~/desktop'
alias dl='cd ~/downloads'
alias docs='cd ~/documents'

# Vimisms
alias vimrc="$EDITOR ~/.vimrc"

alias fancy-wget="wget --mirror --no-parent --adjust-extension --no-host-directories --convert-links --continue --timestamping --no-check-certificate -e robots=off --random-wait --reject=\'index.html*\'" # use with --cut-dirs=<n>
alias -- '-'='cd - > /dev/null'
alias p8='ping 8.8.8.8'
alias where='which -a'
alias make='make -j'
alias mkae='make'
alias :t='type'
alias :h='help'
alias :q='exit'
alias m='make'
alias q='exit'

if [ "$(uname)" = 'Darwin' ]; then

	alias dots='cd ~/config'
	alias drive='cd ~/drive'
	alias code='cd ~/code'
	alias misc='cd ~/misc'
	alias dev='cd ~/dev'
	alias eth='cd ~/eth'

	alias v="$EDITOR"
	alias vi="$EDITOR"
	alias vim="$EDITOR"
	alias mvim="open -a MacVim"

	alias qt="open -a 'QuickTime Player'"
	alias prefs="open -a 'System Preferences'"
	alias clip='pbpaste | vipe | pbcopy'
	alias subl="open -a 'Sublime Text'"
	alias units='/usr/local/bin/units'
	alias grep='ggrep --color=auto'
	alias sha256sum='shasum -a 256'
	alias vtop='vtop --theme brew'
	alias typora='open -a Typora'
	alias mvim="open -a MacVim"
	alias md='open -a MacDown'
	alias objdump='otool -tV'
	alias vlc='open -a VLC'
	alias top='top -o cpu'
	alias sha1sum='shasum'
	alias rgrep='grep -r'
	alias hd='hexdump -C'
	alias finder='open .'
	alias p='pbpaste'
	alias c='pbcopy'
	alias o='open'
	alias du='gdu'

	# Bash completion
	# if [ -f $(brew --prefix)/etc/bash_completion ]; then
	#	. $(brew --prefix)/etc/bash_completion
	# fi

	# Trash cmus's stderr so that the error message won't clog up the UI
	alias cmus="cmus 2> /dev/null"

	export GIT_EDITOR=nvim
	export BROWSER='open -a Google\ Chrome'

	# cd to frontmost finder window
	cdf() {
		target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
		if [ "$target" != "" ] ;
		then
			cd "$target";
		else
			echo 'No Finder window found' > /dev/stderr;
		fi
	}

	cdp() {
		cd $(pbpaste)
	}

	log () {
		< ~/misc/log.csv python3 -c 'import matplotlib.pyplot as pl; import sys; data=[map(float, i.split(",")) for i in sys.stdin.readlines()]; times, batt, temp = zip(*data); pl.plot(times, batt); pl.plot(times, temp); pl.show();'
	}

	trash () {
		mv "$@" ~/.Trash;
	}

	restart_kwm () {
		brew services restart kwm
	}

	kwmrc () {
		$EDITOR ~/.kwm/kwmrc
		kwmc config reload
	}

	# Preview a file or folder in Quicklook
	ql() {
		qlmanage -p "$1" &> /dev/null &
	}

else # Hope this is linux

	alias vi="$EDITOR"
	export GIT_EDITOR=$EDITOR

	alias grep='grep --colour=auto'
	alias cal='cal -m'

	alias b='bc -l'
	alias d='(echo 30k; cat) | dc'
	alias c='xclip -selection clipboard -i'
	alias n='nmcli -c yes | head -1'
	alias o='rifle'
	alias p='xclip -selection clipboard -o'
	alias r='ranger'
	alias z='zathura'

	alias np='nmcli -c yes | head -1; ping 8.8.8.8'
	alias nr='while true; do nmcli -c yes | head -1; ping 8.8.8.8; sleep 1; done'

	alias i3conf="$EDITOR ~/.config/i3/config; i3-msg reload"
	alias dl='cd ~/dl'

	alias topdf='libreoffice --headless --convert-to pdf'

	# Plot battery/temperature logs
	log () {
		< ~/misc/log python -c 'import matplotlib.pyplot as pl; import sys; data=[map(float, i.split(",")) for i in sys.stdin.readlines()]; times, batt, temp = zip(*data); pl.plot(times, batt); pl.plot(times, temp); pl.show();'
	}

	# cd to currently playing music
	cdmus () {
		file="$HOME/music/$(mpc --format '%file%' current)"
		cd "$(dirname "$file")"
	}

	function set_background {
		feh --bg-fill ${1:-/home/balduin/pics/desk.jpg}
	}

	alias bg=set_background

	cdp () {
		if [ -z "$1" ]; then
			echo "cdp: No process name given" > /dev/stderr
			return 1
		fi
		pid=$(pgrep "$1" | head -1)
		if [ -z "$pid" ]; then
			echo "cdp: $1: No such process"
			return 1
		fi
		echo cd /proc/$pid
		cd /proc/$pid
	}
fi

reset_permissions()
{
	echo sudo chown -R balduin:users "$1"
	sudo chown -R balduin:users "$1"
	echo sudo find \"$1\" -type d -exec chmod 755 '{} \;'
	sudo find "$1" -type d -exec chmod 755 {} \;
	echo sudo find \"$1\" -type f -exec chmod 644 '{} \;'
	sudo find "$1" -type f -exec chmod 644 {} \;
}

# open this file
bashrc() {
	$EDITOR ~/.bashrc
	source ~/.bashrc
}

# Display weather information ($1 = city)
weather() {
	curl "wttr.in/${1-Zurich}"
}

# Convert mkv to mp4
mkv2mp4() {
	name=$1
	ffmpeg -i $name -vcodec copy -acodec copy ${name%.mkv}".mp4"
}

# edit an executable
vw () {
	vi $(which "$1")
}

# replacement for cd ..
# $ up -> cd ..
# $ up 3 -> cd ../../..
up () {
	if [[ "$#" -lt 1 ]]; then
		cd ..
	else
		cdstr=""
		for ((i=0; i<$1; i++)); do
			cdstr="../${cdstr}"
		done
		cd "${cdstr}" || exit
	fi
}

alias u2='up 2'
alias u3='up 3'
alias u4='up 4'
alias u5='up 5'
alias u6='up 6'
alias u7='up 7'
alias u8='up 8'

randcommit() {
	curl -s "http://whatthecommit.com/index.txt"
}

randseq() {
	limit=$1
	yes | awk -v seed=$RANDOM "BEGIN {srand(seed);} {print int($limit * rand())}"
}

# simple digital clock
clock() {
	while true; do
		tput clear;
		date +"%H : %M : %S" | figlet;
		sleep 1;
	done
}

# Colourful man pages
man() {
	if [ "$TERM" = 'linux' ]; then
		env \
			LESS_TERMCAP_mb=$(printf "\e[34m") \
			LESS_TERMCAP_md=$(printf "\e[1;31m") \
			LESS_TERMCAP_me=$(printf "\e[0m") \
			LESS_TERMCAP_se=$(printf "\e[0m") \
			LESS_TERMCAP_so=$(printf "\e[30;43m") \
			LESS_TERMCAP_ue=$(printf "\e[0m") \
			LESS_TERMCAP_us=$(printf "\e[32m") \
				/usr/bin/man "$@"
	else
		env \
			LESS_TERMCAP_mb=$(printf "\e[1;34m") \
			LESS_TERMCAP_md=$(printf "\e[38;5;9m") \
			LESS_TERMCAP_me=$(printf "\e[0m") \
			LESS_TERMCAP_se=$(printf "\e[0m") \
			LESS_TERMCAP_so=$(printf "\e[30;43m") \
			LESS_TERMCAP_ue=$(printf "\e[0m") \
			LESS_TERMCAP_us=$(printf "\e[38;5;10m") \
				/usr/bin/man "$@"
	fi
}

export PATH=$(echo "$PATH" | tr ':' '\n' | awk 'length > 0 {print}' | sort | uniq | tr '\n' ':')

# Start the terminal at the bottom of the window
clear_to_bottom () {
	clear; yes '' | head -$(tput lines)
}

# So that the whole terminal is cleared even when the window manager
# immediately enlarges it
# clear_to_bottom

# bind -x '"\C-l": clear_to_bottom'
