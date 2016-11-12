# Build and patch configure st.

# ~~~ I M P O R T A N T ~~~
# If you run make with the -j switch, patching won't
# go well (who would have thought). If make is aliased
# to something like 'make -j4', you need to disable
# concurrent making explicitly with make -j1.

default: patch-font patch-srcery patch-hide-cursor

clone:
	git clone git://git.suckless.org/st

# Apply any given patch file in the st directory
patch-%:
	@echo Patching from $*.patch...
	cd ./st && rm -f config.h && patch < ../$*.patch
	@echo "==> Patch to st applied, now make & install st"

clean:
	cd st; git checkout -- .; git clean -f;
