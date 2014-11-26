---
layout: default
title: "HP Helion OpenStack&#174; Allocating and Associating Floating IP Addresses"
permalink: /helion/commercial/dashboard/managing/ipaddresses/associate/
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
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Allocating and Associating Floating IP Addresses

Floating IP addresses allow external access to the instances in your network. </p>

* <a href="#associate">Associate a floating IP address</a></li>
* <a href="#allocate">Allocate floating IP addresses</a></li>
* <a href="#disassociate">Disassociate a floating IP address</a></li>

**Note:** You must have an external network configured for the project. Without an external network, a floating IP address is not available. When you create an external network, a pool of IP addresses is created, which you can associate to the instances on a network.</p>

### Associate a floating IP address to a network. ### {#associate}

To assign a floating IP address to an instance:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Instances</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

3. For the network you want to associate the IP address, click <strong>More &gt; Associate Floating IP</strong>.</p>

	**Note:** Instances that are in error cannot be assigned a floating IP address. </p>

4. In the <strong>Manage Floating IP Associations</strong> screen, select an address from the <strong>IP Address</strong>. This list contains the currently allocated IP addresses. </p>

**Note:** If the list is empty, you will need to <a href="#allocate">allocate an IP address</a> before you can associate an address to a network. Click <strong>Cancel</strong> and see </p>

5. In the <strong>Port to be Associated</strong> list, select the instance and port that you want to associate with the floating IP address.</p>

6. Click <strong>Associate</strong>.</p>

### Allocate a floating IP address ### {#allocate}

Before associating a floating IP address to an instance, the floating IP address must be allocated for use.</p>

To allocate a floating IP address:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Instances</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

3. For the network you want to associate the IP address, click <strong>More &gt; Associate Floating IP</strong>.</p>

4. In the <strong>Manage Floating IP Associations</strong> screen, click the <strong>+</strong> button next to the <strong>IP Address</strong> list.</p>

5. In the <strong>Allocate Floating IP</strong> screen, select the appropriate external network in the <strong>Pool</strong> list. Select the network to which the instance connects.</p>

6. Click <strong>Allocate IP</strong>.</p>

A floating IP address is added to the <strong>IP Address</strong> list in the <strong>Manage Floating IP Associations</strong> screen.</p>

The floating address can be <a href="#associate">associated to an instance</a>.</p>

### Disassociate a floating IP address from a network. ### {#disassociate}

To remove a floating IP address from an instance:</p>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Instances</strong> link on the <strong>Project</strong> dashboard <strong>Compute</strong> panel.</p>

3. For the network you want to disassociate the IP address, click <strong>More &gt; Disassociate Floating IP</strong>.</p>

4. In the confirmation screen, click <strong>Disassociate Floating IP</strong>.</p>

The floating IP address is removed and the instance is no longer accessible from the external network.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*