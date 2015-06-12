---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Creating Segmentation Ranges Using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/segment/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Creating Segmentation Ranges Using the CLI

You can use the CLI to add segmentation ranges to provider networks.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

This task assumes that provider networks have already been created in order to unlock the compute nodes and make the system operational. 

The scenarios require two provider networks of the VLAN type.

1. Create segmentation ranges on provider network `provider-net-a`.

		neutron providernet-range-create provider-net-a \
		--name pnet-a-common --description "External network access" --range 10-10

		neutron providernet-range-create provider-net-a \
		--name pnet-a-tenant1 --tenant-id ${tenant1_UUID} --description "Shared internal network" \
		--range 623-642

		neutron providernet-range-create provider-net-a \
		--name pnet-a-tenant2 --tenant-id ${tenant2_UUID} --description "Shared internal network" \
		--range 664-680

2. Create segmentation ranges on `provider-net-b`.

		neutron providernet-range-create provider-net-b \
		--name pnet-b-common --shared --description "External network access" --range 568-599

	The segmentation ranges are set.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----