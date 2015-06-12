---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Networks Used in the Deployment Scenarios"
permalink: /helion/openstack/carrier/deploy/networks/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Networks Used in the Deployment Scenarios

Each virtual machine is attached to three networks.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

* **Private tenant network** (`tenant1-net` or `tenant2-net`) - These networks are created by the end users for private use. They can be used to connect the virtual machines to testing equipment.

* **Internal network** (`internal`) This network is created by the system administrator and shared by the tenants. It provides network connectivity between the two private tenant networks.

	The private tenant networks and the internal network illustrate the use of high-performance tenant networking on the Wind River Linux server platform. Each virtual machine provides a Layer 2 or Layer 3 switched path to link the tenant's private network and the internal network.

* **Management network** (`tenant1-mgmt-net` and `tenant2-mgmt-net`) -  These networks are created by the system administrator on behalf of the end users. Each management network connects using a virtual router to a shared external network owned by the system administrator. The shared external network provides access to other networks, including the open Internet, as needed.

	The management network illustrates how to configure an access network for managing instances. For example, it can be used to provide provisioning access over an Internet connection to a router application running on a virtual machine.

	**Note:** The management network, in combination with a virtual router, also provides connectivity between the virtual machine and platform services running on compute nodes. In particular, it enables communication with the OpenStack metadata server, which provides access to instance-specific data (user data) when an instance is started.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----