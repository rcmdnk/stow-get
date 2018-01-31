inst_type=github
function make_cmd {
  execute gem update --system
  execute ruby setup.rb --prefix="$stow_dir/$target"
}
