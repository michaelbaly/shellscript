#!/bin/bash

# count dir file number

binpath=$(echo $PATH | sed 's/:/ /g')

count=0
for dir in $binpath; do
    file_list=$(ls $dir)
    for item in $file_list; do
        count=$[ $count + 1 ]
    done
    echo "$dir --- $count"
    count=0
done