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

Before you proceed with seed node update, you should have [extracted the update scripts](/helion/openstack/update/prereqs/101/#extract) delivered as part of the patch.  

Execute the `seed_update.sh` script to backup and copy the seed settings to host system:

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
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


