---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Create the HLM Node"
permalink: /helion/openstack/carrier/install/hlm-node/
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
<!--
<p style="font-size: small;"><a href="/helion/openstack/technical-overview/">&#9664; Technical Overview</a> | <a href="/helion/openstack/install/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/install/kvm/">Installing on a KVM hypervisor &#9654;</a> OR <a href="/helion/openstack/install/esx/"> Installing on an ESX hypervisor&#9654;</a> </p> 
-->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Create the HLM Node

Helion Lifecycle Management (HLM) consists of the ongoing operations /maintenance as well as the initial deployment of the Helion system as shown above.

## Create the HLM VM

1. Copy the `cg-hlm.qcow2` to `/var/lib/libvirt/images` folder on your KVM host.

2. Use the following commands to create a virtual machine (the HLM node) from the HLM XML definition file then start the domain:

		virsh define hlm.xml
		virsh autostart HLM
		virsh start HLM

	After the HLM VM is up and running, the VM will have three interfaces:

		NIC1: NAT[Vibro] - a virtual NIC
		NIC2: br-ctl[PXE]
		NIC3: br-ctl[CLM port group].

3. Update your interfaces as below and restart network services using the following command:

		/etc/init.d/networking restart

4. Use the following commands to verify that the interfaces and route entries are configured as expected.

		/etc/network/interfaces
		Ifconfig
		Route entries

	If you do not see the interfaces and IP as expected, reboot the VM and check again.  Check the route entries and ping other interfaces after reboot

5. Verify that you can ping other VMs

	* VSD node
	* VSC node
	* NTP/DNS VM
	* NTP server 
	* KVM host
 
6. Verify that you can connect using SSH from the KVM host to the HLM node using the IP address for NIC1 (NAT[Vibro]). 
		ssh root@<IP_address>

7. Verify the bridge ID and VLAN tag ids for the HLM node are configured as expected.

		virsh dumpxml hlm

## Next step {#nextstep}

[Install HP Helion OpenStack](/helion/openstack/carrier/install/vsc-node/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
