#!/bin/bash 

set -Eeuo pipefail 
#trap cleanup SIGINT SIGERR ERR EXIT 

_pkgname=exa-0.10.0
_source_url=https://github.com/ogham/exa/archive/refs/tags/v0.10.0.tar.gz
_srcdir=/home/runner/random-scripts/exa-0.10.0
_pkgdir=/home/runner/.local/bin/

test() {
    local -a commands=("rustc" "cargo" "curl" "unzip")
    for dep in "${commands[@]}"; do 
        if ! command -v "$dep" >/dev/null 2>&1; then 
            echo -e "$dep is not installed or is not on your path!\nExiting now."
            exit 1
        fi 
    done 
}

prepare() {
    if [[ $(pwd -P) != $HOME ]]; then 
        curl -LJO "$_source_url"
        if [[ -f "$_pkgname.zip" ]]; then 
            unzip "$_pkgname.zip"
        elif [[ -f "$_pkgname.tar.gz" ]]; then 
            tar -xf "$_pkgname.tar.gz"
        fi
    else 
        curl -LJO "$_source_url"
        if [[ -f "$_pkgname.zip" ]]; then 
            unzip "$_pkgname.zip"
        elif [[ -f "$_pkgname.tar.gz" ]]; then 
            tar -xf "$_pkgname.tar.gz"
        fi
    fi
    cd $_pkgname
}

build() {
    export RUSTFLAGS="-C opt-level=2 -C target-cpu=native"
    local dirs=$(pwd -P)
    if [[ $(basename $dirs) = 'exa-0.10.0' ]]; then 
        cargo build --release
    fi
}

install() {
    cd $_srcdir
    mkdir -p ~/.local/bin 
    cp target/release/exa "$_pkgdir"
    echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
}

cleanup() {
    find ~/ -type f -name '*.tar.gz' -exec rm {} \;
}

run() {
    test 
    prepare
    build
    install
    cleanup
}

run 