#!/bin/bash

PKGS=$(cat debian-pkgs | sed -re 's/#.*//g' -e '/^\s*$/d')

apt-get update
apt-get install $PKGS

# PPAs
apt-get install software-properties-common

# Lollypop music player
apt-add-repository -y ppa:gnumdk/lollypop
apt-get install lollypop
