inst_type=gnu
bin_dep=(automake autoconf)
lib_dep=(ncurses)
before_configure () {
  if [[ "$OSTYPE" =~ darwin ]];then
    download https://gist.githubusercontent.com/yujinakayama/4608863/raw/75669072f227b82777df25f99ffd9657bd113847/gistfile1.diff
    execute_patch  gistfile1.diff 2
  fi
  download https://gist.githubusercontent.com/rcmdnk/b0bf57d422c875fb70645556d7770091/raw/26d43f3581a77d42027238a4f65130d4753944dc/screen-utf8-nfd.patch
  download https://gist.githubusercontent.com/rcmdnk/8a90eba829fd789a4e058492b494f862/raw/b3104ce355ed5ef17df77caa2af7d99c86a56457/screen-utf8-osc.diff
  execute_patch screen-utf8-nfd.patch 2
  execute_patch screen-utf8-osc.diff 2
  execute ./autogen.sh
}
configure_options="--enable-colors256"
ncurses_check=$(check_lib libncurses 2)
if [ -n "$ncurses_check" ];then
  configure_flags="CPPFLAGS=\"-I$(dirname $ncurses_check)/include\" LDFLAGS=\"-L$ncurses_check\""
fi
