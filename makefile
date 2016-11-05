# Little wrapper around GNU stow

default: linux

.PHONY: base
base:
	stow bash
	stow misc
	stow scripts
	stow tmux
	stow vim

.PHONY: mac
mac: base
	stow cmus
	stow fish

.PHONY: linux
linux: base
	stow i3
	stow linux
	stow ncmpcpp
	stow st
