---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Board Management Network"
permalink: /helion/openstack/carrier/configuration/plan/network/board/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Board Management Network
<!-- From the Titanium Server Admin Guide -->

The board management network is a private, optional network, only visible internally by the hosts in the cluster.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

The board management network provides for out-of-band reset, power-up, and power-down operations on HP hosts.

Support for this network is selected during controller configuration; for details, see the HP Helion OpenStack Carrier Grade Software Installation Guide: The Controller Configuration Script. To support this feature, compute and storage nodes must be equipped with iLO3 or iLO4 (Integrated Lights Out) board management modules.

Compute and storage nodes connect using iLO modules, while controller nodes use the management port in tagged mode. The controller nodes can optionally attach using their own iLO modules, if available.

To use a board management network, you must do the following:

* On the HP Helion OpenStack Carrier Grade:

	* Designate a VLAN ID for use by the board management network.
	* Configure this VLAN ID as part of the software installation process.
	* Ensure that the internal management network is operational and that all participant hosts are attached to it.

* On the HP Helion OpenStack Carrier Grade internal L2 switch:

	* Configure a VLAN using the designated VLAN ID for the board management network.
	* Add each of the ports used to connect an iLO module to the VLAN.
	* Add the ports used to connect the controllers to the internal management network to the VLAN. You must ensure that these ports are tagged ports for this VLAN, that is, that outgoing board management traffic (toward the controllers) uses IEEE 802.1Q tagging. Other management traffic on this port is untagged.
* Configure each iLO module to use DHCP.

* Provision each iLO module with a username and password for secure access.

* Provision each host with the MAC address of the attached iLO module. This is required so that the system can associate the module's assigned IP address with the correct host. The Board Management configuration window is available from the Edit Host window in the Inventory section in the web management interface.

* Provision each host with the username and password of the attached iLO module. This is required for controller
access to the module.

For details on configuring or provisioning switch ports or iLO modules, consult the user documentation supplied with
the equipment.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----