---
layout: default
title: "HP Cloud Compute Networking"
permalink: /compute/networks/issues
product: compute

---
# HP Cloud Compute Networking Known Issues and Workarounds#

This document lists the following issues you may experience when working with our networking services and suggests workarounds for those issues:

- [A modification to a port through networking might not appear immediately in compute](#port)
- [A security group configured using networking might not appear properly in the compute services](#security)

This document also lists [network screen system messages](#messages) that you might encounter and what those messages indicate. 

**Tip**: For a list of known issues and best practices when working between the Compute and Networking services, see [Best Practices in Compute and Networking in 13.5](https://community.hpcloud.com/article/known-issues-and-best-practices-compute-and-networking-135).


##Port Configuration## {#port}
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


##Security Groups## {#security}
 
**Background**

The compute service provides only a subset of the HP Cloud Networking security group functionality.  For example, compute does not support egress rules. 

**Issue**

If you configure security groups via Networking, compute may not display the full resulting configuration.

**Workaround**

1. Use **either** the compute **or** networking service to configure security groups, but do not use both.   Using the OpenStack Networking API provides additional functionality in the form of outbound rules, which the compute API cannot display. 

Note: Security Groups are a feature of  HP Cloud Networking and are fully supported by the Networking API. A limited set of Security Group features are also accessible via the compute API for convenience and backwards compatibility. To directly access the API's broader functionality, HP recommends working only through the OpenStack Networking API and does not recommend mixing compute and OpenStack Networking API calls for security group configuration.



## Understanding network screen system messages ## {#messages}

This page provides details for the various system messages you might see while using the networks screen of the management console (MC).  This page covers the following topics:

* [Before you begin](#Overview)
* [System message 1](#SysMessage1)
* [System message 2](#SysMessage2)
* repeat as needed
* [For further information](#ForFurtherInformation)


###Before you begin### {#Overview}

Pre-reqs and overview of the screen item needed (screen shot of the networks screen with the appropriate item circled or something?).

<img src="media/IMAGE.jpg" width="580" alt="" />

List of things you need to be sure you have done before you begin this task, e.g. setting up a compute instance


###System message 1### {#SysMessage1}

  System message
  
Explanation of system message


###System message 2### {#SysMessage2}

  System message
  
Explanation of system message

repeat as needed

##For further information## {#ForFurtherInformation}

* For basic information about our HP Cloud compute services, take a look at the [HP Cloud compute overview](/compute/) page
* Use the MC [site map](/mc/sitemap) for a full list of all available MC documentation pages
* For information about the Open Stack networking features, surf on over to [their networking wiki](https://wiki.openstack.org/wiki/Quantum)
