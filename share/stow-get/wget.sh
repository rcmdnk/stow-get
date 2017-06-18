inst_type=gnu
gnutls=$(check_lib gnutls)
if [ -z "$gnutls" ];then
  ssl_dir=$(check_lib ssl)
  if [ -z "$ssl_dir" ];then
    lib_dep=(ssl_package_openssl)
    configure_options="--with-openssl=$inst_dir"
  else
    configure_options="--with-openssl=$ssl_dir/../"
  fi
fi
