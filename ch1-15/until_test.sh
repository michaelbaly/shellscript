#!/bin/bash

# Using until cmd

var1=100

until echo $var1
	[ $var1 -eq 0 ]
do 
    echo inside $var1
    var1=$[ $var1 - 10 ]
done
