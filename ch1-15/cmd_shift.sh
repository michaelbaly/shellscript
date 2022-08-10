#!/bin/bash

# Shift cmd to left one by one ($0 not include)

count=1
echo
while [ -n "$1" ]
do 
    echo "parameters #$count = $1"
    shift
    count=$[ $count + 1 ]
done
