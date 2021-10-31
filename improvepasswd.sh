#!/usr/bin/env bash

getinput() {
  read -s -p "Enter the password you want to use for root: " rootpass 
  echo 
  read -s -p "Please repeat the password: " rootpass2 
  echo 
}

check() {
if [[ -z "$rootpass" ]] || [[ -z "$rootpass2" ]]; then 
  exit 1
elif [[ "$rootpass" == "$rootpass2"]]; then 
  exit 1
else 

fi
}



while [[ ]]
