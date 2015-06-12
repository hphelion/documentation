---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Setting Up Flavors Using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/flavors/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Setting Up Flavors Using the CLI

You can use the CLI to define virtual hardware resource profiles, or flavors, for use when launching virtual machines.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

Available flavors and their IDs can be listed using the following command:

	nova flavor-list

1. Define the flavor `example-guest.tiny`.

		nova flavor-create example-guest.tiny 100 512 0 1 \
		--dedicated-cpus true

	The flavor `example-guest.tiny` is created with ID 100. New virtual machines using this flavor are allocated 512 MB of memory, no disks, and one dedicated virtual CPU.

2. Define the flavor `example-guest.small`.

		nova flavor-create example-guest.small 101 512 0 2 \
		--dedicated-cpus true

	The flavor `example-guest.small` is created with ID 101. New virtual machines using this flavor are allocated 512 MB of memory, no disks, and two dedicated virtual CPUs.

	The two flavors `example-guest.tiny` and `example-guest.small` are now available. You can use them as resource allocation directives when launching new virtual machines.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----