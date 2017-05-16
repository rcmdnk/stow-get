version=5.3.4
inst_type=tarball
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
  make $plathome MYLIBS=" -ltermcap" MYLDFLAGS=" -L$inst_dir/lib" MYCFLAGS=" \
    -I$inst_dir/usr/local/include"
  make install INSTALL_TOP="$stow_dir/$target"
}
lib_dep=(readline termcap)
