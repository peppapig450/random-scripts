#!/bin/bash

for pathname in "$HOME/Music/Songs"/*.mp3; do
  [ ! -f "$pathname" ] && continue
  sed -e 's/\[[^][]*\]//g' $pathname
fi

