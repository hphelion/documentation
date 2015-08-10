#!/bin/bash 

echo "$GIT_BRANCH "
echo "===Looking for typos and words that should be avoided ============================="

for i in `find . -name "*.dita"`
do
	while IFS='' read -r line  || [[ -n "$line" ]]
	do
		test=`echo $line | sed 's|=.*||' | sed 's|%||g' `
		help=`echo $line | sed 's|.*=||' `
		if [[ -n $(cat $i | sed 's|<!--[^><]*-->||g' |grep "$test") ]]; 
		then
		
			echo "Found in file: $i"
			issue=`grep -n "$test" $i  | sed "s|\($test\)|\\\e[31;1m>>\\\\e[0m\1\\\\e[31;1m<<\\\\e[0m|" | sed 's|^\s||'`
			echo -e "     Line number: $issue"
			echo    "     Correction:  $help"
			echo    " "
		fi
	done < ./jenkins/badstrings.txt
done
