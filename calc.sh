#!/bin/bash


ARRAY=$(find -type f -name count  -exec cat {} \;)

RESULT=0

for NUM in $ARRAY
do
 RESULT=$(($RESULT + $NUM))
done

echo $RESULT

