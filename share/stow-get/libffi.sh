inst_type=github
bin_dep=(autoconf automake m4 libtool makeinfo_package_texinfo)
function before_configure {
  ./autogen.sh
}
