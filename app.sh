### fdupes ###
_build_fdupes() {
  local BRANCH="master"
  local FOLDER="fdupes-${BRANCH}"
  local URL="https://github.com/adrianlopezroche/fdupes.git"

  _download_git "${BRANCH}" "${FOLDER}" "${URL}"
  pushd "target/${FOLDER}"
  PREFIX="${DEST}" make -e
  make install
  popd
}

### BUILD ###
_build() {
  _build_fdupes
  _package
}
