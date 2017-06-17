inst_type=tarball
url_prefix=http://curl.haxx.se/download/
index_for_latest="https://curl.haxx.se/download/"
ssl_dir=$(check_lib ssl)
if [ -z "$ssl_dir" ];then
  lib_dep=(ssl_package_openssl)
  configure_options="--with-ssl=$inst_dir"
else
  configure_options="--with-ssl=$ssl_dir/../"
fi
