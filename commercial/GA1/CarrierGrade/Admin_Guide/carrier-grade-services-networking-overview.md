---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Networking Service (Neutron) Overview"
permalink: /helion/openstack/carrier/services/networking/overview/
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

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Networking Service (Neutron) Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

HP Helion OpenStack Networking is a virtual networking service that leverages the OpenStack Neutron service to provide network connectivity and addressing to HP Helion OpenStack Compute service devices.

The Networking service also provides an API to configure and manage a variety of network services.

You can use the Networking service to connect guest servers or you can define and configure your own virtual network topology.

You can also use the Networking service to [identify the actual IP address of a malicious user](#nat), if you know the user's NAT address.

## Installing the Networking service ##

Helion Network Administrators are responsible for planning for the Neutron networking service, and once installed, to configure the service to meet the needs of their cloud network users. 

For information, see [Networking Operation (Neutron) Administrator Pre and Post Installation Tasks](/helion/openstack/carrier/services/neutron/installation/intro/).


## Working with the Networking service

To perform tasks using the Networking service, you can use the dashboard, API or CLI.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack Dashboard](/helion/openstack/carrier/dashboard/how-works/) to work with the Networking service.

###Using the API {#API}
 
You can use a low-level, raw REST API to access the Networking service. See the [OpenStack Networking API v2.0 Reference](http://developer.openstack.org/api-ref-networking-v2.html).

###Using the CLI {#cli}

You can use any of several command-line interface software to access Networking. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/neutronclient_commands.html).

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).

<!--

## How To's with the HP Helion OpenStack Networking service ## {#howto}

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack Dashboard](/helion/openstack/carrier/dashboard/how-works/), the OpenStack [CLI](http://docs.openstack.org/cli-reference/content/neutronclient_commands.html) or OpenStack [API](http://developer.openstack.org/api-ref-networking-v2.html).

The administrator can work with all projects in a domain. A user can only work with projects associated with that user.-->

### Tracking masked IP addresses when using network address translation (NAT) ### {#nat}

If you know the NAT address of a malicious user, you can identify his actual IP address. HP Helion OpenStack offers several methods to lookup the Networking Service VM associated with the source of the abusive network traffic.

For more information, see [Tracking masked IP addresses when using network address translation (NAT)](/helion/openstack/carrier/maskedIP/).

<!--### Working with networks ###

You can perform the following tasks:

- **Adding, modifying and removing a network** - Create, delete, and modify your network.
- **Adding, modifying and removing a port on your network** - Create, delete, and modify ports on your network.
- **Adding and removing a subnet to a network** - Create, delete, and modify subnets associated with your network, as needed.
- **Creating an external network** - Create an external network for your environment. Only an administrator can create an external network.

### Working with routers ###

You can perform the following tasks:

- **Adding and removing a network to a router** - Attach or detach a network to your router.
- **Adding, modifying or removing a router** - Add, modify or remove a router from your network.
- **Adding, modifying or removing an interface** - Add, modify or remove an interface from your router.
- **Adding and removing an external network to a router** - Attach or detach a router from an external network. -->

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.

<!-- In GA aether only?
### Adding and removing a network to a DHCP agent ###

Use the Networking service to add or remove a network from a DHCP agent.

### Adding and removing a router to an L3 agent ###

Use the Networking service to add or remove a network from an L3 agent.
-->

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
