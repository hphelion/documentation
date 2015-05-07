---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Pinning a vCPU to a Shared Physical CPU"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/extra/vcpu/pin/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Pinning a vCPU to a Shared Physical CPU

You can pin a vCPU to a shared physical CPU by using a flavor with the required extra specification.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>


You can set up a shared physical CPU on the host to run low-load or non-real-time tasks for multiple VMs, freeing other cores on the host for dedicated high-load tasks. You can then use an extra spec to pin a specified vCPU to the shared physical CPU.

**Note:** To use this extra spec, you must define a shared physical CPU on at least one host.

You must also set the CPU Policy extra specification for the flavor to Dedicated. This enables the high-load vCPUs for the instance to be pinned.

To add this extra spec to a flavor using the Horizon dashboard, use the VCPU Model selection in the [Create Flavor Extra Spec drop-down menu](/helion/commercial/carrier/dashboard/managing/flavors/extra/). 


To set the Shared VCPU ID from the CLI, use a command of the following form:

	nova flavor-key flavor_name set
	hw:wrs:shared_vcpu=vcpu_id

where `vcpu_id` is an integer that identifies the vcpu (starting from 0).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
