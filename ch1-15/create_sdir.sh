#!/bin/bash

mkdir develop_dir
chgrp 'group_name' develop_dir
chmod g+s develop_dir
# make sure shared dir is writable to Group
umask 002
cd develop_dir
touch devfile
ls -l
