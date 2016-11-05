# Build and patch configure st.

default: patch-srcery

clone: st
	git clone git://git.suckless.org/st

# Apply any given patch file in the st directory
patch-%: clone
	cd st && git checkout -- . && patch < ../$*.patch
	@echo "==> Patch to st applied, now make & install st"

clean:
	rm -rf st && mkdir st
