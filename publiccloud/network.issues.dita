---
layout: public-cloud
title: "How To's with the Networking Service"
permalink: /publiccloud/compute/known-issues/
product: compute
published: false

---
<!--PUBLISHED-->
# HP Helion Public Cloud Compute Known Issues and Workarounds with the Networking Service

<!-- Taken from the doc known as the Network Guide ("HP Helion Public Cloud Networking overview) /compute.network-guide.md -->

The following are some known issues and best practices you should observe when using the HP Helion Public Cloud Networking service:

##Port Configuration:##

**Background**

The HP Helion Public Cloud compute service attaches virtual servers to the network via HP Helion Public Cloud Networking ports, which are created in one of the two following ways:

1. You can create ports in Networking and pass them to compute. 

    OR

2. You can allow compute to create the ports it needs for you.   

**Issue**

In both cases, when the compute service creates a server it maintains an internal cache of the list and configuration of the created ports.  Configuration items include the fixed and floating IP addresses assigned to the ports, the latter being the most likely to change. The compute service uses the cached information solely to display the network configuration details of the server in response to compute API queries. 

If you allow compute to create the ports instead of going through Networking, compute refreshes the cache as needed. However, if you make a change to the port configuration through Networking, the compute cache does not automatically refresh,  often taking several minutes to update.
 
**Workarounds**

**!!! Important: HP does not recommend mixing compute and OpenStack Networking API calls for network configuration.**


1. Compute can perform all floating IP operations. If those are the only operations you are going to perform, the   simplest workaround is to perform all floating IP manipulation through compute so it always reports the correct network configuration information for servers.

    OR  

2. To make the port configuration through Networking, disregard the network information compute displays and query Networking directly for the information.

    OR
 
3. Only make changes through the compute service for ports that are assigned to servers.


## Security Groups ## 
 
**Background**

The compute service provides only a subset of the HP Helion Public Cloud Networking security group functionality.  For example, compute does not support egress rules. 

**Issue**

If you configure security groups via Networking, compute may not display the full resulting configuration.

**Workaround**

1. Use **either** the compute **or** networking service to configure security groups, but do not use both.   Using the OpenStack Networking API provides additional functionality in the form of outbound rules, which the compute API cannot display. 

Note: Security Groups are a feature of  HP Helion Public Cloud Networking and are fully supported by the Networking API. A limited set of Security Group features are also accessible via the compute API for convenience and backwards compatibility. To directly access the API's broader functionality, HP recommends working only through the OpenStack Networking API and does not recommend mixing compute and OpenStack Networking API calls for security group configuration.

## Working with Nova and Neutron in 1.1 ##

**Background**

Networking in OpenStack is currently in something of a transition phase;  Neutron is the strategic network component which has its own API, but Nova still also supports the legacy nova-network components and so the Nova API also still includes support for basic network operations.  Because the current v2 Nova API pre-dates Neutron, the split of functionality on systems running both Nova and Neutron APIs is not as clean as it could be.

In addition HPCS has decided to continue to provide basic network capability, via the Nova API, to make the migration from 1.0 to 1.1 easier.  Nova in 1.1 therefore supports the Floating IP and Security Group API extensions, although these are really just translation layers to the Neutron API.

Note that It is expected that nova-network will be deprecated in the IceHouse release, which will also introduce the Nova v3 API, which will provide a cleaner split between Compute and Networking functionality.

At a high level, the current situation can be summarized as:

"In 1.1 you can do everything you're used to doing in 1.0 though just the Nova API.  You can do even more by also using the Neutron API.  But once you start using both there are some things we need to make you aware of ..."

This page capture those things you need to be aware of.

Bottom line is that we try to keep things simple for folks that only want/need to do simple operations via the Nova API.  Once they start using the Neutron API directly (which implies that they're doing more complex things), then we expect you to understand the consequences of this.  Mixing Nova and Neutron API calls for network configuration is not complex once you understand the issues, but it is not trivial either.

### Floating Ip Addresses ###

**Background**

In 1.1 Servers do not get automatically assigned a floating IP address.

**Issue** 

In contrast to the 1.0 system servers are now only assigned an IP address from the subnet of the network they are attached to, they no longer also get an auto-assigned public IP address.  All servers can make outbound connections to the internet, but to be able to receive an inbound connections you must explicitly allocate and assign a floating IP address to the server.

**Workaround**

Do all Floating IP commands via the Nova API.

Floating IP assignment is the most common network configuration change and if you do this via the Neutron API then the network data reported by Nova will become stale (see above).  There is no functional difference in scope between the Nova and Neutron floating IP APIs.  If you do want/need to use the Neutron API for floating IP commands then you must disregard the network information provided by Nova and instead use the Neutron API to query the configuration of the ports associated with the Server.

### Configuration Chagnes ###

**Background**

Nova doesn't track configuration changes to Neutron ports made via the Neutron API.

**Issue**

When Nova creates a server it maintains an internal cache of the network configuration, including items such as the fixed and floating IP addresses.  That cached information is used by Nova only to display the network configuration details of the server in response to API queries.  If you make the change to the network configuration via the Nova API the cache will be refreshed as required.  However If you make a change to the port configuration via Neutron, the Nova cache will not get updated and so the Nova Server Details API will return stale data.  Nova does periodically refresh the cached information, but it can take tens of minutes before the refresh.

**Workaround**

Stick to either the Nova API or Neutron API for Security Groups, but don't mix them.

The Nova Security Group API commands are limited to the security group functionality supported by nova-network.  Neutron provides additional security group functionality allowing outbound rules in addition to the inbound rules supported by Nova.  Nova won't display these rules, as it doesn't recognise them.  The Nova Security Group API is enabled as a tool for users migrating from 1.0, and for users who only want to perform simple use cases that can be met via the Nova API using the default network configuration.

If all you need is the capability supported by Nova then using the Nova Security Group API is fine, but once you start using the Neutron Security Group API in a project don't go back to the Nova API.

### Ports ###

**Background**

If you create ports in Neutron and pass them into Nova, don't expect to get them back.

**Issue**

Nova attaches Servers to the network via Neutron Ports.  You can create the Port in Neutron and pass it into Nova to use, or you can allow Nova to create the Ports it needs for you.  Either way, when you eventually tell Nova to delete an instance, it will delete all of the Neutron ports associated with that instance.

**Workaround**

### Multiple Networks ###

**Issue**

If you have more than one Network, always be explicit about which ones you want Nova to use.

**Workaround**

Providing network information to Nova when creating a server is optional if you only have one network, but if you have more than one network then you have to tell Nova which one(s) you want to connect to, and in which order.

    nova boot .... --nic network-id=<uuid#1> --nic network-id=<uuid#2>

The HPCS guest images will only enable and configure the NIC connected to the first network.

### Security groups ###

If you attach a server to more than one Network and want different security groups on each network, use the Neutron API to assign security groups at the Port Level. 

The Nova security group API, including specifying a security group as part of server creation, is based on assignment to a server.  

**Workaround**

So if your server is attached to more than one network the security group will be applied equally to all interfaces.  If this is what you want, fine - but if not you need to use the Neutron API to assign security groups to specific ports.  Neutron doesn't allow you to change the security group association with a port after it has been created, so this is a case where you have to create the ports first and then pass them into Nova.

	neutron port-create --security-group <SG1> <Network 1>

	neutron port-create --security-group <SG2> <Network 2>

	nova boot --nic port-id=<port 1> --nic port-id=<port 2>

### Quota limits ###

**Background**

Nova does not correctly reflect Floating IP and Security Group Quota Limits.

**Issue**

The quota limits associated with Floating IP addresses and Security Groups are controlled and configured in Neutron. Nova also provides quota limits for these to cover configurations that are still using Nova networking. However a bug in Nova https://bugs.launchpad.net/nova/+bug/1186354 means that even where Nova is configured to use Neutron it always displays the Nova limit values.



## For more information ##

For known issues and best practices when interacting with our Compute and Networking services, see [Known Issues and Best Practices in Compute and Networking in 13.5](https://community.hpcloud.com/article/known-issues-and-best-practices-compute-and-networking-135).
