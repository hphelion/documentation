---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Creating an Instance Snapshot"
permalink: /helion/commercial/carrier/dashboard/managing/volume/snapshot/create/
product: carrier-grade

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> 
-->

# HP Helion OpenStack&#174; Carrier Grade: Creating a Snapshot from a Volume

A snapshot is a new image based on a running instance. That snapshot can be used as the base for new instances. 

### Creating a snapshot ###

To create a snapshot:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Compute** tab on the dashboard **Project** panel.

3. In the **Compute** panel, click **Volumes**.

3. In the **Volumes** screen, for the volume you want to create a snapshot, click the arrow icon in the **Actions** menu and select **Create Snapshot**.

4. On the **Create Snapshot** tab, enter a name for the snapshot.

5. Click **Create Snapshot** to launch the instance.

	A snapshot image is created on the **Volume Snapshot** tab.

When you create a snapshot, by default the snapshot image can be used only with the current project.

You can [make the snapshot public](/helion/commercial/carrier/dashboard/managing/images/public/) for use in all projects in the domain and you can [protect the image](/helion/commercial/carrier/dashboard/managing/images/protect/) from being deleted. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
