---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Creating Tenants and Updating Quotas Using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/tenants/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Creating Tenants and Updating Quotas Using the CLI

You can use the CLI to create and configure tenants.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

This exercise creates the tenants tenant1 and tenant2, and sets up their resource quotas.

1. Log in to the active controller as the Keystone admin user.

		$ source /etc/nova/openrc

2. Create a project (or, tenant) `tenant1`.

		keystone tenant-create --name tenant1

3. Create a project (or, tenant) `tenant2`.

		keystone tenant-create --name tenant2

4. Set up the UUID variables for the new tenants.

		export tenant1_UUID=`keystone tenant-list | grep tenant1 | \
		awk '{print $2}'`

		export tenant2_UUID=`keystone tenant-list | grep tenant2 | \
		awk '{print $2}'`

5. Adjust networking resource quotas for the projects.

		neutron quota-update --subnet 32 --network 32 --port 128 \
		--tenant-id ${tenant1_UUID}

		neutron quota-update --subnet 32 --network 32 --port 128 \
		--tenant-id ${tenant2_UUID}

6. Adjust VM quotas for the tenants.

		{tenant1_UUID} --instances 20 -- cores 40 \
		--floating_ips 20

		nova quota-update ${tenant2_UUID} --instances 20 -- cores 40 \
		--floating_ips 20

7. Adjust networking resource quotas for the tenant admin.

		neutron quota-update --subnet 32 --tenant-id {admin_tenant_UUID}

	The two additional tenants are available now, with quotas established.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----