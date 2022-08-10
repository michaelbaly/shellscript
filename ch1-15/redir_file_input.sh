#!/bin/bash

# Redirecting file input
exec 0< testinput
count=1

while read line
do
    echo "Line $count: $line"
    count=$[ $count + 1 ]
done

