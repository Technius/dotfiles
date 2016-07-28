#!/bin/bash

source $(dirname $0)/util.sh

if prompt_install "lollypop"; then
    if ! $(grep -q "^deb http://ppa.launchpad.net/gnumdk/lollypop" /etc/apt/sources.list.d/*); then
        sudo apt-add-repository ppa:gnumdk/lollypop
        sudo apt-get update
    fi
    if ! is_installed "lollypop"; then sudo apt-get install lollypop; fi
fi

apt_installs=""

prompt_install "vlc" && apt_installs="$apt_installs vlc"
prompt_install "kazam" && apt_installs="$apt_installs kazam"

[[ -n $apt_installs ]] && sudo apt-get install $apt_installs
