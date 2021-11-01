#!/usr/bin/env bash

# get everytime the word 'map' occurs in NvChad config files 
for f in $(find "$HOME/.config/nvim" -name '*.lua'); do awk '/map/' $f; done
