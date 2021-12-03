#!/usr/bin/env bash 

pic() {
        files=$(find "$HOME/Downloads/tmp/Pics/Pictures/" -type f -print0 | shuf -z -n 1)
        if [[ $(echo "$files" | awk -F. '{print $2}') == 'mp4' ]]; then 
          mpv --really-quiet "$files"
        return 5 
        else
          printf '%s\n' "$files"
          # kitty +kitten icat "$files"
          timg -U "$files"
          sleep 5 
          clear 
          return 5
=======
set -x 
set -v
mac() {
  timg --upscale "$files"
  sleep 5
  clear
  return 5
}

other() {
  feh -F -Z "$files" &
  pid=$!
  sleep 5
  kill $pid
  return 5

}

os=$(uname -a | awk '{print $1}')
pic() {
        if [[ "$os" == 'Darwin' ]]; then 
          files=$(find "$HOME/Downloads/tmp/Pics/Pictures/" -type f -print0 | shuf -z -n 1)
        else  
          files=$(find ../Pictures/ -type f -print0 | shuf -z -n 1 | tr -d '\0')
        fi
}
pic
while [ $? -eq 5 ]; do
	pic
done
