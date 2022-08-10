#!/bin/bash

# Filter out email
# username@hostname

# username ([a-zA-Z0-9_\.\+\-]+)
# hostname ([a-zA-Z0-9_\.\-]+)
# top domain suffix within hostname([a-zA-Z]{2,5})

gawk --re-interval '/^([a-zA-Z0-9_\.\+\-]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/{print $0}'
