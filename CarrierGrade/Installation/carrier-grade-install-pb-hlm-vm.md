---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Create the HLM Virtual Machine"
permalink: /helion/openstack/carrier/install/pb/hlm-vm/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/network/prepare/">&#9664; Preparing the Network for Installation</a> | <a href="/helion/openstack/carrier/install/pb/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/install/pb/hlm-vm/"> Create the HLM Virtual Machine &#9654;</a> </p> 



# HP Helion OpenStack&#174; Carrier Grade (Beta):  Create the HLM Virtual Machine

Helion Lifecycle Management (HLM) consists of the ongoing operations/maintenance as well as the initial deployment of the HP Helion OpenStack Carrier Grade system.

1. On the KVM host, change to the home directory.

		cd ~

2. Provision and configure your HLM VM.

		hnewcloud  <cloudname> <cloud_template>

	Where:
	* cloudname is the name of the cloud to create
	* cloud_template is the name of the template to use.

	The command creates the <cloudname> directory, which will contain a JSON template file `node-provision.json`. THis template supplies input values to the `hprovision` script, later in the installation. 

3. Edit `node-provision.json` file based on following guidelines:

	<table>
	<tr><th>Field</th><th>Baremetal</th></tr>
	<tr><td>name</td><td>Name of the system you want to add in cobbler</td></tr>
	<tr><td>Pxe-mac-address</td><td>MAC address of the interface you want to pxe boot onto. This is not same as iLO MAC address,</td></tr>
	<tr><td>Pxe-interface</td><td>nterface name on which pxe boot should occur. For example: `eth0`</td></tr>
	<tr><td>pm_type</td><td>ipmilan
	<tr><td>pm_ip</td><td>Power management IP:ilo ip</td></tr>
	<tr><td>pm_user</td><td>Power management user: ilo username</td></tr>
	<tr><td>pm_pass</td><td>Power management password: ilo password</td></tr>
	<tr><td>node_group</td><td>For now, this should have the same value as `node-type` in the `nodes.json` file. For example: `CCN-001-001`.</td></tr>
	<tr><td>failure_zone, vendor, model, os_partition_size, data_partition_size</td><td>These fields have same significance as they have in the `nodes.json` used during cloud deployment</td></tr>
	</table>

4. Use the following script to start the provisioning of the HLM VM:

	hprovision <cloudname>

	Where:
	* cloudname is the name of the cloud to create

	This script will PXE boot the nodes specified in `node-provision.json` file. The script alsos track the PXE boot completion process and will create the `nodes.json` file in the <cloudname> directory. 

	The `nodes.json` file will contain all the required information for the cloud deployment, including the PXE IP addresses and MAC addresses of the nodes to be used. You use this file for cloud deployment.

5. Update the cloud template JSON files used in the previous step.

	a. Change to the <cloudname> directory:

		cd ~/<cloudname>

	b. Verify that the each PXE-booted nodes has an IP address that matches the IP address specified in the `nodes.json` file.

	c. Modify the `environment.json` file to add the details of CLM network. 

		"cidr": 
		"start-address": 

	**Example:**

		"cidr": "192.168.101.0/24",
		"start-address": "192.168.101.100"

	**NOTE:** The Helion Configuration Processor assigns the first address of the CLM address range to itself for serving python and debian repositories. Make sure that you set the first IP address of the CLM range for the eth2 (CLM) address of the HLM node.

	d. Modify the `ccp-3-1-1-dcn-as.json` file to set the number of overcloud controllers to 2:

		"member-count": 2, //number of controllers on the plane

	e. Modify the `definition.json` file to set the number of compute systems to 1.

		"count": 1, //number of computes in the resource pool.


6. For bare metal environment or virtual env with fancy networking - you will have to edit the logical network and environment config json files to represent your desired configuration.

7. Modify the `environment.json` file to configure the VLANs and network addresses that need to be configured for respective cloud nodes. 

	* The three controller nodes should have CLM, CAN, EXT, BLS on eth0 and TUL on eth1. 
	
	* The two compute nodes should have CLM, EXT, BLS on eth0 and TUL on eth1.  

8. Once you have correctly edited all the json "Cloud Model" files, run the Helion Configuration Processor on these

		cd <cloudname> 

		hcfgproc -d definition.json

	The `hcfgproc` script gets installed in `/usr/local/bin` by the `prepare-env` script. The script generates a `clouds/` directory within the <cloudname> directory.

9. Review the CloudDiagram, `hosts.hf`, and `net/interfaces.d/eth.cfg` files to make sure the network settings are correct.

10. Initialize network interfaces on all the cloud nodes using the following command:

		hnetinit <cloudname> 

	You can run this command from any directory. 

	After this command completes, all cloud nodes and CLM network interfaces should be set correctly. 



## Next Step

[Create the HLM Virtual Machine](/helion/openstack/carrier/install/pb/hlm-vm/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


