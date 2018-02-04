inst_type=tarball
url_prefix=ftp://download.osgeo.org/libtiff
function get_latest {
  local output_detail="${1:-0}"
  local params="$(get_page http://libtiff.maptools.org/)"
  version="$(echo "$params"|get_page http://libtiff.maptools.org/|grep "Latest Stable Release" -A1 | grep href|grep href|head -n1|cut -d ">" -f3|cut -d "<" -f1|sed 's/v//g')"
  if [ -z "$version" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  if [ "$output_detail" -eq 1 ];then
    local d="$(echo "$params"|grep "Last updated"|tail -n1)"
    printf "%15s %8s   updated on: %10s\n" "$package" "$version"  "$d"
  fi
}
get_version
directory=tiff-${version}
tarball=${directory}.tar.gz
