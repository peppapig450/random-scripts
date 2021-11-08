#!/bin/sh

cr="\033[1;31m"
cg="\033[1;32m"
help() { printf "${cg}colorscheme: show color scheme
Usage: ./colorscheme.sh
${cr}Report issues at: https://github.com/peppapig450/random-scripts/\n"; }

case $1 in 
  *h*)
    help;;
  *)
  printf "\n"
    for a in 3 9; do
      for b in 0 1 2 3 4 5 6 7; do 
        printf "\033[7;$a%sm    \033[1;0m " "$b"
      done
      printf "\n"
    done
    printf "\n"
esac
