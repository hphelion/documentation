---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Install HP Helion OpenStack"
permalink: /helion/openstack/carrier/install/vsc-node/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Install Helion OpenStack

To install of HP Helion OpenStack: 

## Create blank VMs for the installation

1. Use a tool such as KVM virt-manager to create three blank VMs (no operating system) on the KVM host, called `ccn1`, `ccn2`, and `cpn1` using the xml files [ccn1.xml, ccn2.xml, ccn3.xml

2. Create three blank VM image files and resize them  using the following commands:

		touch /var/lib/libvirt/images/ccn1.img
		touch /var/lib/libvirt/images/ccn2.img
		touch /var/lib/libvirt/images/cpn1.img

		qemu-img resize /var/lib/libvirt/images/ccn1.img +20G
		qemu-img resize /var/lib/libvirt/images/ccn2.img +20G
		qemu-img resize /var/lib/libvirt/images/cpn1.img +20G

3. Verify the size of the blank images using the following command: 

		ls -ltr /var/lib/libvirt/images/

4. Provision the virtual machines using the following commands:

		virsh define ccn1.xml
		virsh autostart ccn1
		virsh start ccn1

		virsh define ccn2.xml
		virsh autostart ccn2
		virsh start ccn2

		virsh define ccn3.xml
		virsh autostart ccn3
		virsh start ccn3


## Configuring the installation environment

The process for deploying HP Helion OpenStack includes populating HLM node with required files, enabling Cobbler for PXE booting.

[Cobbler](http://www.cobblerd.org/) is a Linux installation server.

To configure the installation environment:

1. Copy the `cg-hos.tar.gz.gpg` file and HLM node image file (`cg-hlm.qcow2`) to the /root directory on the KVM host.

2. Decrypt and extract the file using the following command: 

		gpg -d cg-hos.tar.gz.gpg | tar -xzvf -
		(password to decrypt: cghelion)

	This will extract following folders:

	* packages (includes all debs + pips)
	* hlm-files (includes hlinux distro to be pxe booted)
	* kenobi-configuration-processor (includes Kenobi source code)
	* kenobi-node-configuration (includes Kenobi source code)
	* cg-hlm (includes source code to populate environment on HLM and deploy cloud)

3. Populate HLM node with required contents using the following command:

		./hlm_updatepackages.sh

	This command syncs the debian and pip files in the `packages` directory onto static repo on HLM node.

3. Run the following command to configure Cobbler:

		./hlm_configurecobbler.sh <eth1 pxe ip of HLM node> <netmask> <gateway> <dhcp start address> <dhcp end address>

	**Example:** 

		./hlm_configurecobbler.sh 192.168.122.203 255.255.255.0 192.168.122.1 192.68.122.100 192.168.122.200

	You will be prompted with following questions:

	*What is the IP address for this boot server virtual machine?* This is the IP address of the eth1 PXE interface of the HLM node 

		Example: 192.168.122.203

	*What is the netmask for this boot server virtual machine?*

		Example: 255.255.255.0

	*What is the IP address of the default gateway for network?*

		Example: 192.168.122.1

	*What is the starting IP address for your dhcp range?*

		Example: 192.168.122.100

	*What is the ending IP address for your dhcp range?*

		Example: 192.168.122.200

	This command restarts networking. If you SSH session gets disconnected, you will need to restart the session to the HLM console.

4. Use the following command to import the hlinux distribution into Cobbler.

		 /hlm_importiso.sh:

	At this point Cobbler is up and running.


5. Use KVM virt-manager to restart the VMs you created previously: `ccn1`, `ccn2` and `cpn1`. Make sure you select `network pxe boot` before restarting. 

	Once the nodes start PXE booting, set the boot order back to hard disk to avoid repeated cycles of pxe boot.

If you want to login onto any of the client VMs, use credentials `root/iforgot`


## Deploy the HLM VM

At this point, the networking settings and PXE clients are ready to proceed deploy the HLM VM on those 3 nodes using CLM network. 


1. Change to the HLM node:

		cd ~/cg-hlm/hlm-build

2. Prepare environment for the installation

	This command brings new code from kenobi source folders and will install the code into `/opt/share/hlm` on HLM node.

		./hlm_prepare-env.sh


3. Create new cloud template:

	This command creates a directory <cloudname> in root folder.

		cd ~
		hnewcloud <cloudname> demo

	Example: `hnewcloud hlmcloud demo` will create ~/juno cloud config files from the demo sample.

4. Update cloud template JSON files:

	a. Change to the new cloud directory you created

	cd ~/<cloudname>

	b. Modify the `serverConfig.json` with the IP address of the PXE eth1 interface of the cloud nodes.

	c. Modify environmentConfig.json -

Add details of CLM network here, 

Example:

"cidr": "192.168.101.0/24",

"start-address": "192.168.101.100"

IMPORTANT NOTE: Helion Configuration Processor will assign the first address of the CLM address range to itself for serving python and deb repositories - so you need to ensure that you set the first IP address of the CLM range for the eth2 (CLM) address of the HLM node.

iv) Modify ccp-1x3-as.json

a) "member-count": 2, //number of controllers on the plane

v) Modify definition.json

"count": 1, //number of computes in the resource pool. Since we try with one compute node it is shown as 1.

6) For bare metal environment or virtual env with fancy networking - you will have to edit the logical network and environment config json files to represent your desired configuration.

7) Once you have correctly edited all the json "Cloud Model" files, you are ready to run Helion Configuration Processor on these

cd <cloudname> (e.g. cd padawan)

hcfgproc -d definition.json

    hcfgproc script gets installed in /usr/local/bin by the prepare-env script and will generate a clouds/ directory within the <cloudname> dir.

8) In this generated cloud, eyeball the CloudDiagram, hosts.hf, and net/interfaces.d/eth?.cfg files to ensure the network settings meet your expectations.

9) Now you are ready to initialize network interfaces on all the cloud nodes - do this using

hnetinit <cloudname> (e.g. "hnetinit padawan" - you can run this command from anywhere - it will look for <cloudname> under ~ directory and run ansible from it to initialize network interfaces for that cloud.

10) After hnetinit, all your cloud nodes CLM network interfaces should be set correctly. Now you are ready to deploy and configure the cloud services - do this using

hdeploy <cloudname> (e.g. "hdeploy padawan" - you can run this command from anywhere - it will look for <cloudname> under ~ directory and run ansible from it to install and configure all the cloud services.

11) Currently it is showing some errors but the entire script runs end to end. Your mileage may vary.

12) May the force be with you!



## Next Step

[Create the HLM Node](/helion/openstack/carrier/install/hlm-node/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


