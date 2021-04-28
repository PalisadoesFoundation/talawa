#!/bin/bash
maxLine=$1;

# Listing of Files which have more line of code that maxLine
# if you need to exclude files or directory use this ':!:<path-to-directory/file>' 
# Please have a look at this if you have doubt https://stackoverflow.com/questions/36753573/how-do-i-exclude-files-from-git-ls-files
files=$(git ls-files '*.dart' ':!:lib/services/*.dart' | xargs wc -l | awk -v max=$maxLine '$1 > max' | sed '$d' | sort -rn)

# No. of Files which have more line of code that maxLine 
no_of_files=$(git ls-files '*.dart' ':!:lib/services/*.dart' | xargs wc -l | awk -v max=$maxLine '$1 > max' | sed '$d' | wc -l | sort -rn)

# Checking if no_of_files is 0
if [[ "$no_of_files" -eq 0 ]]
	then
		exit 0
	else
		echo "Below $no_of_files files have more than $maxLine lines"
		echo "Lines  Path"
		echo "$files"
		exit 1
fi

