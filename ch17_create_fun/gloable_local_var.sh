#!/bin/bash

# Access script parameters inside a function

compute() {
    local temp=$[ $value + 8 ]
    result=$[ $temp ^ 2]
}

temp=4
value=9

compute
echo "The result is $result"
if [ $temp -gt $value ]; then
    echo "temp is larger than value"
else
    echo "temp is smaller than value"
fi