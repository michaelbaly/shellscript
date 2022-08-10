#!/bin/bash

# Storing STDOUT, and then restore
exec 15>&1
# Temporay direct STDOUT to file
exec 1> fd9.out

echo "this should contains in fd9.out"
echo "alone with this line"

# STDOUT back to personal defined fd ---> though it also point to console
exec 1>&15

# Below will show on console
echo "Everthing back to normal"
