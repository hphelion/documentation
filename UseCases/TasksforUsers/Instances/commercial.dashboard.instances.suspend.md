---
layout: default
title: "HP Helion OpenStack&#174; Suspending Instances"
permalink: /helion/commercial/dashboard/managing/instances/suspend/
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

# HP Helion OpenStack&#174; Suspending and Resuming Instances

When a user *suspends* an instance, the contents of the instance are stored on disk and the instance is stopped. Suspending an instance is similar to placing a device in hibernation; memory and vCPUs become available to create other instances.

Users can suspend an instance, for example, to free up the resources used by an instance that is used infrequently or to perform system maintenance. 

**Note:** Suspending is different from <a href="/helion/commercial/dashboard/managing/instances/pause/">pausing an instance</a>. Pausing keeps the instance running, (in a &quot;frozen&quot; state) and stores the content of the instance in memory (RAM).  


### Suspend an instance ###

To suspend an instance:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. In the **Instances** screen, for the instance you want to modify, click **More &gt; Suspend Instance**.

	The status of the instance reports *Suspended*.

### Resume an instance ###

To resume an instance:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. In the **Instances** screen, for the instance you want to modify, click **More &gt; Resume Instance**.

	The status of the instance reports *Running*. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
