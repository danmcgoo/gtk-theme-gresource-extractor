#!/bin/bash

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 FILE PATH"
  exit 1
fi

for OUTPUT in $(gresource list $1)
do

  if [[ ! -e "$2$OUTPUT" ]]; then
    install -D /dev/null "$2$OUTPUT"
    gresource extract $1 $OUTPUT > "$2$OUTPUT"
  else
    echo "ERROR: $2$OUTPUT already exists."
  fi

done

