function fish_prompt
	set_color -o
	printf "%s > " (prompt_pwd)
	set_color normal
end

setenv PATH ~/scripts/ ~/scripts/colorscripts $PATH

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
alias mvim "open -a MacVim"
setenv EDITOR vim

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
