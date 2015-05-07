---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Adding or Removing Ports"
permalink: /helion/commercial/carrier/dashboard/managing/network/ports/
product: carrier-grade

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/commercial/carrier/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/carrier/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/carrier/ga1/">NEXT &#9654;</a></p> -->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Adding or Removing Ports

A port is a connection point for attaching a single device, such as the NIC of a virtual server, to a virtual network. You can configure rich network topologies by creating and configuring networks and subnets, and then instructing other OpenStack services like Compute to attach virtual devices to ports on these networks.	

As an admin you can add ports to an existing subnet. Non-admin users can create subnets, but cannot create ports.

You can edit the device associated with a port and change the admin state, as needed.

As an admin, you can: 

* [Create a port](#createport)
* [Change the device associated with the port](#editport)
* [Change the admin state between Up or Down](#editport)
* [Delete a port](#deleteport)

### Create a port ### {#createport}

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Networks** link.

	The network(s) for the selected project appear. 

3. Click the name of the network you want to work with.

4. On the **Network Detail** page, click **Create Port**.

5. On the **Create Port** screen:

	a. Enter a descriptive name for the port.

	b. Leave the **Admin State** field selected to create a port in the active state. Or, clear the field to create a non-active port.

	c. Optionally, specify a device ID to assign the port to that device.
	
	d. Optionally, specify a device name to assign the port to that device.

	**Note:**If you do not know the device ID and name, you can create the port and later edit the port to add the ID and name.

6. Click **Create Port**.  

	A message appears indicating if the port was successfully created. When the port is created, an available fixed IP address out of one the designated subnets is associated with the port.

###Edit a port {#editport}

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Networks** link.

	The network(s) for the selected project appear. 

3. Click the name of the network you want to work with.

4. On the **Network Detail** page, for the port you want to delete, click **Edit Port**.

5. On the **Edit Port** screen:

	a. Leave the **Admin State** field selected to create a port in the active state. Or, clear the field to create a non-active port.

	b. Specify a device ID to assign the port to that device.

	c. Specify a device name to assign the port to that device.

6. Click **Save Changes**.  

	A message appears indicating if the port was successfully modified.

###Delete a port {#deleteport}

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Networks** link.

	The network(s) for the selected project appear. 

3. Click the name of the network you want to work with.

4. On the **Network Detail** page, for the port you want to delete, click **More &gt; Delete Port**.

5. In the confirmation screen, click **Delete Port**.  

	A message appears indicating if the port was deleted successfully.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
