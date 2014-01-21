---
layout: default
title: "How To's with the Networking Service"
permalink: /compute/using/
product: compute

---
# How To's with the Networking Service

##Known Issues and Workarounds## {#KnownIssuesandWorkarounds}
###Port Configuration:###
**Background**

The HP Cloud compute service attaches virtual servers to the network via HP Cloud Networking ports, which are created in one of the two following ways:

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


###Security Groups: 
 
**Background**

The compute service provides only a subset of the HP Cloud Networking security group functionality.  For example, compute does not support egress rules. 

**Issue**

If you configure security groups via Networking, compute may not display the full resulting configuration.

**Workaround**

1. Use **either** the compute **or** networking service to configure security groups, but do not use both.   Using the OpenStack Networking API provides additional functionality in the form of outbound rules, which the compute API cannot display. 

Note: Security Groups are a feature of  HP Cloud Networking and are fully supported by the Networking API. A limited set of Security Group features are also accessible via the compute API for convenience and backwards compatibility. To directly access the API's broader functionality, HP recommends working only through the OpenStack Networking API and does not recommend mixing compute and OpenStack Networking API calls for security group configuration.
