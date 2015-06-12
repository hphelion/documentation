---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host Memory"
permalink: /helion/openstack/carrier/admin/host/management/inventory/memory/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host Memory
<!-- From the Titanium Server Admin Guide -->

The **Memory** tab on the **Inventory Detail** page presents memory details for a host.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>


The information is presented in three columns, as follows:

You access the **Inventory Detail** page by clicking the host name on the **Hosts** tab of the **Systems Inventory** page. The inventory detail for a host consists of multiple tabs, each addressing a different aspect of the host. 


* **Memory** - Overall memory on the host. For a controller node it displays the total and available memory figures.

	For a compute node, as in the example above, it displays the amount reserved for the platform (system software), and the total and available figures for use by virtual machines.

* **vSwitch Huge Pages** - This column is relevant on compute nodes only. The size of the huge pages, and the total and available huge page figures.

* **VM Huge Pages** - This column is relevant on compute nodes only.
The size of the huge pages, and the total and available huge page figures.
	
## Huge Page Provisioning {#huge}

You can adjust the number and size of pages to allocate on a host for use as VM memory. For individual VMs, you can specify the page size to use.

In each NUMA node on a host, a fixed amount of memory is reserved for use by VMs. By default, this memory is managed using 2 MiB huge pages. You can change this for individual NUMA nodes to use a combination of 2 MiB and 1 GiB huge pages. Using larger pages can reduce page management overhead and improve system performancefor systems with large amounts of virtual memory and many running processes.

To calculate how many pages of each size you can successfully request, you can use the system host-memorylist and system host-memory-show commands to find out approximately how much memory is available
for VMs. Additional memory not included in these totals may also be available.

If the huge page request cannot be allocated from the available memory, an informative message is displayed. If the available memory is greater than the amount required by the huge page request, the unallocated memory is not used for VMs, and is not available for other uses.
After setting the memory allocations for a compute node, you can save them as a memory profile, and then apply the profile to other compute nodes. For more information, see [Creating and Using Memory Profiles]{#profiles}.

To specify the page size to use for a VM, see Specifying a Page Size for a VM on page 126.

You can edit the huge page attributes for a NUMA node from the web admin interface using the Memory tab on the Inventory pane.

Before requesting huge pages on a host, ensure that the host has enough available memory.

To provision huge memory:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. In the **Host Name** column, click the name of the locked host to open the **Inventory Detail** page for that host.

5. Click the **Memory** tab, then click **Update Hugepage Memory**.

6. Use the **Update Hugepage Memory** screen to set the desired huge pages for each NUMA node.

	For each available NUMA node, two fields are supplied:

		# of VM 2M Hugepages Node n

	The number of 2MiB pages to reserve for VM use on the NUMA Node. If no 2MiB pages are required, type 0.

		# of VM 1G Hugepages Node n

	The number of 1GiB pages to reserve for VM use on the NUMA Node. If no 1GiB pages are required, type 0.

7. Click Save.

	If there are insufficient resources to support the requested number of huge pages, a message appears. Review your calculations and submit a revised request.

6. [Unlock the host](/helion/openstack/carrier/admin/host/management/inventory/lock/) and wait for it to be reported as `Available`.

You can edit the huge page attributes for a NUMA node from the CLI.

1. Lock the affected host.

		system host-lock hostname

2. Use the following command to set the huge page attributes.

		system host-hugepage-update <hostname> processor -2M <2Mpages> -1G <1Gpages>

	where

	* `hostname` - the hostname or id of the compute node processor is the NUMA node of the compute node (0 or 1)
	* `2Mpages` - if the optional -2M argument is included, the number of 2MiB huge pages to make available (if none, use 0).
	* `1Gpages` - if the optional -1G argument is included number of 1GiB huge pages to make available (if none, use 0).

	For example, to allocate four 2 MiB huge pages for use by VMs on NUMA node 1 of compute node compute-0 :

		system host-hugepage-update compute-0 1 -2M 4

3. Unlock the host.

		system host-unlock hostname

4. Wait for the host to be reported as available.

		system host-list hostname

## Creating and Using Memory Profiles {#memory}

You can optionally save the huge pages configuration for a host as a profile, and apply the profile to other hosts.

For more information about huge page configurations, see [Huge Page Provisioning]{#huge}.

To create memory profiles:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. In the **Host Name** column, click the name of the locked host to open the **Inventory Detail** page for that host.

5. Click the **Memory** tab, then click **Create Memory Profile**.

6. In the **Create Memory Profile** screen, enter a name for the memory profile.

7. Click **Create Memory Profile** to save the profile and close the dialog box.

You can use the following CLI command to create a memory profile:

		system memprofile-add <memoryprofile> <hostid>

	where 

	* `memoryprofile` is the name or UUID of the memory profile
	* `hostid` is the name or UUID of the host from which to create the profile.

You can apply this profile to other hosts by editing the host settings in the web administration interface. For information about editing a host, see  [Working with Hosts](/helion/openstack/carrier/admin/host/management/inventory/host/). 

You can also use the following CLI command to apply a memory profile to a host:

	system host-apply-memprofile <memoryprofile> <hostid>

	where 

	* memoryprofile is the name or UUID of the memory profile
	* hostid is the name or UUID of the host.

To manage memory profiles, you can use the Memory Profiles tab on the System Inventory page, or you can use the following CLI commands:

* To list memory profiles:

		$ system memprofile-list

* To show details for a memory profile:

		system memprofile-show <memoryprofile>

	where memoryprofile is the name or UUID of the memory profile.

* To delete a memory profile:

		system memprofile-delete <memoryprofile>

	where memoryprofile is the name or UUID of the memory profile.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----