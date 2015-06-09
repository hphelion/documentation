---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Filtering MAC Addresses on Virtual Interfaces"
permalink: /helion/openstack/carrier/configuration/plan/filtering/virtual/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Filtering MAC Addresses on Virtual Interfaces
<!-- From the Titanium Server Admin Guide -->

The AVS on compute nodes can be configured to filter out packets based on source MAC address.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

MAC addresses for virtual network interfaces on virtual machines are dynamically allocated by the system. For most scenarios, the assigned MAC addresses are expected to be used on all outgoing packets from the virtual machine instances. However, there are scenarios where the source MAC address is not expected to match the original assignment, such as when a L2 switch is implemented internally on the virtual machine.

By default, the AVS on compute nodes accepts any source MAC address on the attached virtual network interfaces.

However, it can be configured to filter out all incoming packets with non-system-generated source MAC address, if required. When evaluating the use of the filtering capability, you must consider the following:

* Source MAC address filtering can be enabled and disabled by the administrator user only, not by tenants.
* Filtering is enabled on a per-tenant basis only. Higher granularity, such as per-instance filtering, is not supported.
* When enabled, source MAC address filtering applies to all new virtual interfaces created by the Neutron service.

Address filtering is not active on virtual interfaces created before filtering is enabled.

Use the following command to enable source MAC address filtering:

	neutron setting-update --tenant-id=<TENANTID> \
	--mac-filtering={True|False}

Filtering can be enabled or disabled from the Horizon interface. As the administrator:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Clicking **Projects** on the **Identity** menu. 

3. Select **Source MAC Filtering**.

4. Click **Save**. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----