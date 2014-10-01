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

# HP Helion OpenStack&reg;: Add(Scale-Out) and Remove(Scale-In) Nodes

<!---This document describes the steps to add and remove nodes (scale in or scale out the VSA and Compute nodes) on an already installed overcloud-->
This document describes the steps to add (Scale Out) or remove (Scale In) nodes  (KVM Compute Nodes) on an already installed Overcloud. 

- [Prerequisites](#pre)
- [Add nodes](#add)
- [Remove nodes](#remove)

## Prerequisites ## {#pre}

Before you begin, ensure the following:

- The Seed VM, Undercloud and Overcloud are installed using the HP Helion OpenStack&#174; Installer with USE_TRICKLE=1, which is the default installation.

## Add Nodes ## {#add}

New nodes can be added to an already installed Overcloud.You can add nodes in any of the following scenarios:

- [Add nodes to pre-allocated empty Baremetal nodes](#pre-allocated)
- [Enroll a new Baremetal and then add nodes](#non-allocated)

### Add nodes to pre-allocated empty Baremetal nodes ### {#pre-allocated}

You can add nodes to empty Baremetal nodes which have been already enrolled during the initial installation process. Perform the following steps:


1. SSH to Seed as root

 		# ssh <IP Address>

2. To scale out compute nodes, edit the Scale Counts in environment variables file (env_vars) which is used during the initial installation. Edit the `env_vars` file as follows to define the appropriate scale number:

		# export OVERCLOUD_COMPUTESCALE=<number of compute nodes>

3. Source the environment variables file that  you updated  

		# source /root/env_vars

4. Run the installer script

		# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log

	<!---If because of some reason, the above command fails, try the alternative approach

		export OVERCLOUD_SCALE_NODES=1
		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log-->

### Enroll a new Baremetal node and then add nodes ### {#non-allocated}

To add new compute nodes to a non allocated Baremetal node, first enroll the Baremetal node and then add new nodes.

1. SSH to Undercloud VM as heat-admin from Seed VM

	    # ssh heat-admin@<IP Address>
		# sudo -i
		# source stackrc

2. Register the new Baremetal server in the ironic database. Replace the cpus, memory&#095;mb,local&#095;gb,ipmi&#095;address, ipmi&#095;password variable values with your Baremetal settings. 

		# ironic node-create -d pxe_ipmitool -p cpus=<value> -p memory_mb=<value> -p local_gb=<value> -p cpu_arch=<value> -i ipmi_address=<IP Address> -i ipmi_username=<username> -i ipmi_password=<password>

	Following is the example for reference:

		# ironic node-create -d pxe_ipmitool -p cpus=12 -p memory_mb=98304 -p local_gb=1800 -p cpu_arch=amd64 -i ipmi_address=10.12.22.70 -i ipmi_username=admin -i ipmi_password=password

	
3. Create the ironic port for the ironic node created in previous step

	 `ironic port-create --address $MAC_ADDR --node_uuid $NODE_UUID`. 

4. List the Baremetal nodes. This command also lists the newly added nodes

		# ironic node-list

5. Log out from Undercloud to go back to Seed

       
6. If `/root/overcloud-config.json` is not present, copy Overcloud template config file to `/root/overcloud-config.json`
 
		# cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json


7. Edit the `env_vars` file as follows to define the appropriate scale number:

	
		# export OVERCLOUD_COMPUTESCALE=<number of compute nodes>

4. Source the environment variables file that  you updated:  

		# source /root/env_vars

4. Run the installer script

		# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log


## Remove nodes {#remove}

To remove a node:

1. SSH to Undercloud VM

		# ssh root@<IP Address>

2. Verify the ID of the node you want to delete

		# nova list

3. Obtain the Ironic Node UUID 

		# ironic node-list | grep <node ID from the previous step>

4. Obtain the MAC Address 

		# ironic node-port-list <Ironic Node UUID>

5. Obtain the heat stack to be deleted for the particular node 
 
		# heat stack-list

6. Delete the particular stack 
		
		# heat stack-delete <Stack to be Deleted>

7. If the deleted node is in a bad state and needs to be removed from ironic, use the following command with the UUID from the previous step

		# ironic node-delete <UUID>

8. 	SSH to Controller0 and disable the compute node

		# nova-manage service disable --service=nova-compute --host=<hostName of Compute Node>

9. SSH to Seed VM

		# ssh <IP Addresss>

10. Remove the entry with the MAC Address that you retrieved in step 4 from from the `/root/baremetal.csv` file

10. Reduce OVERCLOUD_COMPUTESCALE in /root/env_vars(environment variables file) on the Seed VM, so that next time a node is added, the installer does not try to add the deleted node. 

		 # export OVERCLOUD_COMPUTESCALE=<number>

11. Source the environment variables file that  you updated:  

		# source /root/env_vars

12. Run the installer script

		# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

     
