---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Allocating and Associating Floating IP Addresses"
permalink: /helion/commercial/carrier/dashboard/managing/instances/ipaddresses/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Allocating and Associating Floating IP Addresses

Floating IP addresses allow external access to the instances in your network. 

* [Associate a floating IP address](#associate)
* [Allocate floating IP addresses](#allocate)
* [Disassociate a floating IP address](#disassociate)

**Note:** You must have an external network configured for the project. Without an external network, a floating IP address is not available. When you create an external network, a pool of IP addresses is created, which you can associate to the instances on a network.

### Associate a floating IP address to a network. ### {#associate}

To assign a floating IP address to an instance:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. For the network you want to associate the IP address, click the arrow icon in the **Actions** menu and select **Associate Floating IP**.

	**Note:** Instances that are in error cannot be assigned a floating IP address. 

4. In the **Manage Floating IP Associations** screen, select an address from the **IP Address**. This list contains the currently allocated IP addresses. 

**Note:** If the list is empty, you will need to [allocate an IP address](#allocate) before you can associate an address to a network. Click **Cancel** and see 

5. In the **Port to be Associated** list, select the instance and port that you want to associate with the floating IP address.

6. Click **Associate**.

### Allocate a floating IP address ### {#allocate}

Before associating a floating IP address to an instance, the floating IP address must be allocated for use.

To allocate a floating IP address:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. For the network you want to associate the IP address, click the arrow icon in the **Actions** menu and select **Associate Floating IP**.

4. In the **Manage Floating IP Associations** screen, click the **+** button next to the **IP Address** list.

5. In the **Allocate Floating IP** screen, select the appropriate external network in the **Pool** list. Select the network to which the instance connects.

6. Click **Allocate IP**.

A floating IP address is added to the **IP Address** list in the **Manage Floating IP Associations** screen.

The floating address can be [associated](#associate) to an instance.

### Disassociate a floating IP address from a network. ### {#disassociate}

To remove a floating IP address from an instance:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. For the network you want to disassociate the IP address, click the arrow icon in the **Actions** menu and select **Disassociate Floating IP**.

4. In the confirmation screen, click **Disassociate Floating IP**.

The floating IP address is removed and the instance is no longer accessible from the external network.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
