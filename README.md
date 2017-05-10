# stow-get

[![Build Status](https://travis-ci.org/rcmdnk/stow-get.svg?branch=master)](https://travis-ci.org/rcmdnk/stow-get)

Package manager with stow.

## Preparation

Set your `PATH`and `LD_LIBRARY_PATH` (and `PYTHONPATH`, if necessary) for the stow directory.

Default installation directory is:

    $HOME/usr/local/

Therefore, set like:

    export STOW_TOP=$HOME/usr/local
    export PATH=$STOW_TOP/bin:$PATH
    export LD_LIBRARY_PATH=$STOW_TOP/lib64:$STOW_TOP/lib:$LD_LIBRARY_PATH
    export PYTHONPATH=$STOW_TOP/lib64:$STOW_TOP/lib:$PYTHONPATH

## Installation

stow-get can be installed by using curl:
You can also use an install script on the web like:

    $ curl -fsSL https://raw.github.com/rcmdnk/stow-get/install/install.sh| bash

This will install stow-get in `$HOME/usr/local`

If you want to install other directory, do like:

    $ curl -fsSL https://raw.github.com/rcmdnk/trash/install/install.sh|  prefix=/usr/local bash

Or, simply download (or git clone) the script and set where you like.

## Usage

To install package, do like:

    $ stow-get install vim

Available packages can be found by:

    $ stow-get packages

For [GNU Project](https://www.gnu.org/gnu/thegnuproject.html) packages,
you can install them even if there is no configuration file (i.e. not found in `stow-get packages`).
To install these packages, do like:

    $ stow-get install -t gnu wdiff

To uninstall, do like:

    $ stow-get uninstall vim

## Personal configuration file

Personal settings can be set by **$HOME/.stow-get**.

If you use **install.sh**, you will have **.stow-get** like:

    set_inst_dir /home/USER/usr/local

`set_inst_dir` sets installed directory (**inst_dir**).
Substances of packages for stow are placed in **$inst_dir/stow** (**stow_dir**).

Default directory for package configuration files is **/PATH/TO/stow-get/../share/stow-get**.

If you have own package configuration files, set the directory like:

    conf_dir=/PATH/TO/YOUR/CONFIGURATION/DIRECTORY

If you set **packages** variable in your configuration file like:

    packages=(git screen vim)

you can easily install them by:

    $ stow-get install

## Package configuration file

See examples in [stow-get/share/stow-get](https://github.com/rcmdnk/stow-get/tree/master/share/stow-get).

## Help

    Usage: stow-get <sub command> [-fDVvh] [-c <conf file>] [-d <conf dir>] [-i <inst dir> ] [-t <inst type>] [package [package [...]]]

    Sub commands:
       install [package [package...]]
                      Install packages (all packages in the configuration file if no package is given).
       uninstall <package>
                      Remove package.
       rm/remove      Aliases of uninstall.
       list           List up installed packages.
       packages       List up available packages which have configuration files.
       info <package> Show configuration file of package.
       get_latest  <package>
       Show the latest version of package (only for GNU packages).
       version        Show version.
       help           Show this help.

    Arguments:
       -c <conf file> Configuration file (default: /Users/USER/.stow-get).
       -d <conf dir>  Directory which has package configuration files (default: /Users/USER/tmp/stow-get/bin/../share/stow-get).
       -i <inst dir>  Directory to install packages (default: /Users/USER/usr/local).
       -t <inst type> Set install type: only for install with package name (default: ).
       -f             Force to re-install.
       -D             Dry run mode.
       -V             Verbose mode.
       -v             Show version.
       -h             Show this help.

