inst_type=github
stow_install () {
  execute download https://github.com/neovim/neovim/releases/download/v${version}/nvim.appimage
  ret=$?
  if [ $ret -ne 0 ];then
    return $ret
  fi
  execute mkdir -p neovim/bin
  execute mv nvim.appimage neovim/bin/nvim
  execute chmod 755 neovim/bin/nvim
  execute mkdir -p "$stow_dir" && execute cp -r ./neovim "$stow_dir/$target"
}
