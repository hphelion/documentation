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

1. On the KVM host, change to the `/root/infra-ansible-playbooks/roles/HLM-CFG/` directory.

		cd /root/infra-ansible-playbooks/roles/HLM-CFG/

2. Execute the `setup_hlm_onBM.yml` file.

		ansible-playbook -i hosts setup_hlm_onBM.yml

3. Use the following command to verify that the HLM VM has been created:

		virsh list

	The output should appear similar to the following image:

	<img src="/media/CGH-install-pb-hlm-node.png" />

4. Use the following command to launch a console session to the HLM VM: 

	virsh console hlm 

	Use the following credentials:

	* Username: `root`
	* Password: `cghelion`

	If the console does not launch, wait for a few minutes to allow the VM to fully boot up.

5. Use the console to obtain the IP address for the eth0 interface: 

		ifconfig eth0

7. Use the following command to exit the console:

		ctrl ]

8. Edit `/root/infra-ansible-playbooks/hosts` file and replace the IP in the `[hlm]` section with eth0 IP address, similar to the following:

		[hlm]
		192.168.122.100 ansible_ssh_user=root ansible_ssh_pass=cghelion

9. Verify that you can connect to eth0 using a tool such as SSH.

		ssh root@<IP_address>

10. Edit the `infra-ansible-playbooks\roles\HLM-CFG\defaults\main.yml` file to specify the IP address for the CLM and PXE networks. 

	<a href="javascript:window.open('/content/documentation/media/CGH-architecture-alpha-2.png','_self','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><img src="media/CGH-install-hlm-network" width="750" /></a>
	Click to view larger image; click **Back** to return.

	The PXE network uses the `eth1` interface and CLM uses `eth2`. 

		pxestartip: 192.168.100.100
		pxeendip: 192.168.100.200
		pxestaticip: 192.168.100.2
		pxenetmask: 255.255.255.0
		pxegateway: 192.168.100.1

		clmstaticip: 10.20.20.100
		clmnetmask: 255.255.255.0
		clmgateway: 10.20.20.1

	Where:
	* pxestartip is the start of the DHCP IP range
	* pxeendip is the end of the DHCP IP range
	* pxestaticip is a static IP address for the boot server virtual machine
	* pxenetmask is the netmask for this boot server virtual machine
	* pxegateway is the default gateway for the PXE network
	* clmstaticip is the static IP address for the CLM network 
	* clmnetmask is the netmask for the CLM network
	* clmgateway is the default gateway for the CLM network

11. Use the following command to configure HLM VM:

		ansible-playbook -i hosts configure_hlm.yml

	This command does following:

	* Copy both installation TAR files to the HLM VM 
	* Decrypt and extract the TAR files
	* Populate HLM node with required contents
	* Prompt for the PXE network details
	* Import the hlinux distribution into Cobbler
	* Import code from the installation files and copy the code

	This process restarts networking. If you SSH session gets disconnected, you will need to restart the session to the HLM console.

When these processes are complete, you can build out the HP Helion OpenStack cloud.

## Next Step

[Create the HLM Virtual Machine](/helion/openstack/carrier/install/pb/hlm-vm/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


