#!/bin/bash

# Using pattern matching

if [[ $USER == g* ]]
then
    echo "Hello $USER"
else
    echo "No match user"
fi
