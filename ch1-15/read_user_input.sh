#!/bin/bash

# read user input(safe)

if read -s -t 10 -p "User passwd: " pass
then
echo
echo "IS $pass really your passwd?"
else
echo
echo "Unauthorized!"
fi