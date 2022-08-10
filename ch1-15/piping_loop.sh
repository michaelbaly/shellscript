#!/bin/bash

# Piping loop to another cmd

for state in "North Dakota" Connecticut Illinois Alabama Tennessee
do 
    echo "$state is your next vacation place"
done | sort
echo "You completes your travels"
