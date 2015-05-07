---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Creating, Editing, and Deleting Volumes"
permalink: /helion/commercial/carrier/dashboard/managing/volume/create/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> -->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Creating, Editing, and Deleting Volumes

Volumes are block devices that can be attached to instances.

### Create a volume ###

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Volumes** link.

4. Click **Create Volume**.

5. In the **Create Volume** dialog box, enter the relevant information for the volume: 

	* **Volume Name:** Enter a name for the volume  
	* **Description:** Provide a brief description (optional).  
	* **Volume Source:** Select one of the following options: 
		* No source, empty volume - creates an empty volume and does not contain a file system or a partition table  
		* Image - a new field for Use image as a source displays. You can select the image from the list.  
	* **Size:** Enter the size of the volume in gigabytes  	
	* **Availability Zone:** Select the availability zone. By default, this value is set to 'any availability zone'.  

6. Click **Create Volume** to confirm.  

### Edit a volume ###

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Volumes** link.

4. Under the **Actions** column, click **Edit Volume**, next to the volume you want to edit.  	.

5. In the **Edit Volume** dialog box, modify the name and description.

6. Click **Edit Volume** to confirm. 

	**Note:** You can [extend a volume](/helion/commercial/carrier/dashboard/managing/volume/extend/) by using the **Extend Volume** option available in the **More** drop-down list and entering the new value for volume size.

### Delete a volume ###

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Volumes** link.

4. Select the volume(s) that you want to delete.

5. Click **Delete Volume** to confirm.

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
