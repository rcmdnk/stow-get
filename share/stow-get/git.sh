inst_type=github
function before_configure {
  make configure
}
bin_dep=(autoconf)
lib_dep=(curl expat)
