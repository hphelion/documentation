---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Creating a Segmentation Range"
permalink: /helion/commercial/carrier/dashboard/managing/network/segment/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Creating a Segmentation Range

The admin user must create segmentation ranges on existing provider networks of the vlan type in order to support tenant networks.


<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

This task assumes that provider networks have already been created to unlock the compute nodes and make the system operational. For more information, see [Creating and Deleting Provider Networks](/helion/commercial/carrier/dashboard/managing/network/provider/create/).

Segmentation ranges are sets of contiguous identifiers defined on a provider network. Each ID is used to implement a tenant network.

Depending on how a segmentation range is configured, its ID can be available to all tenants (shared), or designated for use by a particular tenant. When a tenant or admin creates a new tenant network, it is assigned an ID automatically from the available ranges on available provider networks.

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Networks** link.

	The network(s) for the selected project appear. 

3. Select the **Provider Networks** tab.

4. Click the name of the provider network where you want to create a segmentation range.

5. On the **Provider Network Overview** page, click **Create Range** to open the Create Segmentation Range page.

6. Complete the form as required.

	* **Name** -  Enter the name of the segmentation range.
	* **Description** -  Enter a free-text field for reference.
	* **Shared** -  If selected, shares the range for use by all tenants. 
	* **Project** -  Select the tenant associated with the segmentation range.
	* **Minimum** Enter the lowest value of a range of IDs.
	* **Maximum** Enter the highest value of a range of IDs.

	**Caution:** The range must not overlap other segmentation ranges on the same provider network.

7. Click **Create Segmentation Range** to commit the changes.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
