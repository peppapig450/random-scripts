#!/bin/bash
SAVEIFS=$' \t\n'
IFS=$(echo -en "\n\b")
for oldname in $(find "$HOME/.local/share/fonts/" -type f) 
do 
  newname=$(echo $oldname | sed -e 's/ //g') 
  mv -i "$oldname" "$newname" 2> /dev/null
done
IFS=$SAVEIFS
