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
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Creating Instances

Instances are virtual machines that run inside the cloud.</p>

You can launch an instance from the following sources:</p>

* Images uploaded to the Image Service.</li>
* Image that you have copied to a persistent volume.</li>

### Create an instance ###

To create an instance:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Instances</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

3. In the <strong>Instances</strong> screen, for the instance you want to modify, click <strong>Launch Instance</strong>.</p>

	The Launch Instance dialog box opens, with five tabs: <strong>Details</strong>, <strong>Access and Security</strong>, <strong>Networking</strong>, <strong>Post Creation</strong>, and <strong>Advanced Options</strong>. By default, <strong>Details</strong> is the active tab.</p>

4. On the <strong>Details</strong> tab, perform the following tasks:</p>

	* From the <strong>Availability Zone</strong> list, select the AZ this instance will be associated with.</li>
	* In the <strong>Instance Name</strong> field, enter the name for the instance.</li>
	* From the <strong>Flavor</strong> list select the flavor.</li>
	* In the <strong>Instance Count</strong> field, enter the number of instances required.</li>
	* From the <strong>Instance Boot Source</strong> list, select the source to create the image from:</p>

		* Image -- create an image from an existing image</li>
		* Snapshot -- create an image from an existing snapshot</li>
		* Volume -- create an image from an existing volume</li>
		* Image (create new volume) -- create an image from an existing image and create a new volume</li>
		* Volume snapshot (create new volume) -- create an image from an existing snapshot and create a new volume</li>

	* Select the volume, snapshot, or image from the list that appears.</p>

		Additonal fields appear for the boot source option that create a new volume. For more information, refer to <a href="/helion/community/managing/volumes/">Managing Block Storage Volumes</a>.</p>
5. On the <strong>Access &amp; Security</strong> tab, perform the following tasks:.</p>

	* From the <strong>Keypair</strong> list, select the <strong>keypair</strong> to use with the instance.</li>
	* Select the security group to use with the instance.</li>

6. On the <strong>Networking</strong> tab, from the <strong>Available Networks</strong> list, select the required network. The network is displayed in the Selected Networks box.</p>

7. On the Post-Creation tab, optionally, enter a script to pass user data to the instance at launch time. </p>

	For more details, refer to the OpenStack documentation, such as <a href="http://docs.openstack.org/user-guide/content/user-data.html">Configure instances at boot</a>.</p>

8. On the <strong>Advanced Options</strong> tab, select either <strong>Automatic</strong> or <strong>Manual</strong> in the <strong>Disc Partition</strong> list  

	Selecting <strong>Automatic</strong> will resize the partitions on boot to match the size requested by the user. If you select <strong>Manual</strong>, you will need to manually resize the partitions, after the instance boots.</p>

9. Click <strong>Launch</strong> to launch the instance.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*