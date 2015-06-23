#!/bin/bash


 
echo " "
echo -e "\e[1m======================================================================\e[0m"
echo -e "\e[1m===========================REPORT BEGINS HERE=========================\e[0m"
echo -e "\e[1m======================================================================\e[0m"

#Write ditamap to tempfile
cat docs.hpcloud.com.ditamap > temp.ditamap

#find ditamaps referenced by docs.hpcloud.com.ditamap
for i in `grep ditamap docs.hpcloud.com.ditamap  | sed 's|.*href=\"||' | sed 's|ditamap\" .*|ditamap|'`
do
	if [ -e "$i" ]
	then
		
		echo "Merging $i with docs.hpcloud.com for testing"
		cat $i >> temp.ditamap
	else
		echo -e "\e[31;1mWARNING:\e[0m The ditamap docs.hpcloud.com.com calls the ditamap" 
         	echo "$i"
         	echo "but it does not exist in the repo!"
	 

	fi
done

#Extract all dita files from docs.hpcloud.com ditamap
cat temp.ditamap | tr '\n' @ | sed 's|<\![^><]*->||g' | tr '@' '\
n' | sed 's|<topicref href=\"||' | sed 's|".*||'  | sed 's| ||g' | grep dita |
grep -v ditamap | sort | uniq > called_dita_files.tmp




#Collect all ditafiles on disk
find . -name "*.dita" | sed 's|\./||' | sort > all_dita_files_on_disk.tmp


if [[ -s all_dita_files_on_disk.tmp  &&  -s called_dita_files.tmp ]];
	then

	echo -e "\e[1m
=====================================================================
Files called by docs.hpcloud.com, but which are not present on the file system

These files produce entries in the webhelp TOC, but the links are broken.
\e[0m"

diff -d all_dita_files_on_disk.tmp called_dita_files.tmp  | grep ">" 

echo -e "\e[1m

=====================================================================
Files on the file system, which are not referenced by the ditamap

These files will be included in the build ONLY if they are linked
to by another file which is included in the ditamap.  They will not
checked by the \"Project Files in the ditamap that are not building\"
Best practice is to include these in the dita file and set to toc=no
\e[0m"
	diff -d all_dita_files_on_disk.tmp called_dita_files.tmp  | grep "<" 	
    
    
 
else


	 
     
     echo -e "\e[1mNo descrepancies found.  All is right with the world\e[0m"
     
     exit 0
fi






 