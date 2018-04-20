inst_type=gnu
ac_prog_version=`bison --version 2>&1 | sed -n 's/^.*bison (GNU Bison) \([0-9]*\.[0-9.]*\).*$/\1/p'`
case $ac_prog_version in
  '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
  2.7*|[3-9].*|[1-9][0-9]*)
    ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
  *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
esac
prepend_package bison

ac_prog_version=`ld --version 2>&1 | sed -n 's/^.*GNU gold.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
case $ac_prog_version in
  '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
  1.1[4-9]*|1.[2-9][0-9]*|1.1[0-9][0-9]*|[2-9].*|[1-9][0-9]*)
  ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
  *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
esac
prepend_package binutils
