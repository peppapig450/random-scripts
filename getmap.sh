#!/usr/bin/env bash

for f in $(find "$HOME/.config/nvim" -name '*.lua'); do awk '/map/' $f; done
