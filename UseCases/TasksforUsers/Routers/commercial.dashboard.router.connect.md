---
layout: default
title: "HP Helion OpenStack&#174; Connecting a Network to a Router"
permalink: /helion/commercial/dashboard/managing/router/connect/
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

# HP Helion OpenStack&#174; Connecting a Network to a Router

A network connects to the router through an interface. You must create an interface between the network and router to remotely connect to the network and any instances on that network through the router.</p>

When you create a new router, the router is not associated to any subnet. You can optionally connect the router to an internal network. </p>

### Connect a network to the router ###

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Routers</strong> link on the <strong>Project</strong> dashboard <strong>Network</strong> panel.</p>

	The routers for the selected project appear. </p>

3. Click the name of the router you want to connect to the network.</p>

4. On the <strong>Router Details</strong> tab, click <strong>Add interface</strong>.</p>

5. On the <strong>Add Interface</strong> screen:</p>

	* Select a subnet associated with the network you 
want to connect with from the <strong>Select</strong> list.</li>
	* Optionally, specify an IP address for the interface that is in the IP range.</li>

6. Click <strong>Add Interface</strong> </p>

	The network is connected to the router.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*