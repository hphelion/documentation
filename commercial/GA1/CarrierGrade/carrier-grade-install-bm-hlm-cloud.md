---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Deploying the HLM Cloud"
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

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/bm/environment/">&#9664; Configuring the installation environment</a> | <a href="/helion/openstack/carrier/install/overview/">&#9650; Installation Overview</a>  </p> 

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Deploying the HLM Cloud 

At this point, the networking settings and PXE clients are up and running. 

The network configuration appears similar to the following image:

<img src="media/CGH-Install-3Node-Network.png" />

You will now configure the HLM cloud on those three nodes using CLM network. 

To configure the HLM cloud:

1. Change to the following directory:

		cd ~/cg-hlm/hlm-build

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

	a. Modify the `serverConfig.json` with the IP address of the PXE eth1 interface of the cloud nodes

	b. Modify the `environmentConfig.json` file to add details of CLM network: 

		Example:

		"cidr": "192.168.101.0/24",
		"start-address": "192.168.101.100"

	**IMPORTANT**: The Helion Configuration Processor assigns the first address of the CLM address range to itself for serving python and debian repositories. Make sure that you set the first IP address of the CLM range for the `eth2` (CLM) address of the HLM node.

	c. Modify the `ccp-1x3-as.json` file to set the number of controllers on the plane to 2.

		"member-count": 2, //number of controllers on the plane

	d. Modify the `definition.json` file to set the number of computes in the resource pool to 1.

		"count": 1, //number of computes in the resource pool. 

6. Edit the logical network and environment configuration JSON files to represent the network configuration.

7. Run the Helion Configuration Processor on the configuration files you have modified:

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

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
