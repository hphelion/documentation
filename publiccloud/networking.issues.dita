---
layout: public-cloud
title: "Known Issues and Workarounds with the Networking Service"
permalink: /publiccloud/compute/network/known-issues/
product: compute
published: false

---
<!--PUBLISHED-->
# HP Helion Public Cloud Compute Known Issues and Workarounds with the Networking Service

<!-- Taken from the doc known as the Network Guide ("HP Helion Public Cloud Networking overview) /compute.network-guide.md. Also from Working with Nova and Neutron in 1.1 per DOCS 202) -->

The following are some known issues and best practices you should observe when using the HP Helion Public Cloud Networking service:

- [New Instances are not automatically assigned a floating IP address](#floatingIP)
- [All ports associated with an instance will be deleted when the instance is deleted](#PortDelete)
- [Issues due to Compute and Networking APIs containing overlapping components](#NovaNeutron) 
- [Specify the network in commands in a multiple network environment](#MultiNet)
- [Security groups cannot be assigned to port in Compute](#SecGroupPort)
- [Quota limits not reported by Compute](#quota)

## New Instances are not automatically assigned a floating IP address ## {#floatingIP}

**Background**

By design, in 13.5 servers do not get automatically assigned a floating IP address. In 12.12, instances were assigned a floating IP address upon creation. 


**Issue** 

In 13.5, instances are not automatically assigned an IP address. 

Until you assign a floating IP address, a servers can make outbound connections to the Internet, but cannot receive an inbound connections from the Internet.

**Workaround**

You must allocate and assign an IP address from the subnet of the network an instance is attached to. 


## All ports associated with an instance will be deleted when the instance is deleted ## {#PortDelete}

**Background**

The HP Helion Public Cloud Compute service attaches virtual servers to the network via HP Helion Public Cloud Networking ports, which are created in one of the two following ways:

1. You can create ports in the Networking service, which can be used by the Compute service. 

    OR

2. You can allow Compute to create the required ports when you create an instance.    

**Issue**

If you delete an instance using the Compute service, regardless of which method you use, all the ports associated with that instance will be deleted also, even if you created the ports in the Networking service. 

 
**Workarounds**

There is no workaround for this issue.


## Overlapping API operations in the Compute API and Neutron API can cause issues ## {#NovaNeutron}

The HP Helion Public Cloud Compute and Networking services are based on the OpenStack Compute and Networking APIs, which are currently in a transition phase.  

OpenStack has created a new API for networking, called [Neutron](https://wiki.openstack.org/wiki/Neutron). Neutron is intended to contain all networking operations.  

However, the OpenStack Compute API, called [Nova](https://wiki.openstack.org/wiki/Nova), contains some legacy networking capability. 

HP Helion Public Cloud Services (HPCS) continues to provide basic network capability, through the Compute service, to make the migration from 12.12 to 13.5 easier.  

During this transition, some operations are supported in both APIs. For example, you can work with floating IPs and security groups using eitehr APIs.

As a result of having operations supported by both APIs, some issues can arise. These issues affect you whether you access the APIs using the [HP Horizon Console](https://horizon.hpcloud.com/), [command-line interface software](http://docs.hpcloud.com/cli/), or [directly](http://docs.hpcloud.com/api/). 

This section lists issues that result from the overlapping of these two APIs. 

**Note:** A future HP Helion Public Cloud release is planned to resolve some of these issues between Compute and Networking functionality.

### Issues resulting from the Compute service internal cache ### {#cache}

The Compute service contains an internal cache of network and server configurations, including items such as the fixed and floating IP addresses, security groups, and port configuration. 

The Compute service refreshes the cache as needed. However, if you make a change to a network or server configuration through Networking, the internal cache in the Compute service does not automatically refresh, often taking several minutes to update.

Because of this issue, HPCS recommends that you use either Compute or Networking service for network configuration, and avoid performing tasks in both. 


### Floating IP address configuration in Networking might not appear in Compute ###

**Background**

The assignment of floating IP addresses is the most common network configuration change. 

**Issue** 

If you use the Networking API, the network data reported by the Compute service experiences the caching issues [as previously described](#cache). 

Because the cache is not updated immediately, information on modified floating IPs will not be reported properly by the Compute service.

**Workaround**

Use the Compute service to perform all floating IP commands. 

There are no functional differences between the floating IP components of the Compute service and the Networking service. HPCS recommends that you perform all floating IP configuration through the Compute service to make sure that the correct network configuration information is available.

If you do use the Networking service for floating IP commands, use the Networking service to query network information. Disregard the network information provided by the Compute service.

### Port configuration in Networking might not appear in Compute ### 

**Background**

[As previously described](#cache) the Compute service maintains an internal cache of network and server configuration. If you make changes to a port configuration, the new configuration is updated in the cache. 


**Issue**

However, if you make the change to a port using the Network service, the internal cache is not updated. 

Because the cache is not updated immediately, information on modified ports will not be reported properly by the Compute service. 

**Workaround**

If you use the Networking service configure ports, use the Networking service to query network information. Disregard the network information provided by the Compute service.

## Specify the network in commands in a multiple network environment ## {#MultiNet}

**Background**

The HPCS guest images only enable and configure the NIC connected to the first network.

**Issue**

If you have more than one Network, always be explicit about which network you want to use.

**Workaround**

Specifying a network when creating an instance is optional if you only have one network, but if you have more than one network then you specify the instance(s)  you want to connect to, and in which order.

    nova boot .... --nic network-id=<uuid#1> --nic network-id=<uuid#2>


### Security groups cannot be assigned to port in Compute ### {#SecGroupPort}

**Background**

The Compute service assigns security groups to an instance, by specifying a security group when creating an instance. The Compute service does not allow you to assign a security group to a specific port (security rules can be assigned by port). 

**Issue**

If you attach a server to more than one network and want to use different security groups on each network, use the Networking API to assign security groups at the port level. 

**Workaround**

If a server is attached to more than one network, the security group is applied to all interfaces.  

If you want to associate a different security group  to each network, you must use the Networking API to assign security groups to specific ports.  

	neutron port-create --security-group <SG1> <Network 1>

	neutron port-create --security-group <SG2> <Network 2>

	nova boot --nic port-id=<port 1> --nic port-id=<port 2>

Note that you must assign the security group when creating the port. The Networking API doesn't allow you to change the security group association after the port has been created.


### Quota limits not reported by Compute ### {#quota}

**Background**

The quota limits associated with floating IP addresses and security groups are controlled by the Networking service.

However, for systems configured to use the Compute service for networking, the Compute service also provides floating IP and security group quota limits.

**Issue**

A known OpenStack defect causes a system configured to use the quota limits reported by the Compute service to use the Networking service quota limits.

**Workaround**

For information on the impact of this defect, see the defect at [Limits API doesn't work with Quantum](https://bugs.launchpad.net/nova/+bug/1186354).

## For more information ##

For known issues and best practices when interacting with our Compute and Networking services, see [Known Issues and Best Practices in Compute and Networking in 13.5](https://community.hpcloud.com/article/known-issues-and-best-practices-compute-and-networking-135).

<!-- This may be a 12.12 legacy issue. In 12.12, one could not specify ingress or egress when creating rule. In 13.5, a rule can be ingress, egress, or both.

## Security Groups ## 
 
**Background**

The Compute service provides only a subset of the HP Helion Public Cloud Networking security group functionality.  For example, Compute does not support egress rules. 

**Issue**

If you configure security groups via Networking, Compute may not display the full resulting configuration.

**Workaround**

1. Use **either** the compute **or** networking service to configure security groups, but do not use both.   Using the OpenStack Networking API provides additional functionality in the form of outbound rules, which the compute API cannot display. 

Note: Security Groups are a feature of  HP Helion Public Cloud Networking and are fully supported by the Networking API. A limited set of Security Group features are also accessible via the compute API for convenience and backwards compatibility. To directly access the API's broader functionality, HP recommends working only through the OpenStack Networking API and does not recommend mixing compute and OpenStack Networking API calls for security group configuration.

-->
