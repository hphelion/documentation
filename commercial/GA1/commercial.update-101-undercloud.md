---
layout: default
title: "HP Helion OpenStack&#174; Updating the Undercloud"
permalink: /helion/openstack/update/undercloud/101/
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
# HP Helion OpenStack&reg; Updating the Undercloud
<!-- No readme in 1.01 per Jon Lowe
The *Readme.txt* that comes with a patch update will tell you what nodes need to be updated as a result of this patch. It will be located in the directory described in the [Extract the required scripts and libraries](/helion/openstack/update/prereqs/101/#extract).  

If the Readme.txt does not list undercloud nodes, skip this document and proceed to [Updating the Undercloud](/helion/openstack/update/overcloud/101/). -->

Use the this document when updating the undercloud nodes.

* [Prerequisites](#prereqs)
* [Update the undercloud](#update)
* [Validate the update](#validate)
* [Backup the updated undercloud](#backup)
* [Next Steps](#next-steps)

You can monitor the update process, see [Monitoring the Update](/helion/openstack/update/monitor/101/).

## Prerequisites ## {#prereqs}

Before you begin the update:

* If the seed VM needed updating, perform this update before updating the undercloud, as described in [Updating the Seed Cloud Host](/helion/openstack/update/seed/101/).

* Copy the TAR file to the seed cloud host and extract contents. From an SSH session to the seed cloud host do the following:

		ssh <seed_cloud_host_IP>
		scp heat-admin@<undercloud_IP>:/tmp/heat_templates/* /tmp
		
		tar xvf tripleo-ansible<version>.tar 
		mv /opt/stack/tripleo-ansible /opt/stack/tripleo-ansible-orig
		mv /tmp/tripleo-ansible /opt/stack/

	Where:

	* <Insert undercloudIP> is the IP of the undercloud node
	* /tmp/heat_templates/ is the default location of the TAR files; enter the appropriate location, if you [changed the location](#default).

The files extracted in the seed tmp node.  If desired, you can delete the files in the `/tmp/heat_templates` directory.

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

* Review the [update prerequisites](/helion/openstack/update/prereqs/101/) and make sure all necessary tasks have been performed. <!--- including [extracting the update scripts](/helion/openstack/update/prereqs/101/#extract)---->.

* Backup a copy of the undercloud to restore in case of catastrophic failures.  For information, see [Back Up and Restore](/helion/openstack/backup.restore/).  

* Make sure that you have a least 7GB of space available on the seed node. Converting to the raw mode will take space on the seed. 
	<!-- 
	If you are low on space and you updated the seed previously please refer to the [Cleanup section](/helion/openstack/update/seed/101/) in *Updating the Seed Cloud Host* for information on removing post-update files. The backup/restore process should remove these files. You can check to make sure the files have been removed. -->

* Point the install script to the undercloud. The patch update script is based on the Ansible platform. For the undercloud, because the script is launched from the seed cloud host, you need to point the script to the seed cloud host.


	To point the script to update the undercloud, use the following steps:

	a. Login to seed

		ssh <seed_cloud_host_IP>

	b. Run the following command

		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/seedrc
	
	<!---Removed as per JIRA

	a. Copy the `stackrc` file it from the undercloud and rename the file for the undercloud:

		ssh heat-admin@<Undercloud IP>
		sudo -i
		cp stackrc /home/heat-admin/uc_stackrc

	b. On the seed cloud host, copy the `undercloud stackrc` file:

		scp heat-admin@<Undercloud ip>:uc_stackrc ~/
		
	c. Edit the `uc_stackrc` file to replace the localhost in the `OS_AUTH_URL` variable with the IP address of the undercloud.  

		export OS_AUTH_URL=http://<Undercloud>:5000/v2.0
	
	d. Source the file:
	
		source ~/uc_stackrc
		--->
	
	c. Execute the following commands:

		source /opt/stack/venvs/ansible/bin/activate
		cd /opt/stack/tripleo-ansible
		bash scripts/inject_nova_meta.bash
		export ANSIBLE_LOG_PATH=/var/log/ansible/ansible.log
		mkdir -p /var/log/ansible

	The command prompt should change to `(ansible)`. You must use  `(ansible)` session for executing all the update operations manually.

	d. To test that the ansible environment is correctly setup, use the following command to ping all the nodes that ansible can find via its inventory: 

		ansible all -u heat-admin -i plugins/inventory/heat.py -m ping  

	If successful, the ping command will show a ping of every node in a particular cloud.  It will look similar to this with one for each node.  

		192.0.2.28 | success >> {
			"changed": false,
			"ping": "pong"
		}	


## Update the undercloud ## {#update}

There are two methods to update the undercloud: 

* [Upgrade using the helper script](#upgradescript)
* [Manual upgrade](#upgrademanual)

You can monitor the update process, see [Monitoring the Update](/helion/openstack/update/monitor/101/).

### Update the undercloud using the script ### {#upgradescript}

To upgrade the undercloud using the `HelionUpdate.sh` script included in the patch update download, use the following steps:

1. Log in the seed VM host.

		sudo su -

2. SSH to the seed VM.

		ssh root@192.0.2.1 

3. Run the following command to start the update:

		cd /opt/stack/tripleo-ansible/
		./update-helpers/HelionUpdate.sh -undercloud

	This script will setup the environment, allow you to do test `ping` and perform pre-update checking, and also update the node.  

4. When the update is done, [validate the update](#validate). 


### Update the undercloud manually ### {#upgrademanual}

The manual method generally gives you more control of the update. 

There are three images that you need to place into the seed glance for the Undercloud. These images will be delivered in a file called `undercloud.tar` and are located in the undercloud local filesystem after you [obtain and extract the update package](/helion/openstack/update/download/101/).  

Please refer to [Extract the required scripts and libraries](/helion/openstack/update/prereqs/101/#extract) in *Update Prerequisites* for instructions on locating the directory the undercloud.tar.  

To update a node, the patch image needs to be loaded into the seed VM Image Operations service (Glance).  A `qcow2` image used for image update has dependencies on `vmlinuz` and `initrd` images.  

Use the following steps to load upload an image and its dependencies:  


1. Copy the new undercloud images into the seed glance repo.  

	* `undercloud.qcow2` 
	* `undercloud.initrd` 
	* `undercloud.vmlinuz`

2. SSH to the seed VM as `root`:

 		ssh <IP Address>

3. Run the update do the following:

		scp heat-admin@<Insert undercloudIP>:/tmp/heat_templates/undercloud.tar /tmp.  
		tar xvf undercloud.tar 

4. Rename the old undercloud image using the following commands

		export IMAGE_ID='glance image-list | grep undercloud | grep qcow2 | awk '{print $2}''
		export RAMDISK_ID='glance image-list | grep undercloud-initrd | awk '{print $2}''
		export KERNEL_ID='glance image-list | grep undercloud-vmlinuz | awk '{print $2}''

		glance image-update --name undercloud-old $IMAGE_ID
		glance image-update --name undercloud-initrd-old $RAMDISK_ID
		glance image-update --name undercloud-vmlinuz-old $KERNEL_ID

5. Upload new undercloud images to glance

		glance image-create --is-public True --is-protected False --name undercloud.vmlinuz --file undercloud.vmlinuz --disk-format aki --container-format aki

		glance image-create --is-public True --is-protected False --name undercloud.initrd --file undercloud.initrd --disk-format ari --container-format ari

		glance image-create --name <image name> --disk-format qcow2 --container-format bare --is-public True --file patch1.qcow2 --property ramdisk_id=<GlanceId of initrd image>  --property kernel_id=<GlanceId of vmlinuz image

5.	Make sure you are in the `/opt/stack/tripleo-ansible` directory and that you have the `(ansbile)` as part of your command prompt.

6. Run the following command:

		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -l <IP of undercloud> -e undercloud_rebuild_image_id=<glance Image_ID of undercloud> playbooks/update_cloud.yml

	Ansible will show progress and alert you to failures.  The `-vvvv` option makes information available in case of failure. 

7. When the update is done, [validate the update](#validate). 

## Validate the update ### {#validate}

Verify that services and communication between nodes is functional.

1.	SSH to undercloud:

		ssh heat-admin@<undercloud IP address>

2. Log in:

		sudo -i

3. Run the following commands to make sure all systems appear as expected:

		#. stackrc - to source the credentials or setup credentials
		nova list
		heat stack-list
		glance image-list

4. [Launch the Horizon UI](/helion/openstack/dashboard/login/) and make sure you can authenticate successfully.

### Backup the updated undercloud ### {#backup}

Once the update of undercloud node is complete, you should backup the node in case of failures.  See [Back Up and Restore](/helion/openstack/backup.restore/).

## Next Steps {#next-steps}

Upgrade the overcloud. 

For installation instructions, see [Updating the Overcloud](/helion/openstack/update/overcloud/101/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----

