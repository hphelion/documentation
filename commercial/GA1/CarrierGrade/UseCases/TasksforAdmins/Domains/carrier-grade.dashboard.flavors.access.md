---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Managing access to a flavor"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/access/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Managing access to a flavor #

Compute flavors are machine configurations that describe the amount of memory, number of CPUs, and storage capacity of instances. 

As an admin, you can [allow specific projects to have access to a flavor](#add) or [prevent a project from accessing a flavor](#remove).

### Allowing a project to access a flavor ### {#add}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Flavors** link.

	The flavors for in the domain are listed. 

3. For the flavor you want to modify, click **Edit Flavor &gt; Modify Access**.

4. Click the **+** icon next to a project in the **All Projects** column to allow the project to access the flavor.

	By default, no project is specified as having access the flavor. If none is specified, all projects can access the flavor.

5. Click **Save** to create a new the flavor.<br />

	A message is displayed on successful change.

### Preventing a project from accessing a flavor ### {#remove}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **System** panel, then the **Admin** dashboard, then the **Flavors** link.

	The flavors for in the domain are listed. 

3. For the flavor you want to modify, click **Edit Flavor &gt; Modify Access**.

4. Click the **-** icon next to a project in the **Selected projects** column to remove the flavor from the project.

	By default, no project is specified as having access the flavor. If none is specified, all projects can access the flavor.

5. Click **Save** to create a new the flavor.<br />
A message is displayed on successful change.

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
