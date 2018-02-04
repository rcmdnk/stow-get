inst_type=gnu
lib_dep=(libtiff)
_CPPFLAGS=""
_LDFLAGS=""
libtiff_check=$(check_lib libtiff 2)
if [ -n "$libtiff_check" ];then
  _CPPFLAGS="-I$(dirname "$libtiff_check")/include"
  _LDFLAGS="-L$(dirname "$libtiff_check")/lib"
fi
configure_options="$configure_options --disable-ns-self-contained"
xml2=$(xml2-config --cflags 2>/dev/null)
if [ -z "$xml2" ];then
  configure_options="$configure_options --without-xml2"
else
  _CPPFLAGS="$_CPPFLAGS \"$(xml2-config --cflags)\""
fi
gif=$(check_lib libgif 1)
if [ -z "$gif" ];then
  configure_options="$configure_options --without-xpm --without-gif"
fi
if [ -n "$_CPPFLAGS" ];then
  configure_options="$configure_options CPPFLAGS=\"$_CPPFLAGS\""
fi
if [ -n "$_LDFLAGS" ];then
  configure_options="$configure_options LDFLAGS=\"$_LDFLAGS\""
fi
function make_cmd {
  execute make all
  if [ $ret -ne 0 ];then
    # Try to build with CANNOT_DUMP=yes
    # This will disable graphical session.
    # [Cannot build emacs using Dockerfile · Issue #22801 · moby/moby](https://github.com/moby/moby/issues/22801)
    #
    echo "Try to build with CANNOT_DUMP=yes"
    configure_flags="$configure_flags env CANNOT_DUMP=yes"
    execute $configure_flags $configure_file --prefix="$stow_dir/$target" $configure_options
    execute make all
  fi
  if [ $ret -eq 0 ];then
    execute make install
  fi
  return $ret
}
