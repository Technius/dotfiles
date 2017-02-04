#!/bin/bash
# This file updates symlinks to the config and script files

thisdir=$(readlink -f $(dirname $0))

# Create symlinks to scripts in $HOME/bin
for f in $(ls scripts); do
    ln -sf $thisdir/scripts/$f ~/bin/$f
done

# Symlink configs
ln -sf $thisdir/config/vimrc ~/.vimrc
ln -sf $thisdir/config/vimrc ~/.config/nvim/init.vim
ln -sf $thisdir/config/tmux.conf ~/.tmux.conf
ln -sf $thisdir/config/gitignore ~/.gitignore
ln -sf $thisdir/config/spacemacs ~/.spacemacs
