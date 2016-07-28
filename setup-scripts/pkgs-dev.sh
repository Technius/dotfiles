#!/bin/bash

source $(dirname $0)/util.sh

# Versions
scala_ver="2.11.8"
neovim_ver="0.1.4" # tagged release on GitHub

if prompt_install "neovim"; then
    # I'll just manually compile neovim until it's in official, main repos
    wget "https://github.com/neovim/neovim/archive/v$neovim_ver.tar.gz" -O /tmp/nvim.tar.gz
    tar /tmp/nvim.tar.gz -C /tmp
    echo "Installing dependencies"
    sudo apt-get update
    sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y
    echo "Building"
    (cd /tmp/neovim-$neovim_ver && make CMAKE_BUILD_TYPE=Release)
    (cd /tmp/neovim-$neovim_ver && sudo make install)
    pip install --user --upgrade neovim
    pip3 install --user --upgrade neovim
    mkdir -p ~/.config/nvim
fi

if prompt_install "Scala"; then
    wget http://downloads.lightbend.com/scala/$scala_ver/scala-$scala_ver.deb \
        -O /tmp/scala-$scala_ver.deb
    dpkg -i /tmp/scala-$scala_ver.deb
fi

if prompt_install "Scala SBT"; then
    echo "deb https://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
    apt-get update && apt-get install sbt
fi

prompt_install "Haskell Stack" "which stack" && \
    wget -qO- https://get.haskellstack.org/ | sh
