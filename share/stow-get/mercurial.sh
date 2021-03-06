inst_type=tarball
version_safe=4.2.1
url_prefix=https://www.mercurial-scm.org/release/
make_cmd () {
  execute make build
  execute python setup.py install --prefix="$stow_dir/$target" --force
}
get_latest () {
  local output_detail="${1:-0}"
  local params="$(get_page https://www.mercurial-scm.org/wiki/|grep released|cut -d "(" -f1)"
  version="$(echo "$params"|cut -d " " -f 7)"
  if [ -z "$version" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  if [ "$output_detail" -eq 1 ];then
    local d="released on $(echo "$params"|cut -d ">" -f6|cut -d " " -f1)"
    printf "%15s %8s %20s\n" "$package" "$version"  "$d"
  fi
}
