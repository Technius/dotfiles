#!/bin/bash

source $(dirname $0)/util.sh

if prompt_install "Godot Engine 3" "which godot"; then
    curl -L -o /tmp/godot3.zip https://downloads.tuxfamily.org/godotengine/3.0.2/Godot_v3.0.2-stable_x11.64.zip
    unzip /tmp/godot3.zip -d /tmp/godot3
    cp /tmp/godot3/Godot_v3.0.2-stable_x11.64 ~/.local/bin/godot
    chmod +x ~/.local/bin/godot
fi

if prompt_install "Tiled Map Editor" "which tiled"; then
    curl -L -o ~/.local/bin/tiled https://github.com/bjorn/tiled/releases/download/v1.1.1/Tiled-1.1.1-x86_64.AppImage
    chmod +x ~/.local/bin/tiled
fi
