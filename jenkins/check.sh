#!/bin/bash 

echo "$GIT_BRANCH "
echo -e "===Looking for typos and words that should be avoided============================="

for i in `find . -name "*.dita"`
do
	while IFS='' read -r line  || [[ -n "$line" ]]
	do
		test=`echo $line | sed 's|=.*||' | sed 's|%||g' `
		help=`echo $line | sed 's|.*=||' `
		if [[ -n $(cat $i | sed 's|<!--[^><]*-->||g' |grep "$test") ]]; 
		then
		
			echo "\e[31;1mFound in file: $i on the $GIT_BRANCH branch\e[0m"
			issue=`grep -n "$test" $i  | sed "s|\($test\)|>>\1<<|" | sed 's|^\s||'`
			echo -e "     \e[31;1mLine number\e[0m: $issue"
			echo    "     \e[31;1mCorrection\e[0m:  $help"
			echo    " "
		fi
	done < ./jenkins/badstrings.txt
done
