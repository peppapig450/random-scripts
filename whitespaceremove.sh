#!/usr/bin/env bash 

###########################
# Usage                   #
###########################
usage() {
  echo "Syntax: $0 [-h] [-d <directory>] [-s <search term>] [ -r <replace character> ]"
  echo "For more detailed information about how to use this scrit run $0 -h"
}

###########################
# Help                    # 
###########################
help() {
  echo "A script to remove/replace whitespace from filenames."
  echo
  usage 
  echo "Options:"
  echo "-h                      Print this help message and exit."
  echo "-d <directory>          Specify the directory to remove whitespace from (default is the current directory)"
  echo "-s <search term>        Term to filter the filenames you want to remove whitespace from"
  echo "-r <replace character>  Character to replace the whitespace with (default is none)" 
  echo
}

[ $# -eq 0 ] && usage
while getopts "hd:s:r:" arg; do
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
    r)
      char=${OPTARG}
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
  if [[ ! -z "$char" ]]; then 
    newname=$(echo $oldname | sed -e "s/ /$char/g")
  else 
    newname=$(echo $oldname | sed -e 's/ //g')
  fi
   mv -i "$oldname" "$newname" 2> /dev/null
done
IFS=$SAVEIFS
