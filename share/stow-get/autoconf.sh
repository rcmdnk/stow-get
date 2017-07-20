inst_type=gnu
if check_bin m4;then
  m4_version=($(m4 --version|head -n1|cut -d' ' -f 4|tr . ' '))
  if [ "${m4_version[0]}" -lt 1 ] || ( [ "${m4_version[0]}" -eq 1 ] && [ "${m4_version[1]}" -lt 16 ] );then
    bin_dep=(m4_install_package_m4)
  fi
else
  bin_dep=(m4)
fi
