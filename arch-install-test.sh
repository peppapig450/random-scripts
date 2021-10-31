#!/bin/bash 

read -s -p "Please enter the password to use for root: " rootpass
echo 
read -s -p "Please repeat the same password: " rootpass2
if [ "$rootpass" == "$rootpass" ]; then
  echo "root:$rootpass"
else
  printf "The passwords do not match!"
fi
