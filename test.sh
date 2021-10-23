#!/bin/bash

shopt -s nullglob
  SH=("$HOME"/.scripts/*.sh)
  TXT=("$HOME"/scripts/*.txt)
  if ((${#SH[@]} || ${#TXT[@]})); then
    echo "found"
  else
    echo "not found"
  fi

