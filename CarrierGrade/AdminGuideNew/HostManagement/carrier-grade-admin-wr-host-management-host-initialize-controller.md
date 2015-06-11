---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Initializing and Configuring Controller-1"
permalink: /helion/openstack/carrier/admin/host/initialize/controller1/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Initializing and Configuring Controller1
<!-- From the Titanium Software Install Guide -->

You must assign a host as a second controller to provide redundancy for controller-0.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>


Before initializing a node, ensure that the following conditions are satisfied:

* The node must meet the hardware requirements for the personality to be assigned. For more information, see Hardware Requirements
* `Controller-0` must be installed and operational.
* The node must be connected to the internal management network using an Ethernet interface configured for PXE boot.
* The node must be configured in the BIOS to boot from the internal management network.

To install and configure `Controller-1`:

1. Power on the node to be configured as `Controller-1`.

	**Note:** To ensure you can correctly identify hosts as you install them, power on and configure each new node one at a time.

2. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

	The new node is listed with an empty Host Name and Personality.

4. Assign the node's personality: 

	a. Click **Edit Host** for the new host.

	b. In the Edit Host screen, select **Storage** from the **Personality** list.

	c. Optional: Enter a physical Location for the node to help identify it.

	d. Click **Save** to initialize and configure the new node.

	The node is restarted automatically, and a display-device menu appears on the node console.

	<img src="media/CGH-WR-Node-Console.png">

5. Optional: Select the display device to use during initialization.
The personality (Controller, Compute, or Storage) is confirmed in the menu. If you do not change the selection, the default is applied automatically after a few seconds.

	* Serial &lt;personality> Node Install (default) - Use the serial port to display messages. You can monitor the port using the terminal server.
	* Graphics &lt;personality> Node Install - Use the console port in graphics mode to display messages. This selection works with most console displays.
	* Graphics Text &lt;personality> Node Install - Use the console port in text mode to display messages. This is a safe option for nodes that do not support graphics mode.

6. Wait while the node is configured and rebooted.

	After a few minutes, the node is reported as Locked, Disabled, and Online in the Hosts list.

	**Caution:** To ensure a successful installation, wait for the node to be reported as Locked, Disabled, and Online, and ensure that the login prompt appears on the host console. If the process is interrupted prematurely, the host installation can fail.

	The time required to configure and reboot controller-1 depends on the secondary disk partition size. Larger partitions require more time for synchronization with controller-0.

	The host is now configured with a personality.

7. Configure the host so that it can be unlocked.

	Before you can unlock a storage node, you must do the following:

	a. Create storage volumes. For details, see Creating Storage Volumes.

	b. If using LAG to attach to the management network, change the Interface Type for the management network interface to aggregated ethernet For more information, see Editing Interface Settings.

	c. Configure the interface to the infrastructure network. For details, see Network Interface Provisioning.

8. [Unlock the node](/helion/openstack/carrier/admin/host/management/inventory/lock/) to make it available for use. Click **More** then **Unlock Host**.

	The node is rebooted, and its Availability State is reported as `In-Test`. After a few minutes, it is reported as `Unlocked`, `Enabled`, and `Available`.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----