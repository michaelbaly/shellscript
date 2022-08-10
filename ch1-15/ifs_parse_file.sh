#!/bin/bash

# Parse file using IFS env

IFS_O=$IFS
IFS=$'\n'
for line in $(cat /etc/passwd)
do 
    echo "Line: $line"
    IFS=:
    for item in $line
    do 
        echo "Item: $item"
    done
done
