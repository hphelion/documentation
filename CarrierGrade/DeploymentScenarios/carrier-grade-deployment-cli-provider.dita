---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Establishing Provider Networks Using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/provider/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Establishing Provider Networks Using the CLI

You can use the CLI to add the provider networks required to support tenant networks.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

Provider networks are required before compute nodes can be unlocked. For this reason, they are often set up as part of system installation.

The scenarios assume that two provider networks, provider-net-a and provider-net-b, have already been set up as part of system installation. For convenience, the instructions to set up these provider networks are repeated here. If you already have two provider networks with different names, you can use them instead, substituting their names in the following exercises.

For more information about setting up provider networks, see the *HP Helion OpenStack Carrier Grade Software Installation Guide: Configuring Provider Networks*.

1. Log in to the active controller as the Keystone admin user.

		source /etc/nova/openrc

2. On the active controller's console, create the two example provider networks.

	neutron providernet-create provider-net-a --type vlan

	neutron providernet-create provider-net-b --type vlan

	Both provider networks are created as type vlan. This means that they can be segmented, or restricted to operate over a range of specific VLAN identifiers.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----