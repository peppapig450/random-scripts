#!/usr/bin/env bash

set -eu 

while IFS= read -r -d '' -u 9
do
  case $REPLY in 
    *Library*)  
      continue 
      ;;
    *.vscode*) 
      continue
      ;;
    *) 
      echo "rm $REPLY"
      ;;
  esac
done 9< <( find "$HOME" -type f -name '.DS_STORE' -exec printf '%s\0' {} + 2> /dev/null ) 
