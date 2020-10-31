#!/usr/bin/env bash
set -e

VERSIONS="8.6.5 8.10.2"
HLS_VERSION="0.5.1"

URL_PREFIX="https://github.com/haskell/haskell-language-server/releases/download/${HLS_VERSION}"

download_unzip() {
    url="$1"
    name="$2"
    curl -L "$url" -o "$HOME/.local/bin/$name.gz" 2>/dev/null
    gunzip "$HOME/.local/bin/$name.gz"
    chmod +x "$HOME/.local/bin/$name"
    echo "Downloaded $name"
}

wrapper_name="haskell-language-server-wrapper"
download_unzip "${URL_PREFIX}/$wrapper_name-Linux.gz" "$wrapper_name"

for version in $VERSIONS; do
    url="${URL_PREFIX}/haskell-language-server-Linux-${version}.gz"
    name="haskell-language-server-${version}"
    download_unzip "$url" "$name"
done
