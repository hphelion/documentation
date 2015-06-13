---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Pinning a Guest NUMA Node to a Host NUMA Node"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/extra/numa/pin/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Pinning a Guest NUMA Node to a Host NUMA Node

You can use flavor extra specs or image properties to pin a guest NUMA node to a host NUMA node.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

By default, when instances are launched or migrated, the virtual NUMA nodes defined for the VMs are mapped to available host NUMA nodes. You can optionally designate a specific host NUMA node for a virtual NUMA node, using either a flavor extra specification (which takes the general form hw:specification), or an image property (which takes the general form hw_specification). This enables you to co-locate VM processes with AVS vSwitch processes for high-performance networking.


**Note:** Multiple NUMA nodes for VMs are not currently supported.

For a VM with only one virtual NUMA node, you can use an extra specification to specify the host NUMA node. 

To add this extra spec to a flavor using the Horizon dashboard, use the VCPU Model selection in the [Create Flavor Extra Spec drop-down menu](/helion/commercial/carrier/dashboard/managing/flavors/extra/). Horizon provides fields to associate a Guest NUMA Node with a Host NUMA
Node. 

You can also pin NUMA nodes using the CLI. The following extra specification assigns a specific host NUMA node
to a virtual NUMA node:

		hw:numa_node.vnode_id=pnode_id

	where
	* `vnode_id` is the number used to identify the virtual NUMA node (0 for the first node, 1 for the second, and so on).
	* `pnode_id` is the number used to identify the host NUMA node (0 for the first node, 1 for the second, and so on).

	**Example:** 

	For the flavor `numa.pinned.asym`, use the following command to assign virtual NUMA node 0 to host NUMA node 1:

		nova-flavor-key numa.pinned.asym set hw:numa_node.0=1