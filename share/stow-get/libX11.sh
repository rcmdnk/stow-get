inst_type=tarball
url_prefix=https://www.x.org/releases/individual/lib
include_dep=("X11/Xproto.h_package_xproto")
function get_latest {
  local output_detail="${1:-0}"
  local params="$(get_page ${url_prefix}/|grep "libX11"|grep "tar.gz\""|tail -n1)"
  version="$(echo "$params"|cut -d '"' -f 8|cut -d "-" -f2|cut -d'.' -f1-3)"
  if [ -z "$version" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  if [ "$output_detail" -eq 1 ];then
    local d="$(echo "$params"|cut -d">" -f10|cut -d "<" -f1)"
    local s="$(echo "$params"|cut -d">" -f12|cut -d "<" -f1)"
    printf "%15s %8s %20s %6s\n" "$package" "$version" "$d" "$s"
  fi
}
