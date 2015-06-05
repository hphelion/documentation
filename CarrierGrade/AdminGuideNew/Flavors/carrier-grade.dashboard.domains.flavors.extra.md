---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring Flavor Extra Specifications"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/extra/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring Flavor Extra Specifications

Compute flavors are machine configurations that describe the amount of memory, number of CPUs, and storage capacity of instances. 

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

You can edit an existing flavor to include additional attributes using extra specifications.

Extra specifications are key-value pairs you can add to an existing flavor to be included when the flavor is used with a new virtual machine. 

The **Extra Specs** tab lists extra specifications that have been added for the flavor. To modify an existing entry, use the **Edit** button. To remove a single entry, open the drop-down menu associated with the extra spec, and select **Delete extra spec** from the menu. You can also remove all extra specs at once using the **Delete extra specs** button.

To add a new extra specification:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

	* Use the IP address for the appropriate region where you want to make the change, either: the hLinux region or the Wind River Linux region.

2. Click the **Admin** dashboard, then the **System** panel, then the **Flavors** link.

	The flavors in the domain are listed. 

3. Click the name of the flavor you want to modify.

4. On the **Extra Specs** tab, click **Create**.

5. Use the Extra Spec drop-down list to add specifications. The following options are available:

	* Custom Extra Spec. Available for internal use only.
	* VCPU Model. The CPU model to use with the virtual machine. For more information, see [Specifying the VCPU Model for a VM](/helion/commercial/carrier/dashboard/managing/flavors/extra/vcpu/).
	* CPU Policy. The policy for assigning dedicated physical or logical CPU resources to the VM. For more information, see [Specifying Dedicated CPUs for a VM](/helion/commercial/carrier/dashboard/managing/flavors/extra/dedicated/cpu/).
	* NUMA node. The NUMA node to use when launching a virtual machine. For more information, see [Configuring the NUMA Node Allocations for a VM](/helion/commercial/carrier/dashboard/managing/flavors/extra/numa/).
	* Shared VCPU ID. The ID of a virtual CPU scheduled to run on a shared physical CPU in the compute host. For more information, see [Pinning a vCPU to a Shared Physical CPU](/helion/commercial/carrier/dashboard/managing/flavors/extra/vcpu/pin/).
		**Note:** To use this extra specification, you must also set the CPU Policy extra specification for the flavor to Dedicated.
	* Memory Page Size. Sets the page size for VM memory. For more information, see [Specifying a Page Size for a VM](/helion/commercial/carrier/dashboard/managing/flavors/extra/page/).
	* Guest Heartbeat. Enables the Heartbeat API for use by guests on the VM. For more information, see [Enabling the Heartbeat API for a VM](/helion/commercial/carrier/dashboard/managing/flavors/extra/api/).
	* VCPU Scheduler Policy. Sets the scheduling priority for non-boot virtual CPUs. For more information, see [Configuring vCPU Scheduling and Priority](/helion/commercial/carrier/dashboard/managing/flavors/extra/vcpu/sched/)
	* Minimum Number of CPUs. Sets the minimum number of virtual CPUs for the flavor.
	* Local Storage. Specifies whether to use local or remote ephemeral storage resources. For more information, see [Specifying Local Storage for a VM](/helion/commercial/carrier/dashboard/managing/flavors/extra/vcpu/storage/).

6. Click **Create** to create a new the flavor.

A message is displayed on successful creation.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Edit a flavor ### {#editflavor}

To edit a flavor:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

	* Use the IP address for the appropriate region where you want to make the change, either: the hLinux region or the Wind River Linux region.

2. Click the **Admin** dashboard, then the **System** panel, then the **Flavors** link.

	The flavors in the domain are listed. 

3. For the flavor you want to modify, click **Edit Flavor**. 

4. In the **Edit Flavor** screen, click the **Flavor Info** tab (should be active).

5. Use the **Flavor Info** and **Flavor Access** tabs to modify the flavor as needed. See <a href="#createflavor">Create a flavor</a> for a description of each field.

6. When done editing, click **Save**.

A message is displayed on successful edit.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Managing Metadata {#editmeta}

Compute uses a metadata service for virtual machine instances to retrieve instance-specific data. 

You can add and remove metadata for flavors, see [Managing Metadata](/helion/commercial/carrier/dashboard/managing/metadata/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Delete a flavor ### {#deleteflavor}

Instances that use the flavor are not affected when a flavor is deleted.

To delete a flavor:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Flavors** link.

	The flavors in the domain are listed. 

3. For the flavor you want to modify, click the arrow icon in the **Actions** menu and select **Delete Flavor**. 

4. In the confirmation screen, click **Delete Flavor**.
<p>A message is displayed on successful delete.</p> 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
