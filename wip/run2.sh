#!/usr/bin/env bash

#set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT 

usage() {
cat << EOF 

Usage: $(basename "${BASH_SOURCE[0]}") [-h | --help] [-c | --class] [-j | --jar] [-r | --run]

A script to compile and run Java programs.

Available options: 
-h, --help      Print this help and exit
-c, --class     Compile .class file(s)
-j, --jar       Compile a .jar file
-r, --run       Run the java program using .class or .jar files

EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
}
