#!/bin/bash
#
#  
#

 


BRANCH=development
echo "$BRANCH"
 
if [ "$BRANCH" == "" ]
then
echo "no branch provided, exiting."
exit 1
fi

#Checkout the branch to merge to master.



 

git branch --set-upstream test origin/${BRANCH}
git branch --set-upstream master origin/master
 
git checkout -f master
git pull origin 
git checkout -f ${BRANCH}
git pull origin 
   

#Search to ensure that every md file contains one of the comments strings above. 
#(If any file does not contain a comment string, report the names of the missing files and exit with an error message.)
MDFILES_NOT_DESIGNATED=`egrep -rL "\-\-PUBLISH|\-\-UNDER REVISION" *.md` 
 
if [ "$MDFILES_NOT_DESIGNATED" != "" ]
then
echo "==========================================================================="
echo "The following files in the $BRANCH branch are missing a PUBLISH or UNDER REVISION comment"
echo " "
echo "$MDFILES_NOT_DESIGNATED"
echo " "
echo "Add or correct the comment in these files and run this script again."
git checkout master
	exit 1
fi


#Search for and record the names of all the files that contain the comment: <!—PUBLISH-->

MDFILES_TO_PUBLISH=`egrep -rl "\-\-PUBLISH" *.md` 
NON_MDFILES_TO_PUBLISH=`find . -type f -not -path "*.git*" -not -name "*.md"`

 
ALL_FILES=${MDFILES_TO_PUBLISH}_list_${NON_MDFILES_TO_PUBLISH}

 

#Checkout the master branch
git checkout master

#For each file in the list of files to publish, execute the command: 
echo "=================================="
for i in  $ALL_FILES
do
 
	if [[ -n $(git diff master $BRANCH -- $i) ]]; 
	then
echo "merging $i"
git checkout origin/${BRANCH} -- $i
fi
done


#Add the files.
git add .

#Commit the files.
git commit -m "Merging <!--PUBLISH--> files from $BRANCH to master" .

git push

git checkout $CURRENT_BRANCH
