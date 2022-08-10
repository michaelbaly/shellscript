#!/bin/bash

# Extracting options and parameters
if [ -z "$1" ]; then
    echo "no options/parameters"
    exit
fi

echo
count=1
for param in "$@"
do 
    echo "\$@ parameter #$count = $param"
    count=$[ $count + 1 ]
done

echo
while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found option -a" ;;
        -b) param=$2
            echo "Found option -b, with param $param"
            shift ;;
        -c) echo "Found option -c" ;;
        --) shift                     # move this -- option
            break ;;
         *) echo "not an option" ;;
    esac
    shift 
done


echo
count=1
for param in "$@"
do 
    echo "\$@ parameter #$count = $param"
    count=$[ $count + 1 ]
done
