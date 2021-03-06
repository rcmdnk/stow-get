inst_type=tarball
# temporarily, 2.2.2 can't be compiled at old linux?
# 2.2.1 started to fail at mac (~Dec/2017, hight sierra)
version_safe=2.2.5
get_latest () {
  local output_detail="${1:-0}"
  local params="$(get_page https://libexpat.github.io/|grep -v Changelog|grep "Changes" -B1|head -n2)"
  version="$(echo "$params"|tail -n1|cut -d "/" -f 7|sed 's/^R_//'|sed 's/_/./g')"
  if [ -z "$version" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  if [ "$output_detail" -eq 1 ];then
    local d="$(echo "$params"|cut -d "," -f 2)"
    local d="released on $(echo "$params"|head -n1|cut -d ">" -f2|cut -d " " -f1)"
    printf "%15s %8s %20s\n" "$package" "$version"  "$d"
  fi
}
get_version
url_prefix=https://sourceforge.net/projects/expat/files/expat/$version
tarball=expat-${version}.tar.bz2
