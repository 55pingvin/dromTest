#!/bin/bash

DIR=$1

if [ "$DIR" == "" ];then
  DIR="/tmp/counter"
  mkdir -p $DIR

fi

echo $DIR

for ((COUNT = 1; COUNT < 10; COUNT++)); do

  INCLUDE_DIR=$(shuf -i 4-10 -n 1)

  for ((DIR_COUNT = 0; DIR_COUNT < $INCLUDE_DIR; DIR_COUNT++)); do

    DIR_PATH+=/$(cat /dev/urandom | tr -dc 'a-z' | fold -w 4 | head -n 1)

    WORK_DIR=$DIR/$DIR_PATH

    mkdir -p $WORK_DIR

    if [[ $WORK_DIR == *"a"* ]]; then
      touch $WORK_DIR/count
      echo $(shuf -i 50-1000 -n 1) > $WORK_DIR/count
    fi

    if [[ $WORK_DIR == *"b"* ]]; then
      touch $WORK_DIR/empty
    fi

  done

    DIR_PATH=''
    WORK_DIR=''
done
