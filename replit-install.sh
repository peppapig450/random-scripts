#!/bin/bash 

set -Eeuo pipefail 
#trap cleanup SIGINT SIGERR ERR EXIT 

_pkgname=exa-0.10.0
_source_url=https://github.com/ogham/exa/archive/refs/tags/v0.10.0.tar.gz

test() {
    local -a commands=("rustc" "cargo" "curl")
    for dep in "${commands[@]}"; do 
        if ! command -v "$dep" >/dev/null 2>&1; then 
            echo -e "$dep is not installed or is not on your path!\nExiting now."
            exit 1
        fi 
    done 
}

prepare() {
    if [[ $(pwd -P) != $HOME ]]; then 
        cd && curl -LJO "$_source_url"
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
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  if [[ $(pwd -P) =~ 'exa' ]]; then 
    if [[ -d ./target ]]; then 
        rm -rf target/ 
    fi
  fi 
  echo "Cleaning up target build dir"
}

test && prepare