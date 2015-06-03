---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host CPUs"
permalink: /helion/openstack/carrier/admin/host/management/inventory/processor/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host CPUs
<!-- From the Titanium Server Admin Guide -->

The Processor tab on the Inventory Detail page presents processor details for a host.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

This page details:

* Viewing details of host CPUs](view)
* Creating CPU profiles](#create)
* Editing CPU assignments](#edit)
* Viewing NUMA node resources on a host](#numa)
* Designating shared physical CPUs on a compute host](shared)


## Viewing details of a host CPUs {view}

To view the host CPUs:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. In the Host Name column, click the name of the locked host to open the **Inventory Detail** page for that host.

5. Select the Processor tab.

The Processor tab includes the following items:

* processor model 
* number of processors
* number of cores per processor
* Hyper-Threading status (enabled or disabled)
* CPU assignments 

## Creating CPU profiles {#create}

To create a CPU profile:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. In the Host Name column, click the name of the locked host to open the **Inventory Detail** page for that host.

5. Click the **Processor** tab.

6. Click the **Create CPU Profile** button.

	Clicking this button displays the **Create CPU Profile** window, where the current CPU assignment can be given a name.


## Editing CPU Assignments {#edit}

Currently, the number of platform cores is limited to one for each host. This is indicated by the read-only platform fields that allocate one core from processor 0.

AVS cores can be configured for each processor independently. This means that the single logical vSwitch running on a compute node can make use of cores in multiple processors, or NUMA nodes. Optimal data path performance is achieved however, when all AVS cores, the physical ports, and the virtual machines that use them, are all running on the same processor. However, having AVS cores on all processors ensures that all virtual machines, regardless of the core they run on, are efficiently serviced. The example allocates two cores from processor 0 to the AVS threads.

One physical core per processor can be configured as a shared CPU, which can be used by multiple VMs for low-load tasks. To use the shared physical CPU, each VM must be configured with a shared vCPU ID. For more information, see Pinning a vCPU to a Shared Physical CPU.

All other cores are automatically available for allocation to virtual machine threads.

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. [Lock the host](/helion/openstack/carrier/admin/host/management/inventory/lock/) to make changes. Click **More** then select **Lock Host**.

	Wait for the host to be reported as Locked.

5. In the Host Name column, click the name of the locked host to open the **Inventory Detail** page for that host.

6. Click the **Processor** tab.

7. Click the **Edit CPU Assignments** button.

	This button is available only when the host is in the locked state.

	Clicking this button displays the **Edit CPU Assignments** window, where the current CPU assignment can be changed.

## Designating Shared Physical CPUs on a Compute Host {shared}

You can designate one shared physical CPU per physical processor on a compute host to run low-load or non-realtime tasks for multiple VMs, freeing other cores on the host for dedicated high-load tasks.
You can use the web administration interface or the CLI to set up shared physical CPUs.

To designate shared CPUs:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. [Lock the host](/helion/openstack/carrier/admin/host/management/inventory/lock/) to make changes. Click **More** then select **Lock Host**.

	Wait for the host to be reported as Locked.

5. In the **Host Name** column, click the name of the locked host to open the **Inventory Detail** page for that host.

6. Click the **Processor** tab.

7. Click **Edit CPU Assignments**.

	This control is available only if the host is locked.

8. In the **Edit CPU Assignments** screen, use the **Shared Function** section to enable shared physical CPUs.

	You can designate one core on each physical processor for use as a shared physical CPU. The actual core is assigned from the pool of available cores for the processor.

	For example, to use a core on processor 0 as a shared physical CPU, set the # of Shared Physical Cores on Processor 0 to 1. Valid values are 1 (to assign a core as a shared physical CPU) or 0 (if a shared physical CPU is not required on the processor.)

To configure a VM to use a shared physical CPU, see Pinning a vCPU to a Shared Physical CPU.

To add or remove a shared physical CPU from the CLI, use a command of the following form:

	system host-cpu-modify -f shared -p<processor> use_shared <hostname>

	where: 
	* `processor` is the number of the physical processor (0 or 1)
	* `use_shared` specifies whether to use a shared physical CPU (0 for no, 1 for yes)
	* `hostname` is the name of the compute host

For example, to set up a shared physical CPU on processor 0 of compute-0:

~(keystone_admin)$ system host-cpu-modify -f shared -p0 1 compute-0




## Viewing NUMA Node Resources on a Host {#numa}

You can use the CLI to display the NUMA node resources for a host.

Host NUMA nodes can be pinned, or assigned for use by VMs. 

For example, a VM can be configured to use NUMA node 0, so that when the VM is launched or migrated, the virtual machine scheduler locates a host node with an available NUMA node 0, and dedicates that NUMA node for use by the VM. For more about pinning NUMA nodes, see Pinning a Guest NUMA Node to a Host NUMA Node.

The resources of the pinned NUMA node, including the number of available CPUS and the available memory, must be sufficient to meet the requirements of the VM, which can be specified independently. For more about specifying NUMA node requirements for a VM, see Configuring the NUMA Node Allocations for a VM. 

To ensure that a given host NUMA node can support the VM requirements, you can review the CPU and memory complements for host NUMA nodes.

To view the CPU complement for a NUMA Node (that is, for a socketed physical processor), use the vm-topology command. 





<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----