#!/bin/bash

# array operation

testit() {
    local newarray
    newarray=(`echo "$@"`)
    echo "${newarray[*]}"
}

addarray() {
    local sum=0
    # local newarray
    local newarray=(`echo $@`)
    for value in ${newarray[*]}
    do
        sum=$[ $sum + value ]
    done
    echo "Sum $sum"
}

intarray=(3 5 8 9 1)
array=(Lucy John Harry Michael)

echo "Original array ${array[*]}"

# passing none-int array
testit ${array[*]}

# check return array
result=($(testit ${intarray[*]}))
echo "Catch return array ${result[*]}"

# calculate sum
addarray ${intarray[*]}



