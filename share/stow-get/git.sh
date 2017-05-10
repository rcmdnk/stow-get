version=2.13.0
inst_type=github
function before_configure {
  make configure
}
bin_dep=(autoconf autoconf)
lib_dep=(libcurl curl libexpat expat)
