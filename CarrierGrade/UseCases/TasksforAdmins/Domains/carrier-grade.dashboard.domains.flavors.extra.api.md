---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha):  Enabling the Heartbeat API for a VM"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/extra/api/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Enabling the Heartbeat API for a VM

You can accommodate the use of guest heartbeats on a VM using an extra specification.

<hr>
**Note:** This feature applies to the Wind River Linux region only.
<hr>

Select this option when you expect one or more of the guest applications running on the virtual machine to make use of the Titanium Server Heartbeat client API. For more information about the Heartbeat API, refer to the Titanium
Server Software Development Kit. The controller node starts heartbeat application-level polling cycles on virtual machines launched using a flavor with this option selected.

A guest application modified to use the Titanium Server Heartbeat client API can be more accurately monitored by
internal messaging within the virtual machine.

To add this extra spec to a flavor using the Horizon dashboard, use the VCPU Model selection in the [Create Flavor Extra Spec drop-down menu](/helion/commercial/carrier/dashboard/managing/flavors/extra/).

To enable the heartbeat API using the CLI, use the following command:

		nova flavor-key flavor_name set
		sw:wrs:guest:heartbeat=integer_value

	where integer_value is either 0 or 1.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
