---
layout: default
title: "HP Helion OpenStack&#174; Creating a Shared Network"
permalink: /helion/commercial/dashboard/managing/network/shared/users/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> 
-->

# HP Helion OpenStack&#174; Creating a Shared Network

A shared network is visible to all projects in the domain. Instances have a single NIC, and receive a fixed IP address from the subnet(s) associated with that network. 

An admin user can create a shared network as needed. 

### Create a network</h3>

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Networks** link on the **Admin** dashboard **Network** panel.

	The network(s) for the selected project appear. 

3. Click **Create Network**.

4. On the **Create Network** screen:

	* Enter a name for the network.</li>
	* Select a project to associate with the network.</li>
	* Leave **Admin State** selected to launch the network in the enabled state or clear the field to disable the new network.</li>
	* Select **Shared** to make the network available to all projects in the domain.</li>
	* Leave **External Network** clear to make the network internally accessible only.</li>

5. Click **Create Network**.  

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
