#!/bin/bash

# Two ways to solve it
# 1. use reverse dash '\'
# 2. use comma to quote "content"

for test in I don\'t know if this\'ll work
do 
    echo "word:$test"
done

