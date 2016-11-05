# dotfiles

Humble dotfile repository. Featuring:

	- `bash`
	- `vim`
	- `tmux`
	- `python`

Linux only:

	- `st` (suckless simple terminal)
	- `xbindkeys`
	- `i3`, `i3blocks`
	- `mpd`, `ncmpcpp`, `mpdcron`

Mac only:

	- `fish`
	- `cmus`

Furthermore, these programs/packages don't have a config file per se, but
are called somewhere in another config file:

i3 config:
	- `xset`
	- `setxkbmap`
	- `xcape`

scripts:
	- `moreutils`
	- `units`
	- `matplotlib`
	- `xev`
	- `chromium`

scripts (called via xbindkeys -> only needed on linux):
	- `kbdlight`
	- `light` ([this one](https://github.com/haikarainen/light))
	- `imagemagick`
	- `i3lock`

... And probably some more that I forgot. Nothing too importa

### Installation

This whole thing is managed by GNU `stow`. So if you have that installed,
you can just run the makefile with one of the following commands, which
will use `stow` to distribute symlinks across your `$HOME` (as long as
there are no conflicts with existing files).

	make base
	make mac
	make linux
