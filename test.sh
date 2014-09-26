#!/bin/bash
#script to search for all md files that contain both string X and Y

for i in  `find . -name "*.md"`
do 

 if [[ `grep -l $1 $i` ]]
	then
	grep -H $2 $i  
fi


done
 