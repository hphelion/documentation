---
layout: default
title: "HP Helion OpenStack&#174; Update Prerequisites"
permalink: /helion/openstack/update/prereqs/101/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Update Prerequisites

Prior to getting a system ready for update and performing the update, there might be a few tasks that you need to complete that could affect the update outcome.  Read this document for information about:

* [Performing a System check](#check)
* [Gathering information needed for update](#info)

### Perform a system check ### {#check}

1.	If you have changed your admin password for undercloud you need to make sure you update the files below, if you have not already done so. 

	If you do not update the password in configuration files, the update will fail.  

	If you have not changed your undercloud admin password you can skip this task.

	a. Edit the seed cloud host root directory. In the `/root/tripleo/tripleo-undercloud-passwords` file, modify the `UNDER_CLOUD_ADMIN_PASSWORD` value.

	b. Edit file environment variables JSON file. In the `/root/tripleo/ce_env.json` file, update the undercloud `"password":` line with the new password. for example:

		"undercloud": {
			"password": "65eef816ac721d6f1b870dfaaff0e7a781dfbc04",

	c.	Edit the `stackrc` file on the undercloud to contain the new password. Use SSH to access the undercloud, edit the OS_PASSWORD variable in the `stackrc` file and save the change. 

		ssh heat-admin@<undercloudIP>
		sudo -i

2.	Prior to starting update you need to verify you are running Ubuntu that is greater than 3.13.0-36 on your seed cloud host machine. 

	Verifying and obtaining the correct kernel may vary depending on distribution.  From a command prompt seed cloud host run the following command to verify the operating system and current version:

		uname -r   

	Follow instructions for your Linux distribution to update.

<!---removing as per JIRA 
### Extract the required scripts and libraries ### {#extract}

As mentioned in the [Update Overview](/helion/openstack/update/overview/101/), a HP Helion OpenStack patch update is composed of multiple major components.  

The Overcloud node images can be one of the components. If you have [downloaded the patch update using Sherpa](/helion/openstack/update/download/101/), at this stage the overcloud node images are located in the undercloud image repository. 

The other files come as TAR files and are delivered to the undercloud local filesystem, by default, the `/tmp/heat_templates` folder.  It is possible to change the location of the undercloud patch update tarballs, during or after deployment. See [Change the default](#default) below. 

To extract the files:

1. Use SSH to access the seed cloud host:

		ssh heat-admin@<seed_cloud_host_IP>
		sudo -i

2. Copy the TAR file to the seed cloud host and extract contents. From an SSH session to the seed cloud host do the following:

		ssh heat-admin@<undercloudIP>
		sudo -i

		scp heat-admin@<Insert undercloudIP>:/tmp/heat_templates/* /tmp
		tar xvf tripleo-ansible<version>.tar 
		mv /opt/stack/tripleo-ansible /opt/stack/tripleo-ansible-orig
		mv /tmp/tripleo-ansible /opt/stack/

	Where:

	* <Insert undercloudIP> is the IP of the undercloud node
	* /tmp/heat_templates/ is the default location of the TAR files; enter the appropriate location, if you [changed the location](#default).

	The files will now be extracted in the seed tmp node.  If desired, you can delete the files in the `/tmp/heat_templates` directory.

#### Change the default #### {#default}

It is possible to change the location of the undercloud patch update TAR files, during or after deployment. The default location is the `/tmp/heat_templates` folder.   

If you have done so you can recall where you have changed the directory to by viewing the Sherpa configuration file.  

The Sherpa configuration file for the undercloud can be found at `/etc/sherpa/sherpa.conf`. 

The directory where the files where stored can be found by looking in the `RepositoryMgr` portion of `/etc/sherpa/sherpa.conf`. Search for the directory attribute as seen below:

	'file': {
	'classname': 'sherpa.handlers.repository.file.FileSystemHandler',
	'destinations': [
	{
	'directory': '/tmp/heat_templates',

When locating the update files, use the directory set in `/etc/sherpa/sherpa.conf`.

---->

## Gather information needed for update {#info}

To perform a node-by-node or group-by-group update, you will need the IPs of the nodes you are updating and the image IDs of the new images to place on the nodes.  

During the update, you might be asked for various IPs and image ID's, when you are refer to this section or save off the information and use it where required.

### Determine IP of nodes ### {#determine}

The administrator should know the IP address of the seed cloud host node.  Other IP address can be obtained using the commands below.  Please record these for later use. 

**Undercloud IP**

To obtain the IP addresses of the undercloud nodes, run the following commands:

1. Log in the seed cloud host.

		sudo su -

2. SSH to the seed VM.

		ssh root@192.0.2.1 

3. Point the `stackrc` file at the undercloud:

		source ./stackrc

	**Note:** This command is described in [Updating the Undercloud](/helion/openstack/update/undercloud/101/). 

4. Run the following command:

		nova list

The IP addresses of the Undercloud will be listed in the `nova list` results.


**Undercloud Image ID**

To determine image ID of the undercloud nodes:

1. Log in the seed cloud host.

		sudo su -

2. SSH to the seed VM.

		ssh root@192.0.2.1 

3. Point the `stackrc` file at the undercloud:

		source ./stackrc

	**Note:** This command is described in [Updating the Undercloud](/helion/openstack/update/undercloud/101/).

4. Run the following command:

		glance image-list | grep qcow2

	The output appears silimar to the following:

	<img src="media/Update_UC_Image_ID.png">

	The ID is to the left of the image name you are looking for. For exaple, the undercloud main image is `undercloud` and it has image id `94763220-a2f1-edfd686`. 


**Overcloud IP**

To obtain the IP addresses of the overcloud nodes, perform the following:

1. Log in the seed cloud host.

		sudo su -

2. SSH to the seed VM.

		ssh root@192.0.2.1 

3. SSH into the Undercloud then become root and source the stackrc file:

		ssh heat-admin@<Undercloud IP>
		sudo -i
		source ./stackrc

	**Note:** This command is described in [Updating the Overcloud](/helion/openstack/update/overcloud/101/).

		nova list | awk -F"|" '{gsub(/ctlplane=/,"",$7); print $3,$7;}'

	The output appears silimar to the following (node names and full IP addresses have been removed for this image):

	<img src="media/Update_OC_IP.png">

**Overcloud Image ID**

1. Log in the seed cloud host:

		sudo su -

2. SSH to the seed VM:

		ssh root@192.0.2.1 

3. SSH into the undercloud then become root and source the stackrc file:

		ssh heat-admin@<Undercloud IP>
		sudo -i
		source ./stackrc

4. Execute following command: 

	glance image-list | grep qcow2

	The output appears silimar to the following (the full iamge IDs have been removed for this image):

	<img src="media/Update_OC_Image_ID.png">

	The ID is to the left of the image name you are looking for.  For example, the `controllerMgmt` main image is `overcloud-control-mgmt` and it has image id `8b015088-edf1-4a8c-a798`


## Next Steps {#next-steps}

Update the seed VM.

For information, see [Updating the Seed VM](/helion/openstack/update/seed/101/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----

