---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Deploying the Cloud"
permalink: /helion/openstack/carrier/install/bm/hlm-cloud/
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

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/bm/environment/">&#9664; Configuring the installation environment</a> | <a href="/helion/openstack/carrier/install/bm/overview/">&#9650; Installation Overview</a>  </p> 

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Deploying the Cloud 

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

## Configure the HLM cloud

Once all of the baremetal systems are configured and running, you can install the HLM cloud.

To configure the HLM cloud:

1. On the KVM host, change to the following directory:

		cd /cg-hlm/hlm-build

2. Run the following command to import code from the installation files and copy the code to `/opt/share/hlm` on the HLM node:

		./hlm_prepare-env.sh

3. Use the following commands to create new cloud template. This command will create a directory <cloudname> in root folder)

		cd ~
		hnewcloud <cloudname> demo

	This command creates a new cloud called <cloudname> from the *demo* sample.

	For example, the following command creates ~/HLMcloud cloud config files from the demo sample: 

		hnewcloud HLMcloud demo

4. Change to the new cloud directory:

	cd ~/<cloudname>

5. Update cloud template json files:

	a. Modify the `nodes.json` file to configure the IP address of the PXE eth1 interface of the cloud nodes

	b. Modify the `environment.json` file to configure the VLANs and network addresses that need to be configured for respective cloud nodes. 

	* The three controller nodes should have CLM, CAN, EXT, BLS on eth0 and TUL on eth1. 
	
	* The two compute nodes should have CLM, EXT, BLS on eth0 and TUL on eth1.  

	c. Modify `lnet-control-data.json` to configure the details of desired logical networks that have mapping to `environmentConfig.json` file.

	d. Modify the `ccp-1x3-as.json` file to set the number of controllers on the plane to 3.

		"member-count": 3, //number of controllers on the plane

	e. Modify the `definition.json` file to set the number of computes in the resource pool to 2.

		"count": 2, //number of computes in the resource pool. 

6. Run the Helion Configuration Processor on the configuration files you have modified:

		cd <cloudname> 
		hcfgproc -d definition.json

	The `hcfgproc script` is installed in `/usr/local/bin` by the `prepare-env` script and generates a `clouds/` directory in the <cloudname> dir.

8. In this generated cloud, review the CloudDiagram, `hosts.hf`, and `net/interfaces.d/eth.cfg` files to make sure the network settings are correct.

9. Initialize network interfaces on all the cloud nodes using the following command:

		hnetinit <cloudname> 

	You can run this command from any directory. 

	After this command completes, all cloud nodes and CLM network interfaces should be set correctly. 

10. Deploy and configure the cloud services using the following command:

		hdeploy <cloudname> 

	You can run this command from anywhere.


When this command completes, the HP Helion OpenStack Carrier Grade (Alpha) installation is complete.

Basic cloud operations can be performed by logging into the Horizon interface using `CAN` IP address specified in `/etc/hosts` file on any cloud node.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
