#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Illegal number of parameters"
  exit 1
fi

for OUTPUT in $(gresource list $1)
do

  if [[ ! -e "./output$OUTPUT" ]]; then
    install -D /dev/null "./output$OUTPUT"
    gresource extract $1 $OUTPUT > "./output$OUTPUT"
  else
    echo "ERROR: ./output$OUTPUT already exists."
  fi

done

