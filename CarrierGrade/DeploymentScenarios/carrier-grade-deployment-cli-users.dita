---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Creating Users Using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/users/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Creating Users Using the CLI

You can use the CLI to add users.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

This exercise creates the users `user1` and `user2`, and associates each one with a tenant.

1. Create user user1.

		keystone user-create --name user1 --pass user1 \

		--email user1@noreply.com --tenant ${tenant1_UUID}

2. Create user user2.

		keystone user-create --name user2 --pass user2 \

		--email user2@noreply.com --tenant ${tenant2_UUID}

	The two new users exist now in the system. No UUID variables are defined because they are not needed in any subsequent commands.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----