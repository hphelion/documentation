#!/bin/bash -li

changed_files=""

for i in `find . -name "*.md"`

do

	if [[ -n $(head -30 $i | grep -E '(^#[^#]|^ *#[^#])' | grep "HP Helion" | grep -v "Public Cloud") ]]; then

		if [[ -n $(grep  "published: false" $i) ]]; then
		   echo "Skipping $i"
		else
		    changed_files=$changed_files" "$i
			echo " " 
			sed -i  's/\(^#[^#]*HP Helion\)/\1 1.0/' $i
		
		fi
	else
		    echo " " 
			echo "Skipping $i"
	fi
 
done

git add .
git commit -m "adding 1.0 version string to doc titles"
git checkout rename-test
 
for i in `echo $changed_files`
do
git checkout origin/master -- $i
done

git add .
git commit -m "merging 1.0 doc back to dev". 

	
	

			
	