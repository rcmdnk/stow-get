inst_type=tarball
url_top="http://ftp.gnome.org/pub/gnome/sources/glib/"
bin_dep=(gettext)
lib_dep=(ffi_package_libffi)
function get_latest {
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
    printf "%15s %8s %10s\n" "$package" "$version"  "$d"
  fi
}
get_version
url_prefix=http://ftp.gnome.org/pub/gnome/sources/glib/$(echo $version|cut -d '.' -f1-2)
tarball=glib-${version}.tar.xz
