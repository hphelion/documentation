---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Managing Metadata"
permalink: /helion/commercial/carrier/dashboard/managing/metadata/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Managing Metadata

Compute uses a metadata service for virtual machine instances to retrieve instance-specific data. 

You can add and remove metadata the following components:

* [Host Aggregates](/helion/commercial/carrier/dashboard/managing/aggregates/)
* [Flavors](/helion/commercial/carrier/dashboard/managing/flavors/)
* Images

To add and remove metadata:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the component link on the **Admin** dashboard **System** panel.

	The flavors in the domain are listed. 

3. For the flavor you want to modify, click the arrow icon in the **Actions** menu and select **Update Metadata**. 

4. In the **Update Metadata** screen, click the **+** icon for a metadata term in the **Available Metadata** column to move the term to the **Existing Metadata** column. 

	Optionally, enter a new term in the **Other** field and click the **+** icon. 

	Metadata terms in the **Available Metadata** column are from the Glance Metadata Catalog.

	Metadata terms in the **Existing Metadata** column are associated with the current flavor. 

5. Click **Save**.


### Delete a flavor ### {#deleteflavor}

Instances that use the flavor are not affected when a flavor is deleted.

To delete a flavor:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Flavors** link on the **Admin** dashboard **System** panel.

	The flavors in the domain are listed. 

3. For the flavor you want to modify, click **Edit Flavor > Delete Flavor**. 

4. In the confirmation screen, click **Delete Flavor**.
<p>A message is displayed on successful delete.</p> 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
