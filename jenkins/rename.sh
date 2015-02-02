#!/bin/bash -li


for i in `find . -name "*.md"`

do
 

	if [[ -n $(head -30 $i | grep "^#[^#]" | grep "HP Helion" | grep -v "Public Cloud") ]]; then

		if [[ -n $(grep  "published: false" $i) ]]; then
		   echo "Don't rename $i"
		else
			echo "Rename:      $i"
		fi
	else
		    echo "Don't rename $i"
	fi

done