#!/bin/bash

for ((COUNT=1; COUNT < 10; COUNT++))
do
    
    INCLUDE_DIR=$(shuf -i 4-10 -n 1)
    echo $INCLUDE_DIR

    for ((DIR_COUNT=0; DIR_COUNT < $INCLUDE_DIR; DIR_COUNT++))
      do
	DIR_PATH+=/$(cat /dev/urandom | tr -dc 'a-z' | fold -w 4 | head -n 1)
        mkdir ./$DIR_PATH
	if [[ $DIR_PATH == *"x"* ]]; then
            touch .$DIR_PATH/count
	    echo $(shuf -i 50-1000 -n 1) > .$DIR_PATH/count
		
        fi
      done

    DIR_PATH=''
done
