#!/bin/bash 

target="$HOME/arch-is-the-best/" 

find "$target" -type f ! -name '*.md' | while read -r f; do
  path="$(realpath ${f})"
  dirname="$(dirname ${f})"
  filename=$(basename -- "$f")
   if [[ ! "$filename" =~ 'archisthebest' ]]; then
    continue 
  fi 
  if [[ "$f" =~ '.' ]]; then 
    ext="${f##*.}" 
    newname="arch.$ext"
  else 
    newname="arch"
  fi
  echo "mv -i ${path} "$dirname/$newname""
done
