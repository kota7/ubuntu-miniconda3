#!/bin/bash

# check if conda commands are at desired location
for cmd in conda activate python
do
  if [ $(which $cmd) != $CONDA_PATH/bin/$cmd ] 
    then
    echo "$cmd location is $(which conda)"
    exit 1
  fi

  echo "$cmd found in the right location"
done

exit 0

