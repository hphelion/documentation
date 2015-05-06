---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Specifying the VCPU Model for a VM"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/extra/vcpu/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Specifying the VCPU Model for a VM

You can select a particular VCPU model for a VM in order to leverage advanced CPU features such as SSE4.2, AES, or AVX on the compute nodes.

When a virtual machine is launched, a Nova scheduler filter restricts the target compute nodes to those with available cores of the requested model, or better. If no such compute node is available, the error No valid host was found is reported.

If no VCPU model is specified, the default QEMU virtual processor is used.

The following selections are available:

* Intel Core i7 9xx (Nehalem Class Core i7)
* Intel Westmere E56xx/L56xx/X56xx (Nehalem-C)
* Intel Xeon E312xx (Sandy Bridge)
* Intel Core Processor (Haswell)

**Note:** The Haswell model does not currently support transactional synchronization extensions (TSX).

To add this extra spec to a flavor using the Horizon dashboard, use the VCPU Model selection in the [Create Flavor Extra Spec drop-down menu](/helion/commercial/carrier/dashboard/managing/flavors/extra/). 

You can also specify the extra spec from the CLI using the following command:

	nova flavor-key flavor_name set hw:cpu_model=cpu_model

where cpu_model is one of `Nehalem`, `Westmere`, `SandyBridge`, or `Haswell`.  If the hw:cpu_model parameter is not supplied with the `nova flavor-key` command, then the default QEMU model is used.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
