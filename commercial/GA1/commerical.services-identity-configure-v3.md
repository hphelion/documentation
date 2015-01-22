---
layout: default
title: "HP Helion OpenStack&#174; Identity Service Overview"
permalink: /helion/openstack/services/identity/configure/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/compute/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/imaging/overview/"> NEXT &#9654</a> </p>
-->

# HP Helion OpenStack&#174; Configuring Horizon for Keystone v3

Horizon does not support Keystone v3 or domains by default.  

As a result: 

* the admin cannot perform domain management using the Horizon dashboard
* if the admin creates a user though the CLI using a Keystone v3 token, the user will not be able to log in to the Horizon dashboard.  Any user created from within Horizon is able to log into Horizon, but the user will be in the default domain.  

To use Keystone v3 in Horizon (perhaps to use LDAP), they can manually change the settings (see below).  When Keystone v3 is enabled, all User, Project, and Domain management must be done via the CLI.  The Identity panel will not be visible in Horizon.

Steps to switch Horizon from Keystone v2 to Keystone v3:

1.	In each controller node, navigate to the `local_settings.py` file located in `/opt/stack/venvs/openstack/lib/python2.7/site-packages/openstack_dashboard/local/local_settings.py` 

2. Edit the file as follows:

	a. Set keystone version to V3:

		OPENSTACK_API_VERSIONS = {
		"identity": 3,
		}

	b. Enable Multi-domain support:

		OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT = True

	c. Point to Keystone V3 endpoint:

		OPENSTACK_KEYSTONE_URL = "http://%s:5000/v3" % OPENSTACK_HOST

2.	Restart the apache server in each controller nodes:

		sudo service apache2 restart
