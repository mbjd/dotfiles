# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
PATH=$PATH:~/bin
PATH=$PATH:~/scripts
PATH=$PATH:~/scripts/colorscripts
PATH=$PATH:/usr/local/bin

export PYTHONSTARTUP="~/.pystartup.py"
export CLICOLOR=1
export XDG_CONFIG_HOME=$HOME/.config

# for go
export GOPATH=~/dev/go
PATH=$PATH:$GOPATH/bin

# Fancy coloured PS1
bold=$(tput bold)
blue=$(tput setaf 4)
reset=$(tput sgr0)
export PS1="\[$bold\]\u@\H:\w \$\[$reset\] "

# Bash completion
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
# 	. $(brew --prefix)/etc/bash_completion
# fi

export PYTHONSTARTUP='~/.pystartup.py'
export XDG_CONFIG_HOME='~/.config'
export XDG_CONFIG='~/.config'
export LANG='en_US.UTF-8'
export LESS='-Ri -x4'
export EDITOR='vim'

# Basic aliases
alias ls="ls -F"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lal="ll -a"

alias newest="command ls -t | head -1"

alias desk='cd ~/Desktop'
alias dl='cd ~/Downloads'
alias docs='cd ~/Documents'

# Vimisms
alias vimrc="vim ~/.vimrc"

alias fancy-wget="wget -r -l inf -np -nH -k -c -N -w1 --no-check-certificate -e robots=off --random-wait --reject=\'index.html*\'"
alias gitlog="git log --format=oneline --abbrev-commit --graph"
alias -- '-'='cd - > /dev/null'
alias where='which -a'
alias make='make -j'
alias mkae='make'
alias :t='type'
alias :h='help'
alias :q='exit'
alias m='make'
alias q='exit'

if [ $(uname) = 'Darwin' ]; then

	alias dots='cd ~/dotfiles'
	alias drive='cd ~/drive'
	alias code='cd ~/code'
	alias misc='cd ~/misc'
	alias dev='cd ~/dev'

	alias v='nvim'
	alias vi='nvim'
	alias vim='nvim'
	alias mvim="open -a MacVim"

	# Trash cmus's stderr so that the error message won't clog up the UI
	alias cmus="cmus 2> /dev/null"

	alias clip='pbpaste | vipe | pbcopy'
	alias subl="open -a 'Sublime Text'"
	alias grep='ggrep --color=auto'
	alias sha256sum='shasum -a 256'
	alias vtop='vtop --theme brew'
	alias typora='open -a Typora'
	alias mvim="open -a MacVim"
	alias md='open -a MacDown'
	alias objdump='otool -tV'
	alias top='top -o cpu'
	alias sha1sum='shasum'
	alias rgrep='grep -r'
	alias hd='hexdump -C'
	alias finder='open .'
	alias units='gunits'

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

else # Hope this is ubuntu

	alias pbcopy 'xclip -selection clipboard -i'
	alias pbpaste 'xclip -selection clipboard -o'

	alias dots 'cd ~/misc/dotfiles'

	setenv GIT_EDITOR vim

	# Open in new gvim tab
	alias tvim 'gvim --remote-tab'
	alias mvim gvim

	alias open 'xdg-open'
fi

# open this file
bashrc() {
	vi ~/.bash_profile
	source ~/.bash_profile
}

cl () {
	cdf
	ls
}

# Read before executing pasted code
pp() {
	# remember output, prevent different clipboard contents
	# after choosing to execute
	script=$(pbpaste)
	echo "$script"
	printf "\nExecute? (y/n): "
	read execute
	# only execute when 'y' was answered
	# all other input is ignored
	if [[ "$execute" == "y" ]]; then
		eval "$script"
	fi
}

# Preview a file or folder in Quicklook
ql() {
	qlmanage -p "$1" &> /dev/null &
}

# Display weather information ($1 = city)
weather() {
	curl "wttr.in/${1-Zurich}"
}


# Use youtube-dl to get the audio track of a youtube video / playlist or sc song
youtube-mp3() {
	youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $1
}

youtube-wav() {
	youtube-dl --extract-audio --audio-format wav -o "%(title)s.%(ext)s" $1
}

# Convert mkv to mp4
mkv2mp4() {
	name=$1
	ffmpeg -i $name -vcodec copy -acodec copy ${name%.mkv}".mp4"
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

# Only unique entries in case this file is sourced several times
export PATH=$(echo $PATH | tr ':' '\n' | sort | uniq | tr '\n' ':')
