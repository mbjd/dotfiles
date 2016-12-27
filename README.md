# dotfiles

Humble dotfile repository.

### Installation

This whole thing is managed by GNU `stow`. So if you have that installed,
you can just run the makefile with one of the following commands, which
will use `stow` to distribute symlinks across your `$HOME` (as long as
there are no conflicts with existing files).

	make base
	make mac
	make linux
