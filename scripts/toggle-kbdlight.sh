#!/bin/bash

current=$(kbdlight get)

if test $current -gt 0; then
	kbdlight off
else
	kbdlight max
fi
