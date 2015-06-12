---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Components of the Scenario Environment"
permalink: /helion/openstack/carrier/deploy/setting/components/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Components of the Scenario Environment

The components that make up the scenario environment can be divided into actors and resources. Actors execute system commands to operate on resources. Resources are passive objects on which system operations take place.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

## Actors {#actors}

* **System Administrator** - Has access to the administration components of the Wind River Linux server to manage users and resources.

	The scenario environment has only one system administrator, identified as the admin user. This user is defined as part of the Wind River Linux server installation.

* **End Users** - Have access to the user components of the Wind River Linux server to manage a set of system resources under the quotas and constraints set up by the system administrator.

	The scenario environment has two end users identified as user1 and user2. They are created by the admin user (see Creating Users on page 16).

## Resources {#resources}

* **Tenant (or Project)** - An isolated resource container consisting of networks, storage volumes, images, instances (guest applications), authentication keys, and users. Tenants are the core resource structure on which all end user services are managed.

The scenario environment has three tenants, identified as admin, tenant1, and tenant2. For convenience, the latter two are referred to as user tenants. The admin tenant is created as part of the HP Helion OpenStack Carrier Greade installation. The user tenants are created by the admin user. See Creating Tenants and Updating Quotas.

	**Note:** The identifier admin is used for both the system administrator and the admin tenant. They can be differentiated by context.

* **Provider Network** - A logical transport mechanism for the tenant networks. Provider networks are realized over physical transport resources.

	For the deployment scenarios, an operational Wind River Linux server system is assumed, implying that provider networks have already been established. Until at least one provider network has been defined and associated with `compute-node` data interfaces, it is not possible to unlock the compute nodes or make the system operational.

	Provider networks are created by the admin user.

	The scenarios use two provider networks of the VLAN type. In the scenario environment, they are identified as provider-net-a and provider-net-b.

	* **provider-net-a** - Used for management tenant networks carrying OAM traffic such as SSH, SNMP, or FTP traffic. Tenant networks using this provider network are created by the admin user, and used by end users.

	* **provider-net-b** - Used for user-plane private tenant networks. Tenant networks using this provider network are created by the end users for their own use.

* **Segmentation Range** - A set of consecutive VLAN IDs on a provider network of the VLAN type. Segmentation ranges are defined by the admin user for each provider network. A segmentation range can be shared by all tenants, or assigned to an individual tenant.

	The segmentation ranges provide VLAN IDs for tenant networks. When a tenant network is created by the admin user or an end user, it is assigned to a VLAN ID. The admin user has the ability to assign a new tenant network to a specific provider network and VLAN ID. For other users, the tenant network is assigned to the first available VLAN ID in the available segmentation ranges.

	**Note:** Each VLAN ID must be unique on the physical network used to implement the provider network. If two or more provider networks are implemented on the same physical network, they cannot share the same VLAN ID. Therefore, the segmentation ranges on such provider networks must not overlap. For the scenario environment, the following segmentation ranges are defined for illustration purposes. Only a few of them are used for tenant networks.

	Provider Network	Segmentation Range
	provider-net-a 		10, 623-642, 664-680
	provider-net-b 		568-599

	The segmentation ranges and VLAN IDs set up for the deployment scenarios are as follows:

	* On provider-net-a:
		* one range assigned to the admin tenant (VLAN ID 10)
		* one range assigned to tenant1 (VLAN IDs 623-642)
		* one range assigned to tenant2 (VLAN IDs 664-680)
	* On provider-net-b:
		* one range shared by all tenants (VLAN IDs 568-599)

* **Tenant Network** - A logical transport network realized over a provider network. Tenant networks can be set up by the admin user
(see Setting Up Tenant Networks) or by end users (see Adding a Tenant Network). For an admin user, additional options are available, for example to specify the provider network and VLAN ID.

The scenario environment has the following tenant networks:

* **external-net** - Associated with the admin tenant, and implemented over the provider-net-a provider network. The VLAN ID for this tenant network is manually set to 10.

	This tenant network is set up as an external network. When a virtual router in a tenant is connected to an external network, it uses the gateway IP address of the external network as its default route. This provides a path to networks outside the system, including the open Internet.

	The external-net tenant network is included for demonstration purposes. It is not used by the bridging or routing test path scenarios.

* **internal-net** - Associated with the admin tenant, and implemented over the provider-net-b provider network. The VLAN ID for this tenant network is dynamically allocated.

	This network is set up as a shared network. Shared networks are accessible to all tenants. This one provides a path to connect the VMs on tenant1 and tenant2.

* **tenant1-mgmt-net and tenant2-mgmt-net** - Management networks associated with the corresponding user tenants, and implemented over the `providernet-a` provider network. They are created by the admin user on behalf of the user tenants. The VLAN IDs for these tenant networks are dynamically allocated.

	Each of these networks is assigned by the admin user for use by a single tenant. The admin user is able to specify the provider network and VLAN on which they are implemented, ensuring that the tenants can use them to connect to specific devices on specific physical networks.

	In the scenarios, each user uses the management network to connect the VMs to a virtual router on the tenant. In addition to establishing a path to the external network, the virtual router establishes connections to OpenStack services such as the metadata service, which provides instances with access to user data.

* **tenant1-net and tenant2-net** -  High-performance data networks associated with the corresponding user tenants. They are created by the respective end users. The provider networks and VLAN IDs for these tenant networks are dynamically allocated based on the resources available to the tenant.

	<table>
<tr><th>Tenant Network</th><th>Created By</th><th>Provider Network</th><th> VLAN ID Allocation</th></tr>
<tr>
<td>external-net</td><td>admin</td><td>provider-net-a</td><td>Manual</td></tr>
<tr>
<td>
internal-net</td><td>admin</td><td>provider-net-b</td><td>Dynamic</td></tr>
<tr>
<td>tenant1-mgmt-net</td><td>admin</td><td>provider-net-a</td><td>Dynamic</td></tr>
<tr>
<td>tenant1-net</td><td>user1</td><td>as allocated</td><td>Dynamic</td></tr>
<tr>
<td>tenant2-mgmt-net</td><td>admin</td><td>provider-net-a</td><td>Dynamic</td></tr>
<tr>
<td>tenant2-net</td><td>user2</td><td>as allocated</td><td>Dynamic</td></tr>
</table>

* **Data Network** - IP subnets configured on the tenant network. In the deployment scenarios, each tenant network supports a single
IP subnet. They are configured as follows:

	<table>
<tr><th>Subnet</th><th>Address</th><th>Tenant Network</th><th>Created By</th></tr>
<tr>
<td>external-subnet</td><td>192.168.2.0/24
<br>External Gateway
<br>192.168.2.1</td><td> external-net</td><td>admin</td></tr>
<tr>
<td>internal-subnet</td><td>10.1.1.0/24</td><td>internal-net</td><td>admin</td></tr>
<tr>
<td>tenant1-mgmt-subnet</td><td>192.168.102.0/24</td><td>tenant1-mgmt-net</td><td>user1</td></tr>
<tr>
<td>tenant1-subnet</td><td>172.31.1.0/24</td><td>tenant1-net</td><td>user1</td></tr>
<tr>
<td>tenant2-mgmt-subnet</td><td>192.168.202.0/24</td><td>tenant2-mgmt-net</td><td>user2</td></tr>
<tr>
<td>tenant2-subnet</td><td>172.31.2.0/24</td><td>tenant2-net</td><td>user2</td></tr>
</table>

	**Notes**:

	* The IP subnets for the tenant data networks tenant1-subnet and tenant2-subnet are not applicable for the Bridging Scenario.
	
	* The data network internal-subnet uses application-level VLAN tagging. In the scenarios, guest VLAN ID 5 is used.

* **Virtual Router** - Created by the end users, the virtual routers provide the VMs with connections to the external network, and to OpenStack services running on the compute node, such as the metadata service used to provide instances with access to user data when they are launched. Two routers are created, tenant1-router and tenant2-router, each within its corresponding tenant container (see Adding a Virtual Router).

* **Glance Guest Image** - The example guest image provided with the Wind River Linux server must be imported into the OpenStack
Glance service for use. Images can be imported by the admin user(see Setting Up the Example Guest Image) or by end users.

* **User Data** - For the example guest image, user data is used to specify the function to be implemented (Linux kernel bridge, DPDK-accelerated bridge, or router) and the virtual ports or IP subnets to be connected by the switches. For details, see [Deploying the Bridging Scenario](/helion/openstack/carrier/deploy/bridging/deploy/) and [Deploying the Routing Scenario](/helion/openstack/carrier/deploy/routing/deploy/)

* **Virtual Machine Flavor** - End users specify the virtual hardware resources allocated to a machine by selecting a flavor. Two flavors are defined, as follows:

	* **example-guest.tiny** - Designed for an example guest VM with Linux kernel-based networking with virtio virtual network interfaces. A virtual machine of this type gets allocated 512 MB of memory, no disks, and one dedicated virtual CPU (vCPU).

	* **example-guest.small** -  Designed for an example guest VM with AVP-type virtual networking interfaces. A virtual machine of this type gets allocated 512 MB of memory, no disks, and two dedicated virtual CPUs.

	Flavors are defined by the admin user (see Setting Up Flavors on page 32).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----