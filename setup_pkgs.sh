#!/bin/bash

PKGS=$(cat debian-pkgs | sed -re 's/#.*//g' -e '/^\s*$/d')

is_installed() {
    local pkgname=$1
    dpkg -s $pkgname > /dev/null 2>&1
}

install_if_needed() {
    local pkgname=$1
    if is_installed $pkgname; then
        echo "Package $pkgname already installed, skipping"
    else
        apt-get install $pkgname
    fi
}

install_ppa_pkg_if_needed() {
    local ppa=$1
    local pkgname=$2
    if $(grep -q "^deb http://ppa.launchpad.net/$ppa" /etc/apt/sources.list.d/*); then
        echo "PPA $ppa already being used, skipping"
    else
        apt-add-repository ppa:$ppa
    fi
    install_if_needed $pkgname
}

apt-get update
apt-get install $PKGS

# PPAs
install_if_needed software-properties-common

# Lollypop music player
install_ppa_pkg_if_needed gnumdk/lollypop lollypop
