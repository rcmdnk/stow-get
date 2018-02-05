inst_type=github
bin_dep=(automake m4 libtool makeinfo_package_texinfo)
if check_bin autoconf;then
  autoconf_version=($(autoconf --version|head -n1|cut -d' ' -f 4|tr . ' '))
  if [ "${autoconf_version[0]}" -lt 2 ] || ( [ "${autoconf_version[0]}" -eq 2 ] && [ "${autoconf_version[1]}" -lt 68 ] );then
    bin_dep=(autoconf_install_package_autoconf ${bin_dep[@]})
  fi
else
  bin_dep=(autoconf ${bin_dep[@]})
fi
before_configure () {
  execute ./autogen.sh
}
