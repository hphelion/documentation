---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Requirements for the Deployment Scenarios"
permalink: /helion/openstack/carrier/deploy/requirements/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Requirements for the Deployment Scenarios

The Deployment Scenarios are built on a prepared HP Helion OpenStack Carrier Grade server cluster.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

The following resources are required for deployment:

* HP Helion OpenStack Carrier Grade server cluster with two provider networks of the VLAN type. The provider networks are used to realize tenant networks owned by the admin, tenant1, and tenant2 tenants.

	In the scenarios, the provider networks are named provider-net-a and provider-net-b. You can use any two provider networks. For information on provider network setup.

* At least one configured and unlocked compute node, connected to both provider networks as shown in the following figure.

	<img src="media/CGH-deploy-requirements.png">

	In the scenarios, a single compute node is used to host both VMs. In practice, you could use different compute nodes, each connected to both provider networks.

* HP Helion OpenStack Carrier Grade server environment provisioned with tenant networks, users, VM flavors, and a virtual router on each tenant network. 

	For information on setting up this environment, see [Setting Up the Scenario Environment](/helion/openstack/carrier/deploy/setting/).

* A sample guest disk image file, copied to a location on the active controller.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
