#!/bin/bash

# Read from file

file="states"

IFS_OLD=$IFS
IFS=$'\n'
for state in $(cat $file)
do
    echo your next stop: $state
done

IFS=$IFS_OLD
