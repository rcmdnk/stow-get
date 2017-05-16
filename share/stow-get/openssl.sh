version="1_1_0e"
inst_type=github
directory=openssl-OpenSSL_${version}
tarball=OpenSSL_${version}.tar.gz
configure="./config"
configure_opstions="--openssldir="$stow_dir/$target/ssl
