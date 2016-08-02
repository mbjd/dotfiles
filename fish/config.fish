setenv PATH ~/scripts/ ~/scripts/colorscripts $PATH

# Remove duplicates from path (otherwise the above two entries would
# be repeated over and over when sourcing this file several times)
setenv PATH (echo $PATH | tr ' ' '\n' | sort | uniq)

setenv EDITOR vim
setenv LESS '-Ri'
setenv XDG_CONFIG_HOME ~/.config
setenv XDG_CONFIG      ~/.config
setenv PYTHONSTARTUP   ~/.pystartup.py
setenv LANG 'en_US.UTF-8'

alias ls "ls -Fh --color=auto"
alias las "ls -aSh"
alias lal "ls -al"
alias clr "clear"
alias ll "ls -l"
alias l "ls"

alias newest "ls -t | head -1"

# Vimisms
alias vimrc "vi ~/.vimrc"
alias vi vim
alias iv sl
alias v vim

alias gitlog "git log --format=oneline --abbrev-commit --graph"
alias clip 'pbpaste | vipe | pbcopy'
alias unset 'set --erase'
alias where 'which -a'
alias mkae 'make'
alias m 'make'
alias - 'cd -'
alias :t type
alias :h help
alias :q exit
alias q exit

alias music '~/Music/iTunes/iTunes Media/Music'
alias docs 'cd ~/Documents'
alias dl 'cd ~/Downloads'
alias dev 'cd ~/dev'

if [ (uname) = "Darwin" ]

	alias vi nvim
	alias vim nvim

	# Trash cmus's stderr so that message won't clog up the UI
	alias cmus "cmus ^ /dev/null"

	alias mvim "open -a MacVim"
	alias subl "open -a 'Sublime Text'"
	alias finder 'open .'
	alias hd 'hexdump -C'
	alias vtop 'vtop --theme brew'
	alias md 'open -a MacDown'
	alias typora 'open -a Typora'

	alias dots 'cd ~/dotfiles'

	setenv PATH /Library/Frameworks/Python.framework/Versions/3.5/bin $PATH
	setenv PATH /opt/gcc-6.1.0/bin $PATH
	setenv GOPATH ~/dev/go
	setenv PATH ~/dev/go/bin $PATH
	setenv EDITOR nvim
	setenv GIT_EDITOR nvim

	alias ls 'ls -FGh'

	# Preview a file or folder in Quicklook
	function ql
		qlmanage -p "$1" ^ /dev/null > /dev/null
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

	source ~/dev/misc/fishrc.fish

else # just assume ubuntu here

	alias pbcopy 'xclip -selection clipboard -i'
	alias pbpaste 'xclip -selection clipboard -o'

	alias dots 'cd ~/misc/dotfiles'

	setenv GIT_EDITOR vim

	# Open in new gvim tab
	alias tvim 'gvim --remote-tab'
	alias mvim gvim

	alias open 'xdg-open'

	function fish_greeting
		return 0
	end
end

function fishrc
	vim ~/.config/fish/config.fish
	source ~/.config/fish/config.fish
end

function cpl
	history | head -n 1 | pbcopy
end
