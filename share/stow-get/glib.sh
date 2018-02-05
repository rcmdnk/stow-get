inst_type=tarball
url_top="http://ftp.gnome.org/pub/gnome/sources/glib/"
lib_dep=(ffi_package_libffi gettextlib_package_gettext)
gettext_check=$(check_lib libmount 2)
_CPPFLAGS=""
_LDFLAGS=""
gettext_check=$(check_lib libgettextlib 2)
if [ -z "$gettext_check" ];then
  _CPPFLAGS="-I${inst_dir}/include"
  _LDFLAGS="-L${inst_dir}/lib"
else
  _CPPFLAGS="-I$(dirname "$gettext_check")/include"
  _LDFLAGS="-L$gettext_check"
fi
if [[ "$OSTYPE" =~ linux ]];then
  lib_dep=(mount_package_util-linux ${lib_dep[@]})
  mount_check=$(check_lib libmount 2)
  if [ -z "$mount_check" ];then
    _CPPFLAGS="$_CPPFLAGS -I${inst_dir}/include"
    _LDFLAGS="$_LDFLAGS -L${inst_dir}/lib"
  else
    _CPPFLAGS="$_CPPFLAGS -I$(dirname "$mount_check")/include"
    _LDFLAGS="$_LDFLAGS -L$mount_check"
  fi
fi
configure_flags="CPPFLAGS=\"$_CPPFLAGS\" LDFLAGS=\"$_LDFLAGS\""
if check_bin pcretest;then
  pcre_version=($(pcretest -C|head -n1|cut -d ' ' -f 3|tr . ' '))
  if [ "${pcre_version[0]}" -lt 8 ] || ( [ "${pcre_version[0]}" -eq 8 ] && [ "${pcre_version[1]}" -lt 13 ] );then
    bin_dep=(pcre_install_package_pcre ${bin_dep[@]})
  fi
else
  bin_dep=(pcre ${bin_dep[@]})
fi
get_latest () {
  local output_detail="${1:-0}"
  local version_top="$(get_page "$url_top/?C=M;O=A"|grep "folder.png"|tail -n1|cut -d'"' -f 6|cut -d '/' -f1)"
  if [ -z "$version_top" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  local params="$(get_page "$url_top/$version_top/?C=M;O=A"|grep "tar.xz"|tail -n1)"
  tarball=$(echo $params|cut -d '"' -f6)
  version=$(echo $tarball|cut -d '-' -f2|cut -d '.' -f 1-3)
  if [ -z "$version" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  if [ "$output_detail" -eq 1 ];then
    local d="$(echo "$params"|awk '{print $6" "$7" "$8}')"
    printf "%15s %8s %20s\n" "$package" "$version"  "$d"
  fi
}
get_version
url_prefix=http://ftp.gnome.org/pub/gnome/sources/glib/$(echo $version|cut -d '.' -f1-2)
tarball=glib-${version}.tar.xz
