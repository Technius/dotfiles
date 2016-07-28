#!/bin/bash

source $(dirname $0)/util.sh

if is_root; then
    read -p "Are you sure you want to run this as root/sudo? (y/n)" force_run
    case $force_run in
        [Yy] ) ;;
        * ) exit;;
    esac
fi

# Setup vim
mkdir -p ~/.vim/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.vim/autoload/plug.vim

# Setup powerline
pip install --user powerline-status
# Install powerline fonts
mkdir -p ~/.fonts/ ~/.config/fontconfig/conf.d/
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O ~/.fonts/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O ~/.config/fontconfig/conf.d/10-powerline-symbols.conf
fc-cache -vf ~/.fonts/

if [[ -n $(which stack) ]]; then
    if [[ -n $(which ghc-mod) ]]; then
        echo "Installing ghc-mod"
    fi
else
    echo "Haskell Stack not installed, so not installing ghc-mod"
fi
