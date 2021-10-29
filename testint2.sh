#!/bin/bash 

string=$(uname -r | awk -F- '{print $2}')
shopt -s extglob
case "$string" in
    @(-|)[0-9]*([0-9]))
        echo "String is a valid integer." ;;
    *)
        echo "String is not a valid integer." ;;
esac

