#!/bin/bash

# Testing input/output file descriptor
exec 3<> poem.txt

read line <&3
echo "Read: $line"
echo "Write: tyger tyger burning bright" >&3
