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
echo  Checking the $GIT_BRANCH branch for embarrassing strings and structural errors... 

 
echo " "
echo "===??============================="
for i in `find . -name "*.md"`; 
do 

if [[ -n "$(sed ':a;N;$!ba;s/\n/ /g'  $i | sed 's|-->|-->\n|g' | sed 's|<!--.*-->||g' | grep  -H \?\? )" ]];
					then
						echo $i
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


#Set HipChat authorization and room     
auth="zKuxF5Bt5H9dpNysOSf8nRPw2GbT41f3vAS5jKSI"
room="177"  

#amok 146
#test 177

#Set the URL to the console output for this build
CONSOLE=${BUILD_URL}console	 
	 
MESSAGE="The link checker reports <b>$FAILURES files(s)</b> listed in the dita map that did not build in the output."

 
 
#Send notification to hipchat
 
curl \
	--header "Authorization: Bearer $auth" \
	--header "Content-Type: application/json" \
	--request 'POST' \
	--data @- \
	https://hipchat.hpcloud.net/v2/room/$room/notification <<EOP
{
	"color":"red",
	"notify":false,
	"message":"$MESSAGE  You can see the list files that are not building (<a href=\"$CONSOLE\">here</a>.)",
	"message_format":"html"
}
EOP

	 
	 
          exit 1
		  
		  
fi




 
#Set HipChat authorization and room     
auth="zKuxF5Bt5H9dpNysOSf8nRPw2GbT41f3vAS5jKSI"
room="177"  

#amok 146
#test 177

#Set the URL to the console output for this build
CONSOLE=${BUILD_URL}console

 
#Exit appropriately
if [ "$FAILURES" == "0" ];
then
        echo No 404 or 403 pages found.
        
        
#Send notification to hipchat
#curl \
#	--header "Authorization: Bearer $auth" \
#	--header "Content-Type: application/json" \
#	--request 'POST' \
#	--data @- \
#	https://api.hipchat.com/v2/room/$room/notification <<EOP
#{
#	"color":"green",
#	"notify":false,
#	"message":"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FANTASTIC! Our doc set now has<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>ZERO BROKEN LINKS!</b><br />Congratulations to all who worked to make it possible!",
#	"message_format":"html"
#}
#EOP

         
        

        exit 0
else
    
MESSAGE="The link checker reports <b>$FAILURES files(s)</b> listed in the dita map that did not build in the output."

 
 
#Send notification to hipchat
 
curl \
	--header "Authorization: Bearer $auth" \
	--header "Content-Type: application/json" \
	--request 'POST' \
	--data @- \
	https://hipchat.hpcloud.net/v2/room/$room/notification <<EOP
{
	"color":"red",
	"notify":false,
	"message":"$MESSAGE  You can see the list files that are not building (<a href=\"$CONSOLE\">here</a>.)",
	"message_format":"html"
}
EOP

         exit 1

   
fi
