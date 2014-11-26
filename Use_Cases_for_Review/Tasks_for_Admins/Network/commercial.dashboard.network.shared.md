---
layout: default
title: "HP Helion OpenStack&#174; Creating a Shared Network"
permalink: /helion/commercial/dashboard/managing/network/shared/
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

# HP Helion OpenStack&#174; Creating a Shared Network

A shared network is visible to all projects in the domain. Instances have a single NIC, and receive a fixed IP address from the subnet(s) associated with that network. </p>

An admin user can create a shared network as needed. </p>

### Create a network</h3>

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Networks</strong> link on the <strong>Admin</strong> dashboard <strong>Network</strong> panel.</p>

	The network(s) for the selected project appear. </p>

3. Click <strong>Create Network</strong>.</p>

4. On the <strong>Create Network</strong> screen:</p>

	a. Enter a name for the network.</li>
	b. Select a project to associate with the network.</li>
	c. Leave <strong>Admin State</strong> selected to launch the network in the enabled state or clear the field to disable the new network.</li>
	d. Select <strong>Shared</strong> to make the network available to all projects in the domain.</li>
	e. Leave <strong>External Network</strong> clear to make the network internally accessible only.</li>

5. Click <strong>Create Network</strong>.  

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*