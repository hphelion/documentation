---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Deploying the Cloud"
permalink: /helion/openstack/carrier/install/pm/hlm-cloud/
product: carrier-grade
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();	

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/hlm-vm/">&#9664; Configuring the installation environment</a> | <a href="/helion/openstack/carrier/install/bm/overview/">&#9650; Installation Overview</a>  </p> 

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Deploying the HLM and DCN Clouds 

At this point, the networking settings and PXE clients are up and running. 

The network configuration appears similar to the following image:

<img src="media/CGH-Install-3Node-Network.png" />

You will now configure the HLM cloud on those three nodes using CLM network. 

## Boot the baremetal nodes

Before starting the HLM cloud installation, boot PXE-boot the [required number of baremetal servers](/helion/openstack/carrier/support-matrix/helion/#baremetal) for cloud deployment using DHCP and the Cobbler service running on HLM VM.

For each baremetal system:

1. In iLO, set the boot order to `hard-disk` and set the one time option to `network` and click **Reset**. 

	The system should boot up with an hlinux image and IP address provided by DHCP Cobbler running in HLM VM.

2. Log in to each system when the start-up process is completed using the following default credentials:

		Username:root
		Password: iforgot

3. Make sure you can access each baremetal system from the KVM host using password-less SSH.

		ssh <IP_Address>

## Deploy the HLM and Helion clouds

Once all of the baremetal systems are configured and running, you can install the HLM cloud.

To configure the HLM cloud:

1. On the KVM host, change to the following directory:

		cd /cg-hlm/hlm-build

2. Run the following command to import code from the installation files and copy the code to `/opt/share/hlm` on the HLM node:

		./hlm_prepare-env.sh

3. Use the following commands to create new cloud template. This command will create a directory <cloudname> in root folder)

		cd ~
		hnewcloud <cloudname> <template_name>

	**Example**

		hnewcloud DemoCloud demo

	This command creates a new cloud called DemoCloud from the *demo* template.

4. Change to the new cloud directory:

	cd ~/<cloudname>

5. Modify the `node-provision.json` file to configure the IP address of the PXE eth1 interface of the cloud nodes:

	* name - An identifying name for the system you want to add in cobbler; such as `ccn1` or `ccn2`.
	* Pxe-mac-address - The MAC address of the interface you want to pxe boot onto (not the ILO MAC address).
	* Pxe-interface - The interface name for the PXE boot (for example: eth0).
	* pm_type - The power management type; use `ipmilan` for baremetal installations.
	* pm_ip - The power management IP; use iLO IP address for baremetal installations.
	* pm_user - The power management user name; use the iLO username.
	* pm_pass - The power management password; use the iLO password.
	* node_group - Set to the same value as 'node-type' in the `nodes.json` file.
	* failure_zone - Set to the same value as set in the `nodes.json` file.
	* vendor - Set to the same value as set in the `nodes.json` file.
	* model - Set to the same value as set in the `nodes.json` file.
	* os_partition_size - Set to the same value as set in the `nodes.json` file.
	* data_partition_size - Set to the same value as set in the `nodes.json` file.

6. Run the following command:

		hprovision <cloudname>

	This script PXE boots the nodes specified in the `node-provision.json` file. 

	The script also creates the `nodes.json` file in the <cloudname> directory, with the information required to deploy the HP Helion OpenStack cloud, including the PXE IP addresses and MAC addresses of the nodes to be used in cloud deployment. 

7. Verify that `nodes.json` file has the correct IP addresses.

		cat <cloudname>

8. Modify the `environment.json` file to configure the VLANs and network addresses that need to be configured for respective cloud nodes. 

	* The three controller nodes should have CLM, CAN, EXT, BLS on eth0 and TUL on eth1. 
	
	* The two compute nodes should have CLM, EXT, BLS on eth0 and TUL on eth1.  

9. Modify the `ccp-3-1-1-dcn-as.json` file to set the number of controllers on the plane to 3.

		"member-count": 3, //number of controllers on the plane

10. Modify the `definition.json` file to set the number of computes in the resource pool to 2.

		"count": 2, //number of computes in the resource pool. 

11. Run the Helion Configuration Processor on the configuration files you have modified:

		hcfgproc -d definition.json

	The `hcfgproc script` is installed in `/usr/local/bin` by the `prepare-env` script and generates a `clouds/` directory in the <cloudname> dir.

12. In this generated cloud, review the CloudDiagram, `hosts.hf`, and `net/interfaces.d/eth.cfg` files to make sure the network settings are correct.

13. Initialize network interfaces on all the cloud nodes using the following command:

		hnetinit <cloudname> 

	You can run this command from any directory. 

	After this command completes, all cloud nodes and CLM network interfaces should be set correctly. 

14. Deploy and configure the cloud services using the following command:

		hdeploy <cloudname> 

	You can run this command from anywhere.


When this command completes, the HP DCN installation is complete.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
