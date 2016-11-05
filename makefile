# Little wrapper around GNU stow

ALL_UNITS=$(shell find . -maxdepth 1 -mindepth 1 -type d -not -name '.git' | tr -d ./)
STOW=stow
UNSTOW=stow --delete

default: linux

.PHONY: base
base:
	$(STOW) bash
	$(STOW) misc
	$(STOW) scripts
	$(STOW) tmux
	$(STOW) vim

.PHONY: mac
mac: base
	$(STOW) cmus
	$(STOW) fish

.PHONY: linux
linux: base
	$(STOW) i3
	$(STOW) linux
	$(STOW) ncmpcpp
	$(STOW) st

.PHONY: unstow
unstow:
	$(UNSTOW) $(ALL_UNITS)
