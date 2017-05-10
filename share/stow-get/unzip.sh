inst_type=tarball
version=6.0
url_prefix=ftp://ftp.info-zip.org/pub/infozip/src
directory=${package}${version}
tarball=${directory}.tgz
configure=""
function make_cmd {
  cp ./unix/Makefile .
  make generic
  mkdir -p "$stow_dir/$target/bin/"
  cp unzip "$stow_dir/$target/bin/"
}
