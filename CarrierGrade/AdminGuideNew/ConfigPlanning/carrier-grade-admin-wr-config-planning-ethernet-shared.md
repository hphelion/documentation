---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring Shared (VLAN) Ethernet Interfaces"
permalink: /helion/openstack/carrier/configuration/plan/ethernet/shared/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring Shared (VLAN) Ethernet Interfaces
<!-- From the Titanium Server Admin Guide -->

The management, OAM, infrastructure, and data networks can share Ethernet or aggregated Ethernet interfaces using VLAN tagging.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

The internal management network cannot use VLAN tagging.

However, the OAM and infrastructure networks can use VLAN tagging, allowing them to share an Ethernet or aggregated Ethernet interface with other networks.

**Note:** You cannot add a data network on an aggregated Ethernet interface.

For a system using all three networks, the following arrangements are possible:

* One interface for the management network, another interface for the OAM network, and a third for the infrastructure network.
* One interface for the management network, and a second interface for either the OAM or infrastructure network, with the remaining network implemented using VLAN tagging on either interface.
* One interface for the management network, and a second carrying the OAM and infrastructure networks, both implemented using VLAN tagging.
* One interface for the management network, with the OAM and infrastructure networks also implemented on it using VLAN tagging.

**Note:** You can configure a data network on a management or infrastructure interface by editing the interface and selecting both types of network, and then selecting the VLAN provider network. For more information,see the Network Type discussion in the HP Helion OpenStack Carrier Grade Installation Guide: Interface
Settings.

Options to share an interface using VLAN tagging are presented during the configuration controller script (see the *HP Helion OpenStack Carrier Grade Installation Guide: The Controller Configuration Script*). 

To attach an interface to other networks after configuration, you can edit the interface; for details, see the *HP Helion OpenStack Carrier Grade Installation Guide: Attaching to Networks Using a VLAN Interface*.

You can also use the command line by logging into the active controller and becoming the Keystone admin user, and then using a command such as the following for each node:

	system host-if-add -V 22 -n infra storage-0 infra0 vlan eth1

This example configures the eth1 interface on storage-0 to connect to the infrastructure network using VLAN ID 22.

To display VLAN information as well as dependencies, use a command such as the following:

	system host-if-list controller-0

The output lists all interfaces and associated networks. For each network that uses VLAN tagging, the vlan id is shown, as well as the shared interface used (in the uses i/f column). For shared interfaces, the names of the networks that use VLAN tagging on the interface are shown (in the used by i/f column).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----