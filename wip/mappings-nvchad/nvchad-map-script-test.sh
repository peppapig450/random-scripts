#!/usr/bin/env bash 

rm -r map 
for f in $(find "$HOME/.config/nvim/lua/plugins/configs/" -type f); do awk '/keymap/ {print $2,$4}' "$f" | tr -d "()" | sed 's/<CR>"/ /' | tail -n +4 |  column -s ',' -t >> map; done 
# sed -i 's/print(vim.inspect(/ /' map 
# sed -i 's/()<CR>"/ /' map 

