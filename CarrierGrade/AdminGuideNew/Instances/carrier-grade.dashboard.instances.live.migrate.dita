---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Live Migration of Virtual Machines"
permalink: /helion/commercial/carrier/dashboard/managing/instances/live/migrate/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Live Migration of Virtual Machines


Live migration occurs when a virtual machine is transferred to execute on a different compute node with minimal disruption of the guest applications. This can happen automatically, or upon request by the system administrator.

While executing a live migration operation, HP Helion OpenStack Carrier Grade manages the state of each virtual machine in such a way that it appears unmodified on the migrated instance. This includes:

* system memory, both kernel and user space
* access to all non-local storage resources, including LVM/iSCSI and Cinder
* all the virtual machine networking options (unmodified/virtio, AVP kernel driver, AVP DPDK Poll Mode Driver), and AVS

The Admin user can [initiate a live migration manually](/helion/commercial/carrier/dashboard/managing/instances/migrate/live/) from the Horizon dashboard. 

## Live Migration and Server Group Policies

Virtual machines launched as part of a [Server Group](/helion/commercial/carrier/dashboard/managing/groups/) are subject to additional live migration restrictions determined
by the selection of scheduling policy. 

* Affinity policy. The goal of this policy is to schedule all virtual machines in the Server Group to execute on the same host.

	If the Best Effort flag of the Server Group is clear, then the individual instances cannot be migrated since this would break the affinity policy.

	Note that this means that a compute node running instances in a Server Group with affinity policy in strict mode cannot be locked. An alternative mode of operation is to always set the Best Effort flag and then manually migrate the instances to a common host.

	If the Best Effort flag of the Server Group is set, then any individual instances can migrate to any other available host.

* Anti-affinity policy. The goal of this policy is to schedule each virtual machine in the Server Group to execute on a different host.

	If the Best Effort flag of the Server Group is clear, then the individual instances can migrate provided that thereare suitable hosts where no other Server Group instance is running.

	If the Best Effort flag of the Server Group is set, then any individual instances can migrate to any other available host.

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
