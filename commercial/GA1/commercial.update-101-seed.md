---
layout: default
title: "HP Helion OpenStack&#174; Updating the Seed Cloud Host"
permalink: /helion/openstack/update/seed/101/
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
# HP Helion OpenStack&reg; Updating the Seed VM

The seed update instructions are different from the instructions for the undercloud and overcloud updates.  Not all updates will include seed updates, please check the [HP Helion OpenStack Release Notes](/helion/openstack/release-notes/101/) to determine if there is a seed update.

For HP Helion OpenStack 1.01, you do not need to update the seed. However, you should perform the following steps to back up the seed VM and  download and extract the HP Helion OpenStack patch update. 

<!-- Not needed for 1.01
Updating the seed node involves saving current environment and configuration settings and restoring them after the update.
-->

* [Backup the seed cloud host](#backup)
* [Backup the original seed settings](#backupsettings)
* [Update the seed cloud host](#updateseed)
<!-- Not needed for 1.01
* [Restore the original seed settings](#restoreseed)
* [Verify the update](#verify)
-->
## Back up the seed cloud host ## {#backup}

Back up the seed node to restore in case of catastrophic failures.  For information, see [Back Up and Restore](/helion/openstack/backup.restore/).  

## Back up the original seed settings ## {#backupsettings}

Before you proceed with seed node update, you should extract the updated scripts that is delivered as part of the patch.  

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














1. Log in the seed VM host.

		sudo su -

2. SSH to seed VM.

		ssh root @<Seed VM>

2. Login to undercloud

		ssh heat-admin@<undercloud_IP>

3. Copy the `heat_templates` to /tmp

		scp <username>@<kvmhost_ip>>:/tmp/heat_templates/* /tmp

4. Untar `xvf tripleo-ansible<version>.tar` 
		
		tar xvf tripleo-ansible<version>.tar 

5. Move `tripleo-ansible` to `tripleo-ansible-orig`

		mv /opt/stack/tripleo-ansible /opt/stack/tripleo-ansible-orig

6. Move tripleo-ansible to `/opt/stack/`

		mv /tmp/tripleo-ansible /opt/stack/

7. Execute the `seed_update.sh` script to backup and copy the seed settings to host system:

		./seed_update.sh --backup-seed <IP Address of Seed> <Backup Destination Folder>

## Download and extract the patch update ## {#updateseed}

For HP Helion OpenStack 1.01, you do not need to update the seed. 

1. [Download and extract the HP Helion OpenStack patch update](/helion/openstack/update/download/101/), if you have not done so already.  

<!-- Not needed for 1.01
2. Update the seed node as described in the [installation instructions](/helion/openstack/install/overview/) providing details for pre-requisites as used during  the initial installation.

## Restore original seed settings ## {#restoreseed}

Once the seed installation is complete, SSH into the seed node to confirm it is accessible.  

On the host node where the scripts were extracted, execute the script to restore seed settings on the updated seed.

	./seed_update.sh --restore-seed <Ip Address of Seed> <Backup Source Folder>


## Verify the update ## {#verify}

Perform these basic tests to verify that the environment settings have been restored on seed node.  Connect to seed node using SSH.

1.	Verify local services

		. stackrc - Source the credentials for verification 
		nova list - Should list the servers
		glance image-list - Should list the images in glance
		heat stack-list - Should list the undercloud stack
		neutron net-list - Should list the ctlplanes

2.	Verify connectivity

		ssh heat-admin@<undercloud-IP>  -  Should be able to successful connect to undercloud
-->
**Note:** If the above verification steps fail, rerun the instructions to restore original seed settings. If the node is unrecoverable, [restore the old image](/helion/openstack/backup.restore/).  


## Next Steps {#next-steps}

Update the undercloud. For installation instructions, see [Updating the Undercloud](/helion/openstack/update/undercloud/101/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----


