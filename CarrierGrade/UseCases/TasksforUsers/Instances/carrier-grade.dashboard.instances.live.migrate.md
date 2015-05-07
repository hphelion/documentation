---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Resizing Instances"
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Live Migration of Virtual Machines


Live migration occurs when a virtual machine is transferred to execute on a different compute node with minimal
disruption of the guest applications. This can happen automatically, or upon request by the system administrator.
While executing a live migration operation, the Titanium Server manages the virtual machine's state in such a way
that it appears unmodified on the migrated instance. This includes:
• system memory, both kernel and user space
• access to all non-local storage resources, including LVM/iSCSI and Cinder
• all the virtual machine networking options (unmodified/virtio, AVP kernel driver, AVP DPDK Poll Mode Driver),
and AVS
Automatic migration of virtual machines occurs whenever the administrator initiates a locking operation on a compute
node. In this case, the Titanium Server first live-migrates all virtual machine instances off of the compute node before
administratively locking it.
The admin user can also initiate live migrations manually from the Instances page available by clicking the option
Instances on the Admin side pane of the web management interface. The More button of the selected instance
provides the option Live Migrate Instance. When selected, the Live Migrate window is displayed as illustrated
below:
The following fields are available:
Current Host
A read-only field displaying the compute node the selected instance is currently running on.
New Host
The target compute node for the migration. The default value is to let the Titanium Server auto-schedule the
virtual machine following the current scheduling guidelines and constraints. Optionally, you can manually select
the target compute node.
Note that the set of available target compute nodes for the migration is still subject to the scheduler constraints
from the virtual machine flavor and other systems options that might be in place.
Titanium Server | Managing Virtual Machines | 133
Live Migration and Server Group Policies
Virtual machines launched as part of a Server Group are subject to additional live migration restrictions determined
by the selection of scheduling policy. See Server Groups on page 129 for details.
Affinity policy
The goal of this policy is to schedule all virtual machines in the Server Group to execute on the same host.
If the Best Effort flag of the Server Group is clear, then the individual instances cannot be migrated since this
would break the affinity policy.
Note that this means that a compute node running instances in a Server Group with affinity policy in strict mode
cannot be locked. An alternative mode of operation is to always set the Best Effort flag and then manually
migrate the instances to a common host.
If the Best Effort flag of the Server Group is set, then any individual instances can migrate to any other available
host.
Anti-affinity policy
The goal of this policy is to schedule each virtual machine in the Server Group to execute on a different host.
If the Best Effort flag of the Server Group is clear, then the individual instances can migrate provided that there
are suitable hosts where no other Server Group instance is running.
If the Best Effort flag of the Server Group is set, then any individual instances can migrate to any other available
host.
<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
