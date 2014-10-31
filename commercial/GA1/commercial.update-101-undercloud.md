---
layout: default
title: "HP Helion OpenStack&#174; Release Notes"
permalink: /helion/openstack/update/undercloud/101/
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
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Updating the Undercloud

The *Readme.txt* that comes with a patch update will tell you what nodes need to be updated as a result of this patch. It will be located in the directory described in the *Extract the scripts and libraries necessary to perform the update* of the Appendix.  

If the Readme.txt does not list undercloud nodes, skip this document and proceed to [Updating the Undercloud](/helion/openstack/update/undercloud/101/).
    



## Prerequisites ## {#prereqs}

* You must have upgraded the seed VM on the seed cloud host, as described in [Updating the Seed Cloud Host](/helion/openstack/update/seed/101/).

* Backup a copy of the undercloud to restore in case of catastrophic failures.  For information, see [Back Up and Restore](/helion/openstack/backup.restore/).  

* Make sure that you have a least 7GB of space available on the seed node. Converting to the raw mode will take space on the seed. If you are low on space and you updated the seed previously please refer to the [Cleanup section](/helion/openstack/update/seed/101/) in *Updating the Seed Cloud Host* for information on removing post-update files. The backup/restore process should remove these files. You can check to make sure the files have been removed.

## Update the undercloud ## {#update}

There are two methods to update the undercloud: 

[Automatic upgrade using the helper script](#upgradescript)
[Manual upgrade](#upgrademanual)

### Update the undercloud using the script ### {#upgradescript}

To upgrade the undercloud using the `HelionUpdate.sh` script included in the patch update download, use the following steps:

1. Log in the seed VM host.

		sudo su -

2. SSH to the seed VM.

		ssh root@192.0.2.1 

3. Run the following command:

		cd /opt/stack/tripleo-ansible/
		./update-helpers/HelionUpdate.sh –undercloud

	This script will setup the environment, allow you to do test `ping` and perform pre-update checking, and also update the node.  

4. When the update is done, validate the update. 


### Update the undercloud manually ### {#upgrademanual}

The manual method generally gives you more control of the update. 

There are three images that you need to place into the seed glance for the Undercloud. These images will be delivered via a file called undercloud.tar and will be placed in the Undercloud local filesystem.  

Please refer to [Extract the required scripts and libraries](/helion/openstack/update/prereqs/101/#extract) in *Update Prerequisites* for instructions on locating the directory where Sherpa delivered the undercloud.tar.  



To upgrade the undercloud manually, use the following steps:

1.	Run the steps in [Setup the update environment](/helion/openstack/update/prereqs/101/#setup) in *Update Prerequisites* to point to the cloud to be updated for the Undercloud.  

	At the end of this step you should have an ssh session with (ansible) in the prompt.  Run all further Undercloud operations from this session (Verification steps may be run from a different session unless noted).

<TODO: confirm with JAGADISH no need to do this step if there was a Seed update>


2. Copy the new undercloud images into the seed glance repo.  

	* `undercloud.qcow2` 
	* `undercloud.initrd` 
	* `undercloud.vmlinuz`

3. SSH to the seed VM as `root`:

 		ssh <IP Address>

	To do this from the seed ssh session where you will run the update do the following:

		scp heat-admin@<Insert undercloudIP>:/tmp/heat_templates/undercloud.tar /tmp.  
		tar xvf undercloud.tar 

To update a node, the patch image needs to be loaded into the Seed’s Glance.  A Glance qcow2 image used for image update has dependencies on vmlinuz and initrd images.  Follow the sequence as outlined below to load upload an image and its dependencies into glance.  Note:  With Sherpa and a CSU this step isn’t necessary the instructions are here incase it’s necessary to do this manually.  Again from the ssh session that you setup for update with prompt containing (ansible) please run the following commands.    <TODO CONFIRM NAMES BELOW>

1.	glance image-create --is-public True --is-protected False --name undercloud.vmlinuz --file undercloud.vmlinuz --disk-format aki --container-format aki

2.	glance image-create --is-public True --is-protected False --name undercloud.initrd --file undercloud.initrd --disk-format ari --container-format ari

3.	glance image-create --name <image name> --disk-format qcow2 --container-format bare --is-public True --file patch1.qcow2 --property ramdisk_id=<GlanceId of initrd image>  --property kernel_id=<GlanceId of vmlinuz image

3.	Make sure you are in the directory /opt/stack/tripleo-ansible and that you have the (ansbile) as part of your command prompt (from the step of setting up the ansible environment above)
ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -l <IP of undercloud> -e undercloud_rebuild_image_id=<glance Image_ID of undercloud> playbooks/update_cloud.yml


### Monitoring the update progress ### {#monitor}

Ansible will show progress and alert you to failures.  The –vvvv option makes information available in case of failure. 

### Validation of update ### {#validate}

Verify that services and communication between nodes is functional.

1.	SSH to undercloud:

		ssh heat-admin@<undercloud IP address>

2. Log in:

		sudo -i

3. Run the following commands to make sure all systems appear as expected:

		. stackrc – to source the credentials or setup credentials
		nova list
		heat stack-list
		glance image-list

4. [Launch the Horizon UI](/helion/openstack/dashboard/login/) and make sure you can authenticate successfully.

## Next Steps {#next-steps}

Upgrade the overcloud. 

For installation instructions, see 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

