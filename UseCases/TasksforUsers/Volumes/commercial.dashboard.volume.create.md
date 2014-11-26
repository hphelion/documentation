---
layout: default
title: "HP Helion OpenStack&#174; Creating, Editing and Deleting Volumes"
permalink: /helion/commercial/dashboard/managing/volume/create/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174;Creating, Editing, and Deleting Volumes

Volumes are block devices that can be attached to instances.</p>

### Create a volume ###

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Compute</strong> tab on the dashboard <strong>Project</strong> panel.</p>

3. In the <strong>Compute</strong> panel, click <strong>Volumes</strong>.</p>

4. Click <strong>Create Volume</strong>.</p>

5. In the <strong>Create Volume</strong> dialog box, enter the relevant information for the volume: </p>

	* <strong>Volume Name:</strong> Enter a name for the volume  
</li>
	* <strong>Description:</strong> Provide a brief description (optional).  
</li>
	* <strong>Type:</strong> Leave this field blank</li>
	* <strong>Size:</strong> Enter the size of the volume in gigabytes  
</li>
	* 
<strong>Volume Source:</strong> Select one of the following options: 
		* No source, empty volume - creates an empty volume and does not contain a file system or a partition table  
		* Image - a new field for Use image as a source displays. You can select the image from the list.  </li>
	* <strong>Availability Zone:</strong> Select the availability zone. By default, this value is set to 'any availability zone'.  </li>

6. Click <strong>Create Volume</strong> to confirm.  

### Edit a volume ###

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Compute</strong> tab on the dashboard <strong>Project</strong> panel.</p>

3. In the <strong>Compute</strong> panel, click <strong>Volumes</strong>.</p>

4. Under the <strong>Actions</strong> column, click <strong>Edit Volume</strong>, next to the volume you want to edit.  	.</p>

5. In the <strong>Edit Volume</strong> dialog box, modify the name and description.</p>

6. Click <strong>Edit Volume</strong> to confirm. </p>

	<strong>Note:</strong> You can <a href="/helion/community/volume/extend/">extend a volume</a> by using the <strong>Extend Volume</strong> option available in the <strong>More</strong> drop-down list and entering the new value for volume size.</p>

### Delete a volume ###

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Compute</strong> tab on the dashboard <strong>Project</strong> panel.</p>

3. In the <strong>Compute</strong> panel, click <strong>Volumes</strong>.</p>

4. Select the volume(s) that you want to delete.</p>

5. Click <strong>Delete Volume</strong> to confirm.</p>

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*