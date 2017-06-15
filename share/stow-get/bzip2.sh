inst_type=tarball
configure=""
function make_cmd {
  if [[ "$OSTYPE" =~ darwin ]];then
    make
  else
    make -f Makefile-libbz2_so
  fi
  make install PREFIX="$stow_dir/$target"
}
function get_latest {
  local output_detail="${1:-0}"
  local params="$(curl http://www.bzip.org 2>/dev/null|grep "current version is")"
  version="$(echo "$params"|cut -d ">" -f 3|cut -d "<" -f1)"
  if [ "$output_detail" -eq 1 ];then
    local d="$(echo "$params"|cut -d "," -f 2)"
    printf "%15s %8s %10s\n" "$package" "$version"  "$d"
  fi
}
get_latest
url_prefix=http://www.bzip.org/$version
