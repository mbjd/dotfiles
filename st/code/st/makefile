# Build and patch configure st.

.NOTPARALLEL: default
default: clean patch-input-font patch-srcery patch-hide-cursor
other: clean patch-envypn-font patch-blue patch-hide-cursor

st:
	git clone git://git.suckless.org/st

# Apply any given patch file in the st directory
# NOTPARALLEL because the different patches modify the
# same file, and not all patches will be applied when
# make is running concurrently.
.NOTPARALLEL: patch-%
patch-%: st
	@ cd ./st && rm -f config.h && patch < ../$*.patch

clean: st
	cd st; git checkout -- .; git clean -f;
