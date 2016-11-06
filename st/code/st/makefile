# Build and patch configure st.

default: patch-srcery patch-hide-cursor

clone: st
	git clone git://git.suckless.org/st

# Apply any given patch file in the st directory
patch-%:
	cd ./st && patch < ../$*.patch
	@echo "==> Patch to st applied, now make & install st"

clean:
	cd st; git checkout -- .; git clean -f;
