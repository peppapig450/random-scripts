#!/usr/bin/env bash

directory="$HOME"
depth=123
while getopts "hd:l" opt; do
  case $opt in
    d ) directory=$OPTARG;;
    l ) depth=$OPTARG;;
    h ) usage
    exit 0;;
    * ) usage
    exit 1;;
esac
done
echo "$directory $depth"
