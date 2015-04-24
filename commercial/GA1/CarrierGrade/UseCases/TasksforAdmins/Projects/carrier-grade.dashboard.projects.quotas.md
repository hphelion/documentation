---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Managing project quotas"
permalink: /helion/commercial/carrier/dashboard/managing/projects/quotas/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Managing project quotas

Quotas are operational limits enforced on each project. 

To prevent system capacities from being exhausted without notification, you can set up quotas. 

For example, the number of gigabytes allowed per project can be controlled to make sure that a single project does not consume all of the disk space. 

Default values are set on the [Default screen](/helion/commercial/carrier/dashboard/managing/quotas/).

### Modify a quotas ### {#quotamod}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Identity** panel, then the **Projects** link.

3. For the project you want to modify, click the arrow icon in the **Actions** menu and select **Modify Quotas**. 
4. In the **Edit Project** screen, click the **Quota** tab (should be active).

5. Edit any of the following fields:

	* Metadata Items. Metadata items allowed for each instance.
	* VCPUs. Instance cores allowed for each project.
	* Instances. Instances allowed for each project.
	* Injected Files. Injected files allowed for each project.
	* Injected File Content Bytes. Content bytes allowed for each injected file.
	* Volumes. Volumes allowed for each project.
	* Volume Snapshots. Volume snapshots allowed for each project.
	* Total Size of Volumes and Snapshots- Enter the maximum total size for all volumes and snapshots allowed for the project.
	* RAM (MB). RAM megabytes allowed for each instance.

6. Click **Save**.

	A message is displayed on successful modification.

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
