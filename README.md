# dotfiles

These are some config files for tmux, fish, bash, vim, cmus, and python.
Running the `install.sh` script creates symlinks to the configuration files
where their respective programs expect to find them (the originals are left
where you cloned this repo).

I only tested it on OS X, and some functionality won't work on other systems
(for example the python copy/paste functions, which use `pbcopy` and
`pbpaste`).

### Installation

First, make sure you have the following installed (If you only have a subset,
it should work too):

- tmux
- fish
- vim
- cmus
- python

Then, execute the following commands:

	git clone https://github.com/mbjd/dotfiles.git
	cd dotfiles
	./install.sh

