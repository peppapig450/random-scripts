#!/usr/bin/env bash 

while IFS= read -r -d '' -u 9
do
  if [[ "${REPLY##*.}" != 'sh' ]]; then 
    echo "$REPLY doesnt contain the .sh extension"
    continue 
  fi 
  if grep -Fxq '/bin/bash' "$REPLY"; then 
    echo 'found /bin/bash'
    sleep 0.5
  fi
  if [[ ! -x $REPLY ]]; then
    echo "chmod u+x $REPLY"
  fi 
done 9< <( find . -type f -exec printf '%s\0' {} + )
