---
layout: default
title: "HP Helion OpenStack&#174; Creating Instances"
permalink: /helion/commercial/dashboard/managing/instances/create/
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
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> 
-->

# HP Helion OpenStack&#174; Creating Instances

Instances are virtual machines that run inside the cloud.

You can launch an instance from the following sources:

* Images uploaded to the Image Service.</li>
* Image that you have copied to a persistent volume.</li>

### Create an instance ###

To create an instance:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. In the **Instances** screen, for the instance you want to modify, click **Launch Instance**.

	The Launch Instance dialog box opens, with five tabs: **Details**, **Access and Security**, **Networking**, **Post Creation**, and **Advanced Options**. By default, **Details** is the active tab.

4. On the **Details** tab, perform the following tasks:

	* From the **Availability Zone** list, select the AZ this instance will be associated with.</li>
	* In the **Instance Name** field, enter the name for the instance.</li>
	* From the **Flavor** list select the flavor.</li>
	* In the **Instance Count** field, enter the number of instances required.</li>
	* From the **Instance Boot Source** list, select the source to create the image from:

		* Image -- create an image from an existing image</li>
		* Snapshot -- create an image from an existing snapshot</li>
		* Volume -- create an image from an existing volume</li>
		* Image (create new volume) -- create an image from an existing image and create a new volume</li>
		* Volume snapshot (create new volume) -- create an image from an existing snapshot and create a new volume</li>

	* Select the volume, snapshot, or image from the list that appears.

		Additonal fields appear for the boot source option that create a new volume. For more information, refer to [Managing Block Storage Volumes](/helion/commercial/dashboard/managing/volumes/).
5. On the **Access &amp; Security** tab, perform the following tasks:.

	* From the **Keypair** list, select the **keypair** to use with the instance.</li>
	* Select the security group to use with the instance.</li>

6. On the **Networking** tab, from the **Available Networks** list, select the required network. The network is displayed in the Selected Networks box.

7. On the Post-Creation tab, optionally, enter a script to pass user data to the instance at launch time. 

	For more details, refer to the OpenStack documentation, such as <a href="http://docs.openstack.org/user-guide/content/user-data.html">Configure instances at boot</a>.

8. On the **Advanced Options** tab, select either **Automatic** or **Manual** in the **Disc Partition** list  

	Selecting **Automatic** will resize the partitions on boot to match the size requested by the user. If you select **Manual**, you will need to manually resize the partitions, after the instance boots.

9. Click **Launch** to launch the instance.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
