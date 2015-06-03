---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host Interfaces"
permalink: /helion/openstack/carrier/admin/host/management/inventory/interfaces/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Host Interfaces
<!-- From the Titanium Server Admin Guide -->

The **Interfaces** tab on the **Inventory Detail** page presents details about the logical L2 network interfaces on a node, as illustrated below for an unlocked controller node.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

On a properly configured compute node, the Interfaces tab presents additional logical interfaces, for a locked node.

This topic covers the following:

* [Viewing interface details](#view)
* [Creating an Interface Profile](#creating)
* [Creating a new interface details](#create)
* [Editing Interface Details](#editing)

## Viewing interface details {#view}

To view host interface information:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. In the Host Name column, click the name of the locked host to open the **Inventory Detail** page for that host.

5. Click the **Interfaces** tab.

Information about interfaces is presented in several columns, as follows:

* **Name** - The name given to the logical L2 interface.
* **Network Type** - The type of network the logical network interface is connected to. The options are:
	* **data** for a compute node data interface
	* **infra** for the optional infrastructure network
	* **mgmt** for the internal management network
	* **oam** for the OAM network
	* **pci-passthrough** for a PCI passthrough interface
* **Type** - Ethernet, or aggregated Ethernet (LAG).
* **Vlan ID** - The VLAN ID of the network listed in the Network Type column, if the network uses a shared interface. For more information about shared interfaces, see Shared (VLAN) Ethernet Interfaces.
* **Port(s)** - The physical ports on top of which the logical interface is built. Multiple ports are displayed when the logical interface uses LAG.
* **Uses** - The interface used by the network listed in the Network Type column, if the network uses a shared interface. The VLAN ID of the network is shown in the Vlan ID field.
* **Used By** - The networks that share the interface using VLAN tagging, if the interface is shared. For more information about shared interfaces, see Shared (VLAN) Ethernet Interfaces.
* **Provider Networks** - This option is relevant for compute nodes only, and for interfaces of the data network type. It lists the provider networks associated with the data interface.
* **Attributes** The current MTU size for the interface.
* **Actions** - On a locked node, you can modify a logical interface, and execute management operations on it. This is implemented using the buttons Edit Interface and More. These buttons are not available when the node is unlocked.


## Creating an Interface Profile {#creating}

You can create a new interface profile out of the currently defined node interfaces. 

To create a host interface profile:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. In the Host Name column, click the name of the locked host to open the **Inventory Detail** page for that host.

5. Click the **Interfaces** tab.

6. Click **Create Interface Profile**. 

7. Enter a name for the new profile.

	Available interface profiles are listed, and can be removed, from the System Inventory page, as described in [Working with Hardware Profiles](/helion/openstack/carrier/admin/host/management/inventory/hardware/).

8. Click **Create Interface Profile** to create the profile based on the interface and port configuration of the selected host.  

## Creating a new interface details {#create}

You can create new logical interfaces. 

To create a host interface:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. [Lock the host](/helion/openstack/carrier/admin/host/management/inventory/lock/) to make changes. Click **More** then select **Lock Host**.

	Wait for the host to be reported as Locked.

5. In the Host Name column, click the name of the locked host to open the **Inventory Detail** page for that host.

6. Click the **Interfaces** tab.

7. Click **Create Interface**.

	This button is available only on nodes in the locked state. 

8. Specify the following in the **Create Interface** screen:

	* **Interface Name** - Enter the name to be assigned to the new logical interface.
	* **Interface Type** - Select the type of network interface: Ethernet or aggregated Ethernet (LAG).
	* **Ports** - Select the physical ports for the the new logical interface. Physical ports already allocated to other interfaces are not listed.
	* **Network Type** - Select the type of network to attach the new logical interface to (`data` or `infra`, for compute node data interfaces and infrastructure network connections respectively). Note that connections to the OAM and internal management networks are auto-provisioned during the software installation process.
	* **Provider Network(s)** - Select one or more provider networks for the new logical interface, for networks of type data. Provider networks already allocated to other data interfaces are not listed, since no provider network can be associated with more than a single data interface.
	* **MTU** - Enter the MTU size in bytes for the interface. For compute nodes, values between 1500 and 9000 are supported. For controller and storage nodes, the MTU size cannot exceed 1500.

9. Click **Create Interface**.

**Note:** Logical interfaces of network types `oam` and `mgmt` cannot be deleted. They can only be [modified to use different physical ports](#editing) when required.


## Editing Interface Details {#editing}

You can edit existing logical interfaces. 

To edit a host interface:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. [Lock the host](/helion/openstack/carrier/admin/host/management/inventory/lock/) to make changes. Click **More** then select **Lock Host**.

	Wait for the host to be reported as Locked.

5. For the interface to change, click **More** then **Edit**.

6. In the Edit Interface screen, make changes to the fields, as described in [Creating a new interface details](#create).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----