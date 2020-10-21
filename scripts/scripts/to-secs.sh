#!/bin/bash

if [ "$1" = -l ]; then
	# keep the numbers literally so they can also be expressions,
	# e.g. to pipe into bc later
	awk -F: '{print "("$1")" "*" 3600 "+" "("$2")" "*" 60 "+" "("$3")"}'
else
	# calculate right away, assuming that the numbers are properly formatted
	if [ "$1" == -h ]; then
		awk -F: '{print $1 + $2 / 60 + $3 / 3600}'
	else
		awk -F: '{print $1 * 3600 + $2 * 60 + $3}'
	fi
fi
