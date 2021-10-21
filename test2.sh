#!/usr/bin/env bash

choice () {
  local choice=$1
  if [[ ${opts[choice]} ]] #toggle
  then
    opts[choice]=
  else
    opts[choice]=+
  fi
}

PS3='Choose an AUR helper: '
while :
do
  clear
  options=("pacaur (bash) ${opts[1]}" "pakku (nim) ${opts[2]}" "aura (haskell) ${opts[3]}" "paru (rust) ${opts[4]}" "pikaur (python) ${opts[5]}" "trizen (perl) ${opts[6]}" "yay (go) ${opts}[7]" "Done")
  select opt in "${options[@]}"
  do
    case $opt in
      "Option 1 ${opts[1]}")
        choice 1
        break
        ;;
      "Option 2 ${opts[2]}")
        choice 2
        break
        ;;
      "Option 3 ${opts[3]}")
        choice 3
        break
        ;;
      "Option 4 ${opts[4]}")
        choice 4
        break
        ;;
      "Option 5 ${opts[5]}")
        choice 5
        break
        ;;
      "Option 6 ${opts[6]}")
        choice 6
        break
        ;;
      "Option 7 ${opts[7]}")
        choice 7
        break
        ;;
      "Done")
        break 2
        ;;
      *) printf '%s\n' 'invalid option';;
    esac
  done
done

printf '%s\n' 'Aur helper chosen:'
for opt in "${!opts[@]}"
do
  if [[ ${opts[opt]} ]]
  then
    printf '%s\n' "Aur helper $opt"
  fi
done
