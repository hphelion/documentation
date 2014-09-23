---
layout: default
title: "HP Helion OpenStack&#174; Configuring your Helion network securely"
permalink: /helion/openstack/ga/install/security/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/esx/">NEXT &#9654;</a> </p>


# HP Helion OpenStack&#174; Network Security

The Helion OpenStack Commercial release has many built-in security controls, but the customer must take responsibility for configuring the network devices that integrate Helion services into an existing data center environment.  This includes defining firewall rules at the edge of the Helion deployment to protect against external abuse as well as defining router rules within the Helion deployment to protect against insider abuse or error.

* [Network Topology](#network)
* [Secure the Perimeter](#peri)
* [Secure the Swift Back-End Traffic](#swiftback)

## Network Topology<a name="network"></a>

HP recommends that the customer deploys network devices into the Helion OpenStack Commercial implementation as depicted in the following network diagram.

<a href="javascript:window.open('/content/documentation/media/topology_kvm.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for KVM network architecture.</a>(opens in a new window)

<a href="javascript:window.open('/content/documentation/media/topology_esx.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX network architecture.</a>(opens in a new window)

In the diagram above, the customer’s devices that perform  internal routing and external routing are depicted as small cloud icons, and the firewall is depicted as a brick wall icon.  The following sections provide guidance on how to configure these network devices for improved security.

## Secure the Perimeter<a name="peri"></a>

To protect against external attack on Helion services, the firewall should be configured with a rule to block any request originating from outside the network attempting to reach the Swift Object
nodes.  If the 3PAR array is dedicated to Helion use, then define a firewall rule to block any request originating from outside the network attempting to reach the 3PAR array.
(We should add details about node names and ports).

## Secure the Swift Back-End Traffic<a name="swiftback"></a>

Swift requests travel from the external network, to an HAproxy on an Overcloud controller, which then forwards the request to a Swift node over the Management network, depicted as follows:

(NOTE: This is a lot of information, but I think we need to provide the customer with some sort of diagram as an aid to their understanding.  This diagram is a placeholder.  I think we should start with Sameer’s original source, but remove the interface labels from the threat analysis review: 5.SP-PAC (HTTP), etc.  We can go with all arrows being unlabeled.  If you guys think that including this diagram is “too much information” then I can agree to omit the diagram).

<a href="javascript:window.open('/content/documentation/media/topology_swift.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX network architecture.</a>(opens in a new window)

To protect against insider abuse or mistakes, the customer router should be configured with rules as follows.  When adding rules to the customer router, take care not to introduce rules that will prevent authorized network traffic between nodes.

1.  Block any requests directly to the Swift Object nodes from compute nodes.  (Valid user requests from the compute nodes will be passed via the HAproxy on the Controller nodes).

2. For defense in depth, block requests from the external network to Swift Object nodes (as already mentioned for the firewall configuration).

3. Swift Admin will access Swift nodes from Undercloud using SSH and such access must be allowed.

4. Swift nodes synchronize objects between themselves to maintain replicas, and this traffic must be allowed.

Note that the Helion OpenStack Commercial release includes IPtables rules on each node to close network ports that are not needed.   Unused ports are already blocked on each node are described at: (some URL). 
<!--
## Securing iSCSI Traffic<a name="iscsi"></a>

?? Gary, can you draft some guidance here?  It seems that we should list the desired source and destination, plus the required ports and protocols.  The format could be similar to the Swift section.  I think it would be more clear to have separate sections for Swift and iSCSI. ?? 


## Securing ESX Traffic

?? This section is out of scope for the Swift work to be done by Sameer, Jack, Gary and David.  James Gu and David need to write the part for ESX, but I think it makes sense to include all the network configuration guidance on one page.  I’ve added it as a reminder and placeholder here.

<a href="javascript:window.open('/content/documentation/media/topology_esx.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX network architecture.</a>(opens in a new window)

## Securing the Service LAN

?? This section is out of scope for the work to be done by Sameer, Jack, Gary and David.  James Gu and David need to write the part for the Service LAN, but I think it makes sense to include all the network configuration guidance on one page.  I’ve added it as a reminder and placeholder here.
-->  