#!/usr/bin/env bash 

if [[ $(uname) =~ 'Linux' ]]; then 
    datem='date'
else 
    datem='gdate'
fi 

trap "tput reset; tput cnorm; exit" 2
clear
tput civis
lin=2
col=$(($(tput cols) / 2))
c=$((col-1))
est=$((c-2))
color=0

# Set the text color to green to write the tree
tput setaf 2; tput bold

# Write the tree
for ((i=1; i<40; i+=2))
{
    tput cup $lin $col
    for ((j=1; j<=i; j++))
    {
        echo -n \*
    }
    let lin++
    let col--
}

## Set the color to brown for the trunk
tput sgr0; tput setaf 130

# Write the Trunk in three lines
for ((i=1; i<=3; i++))
{
    tput cup $((lin++)) $c
    echo 'mWm'
}

# Get days until Christmas 
XMAS=$($datem -d "Dec 25" +%j)
TODAY=$($datem +%j)
DAYS=$(( "$XMAS" - "$TODAY" ))
if [[ "$DAYS" -gt '0' ]]; then 
  greet=''
else 
  greet="Merry Christmas!!"
fi

# Draw a star on top 
tput setaf 190; tput bold
tput cup $((lin -23)) $((c + 1)); printf '%b' "\u2606"

# Write a greeting
tput setaf 170; tput bold
tput cup $lin $((c - 11)); printf '%s\n' "$DAYS days until Christmas!!!"
# tput cup $((lin + 1)) $((c - 11)); echo 'And a happy new year 2022'
let c++
k=1

# Configure lights and decorations
while true; do
    for ((i=1; i<=35; i++)) {
        # Turn off the lights
        [ $k -gt 1 ] && {
            tput setaf 2; tput bold
            tput cup ${line[$[k-1]$i]} ${column[$[k-1]$i]}; echo \*
            unset line[$[k-1]$i]; unset column[$[k-1]$i] # Array cleanup
        }

        li=$((RANDOM % 9 + 10))
        start=$((c-li+2))
        co=$((RANDOM % (li-2) * 2 + 1 + start))
        tput setaf $color; tput bold   # Switch colors
        tput cup $li $co
        echo o
        line[$k$i]=$li
        column[$k$i]=$co
        color=$(((color+1)%8))
    }
    k=$((k % 2 + 1))
  done
 
