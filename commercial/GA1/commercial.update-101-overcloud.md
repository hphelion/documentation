---
layout: default
title: "HP Helion OpenStack&#174; Updating the Overcloud"
permalink: /helion/openstack/update/overcloud/101/
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
# HP Helion 1.0 1.0 OpenStack&reg; Updating the Overcloud
<!-- No README in 1.01
The *Readme.txt* that comes with a patch update lists the nodes that need to be updated as a result of this patch. This file is located in the directory described in the [Update Troubleshooting](/helion/openstack/update/troubleshooting/101/) of the Update Prerequisites.  

If the Readme.txt does not list any overcloud nodes, the update is complete. -->

Use the this document when updating the overcloud nodes.

* [Prerequisites](#pre)
	* [Stop the HP Helion Development Platform](#devplatstop)
* [Update the overcloud](#update)
* [Validate the update](#validate)
* [Restart the HP Helion Development Platform](#devplatstart)
* [Next Steps](#next-steps)

You can monitor the update process, see [Monitoring the Update](/helion/openstack/update/monitor/101/).

## Prerequisites for the overcloud update ## {#pre}

Before you begin the update:

* If the undercloud needed updating, perform this update before updating the overcloud, as described in [Updating the Undercloud Host](/helion/openstack/update/undercloud/101/)

* Make sure a current backup of the management controller, controller0, and controller1 nodes exists, as described in [Back Up and Restore](/helion/openstack/backup.restore/#overcloud).

* Review the [update prerequisites](/helion/openstack/update/prereqs/101/) and make sure all necessary tasks have been performed, including [extracting the update scripts](/helion/openstack/update/prereqs/101/#extract).

* Point the install script to the overcloud. The patch update scripts are based on the Ansible platform. When patching the overcloud, because the script is launched from the seed cloud host, you need to point the script to the overcloud node.

	To point the script to update the overcloud, use the following steps:

	a. Copy the `stackrc` file to the undercloud and rename the file for the undercloud:

		ssh heat-admin@<Undercloud IP>
		sudo -i
		cp stackrc /home/heat-admin/uc_stackrc

	b. On the seed cloud host, copy the file to the seed host.

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

	f. To test that the ansible environment is correctly set up, use the following command to ping all the nodes that ansible can find via its inventory: 

		ansible all -u heat-admin -i plugins/inventory/heat.py -m ping  

	If successful the ping command will show a ping of every node in a particular cloud.  It will look similar to this with one for each node.  

		192.0.2.28 | success >> {
			"changed": false,
			"ping": "pong"
		}	

### Stop the HP Helion Development Platform {#devplatstop}

Before you run the patch update on the overcloud, you must stop the HP Helion Development Platform service using a script. See [Stopping and Starting the Development Platform Services](/helion/openstack/update/devplatstop/101/). After the update is complete, you can execute another script to [restart the service](#devplatstart).

## Update the overcloud ## {#update}

There are two methods to update the overcloud: 

* [Upgrade using the helper script](#upgradescript)
* [Manual upgrade](#upgrademanual)

You can monitor the update process, see [Monitoring the Update](/helion/openstack/update/monitor/101/).


### Update the overcloud using the script ### {#upgradescript}

To upgrade the overcloud using the `HelionUpdate.sh` script included in the patch update download, use the following steps:

1. Log in the seed VM host:

		sudo su -

2. SSH to the seed VM:

		ssh root@192.0.2.1 

3. Run the following command to start the update:

		cd /opt/stack/tripleo-ansible/
		./update-helpers/HelionUpdate.sh

	This script will setup the environment, allow you to do test `ping`, and perform pre-update checking, update the nodes in a specific order.

	The script allows you to update by node type. For example all the controllers are done as a group. Inside each group the individual nodes are presented for the user to update, skip or exit. If you wish to skip a whole group skip at the group level. 

	You might want to skip a node if you want to test the update on a particular node or if you want to resume an update later on. To skip a node, press the `s` key until you get to a node you want to update.
	
	**Note:** The script will detect if a node fails to update. If such a failure is detected the script will exit.  When this happens you should refer to the [Update Troubleshooting](/helion/openstack/update/troubleshooting/101/) document for known workarounds.

4. When the node update is done, validate the updated node. 

5. Manually reboot the compute nodes that were updated or using `nova stop` and `nova start` in the undercloud.

	If after the instances are started it is not possible to ping/ssh to an instance, reboot the instance.

**Note:**  If your cloud has ESX host and the update includes new images for ESX Proxy and ESX OVSvAPP, refer to [Redeploy Compute Proxy and OVSvAPP on ESX Host](#redeploy) after updating Controller Management node and before proceeding to controller nodes.

### Update the undercloud manually ### {#upgrademanual}

The manual update process allows you to upgrade each node in order. 

Make sure that the updated node is back up and running before you update other nodes. This is especially important for the overcloud controllers.  

The recommended update order is 

1. Controller management node 
2. Controller nodes (0,1) 
3. Compute service 
4. Object Operations (Swift) service 
5. HP StoreVirtual VSA (for KVM only)

All Ansible commands must be run in the SSH session setup that has `ansible` in the command prompt.  Validation techniques may be run from any seed SSH session.

Run through the appropriate commands below for this order.

#### Prerequisites for manual update ###

Before you start, do the following:

* Make sure services are in operational state by running the following command: 

		cd /opt/stack/tripleo-ansible
		ansible-playbook -vvvv -M library/cloud -i plugins/inventory/heat.py -u heat-admin playbooks/pre-flight_check.ym

* Determine the overcloud nodes that will need to be updated. The *Readme.txt* that comes with a patch update will tell you what nodes need to be updated as a result of this patch. It will be located in the directory described in the [Extracting the required scripts and libraries](/helion/openstack/update/prereqs/101/#extract).  

	For each node, obtain the image ID and IP address. For each of these, record the ID, to get the ID, see [Gathering information needed for update](/helion/openstack/update/prereqs/101/#info).


To manually update the overcloud nodes:

1. Update the overcloud management controller using the following command:
 
		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -e single_controller=True  -l <IP of controller mgmt> -e controllermgmt_rebuild_image_id=<glance Image_ID of  overcloud-control-mgmt> playbooks/update_cloud.yml

2. Verify that the management controller is running by performing the following steps, from a separate seed SSH window:

	a. SSH into overcloud-controller-mgmt node:

		ssh heat-admin@<Insert IP of controller-mgmt node>
		sudo -i
		. stackrc # - to source the credentials or setup crednetials
		nova list
		heat stack-list
		glance image-list
		mysql 

	b. Run `progress.sh` script to validate that the image ID matches the one expected by the update by running the following command:

		cd /opt/stack/tripleo-ansible:
		./update-helpers/progress.sh

	The `progress.sh` should disply `needed N`, meaning the image ID matches the latest the patch knows about for the management controller node.

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

	The `progress.sh` should disply `needed N`, meaning the image ID matches the latest the patch knows about for the management controller node.


Note:  n-scale nodes are rolled out 1 per stack and can scale from 1 to n in number.

### Compute (n-scale, not ESX) ## {#compute}

You should update the Compute nodes in such a way as to allow workloads to continue to function.  

To do this, migrate the workloads to nodes that will not be down during a particular compute node set update and then migrate them back when done.  


1. Use the `nova list` command in the undercloud to see the full set of compute nodes available to be updated.

2. If your environment uses availability zones, do not bring down all availability zones. Select one zone at a time to prevent stopping all workloads.  

	a. To get a list of availability zones: 

		nova availability-zone-list. 

	b.	To get a list of hosts inside a zone: 

		nova host-list [--zone <zone>]

3.	Migrating hosts is outside the scope of this document, however using the list and availability zone info a user can use techniques. See OpenStack documentation for [Migrate instances](http://docs.openstack.org/admin-guide-cloud/content/section_live-migration-usage.html) and [Configure migrations](http://docs.openstack.org/admin-guide-cloud/content/section_configuring-compute-migrations.html) to migrate workloads to a specific node.

4.	If this update affects several maintenance cycles, you can run the progress script to see where they are in the update process.  

	**One at a time:** 

	This command will update only one compute node, you will have to repeat it for every compute IP address.

		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -l <IP of overcloud-compute > -e nova_compute_rebuild_image_id =<glance Image_ID of overcloud-compute > playbooks/update_cloud.yml

	**A set at a time (set can be 1 to n):**

	This command may update only update a subset of compute nodes, you are responsibe to update all the nodes with multiple commands if necessary.

		ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py  -e force_rebuild=True -l IP_Compute_1:IP_Compute_2:IP_Compute_3...:IP_Compute_n -e nova_compute_rebuild_image_id=<glance Image_ID of overcloud-compute > playbooks/update_cloud.yml

5. Manually reboot the compute nodes that were updated or using `nova stop` and `nova start` in the undercloud.

	If after the instances are started it is not possible to ping/ssh to an instance, reboot the instance.



### Swift (n-scale):  

For Swift, it is strongly encouraged that you update one node at a time (node by node).

The following command updates only one Swift node; you will have to repeat it for every swift IP address.

	ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -l <IP of overcloud-swift nscale> -e swift_storage_rebuild_image_id =<glance Image_ID of overcloud-swift nscale> playbooks/update_cloud.yml

### VSA (n-scale):

This command updates only one VSA node; you will have to repeat it for every VSA IP address.

	ansible-playbook -vvvv -u heat-admin -i plugins/inventory/heat.py -e force_rebuild=True -l <IP of vsa overcloud node> -e vsa_rebuild_image_id =<glance Image_ID of vsa overcloud node > playbooks/update_cloud.yml

## Back up the updated overcloud ### {#backup}

Once the update of overcloud node is complete, you should back up the node in case of failures.  See [Back Up and Restore](/helion/openstack/backup.restore/).

## Redeploy Compute Proxy and OVSvAPP on ESX Host ## {#redeploy}

If your infrastructure includes ESX proxy hosts, update the Compute Proxy and OVSvAPP after updating the overcloud controller management node. The update package contains new images for ESX. Failure to do so will prevent users from launching VMs in vCenter Hosts.
To manage the VMs launched using the older Compute proxy, use the same hostname entered for older Compute proxy.

**Redeploy Nova Compute Proxy**

1. Log in to the undercloud.

2. Deactivate the activated cluster.

3. Delete the `overcloud_vcenter_compute_proxy` template in the vCenter

4. Deploy the Compute proxy as described in [Deploy vCenter ESX compute proxy](/helion/openstack/install/esx/proxy/), using the latest `overcloud_vcenter_compute_proxy.ova`.

5. Activate the cluster which was imported before.

**Redeploy OVSvAPP**

1. Power off and delete the OVSvAPP VMs in the vCenter.

2. Log in to the overcloud ControllerMgmt node.

3. Delete the HP VCN L2 agents:

		neutron agent-delete <HP VCN L2 agent ID>

4. Delete the `overcloud-esx-ovsvapp` template in the vCenter.

5. Follow the steps in [Deploying and Configuring OVSvApp on ESX hosts](/helion/openstack/install/ovsvapp/) to install OVSvAPP, but use the latest `overcloud-esx-ovsvapp.ova` and `ovsvapp.tgz`.

## Restart the HP Helion Development Platform {#devplatstart}

After the update is complete, you can execute a script to restart the service. See [Stopping and Starting the Development Platform Services](/helion/openstack/update/devplatstop/101/). 


## Next Steps {#next-steps}

If your cloud uses the optional HP Helion OpenStack DNSaaS (Domain Name Server as a Service), upgrade DNSaaS. 

For installation instructions, see [DNSaaS Installation and Configuration](/helion/openstack/install/dnsaas/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----

