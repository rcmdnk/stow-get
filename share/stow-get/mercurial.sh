inst_type=tarball
url_prefix=https://www.mercurial-scm.org/release/
configure=""
function make_cmd {
  which python
  echo $LD_LIBRARY_PATH
  make build
  python setup.py install --prefix="$stow_dir/$target" --force
}
function get_latest {
  local output_detail="${1:-0}"
  local params="$(curl https://www.mercurial-scm.org/wiki/ 2>/dev/null|grep released|cut -d "(" -f1)"
  version="$(echo "$params"|cut -d " " -f 7)"
  if [ "$output_detail" -eq 1 ];then
    local d="released on $(echo "$params"|cut -d ">" -f6|cut -d " " -f1)"
    printf "%15s %8s %10s\n" "$package" "$version"  "$d"
  fi
}
