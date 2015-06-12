---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring SR-IOV Ethernet Interfaces"
permalink: /helion/openstack/carrier/configuration/plan/sr-iov/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring SR-IOV Ethernet Interfaces
<!-- From the Titanium Server Admin Guide -->

A SR-IOV Ethernet interface is a physical PCI Ethernet NIC that implements hardware-based virtualization mechanisms to expose multiple virtual network interfaces that can be used by one or more virtual machines simultaneously.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

The PCI-SIG Single Root I/O Virtualization and Sharing (SR-IOV) specification defines a standardized mechanism to create individual virtual Ethernet devices from a single physical Ethernet interface. For each exposed virtual Ethernet device, formally referred to as a Virtual Function (VF), the SR-IOV interface provides separate management memory space, work queues, interrupts resources, and DMA streams, while utilizing common resources behind the host interface. Each VF therefore has direct access to the hardware and can be considered to be an independent Ethernet interface.

When compared with a PCI Passthtrough Ethernet interface, a SR-IOV Ethernet interface:

* Provides benefits similar to those of a PCI Passthtrough Ethernet interface, including lower latency packet processing.
* Scales up more easily in a virtualized environment by providing multiple VFs that can be attached to multiple virtual machine interfaces.
* Shares the same limitations, including the lack of support for LAG, QoS, ACS, and live migration.
* Has the same requirements regarding the VLAN configuration of the access switches.
* Provides a similar configuration workflow when used on HP Helion OpenStack Carrier Grade.

To configure the access switch:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/) as the admin user.

2. [Lock the compute node](/helion/openstack/carrier/admin/host/management/inventory/lock/) you want to configure.

3. Configure the Ethernet interface to be used as a SR-IOV interface.

	a. Click **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

	b. In the **Hosts** list, click the name of the compute node where the PCI interface is available. 

	c. Click the **Interfaces** tab, and finally click the **Edit Interface** button associated with the interface you want to configure. 

	d. Specify the interface to associtate.

	e. Select `pci-sriov` under **Network Type**.

	f. Select the provider network to connect with.

	e. Click **Save**.

	The Maximum number of VFs displayed in this form is a read-only item which is auto-discovered by the system by inspecting the specific NIC model. This value is reported as 0 when the selected interface does not support SRIOV.

4. Create the `tenant1-net1` tenant network.

	a. Click **Create Network** 

	b. In the **Select Network** screen, select a network that has access to the tenant network.

	c. Set the segmentation ID to `20`.

	d. Click **Create Network**.

5. Configure the access switch.

	Configure the physical port on the access switch used to connect to Ethernet interface eth8 as an access port with default VLAN ID of 20.

6. [Unlock the compute node](/helion/openstack/carrier/admin/host/management/inventory/lock/).

7. Launch the virtual machine.

	a. Log into Horizon as a non-admin user to the web management interface.

	b. Click **Instance** on the **Compute** section of the **Pronect** menu. 

	c. Click **Launch Instance**.

	d. In the **Launch Instance** screen, configure the necessary options for the new virtual machine. In particular, click the **Networking** tab and add an SR-IOV interface on the tenant network. Add other network interfaces as needed.

	e. Click the Launch button to proceed.

The interface can also be configured from the CLI as illustrated below:

	system host-if-modify \
	-nt pci-sriov -N 4 -p group0-data0 compute-0 eth8


SR-IOV interfaces can be attached from the CLI when booting a new virtual machine, as illustrated below:

	nova boot \
	--nic net-id=704e9f3b,vif-model=pci-sriov my-new-vm

The new virtual machine instance is up now. It has a SR-IOV VF connection to the tenant1-net1 tenant network identified with VLAN ID 20.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----