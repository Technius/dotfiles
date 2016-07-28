#!/bin/bash
# Installs packages; forces root since sudo might not be installed.

source $(dirname $0)/util.sh

if ! is_root; then
    echo "You need to run this as root/sudo!"
fi

PKGS=$(cat $(dirname $0)/../debian-pkgs | sed -re 's/#.*//g' -e '/^\s*$/d')

apt-get update
apt-get install $PKGS
