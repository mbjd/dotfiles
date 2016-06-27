function fish_prompt
	set_color -o
	printf "%s ―――― " (prompt_pwd)
	set_color normal
end

setenv PATH ~/scripts/ ~/scripts/colorscripts $PATH
setenv PATH /Library/Frameworks/Python.framework/Versions/3.5/bin $PATH
setenv EDITOR vim
setenv PAGER less
setenv BROWSER open
setenv XDG_CONFIG_HOME ~/.config
setenv PYTHONSTARTUP ~/.pystartup.py

alias clr "clear"
alias ls "ls -Fh"
alias l "ls"
alias ll "ls -l"
alias lal "ls -al"
alias las "ls -aSh"

alias newest "ls -t | head -1"

# Vimisms
alias vi vim
alias v vim
alias vimrc "vi ~/.vimrc"
alias :q "exit"
alias mvim "open -a MacVim"

# Trash cmus's stderr so that message won't clog up the UI
alias cmus "cmus ^ /dev/null"

# Preview a file or folder in Quicklook
function ql
	qlmanage -p "$1" ^ /dev/null > /dev/null &
end

function fishrc
	vim ~/.config/fish/config.fish
	source ~/.config/fish/config.fish
end

# cd to frontmost finder window
function cdf
	cd (/usr/bin/osascript (echo '
		tell application "Finder"
			try
				set currFolder to (folder of the front window as alias)
			on error
				set currFolder to (path to desktop folder as alias)
			end try
			POSIX path of currFolder
		end tell' | psub))
end
