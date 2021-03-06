setenv PATH ~/scripts/ ~/scripts/colorscripts $PATH

# Remove duplicates from path (otherwise the above two entries would
# be repeated over and over when sourcing this file several times)
setenv PATH (echo $PATH | tr ' ' '\n' | sort | uniq)

# Set a tab width of 4
tabs -4

setenv EDITOR vim
setenv LESS '-Ri -x4'
setenv XDG_CONFIG_HOME ~/.config
setenv XDG_CONFIG      ~/.config
setenv PYTHONSTARTUP   ~/.pystartup.py
setenv LANG 'en_US.UTF-8'

alias ls "ls -F --color=auto"
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

alias fancy-wget 'wget -r -l inf -np -nH -k -c -N -w1 --no-check-certificate -e robots=off --random-wait --reject=\'index.html*\''
alias gitlog "git log --format=oneline --abbrev-commit --graph"
alias clip 'pbpaste | vipe | pbcopy'
alias unset 'set --erase'
alias where 'which -a'
alias make 'make -j'
alias mkae 'make'
alias m 'make'
alias - 'cd -'
alias :t type
alias :h help
alias :q exit
alias q exit

function raw
	cat $argv | hexdump | sed 's/^[[:xdigit:]]*//g' | tr -d ' \n'
end

alias music '~/Music/iTunes/iTunes Media/Music'
alias docs 'cd ~/Documents'
alias dl 'cd ~/Downloads'
alias dev 'cd ~/dev'

alias u2 'up 2'
alias u3 'up 3'
alias u4 'up 4'
alias u5 'up 5'
alias u6 'up 6'
alias u7 'up 7'
alias u8 'up 8'

if [ (uname) = "Darwin" ]

	alias vi nvim
	alias vim nvim

	# Trash cmus's stderr so that message won't clog up the UI
	alias cmus "cmus ^ /dev/null"

	alias subl "open -a 'Sublime Text'"
	alias grep 'ggrep --color=auto'
	alias sha256sum 'shasum -a 256'
	alias vtop 'vtop --theme brew'
	alias typora 'open -a Typora'
	alias mvim "open -a MacVim"
	alias md 'open -a MacDown'
	alias objdump 'otool -tV'
	alias top 'top -o cpu'
	alias sha1sum 'shasum'
	alias rgrep 'grep -r'
	alias hd 'hexdump -C'
	alias finder 'open .'
	alias units 'gunits'

	alias dots 'cd ~/dotfiles'

	setenv PATH /opt/gcc-6.1.0/bin $PATH
	setenv PATH ~/dev/go/bin $PATH
	setenv GOPATH ~/dev/go

	setenv BROWSER 'open -a Google\ Chrome'
	setenv GIT_EDITOR nvim
	setenv EDITOR nvim

	alias ls 'ls -FGh'

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
end

function fishrc
	vim ~/.config/fish/config.fish
	source ~/.config/fish/config.fish
end

function cpl
	history | head -n 1 | pbcopy
end

function fish_greeting
    return 0
end
