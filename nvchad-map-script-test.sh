#!/bin/bash 

set -x 
set -v
temp_file=$(mktemp)
trap "rm -f $temp_file" 0 2 3 15
for f in $(find "$HOME/.config/nvim/lua/plugins/configs/" -type f); do awk '/keymap/ {print $2,$4}' $f | column -s ',' -t >> tempfile; done 
cat tempfile 
rm ${temp_file}
