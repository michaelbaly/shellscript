#!/bin/bash

# Catch all parameters using $* and $@

count=1
echo
for param in "$*"
do 
    echo "\$* parameters #$count = $param"
    count=$[ $count + 1 ]
done

echo
count=1
for param in "$@"
do 
    echo "\$@ parameters #$count = $param"
    count=$[ $count + 1 ]
done