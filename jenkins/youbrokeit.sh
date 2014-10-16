#!/bin/bash -li

echo 'running documentation/jenkins/check.sh'
#Get the most recent version of the master branch  
env | grep GIT
git checkout $GIT_BRANCH
git pull


#Delete any tempfiles left over from the last run and write introduction
rm checktmp > /dev/null 2>&1  
rm permalinklist.txt  > /dev/null 2>&1  
rm filepermalink.txt > /dev/null 2>&1  

echo " "
echo " "
echo  "Checking the $GIT_BRANCH branch for structural errors that can cause a failure for the entire build or for individual files."






echo  ""

for i in `find . -name "* *"`
do 
 
	if   [ -z "$i" ];
	then
	echo " "
	echo "===Spaces in filenames======================"
		echo "$i"
		echo "files with spaces in the filename can cause scripts to fail"
		echo "Last checked in by:"
		git log -1 "$i" | egrep "(Author|Date)"
		echo "1" > checktmp
	fi
done   




for i in `find . -name "*.md"`; 
do  
if [[ -n $(head -10 $i | egrep  "(\-\-\-\-|^\-\-$)";) ]];
then
echo "==== Incorrect header divider ==="
echo "Header must begin and end with a three-dash line."
echo "The build will not fail, but the md file will not be included in the output."
echo $i
echo "Last checked in by:"
git log -1 $i | egrep "(Author|Date)"
echo ""
echo "1" > checktmp
fi

if [[ -n $(head -10 $i | egrep  "(layout:.*title:|title:.*permalink:|permalink:.*product: )";) ]];
then
echo "==== Incorrect header ==="
echo "The layout, title, permalink and product declarations must all be on seperate lines."
echo "The build will not fail, but the md file will not be included in the output."
echo $i
echo "Last checked in by:"
git log -1 $i | egrep "(Author|Date)"
echo ""
echo "1" > checktmp
fi


done 




for i in `find . -name "*.md" `
do
sed ':a;N;$!ba;s/\n/ /g'  $i | sed 's|-->|-->\n|g' | sed 's|<!--.*-->||g' | grep "](/.*)" | sed 's/.*](//' | sed 's/).*//' | sed 's|#.*||' | grep -v "/api/" | grep -v "^/file/" | sed 's|\/$||'  >> permalinklist.txt


grep permalink $i | sed 's|.* /|/|' | sed 's|\/$||' >> filepermalink.txt

done

 

for i in `cat permalinklist.txt | sed 's/ *//g'  | grep -v http | sort | uniq`
do 
			if [[ -z $(grep $i filepermalink.txt ) ]];
			then
			echo  ""
			echo "==== Broken permalinks to documentation.git files ==="
			echo "The file will build, but the output will contain a broken link"
			
				echo "The permalink $i does not exist but is referenced in:"
				for a in `find . -name "*.md"`
				do
					if [[ -n "$(sed ':a;N;$!ba;s/\n/ /g'  $a | sed 's|-->|-->\n|g' | sed 's|<!--.*-->||g' | grep  $i )" ]];
					then
						echo $a
						echo "Last checked in by:"
						git log -1 $a | egrep "(Author|Date)"
						echo ""
						 echo "1" > checktmp
					fi
				done
			echo ""
			fi
done

rm permalinklist.txt 
rm filepermalink.txt
 
 

for i in `find . -name "*.md" `
do 

	if [[ -n $(grep -L "\-\-PUBLISH" $i) ]]; 
	then
	if  [[ -n $(grep -L "\-\-UNDER REVISION" $i) ]]; 
	then
	
	echo ""
	echo "===Missing publish flag============================="
	echo "When the publish file is missing, the file will be visible on http://15.184.32.138/"
	echo "But will not be copied to the master branch, and so will not be visible on "
	echo "http://docs.qa1-stackato.cx.hpcloud.net/ or http:/docs.hpcloud.com"
	echo $i
	echo "Last checked in by:"
	git log -1 $i | egrep "(Author|Date)"
	echo ""
	echo "1" > checktmp
	fi
	fi
 done 


 



for i in `find . -name "*.md"`
do 
	a=`head -1 $i`
	if   [ -z "$a" ];
	then
	echo " "
	echo "===Blank lines============================="
		echo "Blank lines at the top of file $i"
		echo "When the mdfile begins with a, the file will be visible on http://15.184.32.138/"
		echo "But will not be copied to the master branch, and so will not be visible on "
		echo "http://docs.qa1-stackato.cx.hpcloud.net/ or http:/docs.hpcloud.com"
		echo "Last checked in by:"
		git log -1 $i | egrep "(Author|Date)"
		echo "1" > checktmp
	fi
done   





 


#Set Internal Field Separator to % (to preserve white space at the beginning and end of badstrings)
IFS='%'


#Search yml files for HTML codes
cat ./jenkins/badYAMLstrings.txt |

while read BAD
do

  #Do a recursive grep for all yml files for the badstring and assign result to RESULT
     RESULT=`grep -r --include="*.yml" --exclude-dir=jenkins "${BAD}" ./`


     #If RESULT is not empty, then write the bad string and the result to stout, and write 1 to the file checktmp
     if [ -z "$RESULT" ]
          then
          EXIT=""
     else
          echo ""
          echo "===$BAD============================="
          echo "$RESULT"
          echo "1" > checktmp
     fi

done  
 
echo "" 
 
#Read chcktemp and assign content to EXIT (indicating that at least one error was found)
EXIT=`cat checktmp` > /dev/null 2>&1


#Exit script with 1 if an error was found.  Otherwise exit with 0.
if [ -z "$EXIT" ]
     then
          exit 0
     else
          exit 1
fi
