#!/bin/bash

# Use N to combine lines
echo "------------raw process--------------------"
sed 'N; s/System Administrator/Desktop User/' data3.txt
# Use '.' to match new line or space
echo "------------combine lines------------------"
sed 'N; s/System.Administrator/Desktop User/' data3.txt
echo "-----last line is not processed------"
sed 'N; s/System\nAdministrator/Desktop\nUser/; 
        s/System Administrator/Desktop User/' data3.txt
echo "-----last line is processed------"
sed 's/System\nAdministrator/Desktop\nUser/;
     s/System Administrator/Desktop User/
     N;
     s/System\nAdministrator/Desktop\nUser/;' data3.txt
