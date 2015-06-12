---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Creating Login Environment Files for Users"
permalink: /helion/openstack/carrier/deploy/cli/environ/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Creating Login Environment Files for Users

Using the CLI, you can create scripts to define user login environments.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

This exercise creates the scripts `/etc/nova/openrc.user1` and `/etc/nova/openrc.user2`. The new scripts are created by copying the original admin login environment script `/etc/nova/openrc`, and replacing the admin user identifier and its current password with new values.

1. Create the login environment script for user `user1`.

	a. Copy the environment script used by the user admin.

		cp /etc/nova/openrc /etc/nova/openrc.user1

	b. Edit the new file to include the new login credentials.

	The modified file should look similar to the one illustrated below:

		export OS_USERNAME=user1
		export OS_TENANT_NAME=tenant1
		export OS_PASSWORD=`TERM=linux /usr/bin/keyring get 'CGCS' user1`
		export OS_AUTH_URL=http://192.168.204.2:35357/v2.0/
		export CGTS_URL=http://192.168.204.2:6385
		export PS1='[\u@\h \W(keystone_user1)]\$ '

	**Note:** The IP address shown here is an example, based on the default controller node floating address suggested during the controller configuration script. Depending on your system configuration, the actual IP address may be different.

	The login environment script for user `user1`, with password `user1`, is now available.

2. Create the login environment script for user `user2`.

	a. Copy the environment script used by the user admin.

		cp /etc/nova/openrc /etc/nova/openrc.user2

	b. Edit the new file to include the new login credentials.

	The modified file should look similar to the one illustrated below:

		export OS_USERNAME=user2
		export OS_TENANT_NAME=tenant2
		export OS_PASSWORD=`TERM=linux /usr/bin/keyring get 'CGCS' user2`
		export OS_AUTH_URL=http://192.168.204.2:35357/v2.0/
		export CGTS_URL=http://192.168.9.204:6385
		export PS1='[\u@\h \W(keystone_user2)]\$ '

	The login environment script for user `user2`, with password `user2`, is now available.

	The two new user login environments are available. You can source them in order to execute commands with the corresponding user identities.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----