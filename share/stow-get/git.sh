inst_type=github
function before_configure {
  execute make configure
}
bin_dep=(autoconf)
lib_dep=(curl expat)
ncurses_check=$(check_lib libncurses 2)
if [ -n "$ncurses_check" ];then
  configure_flags="CPPFLAGS=\"-I$(dirname $ncurses_check)/include\" LDFLAGS=\"-L$ncurses_check\""
fi
