inst_type=github
lib_dep=(ncurses event_package_libevent)
ncurses_check=$(check_lib libncurses 2)
if [ -n "$ncurses_check" ];then
  configure_flags="CPPFLAGS=\"-I$(dirname $ncurses_check)/include\" LDFLAGS=\"-L$ncurses_check\""
fi
get_version
tarball=${package}-${version}.tar.gz
