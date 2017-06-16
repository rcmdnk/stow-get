inst_type=tarball
url_prefix=ftp://ftp.info-zip.org/pub/infozip/src
tarball=${directory}.tgz
configure=""
function make_cmd {
  cp ./unix/Makefile .
  make generic
  mkdir -p "$stow_dir/$target/bin/"
  cp unzip "$stow_dir/$target/bin/"
}
function get_latest {
  local output_detail="${1:-0}"
  local params="$(curl http://www.info-zip.org/mans/unzip.html 2>/dev/null|grep "INDENTATION" -B10|tail -n11)"
  version="$(echo "$params"|sed -n 1p|cut -d v -f2|cut -d "<" -f1)"
  if [ "$output_detail" -eq 1 ];then
    local d="$(echo "$params"|sed -n 6p|cut -d ">" -f2|cut -d "<" -f1)"
    printf "%15s %8s %10s\n" "$package" "$version"  "$d"
  fi
}
if [ -z "$version" ];then
  get_version >/dev/null
fi
directory=${package}${version/./}
