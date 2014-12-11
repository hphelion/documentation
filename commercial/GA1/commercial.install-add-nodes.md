---
layout: default
title: "HP Helion OpenStack: Add and Remove Nodes"
permalink: /helion/openstack/install/add/nodes/
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

1. SSH to undercloud VM as the heat-admin user from the seed VM:

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

		ironic node-list

6. Log out from undercloud to go back to the seed VM:

		ssh root@<IP Address>

7. Make the respective Baremetal entry in `/root/baremetal.csv`.   
	<!---If the `/root/overcloud-config.json` is not present, copy the overcloud template config file to `/root/overcloud-config.json`: 
		cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json-->

8. Edit the `kvm-custom-ips.json` file as follows to define the appropriate scale number:

		"compute_scale":<number of compute nodes>,

9. Source the environment variables file that  you updated:  

		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/kvm-custom-ips.json 

10. Run the installer script:

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log


## Remove nodes {#remove}

To remove a node:

1. SSH to the undercloud VM:

		ssh root@<IP Address>

2. Verify the ID of the node you want to delete:

		nova list

3. Obtain the Ironic node UUID:

		ironic node-list | grep <node ID from the previous step>

4. Obtain the MAC address:

		ironic node-port-list <Ironic Node UUID>

5. Obtain the heat stack to be deleted for the particular node:
 
		heat stack-list

6. Delete the particular stack:

		heat stack-delete <Stack to be Deleted>

7. If the deleted node is in a failed state and needs to be removed from Ironic, use the following command with the UUID from the previous step:

		ironic node-delete <UUID>

8. 	SSH to `Controller0` and disable the compute node:

		nova-manage service disable --service=nova-compute --host=<hostName of Compute Node>

9. SSH to seed VM:

		ssh <IP Addresss>

10. Remove the entry with the MAC Address that you retrieved in step 4 from from the `/root/baremetal.csv` file:

<!---11. Reduce the `OVERCLOUD_COMPUTESCALE` in `/root/kvm-custom-ips.json` (environment variables file) on the seed VM, so that next time a node is added, the installer does not try to add the deleted node:

		export OVERCLOUD_COMPUTESCALE=<number>

12. Source the environment variables file that  you updated:  

		source /root/kvm-custom-ips.json

13. Run the installer script:

		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log-->


----

     
