#!/bin/bash

echo Warning! This script is a bit of a hack and each
echo second is actually around 1.005 seconds, so 200
echo seconds will magically turn into 201 seconds.
echo
echo Don\'t use this for anything exact!
echo

i=$1;

while [ $i -gt 0 ]; do echo $i seconds remaining; i=`expr $i - 1`; sleep 1;  done
