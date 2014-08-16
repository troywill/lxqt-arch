#!/bin/bash

set -o nounset
PACKAGE=$1
BASE_PATH="/srv/http/lxqt/os/i686"
DB_PATH="${BASE_PATH}/lxqt.db.tar.bz2"
# repo-add [options] <path-to-db> <package|delta> [<package|delta> ...]
cp -v ${PACKAGE} ${BASE_PATH}
repo-add ${DB_PATH} ${PACKAGE}


# /etc/pacman.conf
# [lxqt]
# SigLevel = Optional TrustAll
# Server = http://lxqt.troywill.com/lxqt/os/i686
