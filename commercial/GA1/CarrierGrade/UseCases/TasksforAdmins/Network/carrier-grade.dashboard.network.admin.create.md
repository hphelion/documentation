---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Creating Externally Available Networks"
permalink: /helion/commercial/carrier/dashboard/managing/network/external/create/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> 
-->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Creating Provider Networks

Provider networks are created by the OpenStack administrator and map directly to an existing physical network in the data center. Useful network types in this category are flat (untagged) and VLAN (802.1Q tagged). It is possible to allow provider networks to be shared among tenants as part of the network creation process.

You can create any of the following types of networks:

* **Flat**. All instances reside on the same network, which can also be shared with the hosts. No VLAN tagging or other network segregation takes place. 
* **Local**. Instances reside on the local compute host and are effectively isolated from any external networks.
* **VLAN**. Networking allows users to create multiple provider or tenant networks using VLAN IDs (802.1Q tagged) that correspond to VLANs present in the physical network. This allows instances to communicate with each other across the environment. They can also communicate with dedicated servers, firewalls, load balancers and other networking infrastructure on the same layer 2 VLAN.
* **VXLAN** and **GRE**. VXLAN and GRE use network overlays to support private communication between instances. A Networking router is required to enable traffic to traverse outside of the GRE or VXLAN tenant network. A router is also required to connect directly-connected tenant networks with external networks, including the Internet; the router provides the ability to connect to instances directly from an external network using floating IP addresses.

An admin user can [create](#createnet) and [delete](#deletenet) provider networks in any project, as needed.

### Create a provider network ### {#createnet}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Networks** link.

	The network(s) for the selected project appear. 

3. Click **Create Network**.

4. On the **Network** tab enter a name for the network.

5. Select which project the network is to be available in. 
6. Select the provider network type:

	* Local. No additional configuration required.
	* Flat. Specify the name of the physical network that this network should map to.
	* VLAN. Specify the name of the physical network that this network should map to and specify the VLAN segment number to assign.
	* GRE. Specify the VLAN segment number to assign.
	* VXLAN. Specify the VLAN segment number to assign.

7. From the **Admin State** list, select **UP** to launch the network in the enabled state or **DOWN** to disable the new network.

8. Determine if the network can be accessed in all projects:

	* Select **Shared** to make the network available in all projects. 
	* Leave the **Shared** option clear to limit the network to the selected project. 

9. Determine if the network is to be available externally or only internally: 

	* Select **External Network** to make the network an externally accessible.
	* Leave the **External Network** option clear to make the network internal, only accessible from the external network through a network router. 

10. Click **Create Network**.  



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
