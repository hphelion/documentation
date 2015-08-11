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
		if [[ -n $(cat $i |sed ':a;N;$!ba;s/\n/ /g'| perl -pe  's|<!--.*-->||g' | grep "$test") ]]; 
		then
		cat $i |sed ':a;N;$!ba;s/\n/ /g'| perl -pe  's|<!--.*-->||g' | grep "$test"
			echo -e "${cc_blue}Found in file: $i on the $GIT_BRANCH (the issue is surrounded by ${cc_red}##${cc_blue}):${cc_normal}"
			issue=`grep -n "$test" $i  | sed "s|\($test\)|${cc_red}##\1##${cc_normal}|" | sed 's|^\s||'`
			echo -e "     ${cc_blue}Line number and text${cc_normal}: $issue"
			echo -e "     ${cc_blue}Correction${cc_normal}:  $help"
			echo -e " "
			echo "1" > checktmp
		fi
	done < ./jenkins/badstrings.txt
done
#Read chcktemp and assign content to EXIT (indicating that at least one error was found)
EXIT=`cat checktmp` > /dev/null 2>&1
rm checktmp || true


#Exit script with 1 if an error was found.  Otherwise exit with 0.
if [ -z "$EXIT" ]
     then
          exit 0
     else
          exit 1
fi
