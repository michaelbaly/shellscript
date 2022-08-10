#!/bin/bash

# read from file

count=1
cat read_user_input.sh | while read line
do 
    echo "Line $count: $line"
    count=$[ $count + 1 ]
done
echo "End processing file"