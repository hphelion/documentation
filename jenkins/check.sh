#!/bin/bash -li

echo 'running documentation/jenkins/check.sh'
#Get the most recent version of the master branch  
env | grep GIT
git checkout $GIT_BRANCH
git pull


#Delete any tempfiles left over from the last run and write introduction
rm checktmp > /dev/null 2>&1  
echo " "
echo " "
echo  Checking the $GIT_BRANCH branch for embarrassing strings and structural errors... 


echo  ""


 for i in `find . -name "*.md"`; 
 
 
 do  
 if [[ -n $(head -10 $i | egrep  "(\-\-\-\-|^\-\-$)";) ]];
then
echo "==== Incorrect header divider ==="
echo "(Header must begin and end with a three-dash line.)"
 echo $i
fi
done 



echo  ""
echo "==== Links to files that don't exist ==="
for i in `find . -name "*.md" `
do
sed ':a;N;$!ba;s/\n/ /g'  $i | sed 's|-->|-->\n|g' | sed 's|<!--.*-->||g' | grep "](/.*)" | sed 's/.*](//' | sed 's/).*//' | sed 's|#.*||' | grep -v "/api/" | grep -v "^/file/" >> permalinklist.txt

grep permalink $i | sed 's|.* /|/|'  >> filepermalink.txt

done

 
for i in `cat permalinklist.txt | uniq | grep -v http`
do
 
	 
	 
			if [[ -z $(grep $i filepermalink.txt ) ]];
			then
			echo "The permalink $i does not exist but is referenced in:"
			for a in `find . -name "*.md"`
			do
			grep -l $i $a
			done
			echo ""
			fi
		 
done

rm permalinklist.txt 
rm filepermalink.txt
 
 
echo ""
echo "===Missing publish flag============================="
for i in `find . -name "*.md" `
do 

	if [[ -n $(grep -L "\-\-PUBLISH" $i) ]]; 
	then
	if  [[ -n $(grep -L "\-\-UNDER REVISION" $i) ]]; 
	then
	echo $i
 
	fi
	fi
 done 



echo " "
echo "===??============================="
for i in `find . -name "*.md"`; do grep -H \?\? $i | grep -v '<!--' | grep -v '<\*\*' ; done
echo "Note: lines that start with <!-- are ignored, so you can remove false ?? positives by commenting them out."


echo " "
echo "===Blank lines============================="

for i in `find . -name "*.md"`
do 
	a=`head -1 $i`
	if   [ -z "$a" ];
	then
		echo "Blank lines at the top of file $i"
	fi
done   


echo " "
echo "===Spaces in filenames======================"
find . -name "* *"


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

#Read badstrings and pipe into loop
cat ./jenkins/badstrings.txt |
while read BAD
do

     #Do a recursive grep on all md files for the badstring and assign result to RESULT
     RESULT=`grep -r --include="*.md" --exclude-dir=jenkins "${BAD}" ./`
	

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


BADCHAR=`grep -r --include="*.md" --color='auto'  -P -n "[\x80-\xFF]" ./ |grep -vF '\`'`
	      #If BADCHAR is not empty, then write the bad string and the result to stout, and write 1 to the file checktmp
     if [ -z "$BADCHAR" ]
          then
          EXIT=""
     else
          echo ""
          echo "===These files contain non-UTF8 characters (format filename:linenumber: line with bad character================="
          echo "$BADCHAR"
          echo "1" > checktmp
     fi

#Read chcktemp and assign content to EXIT (indicating that at least one error was found)
EXIT=`cat checktmp` > /dev/null 2>&1


#Exit script with 1 if an error was found.  Otherwise exit with 0.
if [ -z "$EXIT" ]
     then
          exit 0
     else
          exit 1
fi
