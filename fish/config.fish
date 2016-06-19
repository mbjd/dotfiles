function fish_prompt
	set_color -o
	printf "%s > " (prompt_pwd)
	set_color normal
end

function fish_greeting
	echo
	centered_print '><(((°>'
	echo
	centered_print 'The friendly interactive shell'
	echo
end

set PATH ~/bin/ ~/bin/colorscripts $PATH

alias clr "clear"
alias ls "ls -F"
alias l "ls"
alias ll "ls -l"
alias la "ls -a"
alias lal "ll -a"

alias newest "ls -t | head -1"

# Vimisms
alias vi vim
alias v vim
alias vimrc "vi ~/.vimrc"
alias :q "exit"
set EDITOR vim
alias mvim "open -a MacVim"

# Trash cmus's stderr so that message won't clog up the UI
alias cmus "cmus ^ /dev/null"

# Preview a file or folder in Quicklook
function ql
	qlmanage -p "$1" ^> /dev/null &
end

function fishrc
	eval $EDITOR ~/.config/fish/config.fish
	source ~/.config/fish/config.fish
end
