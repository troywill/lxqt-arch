#!/bin/bash
set -o nounset
set -o errexit

PACKAGE=$1
sudo cp --verbose --archive $PACKAGE /srv/http/lxqt/
cd /srv/http/lxqt/
sudo ./repo-add.sh $PACKAGE
