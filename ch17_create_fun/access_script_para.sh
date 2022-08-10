#!/bin/bash

# Access script parameters inside a function

badfun() {
    echo $[ $1 * $2 ]
}

if [ $# -eq 2 ]; then
    value=$(badfun $1 $2 )
    echo "the return value is $value"
else
    echo "Usage: $0 a b"
fi
