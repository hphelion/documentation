---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring PCI Passthrough Ethernet Interfaces"
permalink: /helion/openstack/carrier/configuration/plan/pci-passthru/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring PCI Passthrough Ethernet Interfaces
<!-- From the Titanium Server Admin Guide -->

A passthrough Ethernet interface is a physical PCI Ethernet NIC on a compute node to which a virtual machine is granted direct access. This minimizes packet processing delays but at the same time demands special operational considerations.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

For all purposes, a PCI passthrough interface behaves as if it were physically attached to the virtual machine.

Any potential throughput limitations coming from the virtualized environment, such as the ones introduced by internal copying of data buffers, are eliminated. However, by bypassing the virtualized environment, the use of PCI passthrough Ethernet devices introduces several restrictions that must be taken into consideration, including:

* no support for LAG, QoS, ACL, or host interface monitoring
* no support for live migration
* no access the compute node's AVS switch

A passthrough interface bypasses the compute node's AVS switch completely, and is attached instead directly to the provider network's access switch. Therefore, proper routing of traffic to connect the passthrough interface to a particular tenant network depends entirely on the VLAN tagging options configured on both the passthrough interface and the access port on the switch.

The access switch routes incoming traffic based on a VLAN ID, which ultimately determines the tenant network to which the traffic belongs. The VLAN ID is either explicit, as found in incoming tagged packets, or implicit, as defined by the access port's default VLAN ID when the incoming packets are untagged. In both cases the access switch must be configured to process the proper VLAN ID, which has to be known in advance.

To configure the access switch:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/) as the admin user.

2. [Lock the compute node](/helion/openstack/carrier/admin/host/management/inventory/lock/) you want to configure.

3. Configure the Ethernet interface to be used as a PCI passthrough interface.

	a. Click **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

	b. In the **Hosts** list, click the name of the compute node where the PCI interface is available. 

	c. Click the **Interfaces** tab, and finally click the **Edit Interface** button associated with the interface you want to configure. 

	d. Specify the interface to associtate.

	e. Select `pci-passthrough` under **Network Type**.

	f. Select the provider network to connect with.

	e. Click **Save**.

4. Create the `net0` tenant network by click **Networks** on the **Admin** menu.

	a. Click **Create Network** 

	b. In the **Select Network** screen, select a network that has access to the tenant network.

	c. Set the segmentation ID to `10`.

	d. Click **Create Network**.

5. Configure the access switch.

	Configure the physical port on the access switch used to connect to Ethernet interface eth8 as an access port with default VLAN ID of 10. Traffic across the connection is therefore untagged, and effectively integrated into the targeted tenant network.

	You can also use a trunk port on the access switch so that it handles tagged packets as well. However, this opens the possibility for guest applications to join other tenant networks using tagged packets with different VLAN IDs, which might compromise the security of the system. See L2 Access Switches for other details regarding the configuration of the access switch.

6. [Unlock the compute node](/helion/openstack/carrier/admin/host/management/inventory/lock/).

7. Launch the virtual machine.

	a. Log into Horizon as a non-admin user to the web management interface.

	b. Click **Instance** on the **Compute** section of the **Pronect** menu. 

	c. Click **Launch Instance**.

	d. In the **Launch Instance** screen, configure the necessary options for the new virtual machine. In particular, click the **Networking** tab and add a PCI passthrough interface on the tenant network. Add other network interfaces as needed.

	e. Click the Launch button to proceed.

The interface can also be configured using the following CLI commands:

	system host-if-modify \
	-nt pci-passthrough -p group0-data0 compute-0 eth8

Passthrough interfaces can be attached from the CLI when booting a new virtual machine, as illustrated below:

	nova boot \
	--nic net-id=704e9f3b,vif-model=pci-passthrough my-new-vm

The new virtual machine instance is up now. It has a PCI passthrough connection to the tenant network identified with VLAN ID 10.

Access switches must be properly configured to ensure that virtual machines using PCI-passthrough or [SRIOV Ethernet interfaces](/helion/openstack/carrier/configuration/plan/sr-iov/) have the expected connectivity. In a common scenario, the virtual machine using these interfaces connects to external end points only, that is, it does not connect to other virtual machines in the same TiS cluster. 

In this case:

* Traffic between the virtual machine and the access switch can be tagged or untagged.
* The connecting port on the access switch is part of a port-based VLAN.
* If the port is tagged, the allowed VLAN ID range must not overlap with VLAN ID ranges used by the AVS ports.
* The port-based VLAN provides the required connectivity to external switching and routing equipment needed by
guest applications to establish connections to the intended end points.

For connectivity to other virtual machines in the TiS cluster the following configuration is also required:

* The VLAN ID used for the tenant network, 10 in this example, and the default port VLAN ID of the access port on the switch are the same. This ensures that incoming traffic from the virtual machine is tagged internally by the switch as belonging to VLAN ID 10, and switched to the appropriate exit ports.
* The target virtual machines are reachable through another port on the compute node, which is managed by the
AVS.
* That other port is configured as usual, as a VLAN trunk port, and the tenant network's VLAN ID (10) is included in the tagged range. This ensures that VLAN 10 is common to both the passthrough/SR-IOV interface and the AVS port.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----