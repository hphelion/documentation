---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring the NUMA Node Allocations for a VM"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/extra/numa/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring the NUMA Node Allocations for a VM

You can use flavor extra specs or image properties to allocate virtual memory and vCPU resources to virtual NUMA nodes.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

By default, the memory and CPU resources defined for a flavor are assigned to a single virtual NUMA node, which is mapped to an available host NUMA node when an instance is launched or migrated. You can specify the use of multiple NUMA nodes using either flavor extra specifications (which take the general form hw:specification), or image properties (which take the general form hw_specification).

**Note:** Multiple NUMA nodes for VMs are not currently supported.

By default, the available CPU and memory resources for the flavor are distributed equally among the NUMA nodes. You can customize the distribution of resources. For example, given a flavor with two NUMA nodes, three vCPUs, and 1024 MB of RAM, you can assign one vCPU and 512 MB to virtual NUMA node 0, and two VCPUs and 512 MB to virtual NUMA node 1. The ability to allocate resources is useful when pinning virtual NUMA nodes to host NUMA nodes to optimize VM performance.

By default, the memory required for a virtual NUMA node is pinned to a single host NUMA node to ensure high performance. For applications where this is not a concern, you can relax the memory allocation requirements so that the memory for a virtual NUMA node can be drawn from more than one host NUMA node if necessary.

When deploying network guest images operating on the data path, it is advisable to co-locate the virtual machines, the AVS switch, physical ports, and all other networking elements on the same node.

Use of this option should be limited to cases where fine-tuning of the data path on guest applications is important.

**Caution:** If the virtual CPUs cannot be allocated to run on the specified node on any compute node, the virtual machine may fail to launch

1. Declare the number of NUMA nodes to expose to the guest.

	The following extra specification sets the number of NUMA nodes:

		hw:numa_nodes=n

	where n is the number of NUMA nodes to expose (1 or more).

	For example, given the flavor numa.pinned.asym, use the following command to expose two NUMA nodes.

	nova flavor-key numa.pinned.asym set hw:numa_nodes=2

	To set an image property instead, you can use the following command:

		nova image-meta image hw_numa_nodes=2

2. **Optional:** For each NUMA node, assign a list of CPUs.

	This step is optional. By default, available CPUs for the flavor are distributed evenly across the available NUMA nodes.

	The following extra specification assigns CPUs to a NUMA node:

		hw:numa_cpus.vnode_id=cpu_list

	where:

	* `vnode_id` is the number used to identify the virtual NUMA node (0 for the first node, 1 for the second, and so on).
	* `cpu_list` is a comma-separated list of vCPUs to assign to the node. The vCPUs for the flavor are enumerated beginning with 0.

	**Example:** 

	For flavor numa.pinned.asym, use the following command to assign vCPU 0 to the first NUMA node, and vCPUs 1 and 2 to the second NUMA node:

		nova flavor-key numa.pinned.asym set hw:numa_cpus.0=0  \ hw:numa_cpus.1=1,2

3. **Optional:** For each NUMA node, assign an amount of memory.

	This step is optional. By default, available memory for the flavor is distributed evenly across the available NUMA nodes.

	The following extra specification assigns memory to a NUMA node:

		hw:numa_mem.vnode_id=ram_size

	where:
	* `vnode_id` is the number used to identify the virtual NUMA node (0 for the first node, 1 for the second, and so on).
	* `ram_size` is the amount of RAM in MB.

	**Example**

	 For flavor `numa.pinned.asym`, use the following command to assign 512 MB of RAM to each of two NUMA nodes:

		nova flavor-key numa.pinned.asym set hw:numa_mem.0=512 \ hw:numa_mem.1=512

4. **Optional:** Specify whether memory for the flavor can be drawn from more than one NUMA node if necessary.

	This step is optional. By default, memory is allocated from the designated host NUMA node only.

	To control whether memory for the flavor can be drawn from more than one host NUMA node, use the following extra specification:

		hw:numa_mempolicy=policy

	where `policy` is either strict (to use only memory from the designated host NUMA node) or preferred (to permit memory from other host NUMA nodes to be used if necessary).

	**Note:** Allocation of memory across NUMA node boundaries is not currently supported.

To pin the virtual NUMA nodes to host NUMA nodes, see [Pinning a Guest NUMA Node to a Host NUMA Node](/helion/commercial/carrier/dashboard/managing/flavors/extra/numa/pin/).

## Viewing the NUMA Node Configuration for a VM {#viewing}

You can use the CLI to display the NUMA node configuration for a VM.

Use the following command:

		nova show instance

where `instance` is the name or UUID of the instance.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
