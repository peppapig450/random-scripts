#!/usr/bin/env bash 

while true; do
    read -p "Which release version would you like to install (dev/stable)? " answer
  case $answer in
    [devDev]* )
      echo "Okay downloading the dev build"
      curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
      curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage.sha256sum
      echo "Checking the sums"
      if sha256sum -c "nvim.appimage.sha256sum"; then
        echo "sums passed"
      else 
        echo "sums failed"
        exit 1
      fi
      ;;
    [stableStable]* )
      echo "Okay downloading the stable build"
      curl -LO https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage
      curl -LO https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage.sha256sum
      echo "Checking the checksums"
      if sha256sum -c "nvim.appimage.sha256sum"; then
        echo "sums passed"
      else
        echo "sums failed"
        exit 1
      fi
      ;;
    * ) echo "Please answer dev or stable."''
  esac
done
