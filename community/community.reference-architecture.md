---
layout: default
title: "HP OpenStack Community Edition: Reference Architecture"
permalink: /cloudos/community/reference-architecture/
product: community

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/community/">&#9664; PREV</a> | <a href="/cloudos/community/">&#9650; UP</a> | NEXT &#9654; </p>

# HP OpenStack&#174; Community Edition Reference Architecture
HP OpenStack Community Edition is delivered as a set of images plus a configuration utility:

- Seed Cloud Image - A bootable image that is deployed into a VM
- Undercloud Image - An image that is deployed by the seed cloud onto a single physical server to create the Undercloud
- Overcloud Images - Images that are deployed onto physical servers by the Undercloud. Overcloud images have specialised roles:   Management, Swift, and Compute 

Users cannot build or rebuild the images.  Direct editing of the Heat templates is possible but not supported.  Configuration is limited to those items supported by the configuration tool and Horizon. 

The HP OpenStack Community Edition uses the standard TripleO deployment model:

- A seed cloud (a sealed bootable image provided as part of HP OpenStack Community Edition) is deployed in a VM.  This image contains a small but operational OpenStack cloud.  The user adds a single bare-metal node to the seed cloud and provisions it with the Undercloud Image.    This server then becomes the Undercloud.
- The Undercloud image is also a complete OpenStack Cloud running on a single physical server, which will be used to deploy and update the Overcloud (the general purpose,.multi-node cloud that will host customers VMs and applications)
- Physical servers are added to the undercloud and then provisioned with Overcloud images.   Image deployment includes post-deployment configuration via Heat.

The minimum configuration is seven physical servers:

- One VM for the seed cloud
- One Undercloud Server
- Three Overcloud Management Servers
- Two Swift Object Servers
- One Compute Server

Note that the seed cloud resides on a VM and is not counted as a physical server.

The maximum supported configuration is 36 servers consisting of 30 compute servers and six configuration and management servers. The following illustration shows the deployment architecture.

<a href="javascript:window.open('/content/documentation/media/openstack-community-deployment-architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP OpenStack Community Edition deployment architecture diagram (opens in a new window)</a>

##Seed Cloud

The seed cloud is a VM created by the customer to a CloudOS specification, and booted from an image provided as part of CloudOS.   The seed cloud is used to deploy and update the Undercloud.

##Undercloud

The Undercloud server is a basic, single-node, OpenStack cloud running Nova bare-metal (Ironic), plus the CODN and CloudOS Installer.    It is used only to deploy, test, and update the Overcloud Servers.
It is not required for successful operation of a deployed Overcloud.

It includes Neutron only to act as a DHCP server. Undercloud Neutron does not perform any network configuration

It does not include Cinder, as this is not required for bare-metal servers.

It does not include Swift, as  Undercloud Glance uses file-based storage for Overcloud images

Tempest is included in the Undercloud so that the Overcloud operation can be tested. Tempest forms part of the diagnostic tooling for install verification and support.   Tests are limited to those that can be run as an unprivileged user.

There is no HA configuration for the Undercloud.

##Overcloud

Three managememt servers are required to provide quorum-based HA configurations for clustered services, such as MySQL and RabbitMQ.  The third server can also run a separate management API service, allowing the main API servers to match the configuration deployed in Public Cloud.

Two of the management servers have an identical configuration in terms of the services they support.  The third server runs a collection of mainly singleton services related to cluster management. The only exceptions being Cinder-volume and Neutron-l3-agent to maximise volume disc capacity and reduce the scope of impact of a failure of these services. 

All services share a common database and RabbitMQ service. Separation comes from schemas and vhosts, respectively.


Nova-API servers provide both Openstack API and the metadata API, but not the EC2 API

See Overcloud HA Configuration for specific details of the availability attributes of each service.

#Physical Network Architecture

The following information describes the physical network configuration which must be configured by the customer.

##Assumptions

Physical network ports are available on each server:

- One IPMI/iLO port
- One physical Ethernet port (for example, eth0) or two physical Ethernet ports in a bond (for example, bond0) for the hypervisor/OS

 Network fabric:

- Two physical links, one for IPMI/iLO and one for the hypervisor/OS
- Network switches capable of basic VLAN, L2 and L3 functions that have no dependencies (for example, VxLAN-capable or OpenFlow-enabled switch)

The physical hypervisor/OS network is shared by a number of logical networks.  Each logical network has its own VLAN and IP subnet.

##Networks

<table>
  <tr>
    <th>Network</th>
    <th>Description</th>
    <th>VLAN type</th>
    <th>Server port</th>
  </tr>
  <tr>
    <td>IPMI/iLO</td>
    <td>Network</td>
    <td>untagged</td>
    <td>IPMI/iLO</td>
  </tr>
  <tr>
    <td>Undercloud<br>Management</td>
    <td>Traffic for Undercloud internal OpenStack calls, Glance image downloads, etc.  Also provides access to Undercloud API endpoints.</td>
    <td>untagged</td>
    <td>eth0 or<br>bond0<br>(PXE boot for overcloud servers)</td>
  </tr>
  <tr>
    <td>Overcloud<br>Management</td>
    <td>Traffic for Overcloud internal OpenStack calls, Glance image downloads, etc.  </td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
  <tr>
    <td>SDN</td>
    <td>Network between workload VMs, for example, carries VxLAN traffic.</td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
  <tr>
    <td>Storage</td>
    <td>iSCSi traffic between VMs and Storage products like StoreVirtual.</td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
  <tr>
    <td>External</td>
    <td>Connected to Internet or Intranet. Floating IPs come from here. </td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
 <tr>
    <td>External API</td>
    <td>Connected to Internet or Intranet, provides access to Overcloud API endpoints. </td>
    <td>tagged</td>
    <td>eth0 or<br>bond0</td>
  </tr>
</table>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
<!-- null comment added -->
