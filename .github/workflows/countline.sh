#!/bin/bash
maxLine=$1;

files=$(git ls-files '*.dart' ':!:lib/services/*.dart' | xargs wc -l | awk -v max=$maxLine '$1 > max' | sed '$d' | sort -rn)

no_of_files=$(git ls-files '*.dart' ':!:lib/services/*.dart' | xargs wc -l | awk -v max=$maxLine '$1 > max' | sed '$d' | wc -l | sort -rn)

if [[ "$files" == "" ]]
	then
		exit 0
	else
		echo "Below $no_of_files files have more than $maxLine lines"
		echo "Lines  Path"
		echo "$files"
		exit 1
fi

