python_version=2
inst_type=tarball
configure_options="--enable-unicode=ucs4 --enable-shared"
get_latest () {
  local output_detail="${1:-0}"
  local params="$(get_page https://www.python.org/downloads/|grep "Download the latest <")"
  if [ $python_version = 2 ];then
    local t=$(echo "$params"|cut -d '"' -f 4)
  else
    local t=$(echo "$params"|cut -d '"' -f 2)
  fi
  version="$(echo "$t"|awk '{split($1, tmp, "Python-")}{gsub(".tar.xz", "", tmp[2])}{print tmp[2]}')"
  if [ -z "$version" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  if [ "$output_detail" -eq 1 ];then
    printf "%15s %8s\n" "$package" "$version"
  fi
}
get_version
url_prefix=https://www.python.org/ftp/python/${version}/
tarball=Python-${version}.tar.xz
directory=Python-${version}
stow_option="--defer=2to3"
#after_add_package () {
#  curl -kL https://bootstrap.pypa.io/get-pip.py | python
#}
