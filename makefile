# Little wrapper around GNU stow

ALL_UNITS=$(shell find . -maxdepth 1 -mindepth 1 -type d -not -name '.git' | tr -d ./)

STOW=stow
UNSTOW=stow --delete

default: linux

.PHONY: base
base:
	$(STOW) bash misc scripts tmux vim vimperator

.PHONY: mac
mac: base
	$(STOW) cmus fish

# alternatively:
# $(STOW) i3 linux ncmpcpp st xbindkeys
.PHONY: linux
linux: base
	$(STOW) i3 linux mpd st sxhkd

.PHONY: unstow
unstow:
	$(UNSTOW) $(ALL_UNITS)
