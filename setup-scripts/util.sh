#!/bin/bash

is_root() {
    test $(id -u) == 0
}

is_installed() {
    local pkgname=$1
    dpkg -s $pkgname > /dev/null 2>&1
}

prompt_install() {
    local pkgname=$1
    local check_install=$2
    [[ -z "$check_install" ]] && check_install="is_installed $pkgname"
    eval $check_install > /dev/null
    if [[ $? == 0 ]]; then
        echo "$pkgname is already installed, skipping"
        return 1
    else
        local choice
        read -p "Do you want to install $pkgname? (y/n)" choice
        case $choice in
            [Yy] ) return 0;;
            * ) return 1;;
        esac
    fi
}
