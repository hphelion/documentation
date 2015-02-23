---
layout: default
title: "HP Helion OpenStack&#174; Rebuilding Instances"
permalink: /helion/commercial/dashboard/managing/instances/rebuild/
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

# HP Helion OpenStack&#174; Rebuilding Instances

The rebuild operation removes all data on the server and replaces it with the specified image. 

A rebuild operation always removes data injected into the file system through server personality. You can reinsert data into the file system during the rebuild. 

### Rebuilding an instance ###

To rebuild an instance:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/1.1/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. In the **Instances** screen, for the instance you want to rebuild, click **Menu &gt; Rebuild Instance**.

4. In the **Rebuild Instances** screen:

	* Select the image to use to rebuild the instance. You can select the same image or rebuild using a different image.</li>
	* Specify whether the instance will automatically partition, based on the image, or you will manually partition the instance.</li>

5. In the confirmation screen, click **Rebuild Instance**.

	The progress of the reboot is displayed in the **Task** column on the **Instances** screen.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
