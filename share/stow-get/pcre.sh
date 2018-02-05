inst_type=tarball
url_prefix=https://ftp.pcre.org/pub/pcre
configure_options="--enable-utf --enable-unicode-properties"
get_latest () {
  local output_detail="${1:-0}"
  local params="$(get_page $url_prefix/|grep "tar.gz<"|grep pcre-8.|tail -n1)"
  version="$(echo "$params"|cut -d'"' -f2|cut -d '-' -f2|cut -d'.' -f1-2)"
  if [ -z "$version" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  if [ "$output_detail" -eq 1 ];then
    local d="$(echo "$params"|cut -d ">" -f3)"
    printf "%15s %8s %20s\n" "$package" "$version"  "$d"
  fi
}
