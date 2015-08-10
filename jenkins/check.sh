#!/bin/bash 

echo "$GIT_BRANCH "
echo -e "===Looking for typos and words that should be avoided \e[31;1m>>\e[0m\1\e[31;1m<<\e[0m============================="
echo -e "\e[31;1mWARNING:\e[0m The ditamap docs.hpcloud.com.com calls the ditamap"
for i in `find . -name "*.dita"`
do
	while IFS='' read -r line  || [[ -n "$line" ]]
	do
		test=`echo $line | sed 's|=.*||' | sed 's|%||g' `
		help=`echo $line | sed 's|.*=||' `
		if [[ -n $(cat $i | sed 's|<!--[^><]*-->||g' |grep "$test") ]]; 
		then
		
			echo "Found in file: $i"
			issue=`grep -n "$test" $i  | sed "s|\($test\)|>>\1\e<<|" | sed 's|^\s||'`
			echo -e "     Line number: $issue"
			echo    "     Correction:  $help"
			echo    " "
		fi
	done < ./jenkins/badstrings.txt
done
