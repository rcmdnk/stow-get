inst_type=github
function before_configure {
  execute make configure
}
bin_dep=(autoconf)
lib_dep=(curl expat)
