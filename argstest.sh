#!/usr/bin/env bash

# Option defaults
OPT="value"

# getopts string
# This stringneeds to be updated with the single character options (e.g. -f)
opts="fvo:"

# Gets the command name without path
cmd(){ echo $(basename $0);
}

# Help command output
usage(){
echo "\
  `cmd` [OPTION..]
  -f, --flag; Set a flag"

}
