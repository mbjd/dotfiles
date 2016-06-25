# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
export PYTHONSTARTUP="/Users/balduin/.pystartup.py"

# for soundcloud2000
# https://soundcloud.com/you/apps/soundcloud2000-mbjd/edit
SC_CLIENT_ID="e8e61a3d2a112feb748ab28fcbdc5be4"

RANGER_LOAD_DEFAULT_RC=FALSE

XDG_CONFIG_HOME=$HOME/.config

# for avrdude
PATH=$PATH:/usr/local/bin

# for go
export GOPATH=~/dev/go
PATH=$PATH:$GOPATH/bin

# user specific bin directory
PATH=$PATH:~/bin

# Fancy coloured PS1
bold=$(tput bold)
blue=$(tput setaf 4)
reset=$(tput sgr0)
export PS1="\[$bold\]\w \$\[$reset\] "

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Basic aliases
alias clr="clear"
alias ls="ls -F"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lal="ll -a"

alias bashrc="bashprof"
alias newest="ls -t | head -1"


# Vimisms
alias :q="exit"
alias vimrc="vim ~/.vimrc"
alias v="/Applications/MacVim.app/Contents/MacOS/vim"
alias vi="/Applications/MacVim.app/Contents/MacOS/vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/vim"

alias mvim="open -a MacVim"
export EDITOR="vim"

# open this file
bashprof() {
	vi ~/.bash_profile
	source ~/.bash_profile
}

export CLICOLOR=1

# cd to frontmost finder window
cdf () {
	currFolderPath=$( /usr/bin/osascript <<EOT
		tell application "Finder"
			try
				set currFolder to (folder of the front window as alias)
			on error
				set currFolder to (path to desktop folder as alias)
			end try
			POSIX path of currFolder
		end tell
EOT
	)
	cd "$currFolderPath"
}

cl () {
	cdf
	ls
}

# Extract all kinds of archives
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xjf $1 ;;
			*.tar.gz) tar xzf $1 ;;
			*.bz2) bunzip2 $1 ;;
			*.rar) rar x $1 ;;
			*.gz) gunzip $1 ;;
			*.tar) tar xf $1 ;;
			*.tbz2) tar xjf $1 ;;
			*.tgz) tar xzf $1 ;;
			*.zip) unzip $1 ;;
			*.z) uncompress $1 ;;
			*) echo "'$1' cannot be extracted via extract ()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
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

# Preview a file or folder in Quicklook
ql() {
	qlmanage -p "$1" &> /dev/null &
}

# Display weather information ($1 = city)
weather() {
	curl "wttr.in/${1-Zurich}"
}


# Redirect cmus's stderr to a file so the message won't clog up the UI
alias cmus="cmus 2> /dev/null"

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

# Print human-readable file size
fsize() {
	wc -c < $1 | ~/dev/C/filesize-format
}

# added by Anaconda3 2.5.0 installer
export PATH="/Users/balduin/anaconda/bin:$PATH"

alias desk='cd ~/Desktop'
alias dl='cd ~/Downloads'
alias docs='cd ~/Documents'

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

# Execute a vim normal command given in command line argument
function vimpipe() {
    vim - -u NONE -es "+%normal $*" '+%print' '+:qa!' | tail -n +2
}
