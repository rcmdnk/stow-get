version=2.7.13
url_prefix=https://www.python.org/ftp/python/${version}/
tarball=Python-${version}.tar.xz
dir=Python-${version}
function stow_install {
  stow_install_tarball
}
