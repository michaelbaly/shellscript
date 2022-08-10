#!/bin/bash

# Testing closing file descriptor
exec 3> testfd

echo "tyger tyger burning bright, in the forest of the night" >&3

# Close specified fd
exec 3>&-

cat testfd
exec 3>> testfd
echo "what inmortal hand or eye, could frame thee fearful symetry" >&3
cat testfd
exec 3>&-
