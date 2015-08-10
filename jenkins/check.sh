#!/bin/bash 

echo "$GIT_BRANCH "
echo -e "===Looking for typos and words that should be avoided============================="

# Escape code
esc=`echo -en "\033"`

# Set colors
cc_red="${esc}[0;31m"
cc_green="${esc}[0;32m"
cc_yellow="${esc}[0;33m"
cc_blue="${esc}[0;34m"
cc_normal=`echo -en "${esc}[m\017"`




for i in `find . -name "*.dita"`
do
	while IFS='' read -r line  || [[ -n "$line" ]]
	do
		test=`echo $line | sed 's|=.*||' | sed 's|%||g' `
		help=`echo $line | sed 's|.*=||' `
		if [[ -n $(cat $i | sed 's|<!--[^><]*-->||g' |grep "$test") ]]; 
		then
		
			echo -e "${cc_blue}Found in file: $i on the $GIT_BRANCH branch$  (The issue is surrounded by ${cc_red qq}##${cc_normal})"
			issue=`grep -n "$test" $i  | sed "s|\($test\)|${cc_red}##\1##${cc_normal}|" | sed 's|^\s||'`
			echo -e "     ${cc_blue}Line number and text${cc_normal}: $issue"
			echo -e "     ${cc_blue}Correction${cc_normal}:  $help"
			echo -e " "
		fi
	done < ./jenkins/badstrings.txt
done
