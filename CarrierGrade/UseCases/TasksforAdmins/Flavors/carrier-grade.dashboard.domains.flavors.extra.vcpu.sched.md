---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta):  Configuring vCPU Scheduling and Priority"
permalink: /helion/commercial/carrier/dashboard/managing/flavors/extra/vcpu/sched/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring vCPU Scheduling and Priority

You can assign the Linux scheduler and priority for non-boot virtual CPUs using an extra specification.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

This extra specification applies to non-boot virtual CPUs, and is available only for flavors that define more than one virtual CPU. For the boot CPU, the Linux scheduler and priority are fixed to non-real-time, with a nice priority of 0.

For each additional virtual CPU, the available options are:

* Default Policy - Assigns a non-real-time scheduling policy with nice priority of 0.
* Real-Time FIFO - Assigns a real-time, first-in-first-out policy with nice priority of 1‒99, specified in the associated VCPU Priority
field.
* Real-Time Round Robin - Assigns a real-time, round-robin policy with nice priority of 1‒99, specified in the associated **VCPU Priority** field.

To add this extra spec to a flavor using the Horizon dashboard, use the VCPU Model selection in the [Create Flavor Extra Spec drop-down menu](/helion/commercial/carrier/dashboard/managing/flavors/extra/).

You can specify the scheduler policy and priority for non-boot virtual CPUs from the CLI using the `hw:wrs:vcpu:scheduler` parameter on the `nova flavor-key` command. This parameter accepts a semicolon-separated list of scheduler:priority:vcpus values as follows.

* scheduler - The scheduler policy. One of other, fifo, or rr to indicate non real-time, FIFO, and Round Robin policies respectively.
* priority - The real-time scheduler priority. A value between 1 and 99.
* vcpus - A list of virtual CPUs as a comma-separated list (1,2,3) or a range specification (1-3). Virtual CPU number 0
refers to the boot virtual CPU and therefore cannot be used.

**Examples**

To set real-time schedulers and priorities on virtual CPU 1 (FIFO, 50) and virtual CPU 2 (Round Robin, 80):

	nova flavor-key flavor_name set
	hw:wrs:vcpu:scheduler fifo:50:1;rr:80:2

To set real-time Round Robin schedulers for three virtual CPU (Round Robin, 80):

	nova flavor-key flavor_name set
	hw:wrs:vcpu:scheduler rr:80:1-3

To set the FIFO scheduler with priority 50 on all virtual CPUs:

	nova flavor-key flavor_name set
	hw:wrs:vcpu:scheduler=fifo:50

To reset all scheduler settings to default values (non real-time scheduler with priority 0):

	nova flavor-key flavor_name unset
	hw:wrs:vcpu:scheduler


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
