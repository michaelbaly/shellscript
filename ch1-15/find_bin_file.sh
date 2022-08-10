#!/bin/bash

# Find bin file which contains keyword "bash" in $PATH

IFS=:
for folder in $PATH
do 
    for file in $folder/*
    do
        if [ -x $file ]; then
        echo "  $file"
        fi
    done
done | grep bash
echo "Complete searching"