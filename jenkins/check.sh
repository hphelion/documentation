#!/bin/bash 

echo " "
echo "===Looking for badstrings	============================="

for i in `find . -name "*.dita"`
do
	while IFS='' read -r line  || [[ -n "$line" ]]
	do
		test=`echo $line | sed 's|=.*||' | sed 's|%||g' `
		help=`echo $line | sed 's|.*=||' `
		if [[ -n $(cat $i | sed 's|<!--[^><]*-->||g' |grep "$test") ]]; 
		then
			echo "Found in file: $i"
			issue=`grep -n "$test" $i  | sed "s|$test| >> $test << |"`
			echo "     Line number: $issue"
			echo "     Correction:  $help"
			echo " "
		fi
	done < ./jenkins/badstrings.txt
done
