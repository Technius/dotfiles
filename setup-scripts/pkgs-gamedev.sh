#!/bin/bash

source $(dirname $0)/util.sh

if prompt_install "Godot Engine 3" "which godot"; then
    curl -L -o ~/.local/bin/godot https://downloads.tuxfamily.org/godotengine/2.1.4/Godot_v2.1.4-stable_x11.64.zip
fi

if prompt_install "Tiled Map Editor" "which tiled"; then
    curl -L -o ~/.local/bin/tiled https://github.com/bjorn/tiled/releases/download/v1.1.1/Tiled-1.1.1-x86_64.AppImage
fi
