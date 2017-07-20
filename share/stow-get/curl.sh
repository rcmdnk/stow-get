inst_type=tarball
version_safe=7.54.1
url_prefix="https://curl.haxx.se/download"
ssl_dir=$(check_lib ssl 2)
if [ -z "$ssl_dir" ];then
  lib_dep=(ssl_package_openssl)
  configure_options="--with-ssl=$inst_dir"
else
  configure_options="--with-ssl=$ssl_dir/../"
fi
