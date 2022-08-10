#!/bin/bash

# Create tmp directory
tempdir=$(mktemp -d dir.XXXXXX)
cd $tempdir

tempfile1=$(mktemp temp.XXXXXX)
tempfile2=$(mktemp temp.XXXXXX)

# specify file descriptor for redirect
exec 7> $tempfile1
exec 8> $tempfile2

# Redirect data to tmp file
echo "Redirect data to dir $tempdir"
echo "this line should contain in $tempfile1" >&7
echo "this line should contain in $tempfile2" >&8
echo "Redirect done"

# sleep 5
exec 7>-&
exec 8>-&
# Remove tmp dir
echo "Remove tmp dir"
cd ..
rm -rf dir.*
