---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Provisioning the Network"
permalink: /helion/openstack/carrier/install/bm/network-install/old/
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

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/bm/hlm-vm/">&#9664; Create the HLM Virtual Machine</a> | <a href="/helion/openstack/carrier/install/bm/overview/">&#9650; Installation Overview</a> |  <a href="/helion/openstack/carrier/install/bm/environment/"> Configuring the installation environment &#9654;</a> </p> 

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Provisioning the Network
 
The HP Helion OpenStack Carrier Grade installation files include a script that automatically creates the networks and blank VMs required for the installation, called `python createvm.py vm.json`. 

This script takes an input JSON file `vm.json` and creates three blank (no operating system installed) virtual machines: `ccn1`, `ccn2` and `cpn1`. The script also created the PXE and CLM networks and assigns the networks to the VMs. The networks will be PXE booted by Cobbler. 

To provision the required networks:

1. On your KVM host, download the `cg-hos.tar.gz.gpg` and HLM node image `cg-hlm.qcow2`to the `root` directory

2. Use the following command to decrypt and untar the GPG file. You will be prompted for the password: `cghelion`.

		gpg -d cg-hos.tar.gz.gpg | tar -xzvf 

3. Provision `cg-hlm.qcow2` on your KVM host and create/assign new DHCP NAT network for SSH access to HLM node called `bkd`.

		qemu-img create -f qcow2 cg-hlm.qcow2

	**QUESTION: WHAT IS COMMAND TO DO THIS?**

4. Use the following commands to configure `bkd` as `eth0` interface; the PXE network as `eth1`; and the CLM network as `eth2` interface.

		iface eth0 bkd
		iface eth1 pxe
		iface eth2 clm

	**QUESTION: WHAT IS COMMAND TO DO THIS?**

	(Note: We strongly recommend using HLM VM from virt-manager console as following section involves running scripts that restart the network at multiple points)

	[login creds for HLM VM: root/cghelion]

4. Edit the `/etc/network/interfaces` file to add static IP addresses for the PXE and CLM networks:

	**Example:**

		iface eth0 inet dhcp
		iface eth1 inet static
			address 192.168.122.203
			network 192.168.122.0
			netmask 255.255.255.0
			broadcast 192.168.122.255
			gateway 192.168.122.1
		iface eth2 inet static
			address 192.168.101.203
			network 192.168.101.0
			netmask 255.255.255.0
			broadcast 192.168.101.255
			gateway 192.168.101.1


5. Restart the networking service using the following command:

		sudo /etc/init.d/networking restart

## Next Step

[Configuring the installation environment](/helion/openstack/carrier/install/bm/environment/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
