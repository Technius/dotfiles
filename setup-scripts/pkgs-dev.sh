#!/bin/bash

source $(dirname $0)/util.sh

# Versions
scala_ver="2.11.8"

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
