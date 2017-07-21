inst_type=gnu
xml2=$(xml2-config --cflags 2>/dev/null)
if [ -z "$xml2" ];then
  configure_options="$configure_options --without-xml2"
else
  configure_flags="CFLAGS=$(xml2-config --cflags)"
fi
configure_options="$configure_options --disable-ns-self-contained"
