#!/bin/bash

# Create tmpfile
# '-t' option --- create tmpfile in system /tmp, not user ~/tmp
tempfile=$(mktemp -t test19.XXXXXX)
exec 3>$tempfile

echo "Write error info to $tempfile"

echo "first line error1" >&3
echo "second line error2" >&3
echo "third line error3" >&3

exec 3>&-

echo "Done redirect error"
cat $tempfile
rm -f $tempfile 2> /dev/null