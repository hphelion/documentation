---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring Ethernet Interfaces"
permalink: /helion/openstack/carrier/configuration/plan/ethernet/config/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring Ethernet Interfaces
<!-- From the Titanium Server Admin Guide -->

You can review and modify the configuration for physical or virtual Ethernet interfaces using the web administration interface or the CLI.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

## Physical Ethernet Interfaces {#physical}

The physical Ethernet interfaces on HP Helion OpenStack Carrier Grade nodes are configured to use the following networks:

* the internal management network
* the external OAM network
* the infrastructure network, if present
* one or more data networks

A single interface can optionally be configured to support more than one network using VLAN tagging. For more information, see [Shared (VLAN) Ethernet Interfaces](/helion/openstack/carrier/configuration/plan/ethernet/shared/). 

In addition, the management or infrastructure interfaces, or both, can be configured with an additional data network (see the HP Helion OpenStack Carrier Grade Software Installation Guide: Editing Interface Settings).

* On the controller nodes, all Ethernet interfaces are configured automatically when the nodes are initialized, based on the information provided in the controller configuration script (see the HP Helion OpenStack Carrier Grade Installation Guide: The Controller Configuration Script). 

* On compute and storage nodes, the Ethernet interfaces for the management network are configured automatically. The remaining interfaces require manual configuration.

Interface configurations are summarized in the following table.

**Note:** If a network attachment uses LAG, the corresponding interfaces on the storage and compute nodes must also be configured manually to specify the interface type.

<table>
<tr><th>Interface<th>Controller</th><th>Storage</th><th>Compute</th></tr>
<tr>
<td></td>Mgmt</td><td>Configured automatically</td><td>Configured automatically</td><td>Configured automatically</td></tr>
<tr>
<td>OAM</td><td>Configured automatically</td><td>Not used</td><td>Not used</td></tr>
<tr>
<td>Infra</td><td>Configured automatically</td><td>For a dedicated interface, the interface is added automatically, but requires additional manual configuration for the network type
<br>For a shared interface, configured manually</td><td>Configured manually</td></tr>
<tr>
<td>Data</td><td>Not used</td><td>Not used</td><td>Configured manually</td></tr>
</table>

<p>You can review and modify physical interface configurations from the web administration interface or the CLI. For more information, see: 

* *HP Helion OpenStack Carrier Grade Installation Guide: Editing Interface Settings*
* *the HP Helion OpenStack Carrier Grade Installation Guide: Creating Data Interfaces*
* *the HP Helion OpenStack Carrier Grade Installation Guide: Command-line Installation*.

You can also save the interface configurations for a particular node to use as a profile or template when setting up other nodes. For more information, see Interfaces on page 112.

## Virtual Ethernet Interfaces

The virtual Ethernet interfaces for guest VMs running on HP Helion OpenStack Carrier Grade are defined when an instance is launched. They connect the VM to tenant networks, which are virtual networks defined over provider networks, which in turn are abstractions associated with physical interfaces assigned to data networks on the compute nodes. Several virtual interface driver options are available. 
<!--
For more information about launching instances and
connecting their virtual Ethernet interfaces, see the HP Helion OpenStack Carrier Grade Reference Deployment Scenarios. The chapters on Deploying the Bridging Scenario and Deploying the Routing Scenario contain detailed examples for defining virtual Ethernet interfaces. -->

You can also connect a VM directly to a physical interface using PCI passthrough or or SR-IOV. 

See [PCI Passthrough Ethernet Interfaces](/helion/openstack/carrier/configuration/plan/pci-passthru/) and [SR-IOV Ethernet Interfaces](/helion/openstack/carrier/configuration/plan/sr-iov/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----