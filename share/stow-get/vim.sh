inst_type=github
configure_options="--enable-luainterp=yes --enable-perlinterp=yes --enable-pythoninterp=yes --enable-python3interp=yes --enable-cscope --enable-multibyte"
lib_dep=(readline termcap lua ncurses)
ncurses_check=$(check_lib libncurses 2)
if [ -n "$ncurses_check" ];then
  configure_flags="CPPFLAGS=\"-I$(dirname $ncurses_check)/include\" LDFLAGS=\"-L$ncurses_check\""
fi
