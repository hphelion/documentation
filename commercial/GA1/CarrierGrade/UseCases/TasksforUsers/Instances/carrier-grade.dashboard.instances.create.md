---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Creating Instances"
permalink: /helion/commercial/carrier/dashboard/managing/instances/create/
product: carrier-grade

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> 
-->

# HP Helion OpenStack&#174; Carrier Grade: Create a New Compute Instance

Compute instances are virtual machines that run inside the cloud.


### Create an instance ###

To create an instance:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. In the **Instances** screen, for the instance you want to modify, click **Launch Instance**.

	The Launch Instance dialog box opens, with five tabs: **Details**, **Access and Security**, **Networking**, **Post Creation**, and **Advanced Options**. By default, **Details** is the active tab.

	<img src="media/CGH-Helion-Instance-Launch-Details.png"/>

4. On the **Details** tab, perform the following tasks:

	* From the **Availability Zone** list, select the AZ this instance will be associated with.
	* In the **Instance Name** field, enter the name for the instance.
	* From the **Flavor** list select the flavor.
	* In the **Instance Count** field, enter the number of instances required.
	* From the **Instance Boot Source** list, select the source to create the image from:

		* Image -- create an image from an existing image
		* Snapshot -- create an image from an existing snapshot
		* Volume -- create an image from an existing volume
		* Image (create new volume) -- create an image from an existing image and create a new volume
		* Volume snapshot (create new volume) -- create an image from an existing snapshot and create a new volume

	* Select the volume, snapshot, or image from the list that appears.

		Additonal fields appear for the boot source option that create a new volume. For more information, refer to [Managing Block Storage Volumes](/helion/commercial/carrier/dashboard/managing/volumes/).

5. On the **Access &amp; Security** tab, perform the following tasks:.

	* From the **Keypair** list, select the **keypair** to use with the instance. If there is no key pair, click the **+** button to [import a key pair](/helion/commercial/carrier/dashboard/managing/security/keypairs/#importKeypairs).
	* Select the security group to use with the instance.

	<img src="media/CGH-Helion-Instance-Launch-Access.png"/>

6. On the **Networking** tab, from the **Available Networks** list, select the required network. The network is displayed in the Selected Networks box.

	A default network is always available. You can also [create custom networks](/helion/commercial/carrier/dashboard/managing/network/create/) which will appear in this list.

	<img src="media/CGH-Helion-Instance-Launch-Networking.png"/>

7. On the Post-Creation tab, optionally, enter a script to pass user data to the instance at launch time. In the Customization Script Source list, select:

	* **Direct Input** to create a script to customize your instance after it launches.
	* File to specify an existing script.

	<img src="media/CGH-Helion-Instance-Launch-Post.png"/>

	For more details, refer to the OpenStack documentation, such as [Configure instances at boot](http://docs.openstack.org/user-guide/content/user-data.html).

8. On the **Advanced Options** tab, optionally, select Configuration Drive to configure OpenStack to write metadata to a special configuration drive that attaches to the instance when it boots. 

	The instance can mount this drive and read files from it to get information that is normally available through the metadata service. For more information, see the OpenStack document [Store metadata on a configuration drive](http://docs.openstack.org/user-guide/content/config-drive.html).

	<img src="media/CGH-Helion-Instance-Launch-Advanced.png"/>

9. Click **Launch** to launch the instance.

	The new instance is listed in the **Instances** screen.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
