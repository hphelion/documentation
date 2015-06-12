---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): User Tasks"
permalink: /helion/openstack/carrier/deploy/setting/user/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): User Tasks

Some of the resources in the Deployment Scenarios must be configured by end users user1 and user2.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>


To complete the Deployment Scenarios configuration, you must perform the tasks in this section while logged in as `user1`, and then perform the same tasks while logged in as `user2`, substituting appropriate strings for keypairs, networks, subnets, or other resources. 

To configure these resources, you must be logged in as admin. Only the admin user can create tenants and end users, set up provider networks, add tenant networks to specific provider networks and segmentation ranges, and define flavors.

## Values for the user tasks {#values}

The following table summarizes the tasks to be performed, the resource names to be supplied, and suggested strings for each user. In the instructions for each task, the strings for `user1` are used as a convenience.

<table>
<tr><th>Task</th><th>Resource Name</th><th>String for user1</th><th>String for user2</th></tr>
<tr border="0"><td>Adding a Keypair</td><td>KeyPair Name
</td><td>tenant1-controller-0</td><td>tenant2-controller-0</td></tr>
<tr></td><td><td>Network Name</td><td>tenant1-net</td><td>tenant2-net</td></tr>
<tr><td></td><td>Subnet Name</td><td>tenant1-subnet</td><td>tenant2-subnet</td></tr>
<tr><td>Adding a Tenant Network</td><td>Network Address</td><td> 172.31.1.0/24</td><td>172.31.2.0/24</td></tr>
<tr>
<td>Setting Up the Management Network</td><td>Subnet Name</td><td>tenant1-mgmt-net</td><td>tenant2-mgmt-net</td></tr>
<tr>
<td></td><td>Network Address</td><td>192.168.102.0/24</td><td>192.168.202.0/24</td></tr>
<tr>
<td>Adding a Virtual Router</td><td>Router Name</td><td>tenant1-router</td><td>tenant2-router</td><td>Creating a Volume</td><td>
</td><td>Volume Name</td><td>vol-example-guest</td><td>vol-example-guest</td></tr>
</table>

When both users have completed the tasks, the test path can be exercised.

This topic contains the following sections:

* [Adding a Keypair](#key)
* [Adding a Tenant Network](#tenant)
* [Setting Up the Management Network](#mgmt)
* [Adding a Virtual Router](#router)
* [Creating a Volume](#volume)


## Adding a Keypair {#key}

Keypairs provide for secure login to guest images.

This exercise injects a keypair into the Nova database with the name tenant1-controller-0. This named keypair can be used to provide automatically authenticated SSH access to the virtual machines. You can use other available keypairs, or create new ones, as required.

**Note:** For the scenarios, SSH access is not required, and the keypairs are not used.

To add a keypairs follow the directions below. For additional information, you can see [Managing Key Pairs](/helion/commercial/carrier/dashboard/managing/security/keypairs/).

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **Manage Compute** panel, then the **Access &amp; Security** link.

	The Access &amp; Security page is displayed with four tabs, **Security Groups**, **Key Pairs**, **Floating IPs**, and **API Access**. By default, **Security Groups** is the active tab. 

3. Click the **Key Pairs** tab to activate it.

	The list of Keypairs is displayed in a table.

4. Click **Create Key Pair**.

5. In the **Create Key Pair Name** box, enter `tenant1-controller-0` for the name of the key pair.

6. Click **Create Key Pair**.

	The private key of the key pair is downloaded to your local system, either automatically or a dialog box prompts you to download the keypair.

7. Click on the download link to have a local copy of the authentication keypair. You use it as you would use any keypair for SSH authentication between two workstations.

	* Transfer the keypair to the workstation you plan to use to access the virtual machine over SSH.
	* Copy the public key to the virtual machine. You can use the command ssh-copy-id from a Linux workstation, or transfer the public key using a command such as scp.
	
	Consult the openly available documentation on SSH for details.

7. Click Save to place the private key on your local system.

8. To complete the deployment scenarios, this task must be repeated as user2, using appropriate names as described in [the values table](#values).

## Adding a Tenant Network {#tenant}

This exercise sets up the private network for the project (tenant network) named `tenant1-net` and configures its IP subnet.

A tenant network added by an end user is automatically assigned to a provider network, using a segmentation range
available to the user.

To create and configure the tenant network `tenant1-net` follow the directions below. For additional information, you can see [Create or delete a tenant network](/helion/commercial/carrier/dashboard/managing/network/create/).

2. Select the Subnet tab to create the IP subnet `tenant1-subnet`.

	**Note:** A subnet is created on tenant1-net to make the VM reachable from the networks used by the test equipment.

	Fill in the fields as shown:

	a. Enter `tenant1-subnet` in the **Name** field.

	b. For user1, enter the subnet 172.31.1.0/24 in the **Network Address** field, as described in [Components of the Scenario Environment](/helion/openstack/carrier/deploy/setting/components/).

	c. Select IPv4 for the IP version.

	d. Leave the **Gateway Address** field blank.	
	
	e. Click **Create** to commit the changes.

	The private tenant network is set up and ready to be used. 

3. To complete the deployment scenarios, this task must be repeated as user2, using appropriate names as described in [the values table](#values).

## Setting Up the Management Network {#mgmt}

This exercise configures the IP subnet of the tenant management network `tenant1-mgmt-net`.

To modify the management network `tenant1-mgmt-net`follow the directions below. For additional information, you can see [Creating or Deleting Networks](/helion/commercial/carrier/dashboard/managing/network/create/).

2. Click the **Project** dashboard, then the **System** panel, then the **Networks** link.

	The network(s) for the selected project appear. 

3. Click the **tenant1-mgmt-net** link.

4. Click **Create Subnet** to open the **Subnet** tab. Fill in the fields as shown:

	a. Enter `tenant1-mgmt-subnet` in the **Name** field.

	b. For user1, enter the subnet 192.168.102.0/24 in the **Network Address** field, as described in [Components of the Scenario Environment](/helion/openstack/carrier/deploy/setting/components/).

	c. Select IPv4 for the IP version.

	d. Leave the **Gateway Address** field blank. If you do not provide a Gateway address, the default 192.168.102.1 is used.
	
	e. Click **Create** to commit the changes.

	f. Click Create to commit the changes.

5. To complete the deployment scenarios, this task must be repeated as user2, using appropriate names as described in [the values table](#values).

## Adding a Virtual Router {#router}

A virtual router is required on each user tenant to connect VMs to an external network, and to internal resources on the compute nodes.

The deployment scenarios require an OpenStack virtual router on each user tenant. The virtual router connects the VMs to a metadata server (nova-api) implemented on one of the compute nodes. The metadata server provides the user data when a VM instance is launched. A route to the metadata server is established automatically when the router is created.

To create the router `tenant1-router` follow the directions below. For additional information, you can see [Creating a Router](/helion/commercial/carrier/dashboard/managing/router/create/).

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Routers** link.

	The routers for the selected project appear. 

3. Click **Create Router** to open the **Create router** tab. 

	a. Enter **tenant1-router** in the **Router Name** field. 

	b. Click **Create Router**.

4. On the **Routers** page, click the name of the router to display the **Router Overview** page.

5. Click **Add Interface** and fill in the fields as shown:

	a. Select **tenant1-mgmt-net** from the **Subnet** list.

	b. Leave the IP address blank.

	c. Click **Add Interface**.

	The new router interface is active.

6. Set up the gateway information.

	a. Click **Set Gateway** for the router to open the **Set Gateway** screen.

	b. Select **external-net** from the **External Network** list.

	c. Click **Set Gateway**.

	The gateway interface is configured.

7. Optionally name the network ports for easier reference.

	a. Click the **Project** dashboard, then the **System** panel, then the **Networks** link.

	b. On the **Networks** page, click the link to the `tenant1-mgmt-net` network. 

8. Edit the name of the router port.

	a. For the router port, click **Edit Port** to open the Edit Port screen.

	b. Enter the desired name for the port.

	c. Click **Save Changes** to commit the name change.

	The router port is listed with the new name.

9. To complete the deployment scenarios, this task must be repeated as user2, using appropriate names as described in [the values table](#values).

## Creating a Volume {#volume}

Before you can use an image, you must create a volume for the image.

To create the volume `vol-example-guest` follow the directions below. For additional information, you can see [Creating, Editing, and Deleting Volumes](/helion/commercial/carrier/dashboard/managing/volume/create/).

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Project** dashboard, then the **System** panel, then the **Volumes** link.

4. Click **Create Volume**.

5. In the **Create Volume** dialog box, fill in the fields as shown:

	a. Enter **vol-example-guest** in the **Volume Name** field.

	b. Optionally, enter a description.

	c. Leave the **Type** field blank.

	d. Enter **1** for Size (GB).

	e. Select Image from the **Volume Source** list.

	f. Select **example-guest (411.0 MB)** from the **Use image as source** list.

	g. Click **Create Volume**.

6. To complete the deployment scenarios, this task must be repeated as user2, using appropriate names as described in [the values table](#values).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----