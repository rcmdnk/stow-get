python_version=${python_version:-2}
inst_type=tarball
function get_latest {
  local output_detail="${1:-0}"
  local params="$(curl -k https://www.python.org/downloads/ 2>/dev/null|grep "Download the latest <")"
  if [ $python_version = 2 ];then
    local t=$(echo "$params"|cut -d '"' -f 2)
  else
    local t=$(echo "$params"|cut -d '"' -f 4)
  fi
  version="$(echo "$t"|awk '{split($1, tmp, "Python-")}{gsub(".tar.xz", "", tmp[2])}{print tmp[2]}')"
  if [ "$output_detail" -eq 1 ];then
    printf "%15s %8s\n" "$package" "$version"
  fi
}
url_prefix=https://www.python.org/ftp/python/$(get_version)/
tarball=Python-$(get_version).tar.xz
directory=Python-$(get_version)
