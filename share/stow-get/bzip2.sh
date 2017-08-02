inst_type=tarball
function make_cmd {
  if [[ "$OSTYPE" =~ darwin ]];then
    execute make
  else
    execute make -f Makefile-libbz2_so
  fi
  execute make install PREFIX="$stow_dir/$target"
}
function get_latest {
  local output_detail="${1:-0}"
  local params="$(get_page http://www.bzip.org|grep "current version is")"
  version="$(echo "$params"|cut -d ">" -f 3|cut -d "<" -f1)"
  if [ -z "$version" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  if [ "$output_detail" -eq 1 ];then
    local d="$(echo "$params"|cut -d "," -f 2)"
    printf "%15s %8s %20s\n" "$package" "$version"  "$d"
  fi
}
get_version
url_prefix=http://www.bzip.org/$version
