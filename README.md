# dotfiles

These are some config files for tmux, fish, bash, vim, cmus, and python. If you
run the `install.sh` script, the files are symlinked to the location assumed by
the respective programs that their programs can find them (the originals are
left where you cloned this repo).

I only tested it on OS X, and some functionality won't work on other systems
(for example the python copy/paste functions, which use `pbcopy` and
`pbpaste`).

### Installation

First, make sure you have the following installed (it will work without these
but you wouldn't configure anything):

- tmux
- fish
- vim
- cmus
- python

Then, execute the following commands:

	https://github.com/mbjd/dotfiles.git
	cd dotfiles
	./install.sh

