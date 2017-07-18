inst_type=tarball
url_prefix=https://pkg-config.freedesktop.org/releases/
glib_check=0
if ! check_lib glib;then
  lib_dep=(glib)
else
  glibv=($(echo $(glib-compile-schemas --version) 2>/dev/null|sed 's/\./ /g'))
  if [ -z "${glibv}" ] || [ "${glib[0]}" -le 2 ] || [ "${glib[1]}" -le 15 ];then
    lib_dep=(glib_install_package_glib)
  fi
fi
