#!/usr/bin/env sh 
# gets ansi color codes 
for c in {0..255}; do tput setaf $c; tput setaf $c | cat -v; echo =$c; done
