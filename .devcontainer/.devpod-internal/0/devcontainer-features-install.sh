#!/bin/sh
set -e

on_exit () {
	[ $? -eq 0 ] && exit
	echo 'ERROR: Feature "Homebrew" (ghcr.io/meaningful-ooo/devcontainer-features/homebrew) failed to install! Look at the documentation at ${documentation} for help troubleshooting this error.'
}

trap on_exit EXIT

set -a
. ../devcontainer-features.builtin.env
. ./devcontainer-features.env
set +a

echo ===========================================================================

echo 'Feature       : Homebrew'
echo 'Description   : Installs Homebrew'
echo 'Id            : ghcr.io/meaningful-ooo/devcontainer-features/homebrew'
echo 'Version       : 2.0.4'
echo 'Documentation : https://github.com/meaningful-ooo/devcontainer-features/tree/main/src/homebrew'
echo 'Options       :'
echo '    SHALLOWCLONE="false"'
echo 'Environment   :'
printenv
echo ===========================================================================

chmod +x ./install.sh
./install.sh
