#!/bin/bash

files=$(find . -type f -name="*.dart" -type d -name "../../lib/services/" -prune   | xargs wc -l | awk '$1 > 300'| sed '$d')
echo "$files"
if [[ "$files" == "" ]]
	then
		exit 0
	else
		echo "$files"
		exit 1
fi
