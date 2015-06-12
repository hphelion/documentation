---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Deploying the Routing Scenario"
permalink: /helion/openstack/carrier/deploy/routing/deploy/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Deploying the Routing Scenario

The Routing Scenario uses two virtual machines, each configured to route traffic between two network interfaces.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

To complete the Deployment Scenarios configuration, you must perform the tasks in this section while logged in as user1, and then perform the same tasks while logged in as user2, substituting appropriate strings for instance names, keypairs, tenant networks, or other resources.

Each user must configure a virtual machine and launch an instance of a Layer 3 router. The router connects two VM interfaces; one is attached to the private
tenant network used for test equipment access (tenant1-net or tenant2-net), and the other is attached to internal-net to complete the test path.


1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/) as the appropriate user (user1 or user2).

2. Click the **Project** dashboard, then the **System** panel, then the **Overview** link.

3. Select **Instances** in the **Manage Compute** section of the **Project** tab to open the **Instances** page.

	Since no instances are currently running, an empty list is displayed.

4. Configure the virtual machine details by clicking **Launch Instance** to display the Launch Instance window. Fill in the information in the Details tab, as illustrated below:

	<img src="media/CGH-deploy-routing-launch.png">

	In this example you are configuring an instance named tenant1-vm, with the flavor example-guest.small, booting from the volume named `volexample-guest`.

5. Configure the virtual machine authentication credentials.

	In the **Launch Instance** window, select the Access & Security tab and associate the available tenant's keypair with this instance. Use a suitable password ( tenant1 in this example) for administration.

6. Connect the VM to the required tenant networks.

	All tenant networks accessible to the tenant are available for use by the virtual machine. You can use the **Networking** tab of the **Launch Instance** dialog box to connect the VM to a tenant network, by moving the network from the **Available Networks** list to the **Selected Networks** list . This connects the tenant network to a virtual ethernet interface ethn on the VM, where `n` is the next available integer starting from zero.

	a. List the available tenant networks.

	In the **Launch Instance** window, select the **Networking** tab. This displays the available networks at the bottom, and the currently selected networks at the top.

	b. Connect the required tenant networks.

	Click the blue + buttons on the Available Networks list to move the tenant networks to the Selected Networks list, as illustrated below.

	<img src="media/CGH-deploy-routing-launch-after.png">

	**Note:** The order in which the networks are moved determines the order in which the virtual ethernet interfaces eth0, eth1, eth2, and so on are assigned. In the scenarios, the example guest image is configured to bridge or route between eth1 and eth2. The networks to be attached to the bridge or router must be moved in the proper order for compatibility with this configuration.

	First, move the tenant1-mgmt-net network. This connects it to interface eth0 on the virtual machine. Then move tenant1-net and internal-net, in that order, to assign them to eth1 and eth2 on the virtual machine.

	For each interface, you can specify the driver type from a drop-down menu. In this example, eth0 (NIC-1) is configured as a virtio interface, suitable for low-level management traffic. The eth1 (NIC-2) and eth2 (NIC-3) interfaces are configured as accelerated AVP ports for highthroughput traffic. You can select any other combination, as required by your application.

	Once the three network interfaces have been selected, the Networking tab appears as follows:

	<img src="media/CGH-deploy-bridge-launch-nic.png">

	**Note:** The interface type and allocated NIC order cannot be changed after the instance is launched. To use different port assignments, you must shut down and delete the instance, and then launch a new instance.

7. Implement a function on the guest image.

	You can implement a function on a guest image by applying user data.

	In the **Launch Instance** window, select the **Post-Creation** tab and populate the Customization Script text box with the appropriate user data.

	Caution: The first line in the user data is a mandatory comment. Without it, the user data is ignored, and all network interfaces are initialized using DHCP.

	* To implement a Linux router on the guest image, add user data to tenant1 and tenant2 as follows.

		**For tenant1:**
			
    		#wrs-config
    		FUNCTIONS="routing"
    		ADDRESSES=(
    		"172.31.1.1,255.255.255.0,eth1,1500"
    		"10.1.1.1,255.255.255.0,eth2.5,1500"
    		)
    		ROUTES=(
    		"10.160.2.0/24,172.31.1.2,eth1"
    		"10.170.2.0/24,10.1.1.2,eth2.5"
    		)
    
		**For tenant2:**

			#wrs-config
			FUNCTIONS="routing"
			ADDRESSES=(
			"172.31.2.1,255.255.255.0,eth1,1500"
			"10.1.2.1,255.255.255.0,eth2.5,1500"
			)
			ROUTES=(
			"10.170.2.0/24,172.31.2.2,eth1"
			"10.160.2.0/24,10.1.1.1,eth2.5"
			)

7. Launch the instance.

	In the Launch Instance window, click Launch to create the instance.

The Routing Scenario is now running. 

The updated Network Topology page for user1 appears as shown:

<img src="media/CGH-deploy-bridge-user1.png">

The updated Network Topology page for user2 appears as shown:

<img src="media/CGH-deploy-bridge-user2.png">

Once the virtual machines for both tenant users are running, you can run test traffic through the test path. For more information, see [Running Traffic Through the Test Paths](/helion/openstack/carrier/deploy/running-traffic/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
