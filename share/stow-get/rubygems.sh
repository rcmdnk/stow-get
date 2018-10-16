inst_type=github
make_cmd () {
  execute gem update
  execute ruby setup.rb --prefix="$stow_dir/$target"
}
