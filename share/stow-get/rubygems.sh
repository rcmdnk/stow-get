inst_type=github
function make_cmd {
  execute ruby setup.rb --prefix="$stow_dir/$target"
}
