---
layout: default
title: "HP Helion OpenStack: Add and Remove Nodes"
permalink: /helion/openstack/ga/install/add/nodes/
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
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&reg;: Add and Remove Nodes

This document describes the steps to add and remove nodes (scale in or scale out the VSA and Compute nodes) on an already installed overcloud 

- [Prerequisites](#pre)
- [Add nodes](#add)
- [Remove nodes](#pre)

## Prerequisites ## {#pre}

Before adding and removing nodes, make sure th

- The seed VM, undercloud and overcloud are installed. The using the EE Installer with USE_TRICKLE=1 which is default installation.

## Add Nodes ## {#add}

To add nodes, use the following procedures, depending on whether the nodes were allocated during the install:

- [Pre-Allocated Empty Baremetal Nodes](#pre)
- [Non-Allocated Empty Baremetal Nodes](#non)

### Scenario 1 - Pre-Allocated Empty Baremetal Nodes ### {#pre}

There are already pre-allocated empty baremetal nodes which were created during the first install and can be used for adding new nodes

1. SSH to seed VM.

2. Maintain the Scale Counts in environment variables file (env_vars) which is used during the initial installation. Edit the `env_vars` file as follows:

	- To scale out the VSA storage nodes, update the `OVERCLOUD_VSA_STORAGESCALE` value to the appropriale scale number.

		export OVERCLOUD_VSA_STORAGESCALE=<number_of_nodes>

	- To scale out the VSA AO storage nodes, update the OVERCLOUD_VSA_AO_STORAGESCALE to appropriate scale number.

		export OVERCLOUD_VSA_AO_STORAGESCALE=<number_of_nodes>

	To scale out the Compute nodes, update the `OVERCLOUD_COMPUTESCALE` value to appropriale scale number. 

		export OVERCLOUD_COMPUTESCALE=2

3. Apply the configuration. Source the environment variables file that  you updated:  

		source /root/env_vars

4. Run the installer script

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log

	If because of some reason, the above command fails, try the alternative approach

		export OVERCLOUD_SCALE_NODES=1
		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log

### Scenario 2 - Non-Allocated Empty Baremetal Nodes ### {#non}

The baremetal nodes are not pre-allocated during the initial install.

1. SSH to undercloud VM

2. Register the new baremetal in Ironic database. 

	ironic node-create -d pxe_ipmitool -p cpus=12 -p memory_mb=98304 -p local_gb=1800 -p
	cpu_arch=amd64 -i ipmi_address=10.22.28.73 -i ipmi_username=admin -i
	ipmi_password=helion_001

3. Create the ironic port for the ironic node created in previous step `ironic port-create --address $MAC_ADDR --node_uuid $NODE_UUID`. Make the respective baremetal entry in `/root/baremetal.csv` on the seed VM.

4. SSH to seed VM.

5. Maintain the Scale Counts in environment variables file (env_vars) which is used during the initial installation. Edit the `env_vars` file as follows:

	- To scale out the VSA storage nodes, update the `OVERCLOUD_VSA_STORAGESCALE` value to the appropriale scale number.

		export OVERCLOUD_VSA_STORAGESCALE=<number_of_nodes>

	- To scale out the VSA AO storage nodes, update the OVERCLOUD_VSA_AO_STORAGESCALE to appropriate scale number.

		export OVERCLOUD_VSA_AO_STORAGESCALE=<number_of_nodes>

	To scale out the Compute nodes, update the `OVERCLOUD_COMPUTESCALE` value to appropriale scale number. 

		export OVERCLOUD_COMPUTESCALE=2

6. Apply the configuration. Source the environment variables file that  you updated:  

		source /root/env_vars

7. Run the installer script

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log

	If because of some reason, the above command fails, try the alternative approach

		export OVERCLOUD_SCALE_NODES=1
		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log

## Remove nodes {#pre}

To remove a node:

1. SSH to Undercloud VM

2. Obtain the ID of the node you want to delete using the following command:

		nova list

3. Obtain the Ironic Node UUID using the following command: 

		ironic node-list | grep <node ID in last step>

4. Obtain the MAC Address 

		ironic node-port-list <Ironic Node UUID>

5. Obtain the heat stack to be deleted for the particular node using the following command:
 
		heat stack-list

6. Delete the particular stack using the following command:

		heat stack-delete <Stack to be Deleted>

7. If the deleted node has gone bad and needs to be removed from ironic, use the following command with the UUID from the previous step:

		ironic node-delete <UUID>

8. If you are removing a Compute node 

	a. SSH to Controller0. 

	b. Disable the particular Compute node using the following command:

		nova-manage service disable --service=nova-compute --host=<hostName of Compute Node>

	c. Remove the entry that has the MAC Address retrieved in the previous step from from the `/root/baremetal.csv` file on the seed VM.

    d. Reduce the `OVERCLOUD_VSA_STORAGESCALE`, `OVERCLOUD_VSA_AO_STORAGESCALE`, and `OVERCLOUD_COMPUTESCALE` values in the `/root/env_vars` file on the seed VM. 

## Troubleshooting ## {#trouble}

While adding VSA and compute nodes, sometimes the stack `ovecloud_ce_controller` is in `UPDATE_IN_PROGRESS` for an extended time. 

To troubleshoot, perform the following steps

1. SSH to all 3 controllers

2. Check the mysql service. If it is stopped, restart the controller using the following command: 

		service mysql restart

4. Look in the `/var/log/upstart/os-collect-config.log`. If it is hung at the restarting rabbitmq phase, kill all the rabbitmq instances using the following commands:

		ps -ef | grep rabbitmq
		pkill -u rabbitmq

		Remove 
		rm -rf /mnt/state/var/lib/rabbitmq
		os-refresh-config

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

     
