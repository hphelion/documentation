---
layout: default
title: "HP Helion OpenStack&#174; Updating the Overcloud"
permalink: /helion/openstack/update/overcloud/101/
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
# HP Helion OpenStack&reg; Updating the Overcloud


[Update the undercloud](#update)
[Validate the update](#validate)
[Next Steps](#next-steps)

You can monitor the update process, see [Monitoring the Update](/helion/openstack/update/monitor/101/).

## Prerequisites ## {#pre}

Before you begin the update:

* Make sure a current backup of the management controller, controller0, and controller1 nodes exists, as described in [Back Up and Restore](/helion/openstack/backup.restore/#overcloud).


## Update the overcloud ## {#update}

There are two methods to update the overcloud: 

[Automatic upgrade using the helper script](#upgradescript)
[Manual upgrade](#upgrademanual)

You can monitor the update process, see [Monitoring the Update](/helion/openstack/update/monitor/101/).


### Update the undercloud using the script ### {#upgradescript}

To upgrade the overcloud using the `HelionUpdate.sh` script included in the patch update download, use the following steps:

1. Log in the seed VM host.

		sudo su -

2. SSH to the seed VM.

		ssh root@192.0.2.1 

3. Run the following command:

		cd /opt/stack/tripleo-ansible/
		./update-helpers/HelionUpdate.sh

	This script will setup the environment, allow you to do test `ping` and perform pre-update checking, update the nodes in a specific order.

	The script allows you to update by node type. For example all the controllers are done as a group. Inside each group the individual nodes are presented for the user to update, skip or exit. If you wish to skip a whole group skip at the group level. 
. 
	You might want to skip a node if you want to test update on a particular node or if you want to resume an update later on.  To skip a node, presst the `s` key until you get to a node you want to update.
	
	**Note:** The script will detect if a node fails to update. If such a failure is detected the script will exit.  When this happens you should refer to the  [Validation and Recovery steps if you encountered an issue in the Overcloud] section for known workarounds.

4. When the update is done, validate the update. 



### Update the undercloud manually ### {#upgrademanual}

The manual update process allows you to upgrade each node in order. 

Make sure that the updated node is back up and running before you update other nodes. This is especially important for Overcloud controllers.  

The recommended update order is 

1. Controller management node 
2. Controller nodes (0,1) 
3. Compute service 
4. Object Operations (Swift) service 
5. HP StoreVirtual VSA (for KVM only)

All ansible commands must be run in the SSH session setup above that has (ansbile) in the command prompt.  Validation techniques may be run from any seed SSH session.

Run through the appropriate commands below for this order.

#### Prerequisites for manua update ###

Before you start, do the following:

* Make sure services are in operational state by running the following command: 

		cd /opt/stack/tripleo-ansible
		ansible-playbook -vvvv -M library/cloud -i plugins/inventory/heat.py -u heat-admin playbooks/pre-flight_check.ym

* Determine the overcloud nodes that will need to be updated. The *Readme.txt* that comes with a patch update will tell you what nodes need to be updated as a result of this patch. It will be located in the directory described in the *Extract the scripts and libraries necessary to perform the update* of the Appendix.  

	For each node, obtain the image ID and IP address.  For each of these, record the ID, to get the ID see Appendix section Gather information needed for update: sub section Determine Glace ID of image.


To manually update the overcloud nodes:

1.	Run the steps in [Setup the update environment](/helion/openstack/update/prereqs/101/#setup) in *Update Prerequisites* to point to the cloud to be updated for the Undercloud.  

2. Update the overcloud Management Controller using the following command:
 
		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -e single_controller=True  -l <IP of controller mgmt> -e controllermgmt_rebuild_image_id=<glance Image_ID of  overcloud-control-mgmt> playbooks/update_cloud.yml

3. Verify that the management controller is running by performing the following steps, from a separate ssh window:

	a. SSH into overcloud-controller-mgmt node:

		ssh heat-admin@<Insert IP of controller-mgmt node>
		sudo -i
		. stackrc # - to source the credentials or setup crednetials
		nova list
		heat stack-list
		glance image-list
		msql 

	b. Run `progress.sh` script to validate that the image ID matches the one expected by the update by running the following command:

		cd /opt/stack/tripleo-ansible:
		./update-helpers/progress.sh

	The `progress.sh` should disply `needed N`, meaning the image ID matches the latest the patch knows about for the management controller node


4. Update overcloud controller0 using the following command:

		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -e single_controller=True -l <IP of controller> -e controller_rebuild_image_id=<glance Image_ID of overcloud-control> playbooks/update_cloud.yml
	Where:

	* `<IP of controller>` is the IP address of overcloud controller0
	* `<glance Image_ID of overcloud-control>` is the image ID of controller0

3. Verify that the controller0 is running by performing the following steps, from a separate ssh window:

	a. SSH into overcloud-controller-mgmt node:

		ssh heat-admin@<Insert IP of controller-mgmt node>
		sudo -i
		. stackrc # - to source the credentials or setup crednetials
		nova list
		heat stack-list
		glance image-list
		msql 

	b. Run `progress.sh` script to validate that the image ID matches the one expected by the update by running the following command:

		cd /opt/stack/tripleo-ansible:
		./update-helpers/progress.sh

	The `progress.sh` should disply `needed N`, meaning the image ID matches the latest the patch knows about for the management controller node

4. Update overcloud controller1 using the following command:

		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -e single_controller=True -l <IP of controller> -e controller_rebuild_image_id=<glance Image_ID of overcloud-control> playbooks/update_cloud.yml
	Where:

	* `<IP of controller>` is the IP address of overcloud controller1
	* `<glance Image_ID of overcloud-control>` is the image ID of controller1


3. Verify that the controller0 is running by performing the following steps, from a separate ssh window:

	a. SSH into overcloud-controller-mgmt node:

		ssh heat-admin@<Insert IP of controller-mgmt node>
		sudo -i
		. stackrc # - to source the credentials or setup crednetials
		nova list
		heat stack-list
		glance image-list
		msql 

	b. Run `progress.sh` script to validate that the image ID matches the one expected by the update by running the following command:

		cd /opt/stack/tripleo-ansible:
		./update-helpers/progress.sh

	The `progress.sh` should disply `needed N`, meaning the image ID matches the latest the patch knows about for the management controller node


Note:  n-scale nodes are rolled out 1 per stack and can scale from 1 to n in number.

Compute (n-scale, not ESX):  It is recommended that a user update their compute nodes in such a way as to allow workloads to continue to function.  To do this it is recommended that a user migrate their workloads to nodes that will not be down during a particular compute node set update and then migrate them back when done.  It is impossible to know all the scenarios here that a customer will want.  To aid them in selecting n-scale nodes for update here is a list of a few helpful commands.  It is also important to note they very well could update all the compute nodes at once, but there will be outages if this happens.  
1.	nova list from the Undercloud will give the full set of compute nodes available to be updated.
2.	If availability zones are employed it is good to not bring down all availability zones.  So selecting one zone and not all are a good idea if you do not want to stop all workloads.  
a.	To get a list of availability zones: nova availability-zone-list 
b.	To get a list of hosts inside a zone: nova host-list [--zone <zone>]
3.	Migrating hosts is outside the scope of this document, however using the list and availability zone info a user can use techniques here http://docs.openstack.org/admin-guide-cloud/content/section_live-migration-usage.html and http://docs.openstack.org/admin-guide-cloud/content/section_configuring-compute-migrations.html to migrate workloads to a specific node.
4.	If this update is over several maintenance cycles the user may want to run the help script that shows where they are in the update process.  Please see section All high-level pre update scripts should be run: for more info.
One at a time:
This command will update only one compute node, you will have to repeat it for every compute IP address.

		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -l <IP of overcloud-compute > -e nova_compute_rebuild_image_id =<glance Image_ID of overcloud-compute > playbooks/update_cloud.yml

A set at a time (set can be 1 to n):
This command may update only update a subset of compute nodes, it is the responsibility of the user to update all the nodes with multiple commands if necessary.

		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py  -e force_rebuild=True -l "IP_Compute_1:IP_Compute_2:IP_Compute_3...:IP_Compute_n" -e nova_compute_rebuild_image_id=<glance Image_ID of overcloud-compute > playbooks/update_cloud.yml


Swift (n-scale):  Swift it is strongly encouraged that you update 1 at a time (node by node):
This command will update only one swift node, you will have to repeat it for every swift IP address.
ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -l <IP of overcloud-swift nscale> -e swift_storage_rebuild_image_id =<glance Image_ID of overcloud-swift nscale> playbooks/update_cloud.yml

VSA (n-scale):
This command will update only one VSA node, you will have to repeat it for every VSA IP address.
ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -l <IP of vsa overcloud node> -e vsa_rebuild_image_id =<glance Image_ID of vsa overcloud node > playbooks/update_cloud.yml

Verification:
1.	Authenticate to n-scale node updated using SSH.

All Nodes:  The user always has the option of updating all nodes at once.  This is NOT the recommend way to update the cloud, but here is the command if they choose to do so:  Note: If you choose to use the not recommended All Nodes method and have HP Development Platform installed in your cloud please read Dev-Platform Services: prior to running the all node.
ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -e controller_rebuild_image_id=<glance Image_ID of  overcloud-controller> -e nova_compute_rebuild_image_id=<glance Image_ID of  nova compute> -e swift_storage_rebuild_image_id=<glance Image_ID of swift-storage> controllermgmt_rebuild_image_id=<glance Image_ID of  overcloud-control-mgmt> playbooks/update_cloud.yml


## Validate the update ### {#validate}

Another helper script exists that will show you the progress of your update.  For each node it will validate if it is running the image deemed to be the latest by the version of the scripts you are running.  It will put a Y or a N by that Node (IP and Node name).  This will help you as you keep track of the update progress especially if you run it over multiple maintenance windows.  This will work even if you use the manual method.  See Appendix section Monitoring Update status: for information on how to run the script.




Validation and Recovery steps if you encountered an issue in the Overcloud:   If an error is encountered please use guide in /opt/stack/tripleo-ansible/troubleshooting.rst
 
Cleanup:  After all the clouds and nodes have been updated it is possible to remove the old images put into glance to reduce required space.  It is recommended that this isn't done until all validation has been run and user is comfortable that they won't have to update to the old version.



## Next Steps {#next-steps}

Upgrade the overcloud. 

For installation instructions, see [Updating the Undercloud](/helion/openstack/update/overcloud/101/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

