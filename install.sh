#!/usr/bin/env bash

# Set parameters
user=rcmdnk
repo="stow-get"
git="https://github.com/$user/$repo"
raw=https://raw.github.com/$user/$repo/master

# Set prefix
if [ x"$prefix"x = xx ];then
  prefix=$HOME/usr/local
fi

prefix=$(echo "$prefix"|sed 's|--prefix=||'|sed "s|^~|$HOME|"|sed "s|^\.|$(pwd)|")

echo
echo "###############################################"
echo "Install $repo to $prefix"
echo "###############################################"
echo

# sudo check
sudo=""
if [ -d "$prefix/bin" ];then
  touch "$prefix/bin/.install.test" >& /dev/null
  ret=$?
  if [ $ret -ne 0 ];then
    sudo=sudo
  else
    rm -f "$prefix/bin/.install.test"
  fi
else
  mkdir -p "$prefix/bin" >&  /dev/null
  ret=$?
  if [ $ret -ne 0 ];then
    sudo mkdir -p "$prefix/bin"
    sudo=sudo
  fi
fi

# Prepare temporary directory
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT HUP INT QUIT ABRT SEGV TERM
cd "$TMP_DIR"

# Get temporary stow-get
if type -a git >& /dev/null;then
  git clone $git
  cd $repo
elif type -a wget >& /dev/null;then
  mkdir -P bin share/$repo
  curl -fsSL -o ./bin/stow-get $raw/bin/stow-get
  chmod 755 bin/stow-get
  curl -fsSL -o ./share/stow-get/stow-get.sh $raw/share/stow-get/stow-get.sh
fi

# Install stow-get
./bin/stow-get install -i "$prefix" stow-get
echo "set_inst_dir $prefix" >> "$HOME/.stow-get"
