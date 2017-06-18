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
function get_latest {
  local output_detail="${1:-0}"
  local params="$(curl http://www.lua.org/ftp/ 2>/dev/null|grep "\"name\"" -A1 | grep lua -A1|grep ".tar.gz<" -A1|head -n2)"
  version="$(echo "$params"|head -n1|cut -d'"' -f4|sed 's/lua-//'|sed 's/.tar.gz//')"
  if [ -z "$version" ];then
    err "Failed to get the latest version for $package."
    return $EXIT_NO_VERSION
  fi
  if [ "$output_detail" -eq 1 ];then
    local d="$(echo "$params"|tail -n1|cut -d ">" -f2|cut -d "<" -f1)"
    printf "%15s %8s updated on: %10s\n" "$package" "$version"  "$d"
  fi
}
