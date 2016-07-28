#!/bin/bash
# Installs packages; assumes root

PKGS=$(cat $(dirname $0)/../debian-pkgs | sed -re 's/#.*//g' -e '/^\s*$/d')

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

# This is needed to install from https sources
install_if_needed apt-transport-https

# PPAs
install_if_needed software-properties-common

# Lollypop music player
install_ppa_pkg_if_needed gnumdk/lollypop lollypop

# Scala
if ! is_installed scala; then
    scala_ver="2.11.8"
    wget http://downloads.lightbend.com/scala/$scala_ver/scala-$scala_ver.deb \
        -O /tmp/scala-$scala_ver.deb
    dpkg -i /tmp/scala-$scala_ver.deb
else
    echo "Scala is already installed, skipping"
fi

# SBT
if ! is_installed sbt; then
    echo "deb https://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
    apt-get update && apt-get install sbt
else
    echo "SBT is already installed, skipping"
fi
