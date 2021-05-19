#!/bin/bash

DIR=$1

if [ "$DIR" == "" ];then
  DIR="/tmp/counter"
  mkdir -p $DIR
fi

ARRAY=$(find $DIR -type f -name count  -exec cat {} \;)

RESULT=0

for NUM in $ARRAY
do
 RESULT=$(($RESULT + $NUM))
done

echo 'Result:' $RESULT

