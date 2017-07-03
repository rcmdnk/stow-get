inst_type=github
user=mtoyoda
configure=""
function make_cmd {
  make && mkdir -p "$stow_dir/$target/bin" && cp sl "$stow_dir/$target/bin"
}
get_version
tarball=${version}.tar.gz
