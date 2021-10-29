#!/usr/bin/env bash 

echo $(python3 $(pwd)/distro.py 2>&1 | xargs | awk 'NR==1 {print $2}')
