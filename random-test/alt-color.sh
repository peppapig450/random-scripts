#!/usr/bin/env bash 

title1() {
  . color.sh
  printf '%s\n' ${BLUE}"==========================="${NORMAL}
  printf '%s\n' ${YELLOW}${UNDERLINE}"Installing an AUR Helper"${NORMAL}
  printf '%s\n' ${BLUE}"==========================="${NORMAL}
}

title2() {
  tput setaf 4;
  printf '%s\n'  "==========================="
  tput setaf 11; tput smul;
  printf '%s\n' "Installing an AUR Helper"
  tput sgr0; tput setaf 4;
  printf '%s\n' "==========================="
}

printf '%s\n' "This is with the color script" 
title1
sleep 2 
echo 
echo 
echo 
printf '%s\n' "This is without the color script" 
title2
sleep 2

bench 
