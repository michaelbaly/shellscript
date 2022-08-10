#!/bin/bash

# Using case command

case $USER in
gypsice | iotcp)
    echo "Welcome $USER"
    echo "please enjoy your visit";;
testing)
    echo "Special testing account";;
lucy)
    echo "clean up the mess when log out";;
*)
    echo "Sorry, authorized visitor";;
esac
