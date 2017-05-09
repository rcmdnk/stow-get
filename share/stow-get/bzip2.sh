version=1.0.6
inst_type=tarball
url_prefix=http://www.bzip.org/$version
configure=""
function make_cmd {
  if [[ "$OSTYPE" =~ darwin ]];then
    make
  else
    make -f Makefile-libbz2_so
  fi
  make install PREFIX="$stow_dir/$target"
}
