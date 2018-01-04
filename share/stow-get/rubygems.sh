inst_type=github
function make_cmd {
  gem update --system
  execute ruby setup.rb --prefix="$stow_dir/$target"
}
