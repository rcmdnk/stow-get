inst_type=github
user=google
bin_dep=(autoconf)
function before_configure {
  execute ./autogen.sh
}
