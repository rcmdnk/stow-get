inst_type=github
make_cmd () {
  execute gem update --system
  execute ruby setup.rb --prefix="$stow_dir/$target"
}
