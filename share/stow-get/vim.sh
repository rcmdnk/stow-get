version=8.0.0586
config_options="--enable-luainterp=yes --enable-perlinterp=yes --enable-pythoninterp=yes --enable-python3interp=yes --enable-rubyinterp=yes --enable-cscope --enable-multibyte"
function stow_install {
  stow_install_github
}
