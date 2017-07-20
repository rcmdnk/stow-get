inst_type=gnu
gnutls=$(check_lib gnutls 2)
if [ -z "$gnutls" ];then
  ssl_dir=$(check_lib ssl 2)
  if [ -z "$ssl_dir" ];then
    lib_dep=(ssl_package_openssl)
    configure_options="--with-ssl=openssl --with-libssl-prefix=$inst_dir"
  else
    configure_options="--with-ssl=openssl --with-libssl-preefix=$ssl_dir/../"
  fi
fi
