version=5.3.4
type=tarball
url_prefix=http://www.lua.org/ftp/
configure=""
plathome=linux
if [[ "$OSTYPE" =~ darwin ]];then
  plathome=macosx
elif [[ "$OSTYPE" =~ cygwin ]];then
  plathome=posix
elif [[ "$OSTYPE" =~ msys ]];then
  plathome=mingw
elif [[ "$OSTYPE" =~ solaris ]];then
  plathome=solaris
elif [[ "$OSTYPE" =~ bsd ]];then
  plathome=freebsd
fi
function make_cmd {
  make $plathome MYLIBS=" -ltermcap" MYLDFLAGS=" -L$INST_DIR/lib" MYCFLAGS=" \
    -I$INST_DIR/usr/local/include"
  make install INSTALL_TOP="$STOW_DIR/lua-$version"
}
