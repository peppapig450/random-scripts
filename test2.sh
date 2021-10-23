#!/usr/bin/env bash


os2=$(echo $(python3 /home/nick/distro.py 2>&1) | xargs | awk 'NR==1 {print $2}')
echo $(pwd)"\n" "$os2"


