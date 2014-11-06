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

The *Readme.txt* that comes with a patch update will tell you what nodes need to be updated as a result of this patch. It will be located in the directory described in the *Extract the scripts and libraries necessary to perform the update* of the Appendix.  

If the Readme.txt does not list overcloud nodes, the update is complete.

* [Prerequisites](#prereqs)
* [Update the overcloud](#update)
* [Validate the update](#validate)
* [Backup the updated overcloud](#backup)
* [Next Steps](#next-steps)

You can monitor the update process, see [Monitoring the Update](/helion/openstack/update/monitor/101/).

## Prerequisites ## {#pre}

Before you begin the update:

* Make sure a current backup of the management controller, controller0, and controller1 nodes exists, as described in [Back Up and Restore](/helion/openstack/backup.restore/#overcloud).

* Review the [update prerequisites](/helion/openstack/update/prereqs/101/) and make sure all necessary tasks have been performed, including [extracting the update scripts](/helion/openstack/update/prereqs/101/#extract).

* Point the install script to the overcloud. The patch update script is based on the Ansible platform. For the overcloud, because the script is launched from the seed cloud host, you need to point the script to the overcloud node.

	To point the script to update the overcloud, use the following steps:

	a. Copy the `stackrc` file it from the undercloud and rename the file for the undercloud:

		ssh heat-admin@<Undercloud IP>
		sudo -i
		cp stackrc /home/heat-admin/uc_stackrc

	b. On the seed cloud host, copy the  the Undercloud to get it.
	scp heat-admin@<Undercloud ip>:uc_stackrc ~/

	c. Edit the `uc_stackrc` file to replace the localhost in the `OS_AUTH_URL` variable with the IP address of the undercloud.  

		export OS_AUTH_URL=http://<Undercloud>:5000/v2.0
	
	d. Source the file:
	
		source ~/uc_stackrc
	
	e. Execute the following commands:

		source /opt/stack/venvs/ansible/bin/activate
		cd /opt/stack/tripleo-ansible
		bash scripts/inject_nova_meta.bash
		export ANSIBLE_LOG_PATH=/var/log/ansible/ansible.log
		mkdir -p /var/log/ansible

	The command prompt should change to `(ansible)`. You will need to use this `(ansible)` session to perform all the update operations.

	c. To test that the ansible environment is correctly setup, use the following command to ping all the nodes that ansible can find via its inventory: 

		ansible all -u heat-admin -i plugins/inventory/heat.py -m ping  

	If successful the ping command will show a ping of every node in a particular cloud.  It will look similar to this with one for each node.  

		192.0.2.28 | success >> {
			"changed": false,
			"ping": "pong"
		}	



## Update the overcloud ## {#update}

There are two methods to update the overcloud: 

[Automatic upgrade using the helper script](#upgradescript)
[Manual upgrade](#upgrademanual)

You can monitor the update process, see [Monitoring the Update](/helion/openstack/update/monitor/101/).


### Update the overcloud using the script ### {#upgradescript}

To upgrade the overcloud using the `HelionUpdate.sh` script included in the patch update download, use the following steps:

1. Log in the seed VM host.

		sudo su -

2. SSH to the seed VM.

		ssh root@192.0.2.1 

3. Run the following command to start the update:

		cd /opt/stack/tripleo-ansible/
		./update-helpers/HelionUpdate.sh

	This script will setup the environment, allow you to do test `ping` and perform pre-update checking, update the nodes in a specific order.

	The script allows you to update by node type. For example all the controllers are done as a group. Inside each group the individual nodes are presented for the user to update, skip or exit. If you wish to skip a whole group skip at the group level. 
. 
	You might want to skip a node if you want to test update on a particular node or if you want to resume an update later on.  To skip a node, presst the `s` key until you get to a node you want to update.
	
	**Note:** The script will detect if a node fails to update. If such a failure is detected the script will exit.  When this happens you should refer to the  [Validation and Recovery steps if you encountered an issue in the Overcloud] section for known workarounds.

4. When the update is done, validate the update. 

**Note:**  If your cloud has ESX host and the update includes new images for ESX Proxy and ESX OVSvAPP, refer to [Redeploy Compute Proxy and OVSvAPP on ESX Host](#redeploy) after updating Controller Management node and before proceeding to controller nodes.

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

#### Prerequisites for manual update ###

Before you start, do the following:

* Make sure services are in operational state by running the following command: 

		cd /opt/stack/tripleo-ansible
		ansible-playbook -vvvv -M library/cloud -i plugins/inventory/heat.py -u heat-admin playbooks/pre-flight_check.ym

* Determine the overcloud nodes that will need to be updated. The *Readme.txt* that comes with a patch update will tell you what nodes need to be updated as a result of this patch. It will be located in the directory described in the *Extract the scripts and libraries necessary to perform the update* of the Appendix.  

	For each node, obtain the image ID and IP address.  For each of these, record the ID, to get the ID see Appendix section Gather information needed for update: sub section Determine Glace ID of image.


To manually update the overcloud nodes:

1. Update the overcloud Management Controller using the following command:
 
		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -e single_controller=True  -l <IP of controller mgmt> -e controllermgmt_rebuild_image_id=<glance Image_ID of  overcloud-control-mgmt> playbooks/update_cloud.yml

2. Verify that the management controller is running by performing the following steps, from a separate ssh window:

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

	**Note:**  If your cloud has ESX host and the update includes new images for ESX Proxy and ESX OVSvAPP, refer to [Redeploy Compute Proxy and OVSvAPP on ESX Host](#redeploy) after updating Controller Management node and before proceeding to controller nodes.

3. Update overcloud controller0 using the following command:

		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -e single_controller=True -l <IP of controller> -e controller_rebuild_image_id=<glance Image_ID of overcloud-control> playbooks/update_cloud.yml
	Where:

	* `<IP of controller>` is the IP address of overcloud controller0
	* `<glance Image_ID of overcloud-control>` is the image ID of controller0

4. Verify that the controller0 is running by performing the following steps, from a separate ssh window:

	a. SSH into overcloud-controller-mgmt node:

		ssh heat-admin@<Insert IP of controller-mgmt node>
		sudo -i
		. stackrc # - to source the credentials or setup crednetials
		nova list
		heat stack-list
		glance image-list
		msql 

	b. Run `progress.sh` script to validate that the image ID matches the one expected by the update by running the following command:

		cd /opt/stack/tripleo-ansible/update-helpers/
		./progress.sh

	The `progress.sh` should disply `needed N`, meaning the image ID matches the latest the patch knows about for the management controller node

4. Update overcloud controller1 using the following command:

		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -e single_controller=True -l <IP of controller> -e controller_rebuild_image_id=<glance Image_ID of overcloud-control> playbooks/update_cloud.yml
	Where:

	* `<IP of controller>` is the IP address of overcloud controller1
	* `<glance Image_ID of overcloud-control>` is the image ID of controller1


5. Verify that the controller0 is running by performing the following steps, from a separate ssh window:

	a. SSH into overcloud-controller-mgmt node:

		ssh heat-admin@<Insert IP of controller-mgmt node>
		sudo -i
		. stackrc # - to source the credentials or setup crednetials
		nova list
		heat stack-list
		glance image-list
		msql 

	b. Run `progress.sh` script to validate that the image ID matches the one expected by the update by running the following command:

		cd /opt/stack/tripleo-ansible/update-helpers/
		./progress.sh

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

		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py  -e force_rebuild=True -l IP_Compute_1:IP_Compute_2:IP_Compute_3...:IP_Compute_n -e nova_compute_rebuild_image_id=<glance Image_ID of overcloud-compute > playbooks/update_cloud.yml


Swift (n-scale):  Swift it is strongly encouraged that you update 1 at a time (node by node):
This command will update only one swift node, you will have to repeat it for every swift IP address.
ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -l <IP of overcloud-swift nscale> -e swift_storage_rebuild_image_id =<glance Image_ID of overcloud-swift nscale> playbooks/update_cloud.yml

VSA (n-scale):
This command will update only one VSA node, you will have to repeat it for every VSA IP address.
ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -l <IP of vsa overcloud node> -e vsa_rebuild_image_id =<glance Image_ID of vsa overcloud node > playbooks/update_cloud.yml

Verification:
1.	Authenticate to n-scale node updated using SSH.



## Validate the update ### {#validate}

Another helper script exists that will show you the progress of your update.  For each node it will validate if it is running the image deemed to be the latest by the version of the scripts you are running.  It will put a Y or a N by that Node (IP and Node name).  This will help you as you keep track of the update progress especially if you run it over multiple maintenance windows.  This will work even if you use the manual method.  See Appendix section Monitoring Update status: for information on how to run the script.




Validation and Recovery steps if you encountered an issue in the Overcloud:   If an error is encountered please use guide in /opt/stack/tripleo-ansible/troubleshooting.rst
 
Cleanup:  After all the clouds and nodes have been updated it is possible to remove the old images put into glance to reduce required space.  It is recommended that this isn't done until all validation has been run and user is comfortable that they won't have to update to the old version.

### Backup the updated overcloud ### {#backup}

Once the update of overcloud node is complete, you should backup the node in case of failures.  See [Back Up and Restore](/helion/openstack/backup.restore/).

## Redeploy Compute Proxy and OVSvAPP on ESX Host ## {#redeploy}

After updating the Controller Management node, update  Nova Compute Proxy and OVSvAPP if the infrastructure includes ESX Proxied Hosts and the update package contains new images for ESX. Failure to do so will prevent users from launching VM's in vCenter Hosts.
To manage the VM's launched using the older compute proxy, use the same hostname entered for older Compute Proxy.

Redeploy Nova Compute Proxy:
1. Login to Undercloud
2. Deactivate the activated cluster
3. Delete overcloud_vcenter_compute_proxy template in the vCenter
4. Deploy Compute proxy similar to how you did before(http://docs.hpcloud.com/helion/openstack/install/esx/proxy/), but use the latest overcloud_vcenter_compute_proxy.ova
5. Activate the cluster which was imported before
Redeploy OVSvAPP:
1. Power off and delete the OVSvAPP vms in the vCenter
2. Login to Overcloud ControllerMgmt node
3. Delete the HP VCN L2 agents
   neutron agent-delete <HP VCN L2 agent ID>
4. Delete overcloud-esx-ovsvapp template in the vCenter
5. Follow the steps (http://docs.hpcloud.com/helion/openstack/install/ovsvapp/) as before to install OVSvAPP, but use the latest overcloud-esx-ovsvapp.ova and ovsvapp.tgz



## Next Steps {#next-steps}

Upgrade the overcloud. 

For installation instructions, see [Updating the Undercloud](/helion/openstack/update/overcloud/101/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

