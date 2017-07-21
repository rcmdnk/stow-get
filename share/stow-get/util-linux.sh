inst_type=github
user=karelzak
bin_dep=(autopoint_package_gettext)
for p_v in "" 2.7 2.6 2.5 2.4;do
  python_lib=$(check_lib libpython${p_v} 1)
  if [ $? -eq 0 ];then
    python_lib=$(basename $python_lib)
    if [ ${python_lib#libpython${p_v}.} = "a" ] || [ ${python_lib#libpython${p_v}.} = "la" ];then
      lib_dep=(python_install_package_python)
    fi
    break
  fi
done
function before_configure {
  ./autogen.sh
}
if [ "$UID" -ne 0 ];then
  configure_options="--disable-makeinstall-chown"
fi
