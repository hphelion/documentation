---
layout: default
title: "HP Helion OpenStack&#174; Deleting a Router"
permalink: /helion/commercial/dashboard/managing/router/delete/
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

# HP Helion OpenStack&#174; Deleting a Router

A network connects to the router through an interface.</p>

You must remove all router interfaces before deleting the router, by removing all internal interfaces.</p>

### Delete a router ###

1. <a href="/helion/community/dashboard/login/">Launch the HP Helion OpenStack Community web interface.</a></p>

2. Click the <strong>Network Topology</strong> link on the <strong>Project</strong> dashboard <strong>Network</strong> panel.</p>

	Determine if the router is connected to a network using the <a href="/helion/community/network/viewing/">Network Topology screen</a>:</p>

	<br><img src="NetworkConnections.png"  alt="" /></p>

3. Click the <strong>Routers</strong> link on the <strong>Project</strong> dashboard <strong>Network</strong> panel.

	The routers for the selected project appear. </p>

	If the router is connected to a network:</p>

		a. Click the name of the router you want to delete.</li>
		b. On the <strong>Router Details</strong> screen, select the interface(s) for the router and click <strong>Delete Interface</strong>.</li>
		c. Return to the <strong>Routers</strong> screen.</li>

4. For the router you want to delete, click <strong>More &gt; Delete Router</strong>.</p>

5. In the confirmation window, click <strong>Delete Router</strong>.</p>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*