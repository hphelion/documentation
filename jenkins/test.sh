#!/bin/bash
#
# This script merges master to all the branches
#

rm permalinklist.txt 
rm filepermalink.txt
rm filepermalink1.txt

for i in `find . -name "*.md" `
do
 

sed ':a;N;$!ba;s/\n/ /g'  $i | sed 's|-->|-->\n|g' | sed 's|<!--.*-->||g' |  sed 's|]|\n]|g' | grep "](/.*)" | sed 's/.*](//' | sed 's/).*//' | sed 's|#.*||' | grep -v "/api/" | grep -v "^/file/" | sed 's|\/$||'  >> permalinklist.txt   
 
grep permalink $i | sed 's|.* /|/|' | sed 's|\/$||' >> filepermalink1.txt

done
 


grep "url:" _config.yml  | sed 's/url: //'  >> permalinklist.txt 

cat filepermalink1.txt | sed 's/ *//g'  | grep -v http | sort | uniq > filepermalink.txt

for i in `cat filepermalink.txt | sed 's/ *//g'  | grep -v http | sort | uniq`
do 
			if [[ -z $(grep $i permalinklist.txt ) ]];
			then
				echo "The permalink $i is not referenced in any file"
				 
			fi
done

 
 