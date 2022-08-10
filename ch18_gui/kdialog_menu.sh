#!/bin/bash

# Use kdialog to create menu

temp=$(mktemp -t temp.XXXXXX)
temp2=$(mktemp -t temp2.XXXXXX)


diskspace () {
    df -k > $temp
    kdialog --textbox $temp 1000 10
}

whoseon () {
    who > $temp
    kdialog --textbox $temp 500 10
}

memusage () {
    cat /proc/meminfo > $temp
    kdialog --textbox $temp 300 500
}

while [ 1 ]; do
kdialog --menu "Sys Admin Menu" "1" "Display disk space" "2" "Display logged on users" \
               "3" "Display memory usage" "0" "Exit" > $temp2
if [ $? -eq 1 ]; then
    break;
fi

selection=$(cat $temp2)
    case $selection in
    1)
        diskspace ;;
    2)
        whoseon ;;
    3)
        memusage ;;
    0)
        break ;;
    *)
        kdialog --msgbox "Sorry, invalid option"
    esac
done

