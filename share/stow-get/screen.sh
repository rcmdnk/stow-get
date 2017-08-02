inst_type=gnu
bin_dep=(automake autoconf)
lib_dep=(ncurses)
function before_configure {
  if [[ "$OSTYPE" =~ darwin ]];then
    wget https://gist.githubusercontent.com/yujinakayama/4608863/raw/75669072f227b82777df25f99ffd9657bd113847/gistfile1.diff >/dev/null 2>&1
    patch -p2 < gistfile1.diff
  fi
  wget https://gist.githubusercontent.com/rcmdnk/b0bf57d422c875fb70645556d7770091/raw/26d43f3581a77d42027238a4f65130d4753944dc/screen-utf8-nfd.patch >/dev/null 2>&1
  wget https://gist.githubusercontent.com/rcmdnk/8a90eba829fd789a4e058492b494f862/raw/b3104ce355ed5ef17df77caa2af7d99c86a56457/screen-utf8-osc.diff >/dev/null 2>&1
  patch -p2 < screen-utf8-nfd.patch && patch -p2 < screen-utf8-osc.diff
  ./autogen.sh
}
configure_options="--enable-colors256"
ncurses_check=$(check_lib libncurses 2)
if [ -n "ncurses_check" ];then
  configure_flags="CPPFLAGS=\"-I$(dirname $ncurses)/include\" LDFLAGS=\"-L$ncurses_check\""
fi
