inst_type=github
user=karelzak
bin_dep=(autopoint_package_gettext)
function before_configure {
  ./autogen.sh
}
if [ "$UID" -ne 0 ];then
  configure_options="--disable-makeinstall-chown"
fi
