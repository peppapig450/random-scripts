#!/usr/bin/env bash

read -s -p "Enter the password you want to use: " rootpass
echo
read -s -p "Please repeat the password: " rootpass2
echo 

if [ "$rootpass" == "$rootpass2" ]; then
  echo "The strings match"
  echo "root:$rootpass" 
else 
  echo "The passwords do not match"
fi
