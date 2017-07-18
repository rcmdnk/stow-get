inst_type=github
function make_cmd {
  ruby setup.rb --prefix="$stow_dir/$target"
}
