#!/bin/bash


#mv devplatform/1.2/  FLUBBER/

for i in `find . -type d | grep -v .git`; #i = directory 
do 
	cd $i;
	for a in `ls *.dita 2> /dev/null` ; #a = all dita files in directory
	do 
	 for b in `grep href $a | sed 's|.*href=\"||' | sed 's|\".*||' | grep -v "#" | grep dita` ;
	 do #b=all hrefs in each ditafil 
	 if [ ! -f "$b" ]
	  
	 	
	then
			echo "$b not found from $a in $i"
			NAME_ONLY=`echo "$b" | sed 's|.*/||'`

			find ~/git/documentation -name $NAME_ONLY | sed 's|/c/Users/grelarse/git/documentation/||'


		        	
			
			
			fi
done
	done ; 
	cd - >/dev/null 2>&1; 
done
