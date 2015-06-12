---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Setting Up Tenant Networks Using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/tenant/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Setting Up Tenant Networks Using the CLI

You can use the CLI to set up tenant networks and their associated IP subnets.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

This exercise sets up the tenant networks `external-net`, `internal-net`, `tenant1-mgmt-net`, and `tenant2-mgmt-net`. IP subnets are created for the first two networks only. IP subnets for the tenant networks are created by the users `user1` and `user2` in a separate task.

1. Create and configure the tenant network `external-net`.

	a. Create the tenant network.

		neutron net-create --tenant-id ${admin_tenant_UUID} \
		--provider:physical_network=provider-net-a \
		--provider:segmentation_id=10 --router:external external-net

	b. Define the IP subnet.

		neutron subnet-create --tenant-id ${admin_tenant_UUID} \
		--name external-subnet --gateway 192.168.2.1 --disable-dhcp external-net 192.168.2.0/24

	c. Set up the UUID variable for the new tenant network.

		export external_net_UUID=`neutron net-list \
		| grep external-net | awk '{print $2}'`

2. Create and configure the tenant network `internal-net`.

	a. Create the tenant network.

		neutron net-create --tenant-id ${admin_tenant_UUID} \
		--provider:physical_network=provider-net-b \
		--shared internal-net

	b. Define the IP subnet.

		neutron subnet-create --tenant-id ${admin_tenant_UUID} \
		--name internal-subnet \
		--no-gateway --vlan-id 5 internal-net 10.1.1.0/24

	**Note:** The `--vlan-id 5` option indicates that packets sent to this subnet by any virtual machine must be tagged with VLAN ID 5.

	c. Set up the UUID variable for the new tenant network.

		export internal_net_UUID=`neutron net-list \
		| grep internal-net | awk '{print $2}'`

3. Create the tenant network `tenant1-mgmt-net`.

	a. Create the tenant network.

		neutron net-create --tenant-id ${tenant1_UUID} \
		--provider:physical_network=provider-net-a tenant1-mgmt-net

	b. Set up the UUID variable for the new tenant network.

		export tenant1_mgmt_net_UUID=`neutron net-list \
		| grep tenant1-mgmt-net | awk '{print $2}'`

4. Create the tenant network `tenant2-mgmt-net`.

	a. Create the tenant network.

		neutron net-create --tenant-id ${tenant2_UUID} \
		--provider:physical_network=provider-net-a tenant2-mgmt-net

	b. Set up the UUID variable for the new tenant network.

		export tenant2_mgmt_net_UUID=`neutron net-list \
		| grep tenant2-mgmt-net | awk '{print $2}'`

	The external and internal tenant networks are set up and ready to be used. The tenant management networks are available, but their IP subnets have yet to be created.

	The tenant networks are assigned segmentation IDs automatically. You can list the assigned IDs for a provider network as follows:

		neutron net-list-on-providernet provider-net-a

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----