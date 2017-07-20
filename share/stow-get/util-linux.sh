inst_type=github
user=karelzak
bin_dep=(autopoint_package_gettext)
for p_v in "" 2.7 2.6 2.5 2.4;do
  python_lib=$(check_lib libpython${p_v} 1)
  if [ $? -eq 0 ];then
    if [ ${python_lib#libpython${p_v}.} = "a" ];then
      lib_dep=(python_install_package_python)
    fi
  fi
done
function before_configure {
  ./autogen.sh
}
if [ "$UID" -ne 0 ];then
  configure_options="--disable-makeinstall-chown"
fi
