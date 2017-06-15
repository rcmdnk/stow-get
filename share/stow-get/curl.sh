inst_type=tarball
url_prefix=http://curl.haxx.se/download/
lib_dep=(ssl_package_openssl)
configure_options="--with-ssl=$inst_dir"
index_for_latest="https://curl.haxx.se/download/"
