#!/bin/bash

if [ -n "$1" ]; then
	yes 0 | head -n$1
fi

echo 1
yes 0
