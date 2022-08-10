#!/bin/bash

# Parse cmd line using getopts
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
while getopts :ab:c opt
do
    case "$opt" in
        a) echo "Found option -a" ;;
        b) echo "Found option -b, with value $OPTARG" ;;
        c) echo "Found option -c" ;;
        *) echo "not an option: $opt" ;;
    esac
done
# move optionss with shift and $OPTIND
shift $[ $OPTIND - 1 ]
#

echo
count=1
for param in "$@"
do 
    echo "\$@ parameter #$count = $param"
    count=$[ $count + 1 ]
done
