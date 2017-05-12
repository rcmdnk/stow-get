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

    conf_dir=(/PATH/TO/YOUR/CONFIGURATION/DIRECTORY ${conf_dir[@]})

`conf_dir` is an array of package configuration directories.

If you set **packages** variable in your configuration file like:

    packages=(git screen vim)

you can easily install them by:

    $ stow-get install

## Package configuration file

All configuration file must have a name of `<package>.sh`.

Following parameters can be set as shell script.

|Parameter|Description|Default|
|:-:|:-|:-|
|inst_type| Type of installation. Available types are: `gnu`, `tarball`, `github` or `github_direct`. This parameter is mandatory.|-|
|version|Version of th package.|-|
|tarball|tarball name.|`<package>-<version>.tar.gz`|
|url_prefix| URL where tarball file is placed.|For gnu: `http://ftp.gnu.org/gnu/<package>`. <br>For github: `https://github.com/<package>/<package>/archive`|
|configure|Configure command. Most of packages have `configure` file to be executed first.|`./configure`|
|config_options|Options for `configure` command.<br>Note: `--prefix="$stow_dir/$target/"` (where the package substance is installed) option is automatically added if `configure` is executed.|`""`|
|before_configure|This is function. Commands executed before `configure`.<br>If `configure` doesn't have `--prefix` but it set prefix in other way, then set `configure=""` and write configure command in `before_configure`.|function before_configure {<br>  :<br>}|
|make_cmd|This is function for make command.|function make_cmd {<br>  make all && make install<br>}|
|bin_dep|Array of executable packages on which the package depending on.<br>One dependency must be a set of executable name and package name likee `lib_dep=(libcurl curl libexpat expat)`|`()`|
|lib_dep|Array of library packages on which the package depending on.<br>One dependency must be a set of library name and package name likee `bin_dep=(automake automake autoconf autoconf)`|`()`|

### `inst_type`

Available `inst_type` are `gnu`, `tarball`, `github` and `github_direct`:

* gnu

For GNU Project packages, if it can be obtained from [ftp repository](http://ftp.gnu.org/gnu/)
and it has tar.gz file with `<package>-<version>.tar.gz` naming convention,
you need only one line:

    inst_type=gnu

If you want to specify a version, add

    version=1.2.3

* tarball

Set `inst_type`:

    inst_type=tarball

`version` must be specified for `tarball` case.

In addition, `url_prefix`, which is URL where tarball file is placed,  is needed, like:

    url_prefix=http://www.lua.org/ftp/

The default tarball name is `<package>-<version>.tar.gz`. If the naming convention is different,
specify tarball name with `tarball`, like:

    tarball=expat-${version}.tar.bz2

`tar.gz`, `tar.xz`, `tar.bz2` and `zip` files are available as tarball.

* github

If the package is distributed by GitHub and it has *releases*,
use `inst_type=github`.

Most of cases, GitHub releases have version with naming convention of `v<version>`.

For this case, set `version` without `v`, like:

    version=2.13.0

GitHub's releases' url is normally like:

    https://github.com/<user>/<repository>/archive/v<version>.tar.gz

If the repository and GitHub user name is same as package (like [git](https://github.com/git/git/),
you need to set only `version`.

If `user` or `repository` is different from package name, specify them in the configuration file.

    user=package_owner
    repository=package_repository

If archive file naming convention is different from `v<version>`,
it may be better to use `tarball` instead of `github`.

* github_direct

Like github, but useful if the repository has simple structure with such **bin** or **lib** directories.

The repository is directory copied into stow directory.

See more examples in [stow-get/share/stow-get](https://github.com/rcmdnk/stow-get/tree/master/share/stow-get).

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
       latest <package>
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

