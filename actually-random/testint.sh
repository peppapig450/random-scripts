#!/usr/bin/env bash 
function is_int() { test "$@" -eq "$@" 2>/dev/null; }

input=$(uname -r | awk -F- '{print $2}')

if is_int "$input"; then
        echo "Input: ${input}"
        echo "Integer: ${input}"
else
        echo "Not an integer: ${input}"
fi
