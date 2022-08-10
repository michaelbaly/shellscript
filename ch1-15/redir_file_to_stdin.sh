#!/bin/bash

# redirecting input fd

# Save STDIN to fd 7
exec 7<&0

# redirect file to STDIN
exec 0< redir_fd.sh

count=1
while read line
do 
  echo "Line #$count: $line"
  count=$[ count + 1 ]
done

# recover normal STDIN
exec 0<&7
# process input from console
read -p "Are you trying to quit? " answer
case $answer in
y|Y) echo "Goodbye" ;;
n|N) read -p "Red pill or blue pill? " answer
     case $answer in
     r|R) echo "Welcome to the real world" ;;
     b|B) echo "Enjoy your fantacy all the time";;
    esac
esac
