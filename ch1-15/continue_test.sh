#!/bin/bash

# Basic continue

for ((a = 1; a < 20; a++))
do 
    if [ $a -gt 7 ] && [ $a -lt 15 ]; then
    continue
    fi
    echo "Value: $a"
done
