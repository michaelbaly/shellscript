#!/bin/bash

# Filter out bad phone number
# ()xxx.xxxx
# () xxx.xxxx
# xxx.xxx.xxxx
# xxx xxx xxxx
# xxx-xxx-xxxx
# xxx.xxx-xxxx
# xxx-xxx.xxxx
# xxx-xxx xxxx


gawk --re-interval '/^\(?[2-9][0-9]{2}\)?(| |-|.)[0-9]{3}( |-|.)[0-9]{4}$/{print $0}'