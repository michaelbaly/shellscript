#!/bin/bash

# Permanent redirect
exec 1> testout
echo "If you can keep your head"
echo "When all about you are losing theirs"
echo "and blame it on you" >&2


exec 2> testerror
echo "Welcome to the jungle" >&2
echo "where do we go" >&2
