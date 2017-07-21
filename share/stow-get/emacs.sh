inst_type=gnu
configure_options="$configure_options --disable-ns-self-contained"
xml2=$(xml2-config --cflags 2>/dev/null)
if [ -z "$xml2" ];then
  configure_options="$configure_options --without-xml2"
else
  configure_flags="CFLAGS=$(xml2-config --cflags)"
fi
gif=$(check_lib libgif 1)
if [ -z "$gif" ];then
  configure_options="$configure_options --without-xpm --without-gif"
fi
