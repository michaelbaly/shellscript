#!/bin/bash

# Adding user accounts

input="users.csv"
while IFS=',' read -r userid name
do
    echo "adding user $userid"
    useradd -c "$name" -m $userid
done < "$input"