inst_type=tarball
url_prefix=ftp://ftp.info-zip.org/pub/infozip/src
function make_cmd {
  execute cp ./unix/Makefile .
  execute make generic
  execute mkdir -p "$stow_dir/$target/bin/"
  execute cp unzip "$stow_dir/$target/bin/"
}
function get_latest {
  local output_detail="${1:-0}"
  local params="$(get_page http://www.info-zip.org/mans/unzip.html|grep "INDENTATION" -B10|tail -n11)"
  version="$(echo "$params"|sed -n 1p|cut -d v -f2|cut -d "<" -f1)"
  if [ -z "$version" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  if [ "$output_detail" -eq 1 ];then
    local d="$(echo "$params"|sed -n 6p|cut -d ">" -f2|cut -d "<" -f1)"
    printf "%15s %8s %20s\n" "$package" "$version" "$d"
  fi
}
get_version
directory=${package}${version/./}
tarball=${directory}.tgz
