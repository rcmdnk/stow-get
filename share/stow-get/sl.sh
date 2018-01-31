inst_type=github
user=mtoyoda
function make_cmd {
  execute make && execute mkdir -p "$stow_dir/$target/bin" && execute cp sl "$stow_dir/$target/bin"
}
get_version
tarball=${version}.tar.gz
