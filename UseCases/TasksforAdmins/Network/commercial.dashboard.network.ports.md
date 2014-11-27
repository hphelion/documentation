---
layout: default
title: "HP Helion OpenStack&#174; Adding or Removing Ports"
permalink: /helion/commercial/dashboard/network/ports/
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
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Adding or Removing Ports</h1>

A port is a connection point for attaching a single device, such as the NIC of a virtual server, to a virtual network. You can configure rich network topologies by creating and configuring networks and subnets, and then instructing other OpenStack services like Compute to attach virtual devices to ports on these networks.	</p>

As an admin you can add ports to an existing subnet. Non-admin users can create subnets, but cannot create ports.</p>

You can edit the device associated with a port and change the admin state, as needed.</p>

As an admin, you can: </p>

* [create a port](#createport)
* [change the device associated with the port](#editport)
* [change the admin state between Up or Down](#editport)
* [delete a port](#deleteport)

### Create a port ### {#createport}</h3>

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Networks</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

	The network(s) for the selected project appear. </p>

3. Click the name of the network you want to work with.</p>

4. On the <strong>Network Detail</strong> page, click <strong>Create Port</strong>.</p>

5. On the <strong>Create Port</strong> screen:</p>

	a. Enter a descriptive name for the port.</li>

	b. Leave the <strong>Admin State</strong> field selected to create a port in the active state. Or, clear the field to create a non-active port.</li>

	c. Optionally, specify a device ID to assign the port to that device.</li>
	
	d. Optionally, specify a device name to assign the port to that device.</p>

	**Note:**If you do not know the device ID and name, you can create the port and later edit the port to add the ID and name.</p>

6. Click <strong>Create Port</strong>.  

	A message appears indicating if the port was successfully created. When the port is created, an available fixed IP address out of one the designated subnets is associated with the port.</p>

<h3>Edit a port ### {#editport}</h3>

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Networks</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

	The network(s) for the selected project appear. </p>

3. Click the name of the network you want to work with.</p>

4. On the <strong>Network Detail</strong> page, for the port you want to delete, click <strong>Edit Port</strong>.</p>

5. On the <strong>Edit Port</strong> screen:</p>

	a. Leave the <strong>Admin State</strong> field selected to create a port in the active state. Or, clear the field to create a non-active port.</li>

	b. Specify a device ID to assign the port to that device.</li>

	c. Specify a device name to assign the port to that device.</li>

6. Click <strong>Save Changes</strong>.  

	A message appears indicating if the port was successfully modified.</p>

<h3>Delete a port ### {#deleteport}</h3>

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the <strong>Networks</strong> link on the <strong>Admin</strong> dashboard <strong>System</strong> panel.</p>

	The network(s) for the selected project appear. </p>

3. Click the name of the network you want to work with.</p>

4. On the <strong>Network Detail</strong> page, for the port you want to delete, click <strong>More &gt; Delete Port</strong>.</p>

5. In the confirmation screen, click <strong>Delete Port</strong>.  

	A message appears indicating if the port was deleted successfully.</p>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a></p>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*