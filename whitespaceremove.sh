#!/bin/bash

###########################
# Usage                   #
###########################
usage() {
  echo "Syntax: $0 [-h] [-d <directory>] [-s <search term>]"
  echo "For more detailed information about how to use this sript run $0 -h"
}

###########################
# Help                    # 
###########################
help() {
  echo "A script to remove whitespace from filenames."
  echo
  usage 
  echo "Options:"
  echo "-h                      Print this help message and exit."
  echo "-d <directory>          Specify the directory to remove whitespace from (default is the current directory)"
  echo "-s <search term>        Term to filter the filenames you want to remove whitespace from"
  echo
}

[ $# -eq 0 ] && usage
while getopts "hd:s:" arg; do
  case $arg in 
    h)
      help 
      exit 0
      ;;
    d)
      dir=${OPTARG}
      ;;
    s)
      search=${OPTARG}
      ;;
    *)
      usage 
      exit 0
      ;;
  esac 
done 
 


if [[ ! -z "$dir" ]]; then
  directory="$dir"
else 
  directory="$(pwd)"
fi

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for oldname in $(find "$directory" -type f) 
do 
newname=$(echo $oldname | sed -e 's/ //g') 
   mv -i "$oldname" "$newname" 2> /dev/null
done
IFS=$SAVEIFS
