inst_type=github
version_safe=1_0_2l
openssl_version=${openssl_version:-1_0}
configure="./config"
configure_opstions="--openssldir="$stow_dir/$target/ssl

function get_latest {
  local output_detail="${1:-0}"
  local url="https://github.com/openssl/openssl/releases"
  local html="$(curl -k "$url" 2>/dev/null)"
  version=$(echo "$html"|grep tag-name|grep "OpenSSL_${openssl_version}"|head -n1|cut -d ">" -f2 |cut -d"<" -f1|sed 's/OpenSSL_//')
  if [ "$output_detail" -eq 1 ];then
    printf "%15s %8s\n" "$package" "$version"
  fi
}
get_version
directory=openssl-OpenSSL_${version}
tarball=OpenSSL_${version}.tar.gz
