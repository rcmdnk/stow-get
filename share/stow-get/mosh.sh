inst_type=github
user=mobile-shell
bin_dep=(automake autoconf)
function before_configure {
  ./autogen.sh
}
function get_latest {
  local output_detail="${1:-0}"
  get_github_latest 0
  version="${version#mosh-}"
  if [ "$output_detail" -eq 1 ] && [ "$version" != "" ];then
    printf "%15s %8s\n" "$package" "$version"
  fi
}
