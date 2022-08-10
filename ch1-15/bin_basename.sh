#!/bin/bash

# Basename of executable file

name=$(basename $0)

if [ -n "$1" ]; then
    echo "Welcome aboard"
else
    echo "Please show your ticket"
fi

# check parameters number
if [ $# -ne 2 ]; then
   echo
   echo "Usage: $name v1 v2"
   echo
   exit
fi

if [ $name = "harry" ]; then
    total=$[ $1 + $2 ]
elif [ $name = "gypsice" ]; then
    total=$[ $1 * $2 ]
fi
echo "Total value: $total"