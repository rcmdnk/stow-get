inst_type=github
bin_dep=(autoconf automake libtool)
function before_configure {
  ./autogen.sh
}
