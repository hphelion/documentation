---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Ethernet Interfaces"
permalink: /helion/openstack/carrier/config/plan/ethernet/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Ethernet Interfaces
<!-- From the Titanium Server Admin Guide -->

Ethernet interfaces, both physical and virtual, play a key role in the overall performance of the virtualized network.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

It is important to understand the available interface types, their configuration options, and their impact on network design.

This section contains the following topics:

* [Configuring Ethernet Interfaces](/helion/openstack/carrier/configuration/plan/ethernet/config/)
* [Configuring Shared (VLAN) Ethernet Interfaces](/helion/openstack/carrier/configuration/plan/ethernet/shared/)
* [Configuring Ethernet MTU](/helion/openstack/carrier/configuration/plan/ethernet/mtu)
* [Filtering MAC Addresses on Virtual Interfaces](/helion/openstack/carrier/configuration/plan/filtering/virtual/)
* [Configuring PCI Passthrough Ethernet Interfaces](/helion/openstack/carrier/configuration/plan/pci-passthru/)
* [SR-IOV Ethernet Interfaces](/helion/openstack/carrier/configuration/plan/sr-iov/)

On compute node data interfaces, the HP Helion OpenStack Carrier Grade supports Ethernet Network Interface Cards (NIC) based on the following chip sets:

* Intel 82599 (NIANTIC) 10 G
* Intel I350 (Powerville) 1G
* Mellanox Technologies MT27500 Family [ConnectX-3]

The following is the list of supported virtual network interfaces:

* Accelerated Virtual Port (AVP)
* Intel e1000 emulation (e1000)
* NE2000 emulation (ne2k_pci)
* AMD PCNet/PCI Emulation (pcnet)
* Realtek 8139 emulation (rtl8139)
* VirtIO Network (virtio)
* PCI Passthrough Device
* SR-IOV

## About LAG/AE Interfaces

Ethernet interfaces in a LAG group should be attached to the same L2 switch to provide link protection. For more information about the different LAG modes see the HP Helion OpenStack Carrier Grade Software Installation Guide.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----