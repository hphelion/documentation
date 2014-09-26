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



 

git branch --set-upstream ${BRANCH} origin/${BRANCH}
git branch --set-upstream master origin/master
 
git checkout -f master
git pull origin 
git checkout -f ${BRANCH}
git pull origin 
   

#Search to ensure that every md file contains one of the comments  strings above. 
#(If any file does not contain a comment string, report the names of the missing files and exit with an error message.)
MDFILES_NOT_DESIGNATED=`egrep -rL "\-\-PUBLISH|\-\-UNDER REVISION" *.md` 

s=" "
MDFILES_NOT_DESIGNATED=""
for i in `find . -name "*.md" `
do 
MDFILES_TO_PUBLISH=$X$s`egrep -L "\-\-PUBLISH|\-\-UNDER REVISION" *.md`; 
 
done
 
if [ "$MDFILES_NOT_DESIGNATED" != "" ]
then
echo "==========================================================================="
echo "The following files in the $BRANCH branch are missing a PUBLISH or UNDER REVISION comment"
echo " "
echo "$MDFILES_NOT_DESIGNATED"
echo " "
echo "Add or correct the comment in these files and run this script again."
#git checkout master
	exit 1
fi


#Search for and record the names of all the files that contain the comment: <!—PUBLISH-->

 

s=" "
MDFILES_TO_PUBLISH=""
for i in `find . -name "*.md" `
do 
MDFILES_TO_PUBLISH=$X$s`egrep -l "\-\-PUBLISH" $i`; 
 
done

 
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
else
echo "skipping $i, no change found"
fi
done


#Add the files.
git add .

#Commit the files.
git commit -m "Merging <!--PUBLISH--> files from $BRANCH to master" .

git push

git checkout $CURRENT_BRANCH
