#!/bin/bash

var1=10

while echo $var1
      #[ $var1 -ge 0 ]
      [ $var1 -gt 0 ]
do 
    echo cur var $var1
    var1=$[$var1 - 1]
done
