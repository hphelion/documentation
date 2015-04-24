---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Creating Instances"
permalink: /helion/commercial/carrier/dashboard/managing/instances/view/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> 
-->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Viewing Compute Instance Details

Compute instances are virtual machines that run inside the cloud.

From the details screen, you can:

* View details on the instance
* View recent activity (same data as in `nova console-log`)
* Launch a Console window
* View the Instance Action List

To view information on your instance:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Overview** link.

3. Click the name of the instance to view. The following information is listed:

	* Name
	* ID
	* Status
	* Availability Zone
	* Date created
	* Time the instance has been up
	* Instance flavor
	* Instance RAM
	* Number of virtual CPUs
	* Disk size
	* Private and floating IP address
	* Security group and rules
	* Metadata
	* Attached volumes

4. Click **Log** to view recent activity (same data as in `nova console-log`)

5. Click **Action Log** to view the Instance Action List (same output as `nova instance-action-list`)

6. Click Console to [launch a Console Window](/helion/commercial/carrier/dashboard/managing/instances/console/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
