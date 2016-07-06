function fish_prompt
	set_color -o
	printf "%s ―――― " (prompt_pwd)
	set_color normal
end

setenv PATH ~/scripts/ ~/scripts/colorscripts $PATH
setenv EDITOR vim
setenv GIT_EDITOR vim
# setenv PAGER less
setenv LESS '-Ri'
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
alias :q exit

alias unset 'set --erase'
alias st 'echo $status'
alias q exit
alias :t type
alias back 'cd -'

alias gitlog "git log --format=oneline --abbrev-commit --graph"

if [ (uname) = "Darwin" ]
	alias copy pbcopy
	alias paste pbpaste

	# Trash cmus's stderr so that message won't clog up the UI
	alias cmus "cmus ^ /dev/null"

	alias mvim "open -a MacVim"
	alias finder 'open .'
	alias hd 'hexdump -C'

	setenv PATH /Library/Frameworks/Python.framework/Versions/3.5/bin $PATH
	setenv GOPATH ~/dev/go
	setenv PATH ~/dev/go/bin $PATH

	alias ls 'ls -FGh'

	# Preview a file or folder in Quicklook
	function ql
		qlmanage -p "$1" ^ /dev/null > /dev/null &
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

else # just assume ubuntu here
	alias copy 'xclip -i'
	alias paste 'xclip -o'

	alias tvim 'gvim --remote-tab'
	alias mvim gvim

	alias open 'xdg-open'

	function fish_greeting
	end
end

function fishrc
	vim ~/.config/fish/config.fish
	source ~/.config/fish/config.fish
end

function cpl
	history | head -n 1 | copy
end

fish_vi_key_bindings
