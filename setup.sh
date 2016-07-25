#!/bin/bash

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
