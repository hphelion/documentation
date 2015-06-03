---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Specifying Dedicated CPUs for a VM"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/extra/dedicated/cpu/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Specifying Dedicated CPUs for a VM

You can specify the use of dedicated CPUs for a VM using an extra specification.

When a virtual machine is launched, its virtual CPUs use resources from a shared pool of cores on the target compute node. Each virtual CPU is scheduled for processing as an independent thread. The CPU Policy extra specification affects two aspects of the scheduling process: the CPU affinity mask, and the CPU over-commit limit.

If the CPU Policy is set to Dedicated, each virtual CPU thread is scheduled to run on a single core exclusively. The cores are removed from the shared resource pool, and each virtual CPU is scheduled to run as a dedicated thread on its corresponding target core. The cores are returned to the shared pool upon termination of the virtual machine.

Selecting Dedicated effectively affines each virtual CPU thread to a dedicated core, and ensures that the core is not shared with other virtual CPU threads.

The Dedicated setting is recommended for Carrier-Grade requirements to prevent over-commitment of host resources, and to minimize the impact that scheduling events may have on the latency and throughput responses of the guest kernel.

If the CPU Policy is set to Shared, the virtual CPU threads are scheduled to run on any available core on the compute node. Also, they can be moved within the compute node from one core to another at any time. In a sense, the virtual CPU threads can be considered to be floating threads. This is the CPU affinity mask portion of the scheduling action.

Additionally, when Shared is selected, the virtual CPU threads can share the core with other threads from the same virtual machine or other virtual machines. The default OpenStack virtual CPU over-commit ratio is 16:1, which means that up to 16 virtual CPU threads can share a single core. Over-committing of virtual CPUs is highly
discouraged in Carrier-Grade operations.

To add this extra spec to a flavor using the web administration interface, use the CPU Policy selection in the Create Flavor Extra Spec drop-down menu. To access this menu, see [Flavor Extra Specifications](/helion/commercial/carrier/dashboard/managing/flavors/extra/).

To add the extra spec using the CLI, use the following command:

		nova flavor-key flavor_name set hw:cpu_policy=policy

	where policy is either dedicated or shared.

**Note:** Using a single compute node for both shared and dedicated threads is not recommended. For clusters that must support threads of both types, use a host aggregate for each type. For more information, see [Working with Hosts](/helion/openstack/carrier/admin/host/management/inventory/host/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
