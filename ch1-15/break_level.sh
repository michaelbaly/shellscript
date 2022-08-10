#!/bin/bash

# Break level

for ((a = 1; a < 7; a++))
do 
    echo "Outer loop: $a"
    for ((b = 1; b < 10; b++))
    do 
        echo "Inner loop: $b"
        if [ $b -eq 7 ]; then
        # break outer loop
        break 2
        fi
    done
done
