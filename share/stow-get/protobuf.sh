inst_type=github
user=google
bin_dep=(autoconf)
before_configure () {
  execute ./autogen.sh
}
