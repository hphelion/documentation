---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Scaling Virtual Machine Resources"
permalink: /helion/commercial/carrier/dashboard/managing/instances/scaling/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Scaling Virtual Machine Resources

You can scale the resources of individual instances up or down.

Currently, the CPU resources for an instance are scalable.
For an instance to be scalable, the following requirements must be satisfied:

* The image used to launch the instance must support scaling. 
* The flavor used to launch the instance must be configured with maximum and minimum scaling limits (the scaling
range) for the resource.

When scaling a VM, use the credentials of the user that launched the VM. This ensures that quotas are correctly managed.

Depending on the resource being scaled, the scaling behavior applied by Titanium Server may be adjustable. For example, you can control which CPUs are released when the CPU resources for an instance are scaled down.

## CPU Scaling

When an instance is first started, all available vCPUs are brought online. If the instance is restarted, the number of online vCPUs is set to match the number when the instance was stopped. 

When CPU resources are scaled up, a vCPU is brought online from the pool of available vCPUs for the instance, subject to the maximum allowed by the flavor. The lowest-numbered offline vCPU is selected.

When CPU resources are scaled down, a vCPU is taken offline, subject to the minimum allowed by the flavor. By default, the highest-numbered online vCPU is selected.

## Setting the CPU scaling range

You can define the maximum and minimum CPU resources available to an instance by using a flavor.

* To set the maximum number of VCPUs for an instance, define a flavor with the required number of vCPUs.
* To set the minimum number of vCPUs, edit the flavor to include an Extra Spec. The minimum cannot be less than one.

You can use the web administration interface or the CLI to edit the flavor. 

### Setting the scaling range using the CLI

The Compute (Nova) service CLI parameter for setting the minimum number of CPUs is as follows:

		hw:wrs:min_vcpus=min

where min is the minimum number of CPUs.

**Example:**

		nova flavor-key flavor_name set
		hw:wrs:min_vcpus=integer_value

## Set the maximum scaling range using Horizon 

1. Launch the Horizon Dashboard.

	Specify the URL for the appropriate server environment, either the hLinux servers or Wind River Linux servers:

		hLinux: <IP_address>/horizon/auth/login/
		Wind River Linux: <IP_address>/auth/login/

2. Click the **Admin** dashboard, then the **System** panel, then the **Flavors** link.

3. In the **Flavors** screen, [create or edit a flavor](/helion/commercial/carrier/dashboard/managing/flavors/).

4. Specify the maximum number of vCPUs for the instance. In the **vCPU** field, enter the maximum number of vCPUs.

5. Click **Save** or **Create Flavor**.

## Set the maximum scaling range using Horizon

For flavors on Wind River Linux servers, you can set the minimum number of vCPUs.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

You can specify the minimum number of vCPUs by adding an [Extra Spec for the flavor](/helion/commercial/carrier/dashboard/managing/flavors/extra/).

1. In the **Flavors** list, click the **Flavor Name** for the flavor you want to edit.

2. On the **Extra Specs** tab, click **Create**.

3. In the **Create Flavor Extra Spec** dialog, select **Minimum Number of CPUs** from the **Extra Spec** drop-down
menu.

4. In the **Value** field, enter the minimum allowed number of vCPUs for the flavor.

5. Click **Create**.

----
