---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Deploying the Cloud"
permalink: /helion/openstack/carrier/install/bm/dcn-cloud/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Deploying the DCN Cloud 

After the [HLM and Helion clouds are installed and running](/helion/openstack/carrier/install/bm/hlm-cloud/), you can install the HP Distributed Cloud Networking (DCN).

The DCN install uses the same scripts and JSON files to create a DCN cloud.  

The DCN install requires two systems (nodes): one for the HP Virtualized Services Controller (VSC) and the HP Virtualized Services Directory (VSD) and one for the HP Virtual Routing and Switching Gateway (VRS-G)

## Deploy the DCN cloud

To deploy the DCN cloud:

1. Use the following commands to create new cloud template. This command will create a directory <cloudname> in root folder)

		cd ~
		hnewcloud <cloudname> <template_name>

	**Example**

		hnewcloud DemoCloud demo

	This command creates a new cloud called DemoCloud from the *demo* template.

2. Change to the new cloud directory:

	cd ~/<cloudname>

5. Update cloud template json files:

	a. Modify the `nodes.json` file to configure the IP address of the PXE eth1 interface of the cloud nodes

	b. Modify the `environment.json` file to configure the VLANs and network addresses that need to be configured for the cloud nodes. 

	* The VSD/VSC node should have CLM, PXE, DCM on eth0 and TUL on eth1. 
	* * The VRS-G node should have CLM, PXE, EXT on eth0 and TUL on eth1. 
	
	c. Modify `lnet-control-data.json` to configure the details of desired logical networks that have mapping to `environmentConfig.json` file.

	d. Modify the `ccp-3-1-1-1-dcn.json` file to set the number of controllers on the plane to 2.

		"member-count": 2, //number of controllers on the plane

6. Run the Helion Configuration Processor on the configuration files you have modified:

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
