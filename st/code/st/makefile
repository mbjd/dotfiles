# Build and patch configure st.

default: clean patch-input-font patch-srcery patch-hide-cursor patch-keys compile
agila: clean patch-input-font patch-agila patch-hide-cursor patch-keys compile
transparent: clean patch-input-font patch-alpha patch-srcery patch-hide-cursor patch-keys compile
other: clean patch-input-font patch-blue patch-hide-cursor patch-keys compile
hacker: clean patch-input-font patch-green patch-hide-cursor patch-keys compile

compile: st
	cd st && make

st:
	git clone git://git.suckless.org/st

# Apply any given patch file in the st directory
# NOTPARALLEL because the different patches modify the
# same file, and not all patches will be applied when
# make is running concurrently.
.NOTPARALLEL: patch-%
patch-%: st
	@ cd ./st && rm -f config.h && patch < ../$*.patch

.PHONY: clean
clean: st
	# cd st; git checkout -- .; git clean -f;
	# this is really ugly but it didn't work with the latest commit
	# and the old one was fine so let's not bother fixing stuff
	cd st; git checkout c63a87cd; git clean -f;

.PHONY: install
install:
	cd st; make install
