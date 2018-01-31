inst_type=github
user=Russell91
function make_cmd {
  execute mkdir -p "$stow_dir/$target/bin"
  execute cp sshrc "$stow_dir/$target/bin/"
  execute cp moshrc "$stow_dir/$target/bin/"
}
version=HEAD
