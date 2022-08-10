#!/bin/bash

# Recursion

factorial() {
    if [ $1 -eq 1 ]; then
        echo 1
    else
        local tmp=$[ $1 - 1 ]
        local result=`factorial $tmp`
        echo $[  $result * $1 ]
    fi
}

read -p "Enter value: " value
result=`factorial $value`
echo "Factorial of $value is $result"
