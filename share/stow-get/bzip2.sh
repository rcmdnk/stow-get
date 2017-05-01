version=1.0.6
url_prefix=http://www.bzip.org/$version
configure=""
function make_cmd {
  make -f Makefile-libbz2_so
  make install PREFIX="$STOW_DIR/$target"
}
function stow_install {
  stow_install_tarball
}
