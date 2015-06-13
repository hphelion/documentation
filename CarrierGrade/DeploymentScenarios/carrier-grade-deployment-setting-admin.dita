---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Reference Deployment Scenarios - Administrative Tasks"
permalink: /helion/openstack/carrier/deploy/setting/admin/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Reference Deployment Scenarios - Administrative Tasks

Certain resources in the Deployment Scenarios must be configured by the admin user.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

To configure these resources, you must be logged in as admin. Only the admin user can create tenants and end users, set up provider networks, add tenant networks to specific provider networks and segmentation ranges, and define flavors.

This topic contains the following sections:

* [Creating tenants and updating quotas](#projects)
* [Creating Users](#users)
* [Establishing Provider Networks](#networks)
* [Creating Segmentation Ranges](#segment)
* [Setting Up Tenant Networks](#proj-net)
* [Setting Up Flavors](#flavors)
* [Setting Up the Example Guest Image](#guest)

## Creating tenants and updating quotas {#projects}

The admin user must create and configure the tenants used in the Deployment Scenarios.

This exercise creates the tenants tenant1 and tenant2, and sets up their resource quotas. It also adjusts resource
quotas for the tenant admin.

1. List the set of tenants currently defined on the system.
Select Projects in the Identity Panel section of the Admin tab to open the Projects page.

	You should see the two default tenants as illustrated:

	<img src="media/CGH-deploy-set-projects.png">

2. Create a project named `tenant1`. See [Creating and Deleting Projects](/helion/commercial/carrier/dashboard/managing/projects/creating/).

	a. Enter `tenant1` as the name and make sure the **Enabled** option is selected.

	b. Select the **Quota** tab, and fill in the quota values:

		<img src="media/CGH-deploy-set-projects-quotas.png">

	**Note:** The resources are presented as a single long list of items. The image above has been edited to present them in a two-column array.

	c. Click Create Project to commit the configuration changes.

3. Create a project named `tenant2`.

	Repeat the step above, this time to create a tenant named tenant2 with the same quota values.

4. Edit the `admin` project to adjust the networking resource quotas. See [Modifying Projects](/helion/commercial/carrier/dashboard/managing/projects/).

	On the **Quota** tab, make sure that the networking resources are as follows:

	<table>
	<tr><th>Field</th><th>Value</th></tr>
<tr>
<td>Floating IPs</td><td>50</td></tr>
<tr>
<td>Networks</td><td>10</td></tr>
<tr>
<td>Ports</td><td>50</td></tr>
<tr>
<td>Routers</td><td>10</td></tr>
<tr>
<td>Subnets</td><td>32</td></tr>
</table>

5. Click Save to commit the configuration changes.

The two projects are available. Quotas are established for both tenants, and updated for the admin project.

## Creating Users {#users}

The admin user must create end users for the Deployment Scenarios.
This exercise creates the users `user1` and `user2` and associates them with the corresponding tenants.

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Identity** dashboard, then the **Users** link to 1. list the users currently defined on the system.

3. Create user `user1`. See [Creating and Deleting Users](/helion/commercial/carrier/dashboard/managing/users/create/). Assign `user1` to the project `tenant1`.

4. Create user `user2`.

	Repeat the step above, this time to create a user named `user2` associated with project `tenant2`.

The two new users now exist in the system.

## Establishing Provider Networks {#networks}

Provider networks are required to support the tenant networks, including those used in the deployment scenarios.

Provider networks are required before compute nodes can be unlocked. For this reason, they are often set up as part of system installation.

The scenarios assume that two provider networks, provider-net-a and provider-net-b, have already been set up as part of system installation. For convenience, the instructions to set up these provider networks are repeated here. If you already have two provider networks with different names, you can use them instead, substituting their names in the following exercises.

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Networks** link.

	The network(s) for the selected project appear. 

3. Select the **Provider Networks** tab.

4. Click **Create Network**. See [Creating and Deleting Provider Networks](/helion/commercial/carrier/dashboard/managing/network/provider/create/).

	Set the **Name** to `provider-net-a`, and set the Type to `vlan`.

5. Click **Create Provider Network**.

6. Repeat the steps to create a provider network named provider-net-b.

	Set the **Name** to `provider-net-b`, and set the Type to `vlan`.

After creating a provider network of the VLAN type, you can assign one or more segmentation ranges consisting of a set of consecutive VLAN IDs. Segmentation ranges are required in order to set up tenant networks.

## Creating Segmentation Ranges {#segment}

The admin user must create segmentation ranges on existing provider networks of the vlan type in order to support tenant networks.

This task assumes that provider networks have already been created to unlock the compute nodes and make the system operational. For more information, see Establishing Provider Networks on page 18.

Segmentation ranges are sets of contiguous identifiers defined on a provider network. Each ID is used to implement a tenant network.

Depending on how a segmentation range is configured, its ID can be available to all tenants (shared), or designated for use by a particular tenant. When a tenant or admin creates a new tenant network, it is assigned an ID automatically from the available ranges on available provider networks.

For a provider network of type VLAN, the identifiers are called VLAN IDs.

To support the six tenant networks in the deployment scenarios, six VLAN IDs are needed. Several large segmentation ranges are defined, using both provider networks, so that more than enough VLAN IDs are available to meet the requirements.

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Networks** link.

	The network(s) for the selected project appear. 

3. Select the **Provider Networks** tab.

4. Add a segmentation range and assign it to a tenant.

	On the **Provider Network Overview** page, click **Create Range** to open the **Create Segmentation Range** page. Complete the fields as required. See [Creating a Segmentation Range](/helion/commercial/carrier/dashboard/managing/network/segment/).

	<img src="media/CGH-deploy-set-projects-segment.png">

5. Click Create Segmentation Range to commit the changes.

6. Add a segmentation range on provider-net-a for use by `tenant2`.
On the **Provider Network Overview** page, click **Create Range** to open the **Create Segmentation Range** page. Fill in the fields as shown:

	<img src="media/CGH-deploy-set-projects-segment2.png">

7. Add a segmentation range on provider-net-a for use by the admin project.

	This step assigns a segmentation range with a single VLAN ID (10) for use only by the admin tenant. Later in this exercise, the admin tenant uses this VLAN ID for the external-net tenant network.

	On the **Provider Network Overview** page, click **Create Range** to display the **Create Segmentation Range** page. Fill in the fileds as shown:

	<img src="media/CGH-deploy-set-projects-segment3.png">

8. Click **Create Segmentation Range** to commit the changes.

	This creates a segmentation range on provider-net-a for use by admin. The range includes a single VLAN ID (10). For reference, this range is assigned the name pnet-a-common.

9. Edit provider-net-b to add a segmentation range.

	On the **Provider Networks** tab, click `provider-net-b`.

10. Add a segmentation range on `provider-net-b` for use by all projects.

	On the **Provider Network Overview** page, click **Create Range** to open the **Create Segmentation Range** page. Fill in the fields as shown:

	<img src="media/CGH-deploy-set-projects-segment4.png">

11. Click **Create Segmentation Range** to commit the changes.

This creates a shared segmentation range on provider-net-b. Shared segmentation ranges contain VLAN IDs that can be used by any tenant. This one includes VLAN IDs 568‒599. For reference, this range is assigned the name `pnet-b-common`.

## Setting Up Tenant Networks {#proj-net}

The admin user must set up admin tenant networks and associated IP subnets, as well as tenant networks assigned to specific provider networks for use by individual tenants.

This exercise sets up the tenant networks tenant1-mgmt-net, tenant2-mgmt-net, internal-net, and external-net.

The admin user creates IP subnets for the internal and external networks only. IP subnets for the tenant management networks are created by the users user1 and user2 later in the exercises (see Setting Up the Management Network).

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Networks** link.

3. [Create a network](/helion/commercial/carrier/dashboard/managing/network/create/) named `tenant1-mgmt-net`.

	The `tenant1-mgmt-net` network is created so that VMs on tenant1 can connect to an OpenStack virtual router, which is added to the tenant and then associated with this network later in the exercises. This provides the VMs with access to OpenStack services, and optionally to an external network, as shown in the scenario diagrams.

	Fill in the fields as shown:

	<a href="media/CGH-deploy-set-tenant-net.png>

4. Click **Create Network** to commit the changes.

5. Create the tenant network `tenant2-mgmt-net`.

	The tenant2-mgmt-net network is added so that VMs on tenant2 can connect to an OpenStack virtual router implemented later on tenant2.

	From the **Networks** tab, click **Create Network** and fill in the form as shown:

	<a href="media/CGH-deploy-set-tenant-net2.png>

5. Click **Create Network** to commit the changes.

6. Create and configure the tenant network `internal-net`.

	The internal-net network is added to provide a connection between the two VMs created in the scenarios. As a network intended for general use, it is created on the admin tenant. To make it accessible to both tenants, it is set up as a shared network.

	a. Create the network.

	From the **Networks** tab, click **Create Network** and fill in the form as shown:

	<a href="media/CGH-deploy-set-tenant-net3.png>

	Click **Create Network** to commit the changes.

	b. Define a subnet on the new network.

	A subnet on internal-net is required by the routing scenario, to support Layer 3 routing between the VMs. The subnet is not used by the bridging scenario.

	On the **Network** tab, click the name of the new network you just created.

	c. Create the IP subnet internal-subnet.

	Click **Create Subnet** to open the Subnet tab. Fill in the form as shown:

	<a href="media/CGH-deploy-set-tenant-net4.png>

	d. Define the IP subnet's details.

	Select the Subnet Detail tab, and fill in the form as shown:

	<a href="media/CGH-deploy-set-tenant-net5.png>

	**Note:** The VLAN field is used here to indicate that packets sent to this subnet by any virtual machine must be tagged with VLAN ID 5.

	e, Click Create to commit the changes.

7. Create and configure the tenant network `external-net`.

	The external-net network is added so that an outside network can connect to virtual machines on tenant1 or tenant2. This could be used for programming or provisioning access.

	Note: The bridging and routing scenarios do not demonstrate external access to the VMs. For these scenarios, the external-net network is not required.

	a. Create the tenant network.

	From the Networks tab, click Create Network and fill in the form as illustrated below:

	<a href="media/CGH-deploy-set-tenant-net6.png>

	b. Click **Create Network** to commit the changes.

	c. Define a subnet on the new network.

	On the **Network** tab, click the name of the new network you just created. The Network Overview page appears.

	d. Create the IP subnet `external-subnet`.

	Click **Create Subnet** to open the **Create Subnet** dialog box. Fill in the fields as shown:

	<a href="media/CGH-deploy-set-tenant-net7.png>

	e. Define the IP subnet's details.

	Select the **Subnet Detail** tab, and fill in the fields as shown:

	<a href="media/CGH-deploy-set-tenant-net8.png>

	For a network with System Managed Subnet selected, an IP address is automatically allocated for any virtual ethernet interface attached to the network. If Enable DHCP is also selected, a DHCP server is activated, so that the allocated address is offered in response to a DHCP request.

	g. Click **Create** to commit the changes.

The external and internal tenant networks are set up and ready to be used. The tenant management networks are available, but their IP subnets have yet to be created.

To display the current network topology for the admin tenant, click **Network Topology** in the **Manage Network** section of the **Project** tab.

<a href="media/CGH-deploy-set-tenant-net9.png>


This shows networks owned by the admin project. To see the topology for networks owned by another project, log in as the user associated with that project.

The tenant networks are assigned segmentation IDs automatically. To view the assigned IDs, display the Details page
for the provider network.

## Setting Up Flavors {#flavors}

This task defines two virtual machine resource profiles, or flavors, for use when launching virtual machines.

1. [Define the virtual machine flavor](/helion/commercial/carrier/dashboard/managing/flavors/) `example-guest.tiny`. 

	a. In the Create Flavor screen, fill the fields as shown:

	<a href="media/CGH-deploy-set-flavor.png>

	b. Click **Create Flavor** to commit the flavor definition.

	The virtual machine flavor `example-guest.tiny` is created with an automatic ID. New virtual machines using this flavor get allocated 512 MB of memory, no disks, and one dedicated virtual CPU.

3. Define the virtual machine flavor `example-guest.small`.

	Repeat the step above to create this new flavor, this time allocating two virtual CPUs.

	The virtual machine flavor example-guest.small is created with automatic ID. New virtual machines using this flavor get allocated 512 MB of memory, no disks, and two dedicated virtual CPUs.

Note: The flavor `example-guest.tiny` is not used in the scenarios. All the instances in the scenarios require the extra CPU provided by `example-guest.small` to support AVP network interfaces.

## Setting Up the Example Guest Image {#guest}

You can import guest images for use with the HP Helion OpenStack Carrier Grade server.

This example assumes that a guest disk image named `example-guest.img` is available on the file system of the active controller. The guest image is available as part of HP Helion OpenStack Carrier Grade.

The image must be uploaded to the Image Operations (Glance) service, the OpenStack image deployment service, so that it can be used to launch new virtual machines.

1. List the images available on the system.

	Select **Images** in the **System Panel** section of the **Admin** tab to open the **Images** page.

	Since no images have been defined yet, an empty list is displayed.

2. [Upload the guest image](/helion/commercial/carrier/dashboard/managing/images/create/) to the Image Operations service. 

	a. Click **Create Image** and fill in the form as shown:

	<a href="media/CGH-deploy-set-image.png>

	b. Click Create Image to upload the guest image.

The image `example-guest` is available now.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----