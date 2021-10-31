#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for oldname in $(find "$HOME/.local/share/fonts/" -type f) 
do 
  newname=$(echo $oldname | sed -e 's/ //g') 
  mv -i "$oldname" "$newname"
done
IFS=$SAVEIFS
