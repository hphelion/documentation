---
layout: default
title: "HP Helion OpenStack: Add and Remove Nodes"
permalink: /helion/openstack/install/add/nodes/
product: commercial.ga
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Binamra S, 

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&reg;: Add (Scale-Out) and Remove (Scale-In) Nodes on KVM Hypervisors

<!---This document describes the steps to add and remove nodes (scale in or scale out the VSA and Compute nodes) on an already installed overcloud-->
By default, HP Helion Openstack cloud deploys a two node (termed as start-up swift nodes) Swift cluster as part of its deployment.

This document describes the steps to add (Scale Out) or remove (Scale In) nodes (KVM Compute Nodes) to an already-installed overcloud on a KVM hypervisor. 

- [Prerequisites](#pre)
- [Add compute nodes](#add)
- [Remove nodes](#remove)

## Prerequisites ## {#pre}

Before you begin, ensure the following:

- The seed VM, undercloud and overcloud are installed using the HP Helion OpenStack installer.

## Add compute nodes ## {#add}

New compute nodes can be added to an already-installed overcloud. You can add nodes in any of the following scenarios:

- [Configure compute nodes to pre-allocated empty baremetal nodes](#pre-allocated)
- [Enroll a new baremetal and then add nodes](#non-allocated)

### Configure compute nodes to pre-allocated empty baremetal nodes ### {#pre-allocated}

You can enroll (add) nodes that that are present in baremetal.csv but have not been used, perform the following steps:


1. SSH to the seed VM as `root`:

 		ssh <IP Address>

2. Edit the scale counts in JSON environment variables file (`kvm-custom-ips.json`) that was used during the initial installation to define the appropriate scale number:

		"compute_scale":<number of compute nodes>,

3. Source the environment variables file that you updated:  

		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/kvm-custom-ips.json

4. Run the installer script:

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log


### Enroll a new baremetal node and then configure compute nodes ### {#non-allocated}

To add new compute nodes that were not present during the initial installation process, first enroll the baremetal node and then configure the new node.

<!--1. SSH to undercloud VM as the heat-admin user from the seed VM:

		ssh heat-admin@<IP Address>
		sudo -i

2. Source the `stackrc` configuration file created during the installation process:

		source stackrc

3. Register the new baremetal server in the Ironic database. Replace the CPU, memory, local disk size, IPMI address, and IPMI password values with your baremetal settings: 

		ironic node-create -d pxe_ipmitool -p cpus=<value> -p memory_mb=<value> -p local_gb=<value> -p cpu_arch=<value> -i ipmi_address=<IP Address> -i ipmi_username=<username> -i ipmi_password=<password>

	The following example for reference:

		ironic node-create -d pxe_ipmitool -p cpus=12 -p memory_mb=98304 -p local_gb=1800 -p cpu_arch=amd64 -i ipmi_address=10.12.22.70 -i ipmi_username=admin -i ipmi_password=password

4. Create the Ironic port for the Ironic node created in the previous step:

		ironic port-create --address $MAC_ADDR --node_uuid $NODE_UUID

5. List the baremetal nodes. This command also lists the newly added nodes:

		ironic node-list -->

6. Log in to the seed VM:

		ssh root@<IP Address>

7. Make the respective Baremetal entry in `/root/baremetal.csv`.   
	<!---If the `/root/overcloud-config.json` is not present, copy the overcloud template config file to `/root/overcloud-config.json`: 
		cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json-->
Add the node to baremetal.csv at the end.
    The full syntax is documented above. Make sure it is at the end of the file as it is a new node.
2.  Set all enviromental variables you would have set for the initial install.
3.  If you are explicitly specifying OVERCLOUD_COMPUTESCALE then increase it by one, otherwise the new value will be computed. Then run 
5.  
		hp_ced_installer --update-overcloud

    	$ bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud

    This will register a new ironic node and create a new nova instance (and a new heat stack if using trickle.


<!--8. Edit the `kvm-custom-ips.json` file as follows to define the appropriate scale number:

		"compute_scale":<number of compute nodes>,

9. Source the environment variables file that  you updated:  

		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/kvm-custom-ips.json 

10. Run the installer script:

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log-->


## Remove nodes {#remove}

To remove a node:

1. SSH to the undercloud VM:

		ssh root@<IP Address>

2. If using trickle (default):
   Identify the MAC address of the node to be deleted

		

3. identify the ironic 'Node UUID'

		ironic port-list --detail

4. identify the nova instance 'Instance UUID' associated with the ironic Node UUID and, from that, identify the heat stack associated with the nova instance


		ironic node-list

5. the instance name will be something like:

		overcloud-ce-novacompute0-NovaCompute0-aztnviyoamsc
   so the stack name will be:

		overcloud-ce-novacompute0

- Run

		heat stack-list

6. Wait for stack to be deleted

- Delete node

		ironic node-delete <ironic_nodeid>

8. 	Mark the node as 'deleted' in baremetal.csv
9. 	Change the 'role' from 'OvercloudCompute' to 'OvercloudCompute:deleted'.
    For example:

		78:e7:d1:22:52:9e,administrator,password,192.168.11.7,12,32768,2048,OvercloudCompute,IPMI

    becomes:

		78:e7:d1:22:52:9e,administrator,password,192.168.11.7,12,32768,2048,OvercloudCompute:deleted,IPMI
Note: Do NOT delete the line
When hp_ced_installer --update-overcloud is run again, the node will be skipped in all operations.



		


----

     
