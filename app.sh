### fdupes ###
_build_fdupes() {
  local BRANCH="master"
  local FOLDER="fdupes-${BRANCH}"
  local URL="https://github.com/adrianlopezroche/fdupes.git"

  _download_git "${BRANCH}" "${FOLDER}" "${URL}"
  pushd "target/${FOLDER}"

  patch -p1 <<-__PATCH_EOF__
	diff --git a/Makefile b/Makefile
	index bc5ff54..31678be 100644
	--- a/Makefile
	+++ b/Makefile
	@@ -11,7 +11,7 @@
	 # determination of the actual installation directories.
	 # Suggested values are "/usr/local", "/usr", "/pkgs/fdupes-\$(VERSION)"
	 #
	-PREFIX = /usr/local
	+PREFIX = ${DEST}

	 #
	 # When compiling for 32-bit systems, FILEOFFSET_64BIT must be enabled
	@@ -70,8 +70,8 @@ MKDIR   = mkdir -p
	 #
	 # Make Configuration
	 #
	-CC ?= gcc
	-COMPILER_OPTIONS = -Wall -O -g
	+CC ?= ${CC-gcc}
	+COMPILER_OPTIONS = ${CFLAGS} -Wall -O -g

	 CFLAGS= \$(COMPILER_OPTIONS) -I. -DVERSION=\\"\$(VERSION)\\" \$(OMIT_GETOPT_LONG) \$(FILEOFFSET_64BIT)
	__PATCH_EOF__

  make
  make install
  popd
}

### BUILD ###
_build() {
  _build_fdupes
  _package
}
