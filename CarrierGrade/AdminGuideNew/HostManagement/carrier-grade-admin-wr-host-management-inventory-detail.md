---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Managing Host Systems"
permalink: /helion/openstack/carrier/admin/host/management/inventory/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Managing Host Systems
<!-- From the Titanium Server Admin Guide -->

From the **Inventory Detail** page you can see detailed information about a host, and use it to define hardware profiles that can be used across the cluster.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

You access the **Inventory Detail** page by clicking the host name on the **Hosts** tab of the **Systems Inventory** page. The inventory detail for a host consists of multiple tabs, each addressing a different aspect of the host. 

They include:

* [Working with Host CPUs](/helion/openstack/carrier/admin/host/management/inventory/processor/)
* [Working with Host Memory](/helion/openstack/carrier/admin/host/management/inventory/)
* [Working with Host Storage](/helion/openstack/carrier/admin/host/management/inventory/storage/)
* [Viewing Host Port Details](/helion/openstack/carrier/admin/host/management/inventory/ports/)
* [Working with Host Interfaces](/helion/openstack/carrier/admin/host/management/inventory/interfaces/)

## Overview

The **Overview** tab on the **Inventory Detail** page summarizes core details about a host object.

To view the host CPUs:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. In the Host Name column, click the name of the locked host to open the **Inventory Detail** page for that host.

The following items are included in the summary:

* host name, personality, and the internal UUID and host ID reference numbers
* MAC and IP addresses on the internal management network
* serial ID, if known. Use the command system host-modify &lt;hostname> serialid=xxx to update it.
* location, as entered by the operator using the Edit Host window. For more information, see [Host Inventory](/helion/openstack/carrier/admin/host/management/inventory/host/)
* time stamps of when the host was created and last updated
* the host's state
* board management (iLO) information, if available, including controller type, MAC address, and IP address.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----