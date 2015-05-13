---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Distributed Cloud Networking Overview"
permalink: /helion/openstack/carrier/dcn/overview/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/helion/overview/"> &#9664; HP Helion OpenStack Overview | <a href="/helion/openstack/carrier/home/">&#9650; Documentation Home</a> </p>


# HP Helion OpenStack&#174; Carrier Grade (Beta): Distributed Cloud Networking (DCN) Overview

<!-- From http://h20628.www2.hp.com/km-ext/kmcsdirect/emr_na-c04518178-1.pdf HP DCN Overview -->

Distributed Cloud Networking (DCN) is a Software-Defined Networking (SDN) solution that provides data center (DC) network virtualization and automatically establishes connectivity between compute resources upon their creation.

Leveraging programmable business logic and a powerful policy engine, the HP DCN provides an open and highly responsive solution that scales to meet the stringent needs of massive multi-tenant DCs. The HP DCN is a software solution that can be deployed over an existing DC IP network fabric.

The main components in the HP DCN solution are: Virtualized Services Directory (VSD) and Virtualized Services Directory Architect (VSD-A), Virtualized Services Controller (VSC) and Virtual Routing and Switching (VRS).

The complete component list follows:

* **Virtualized Services Directory**. The HP VSD provides a flexible and hierarchical network policy framework that enables IT administrators to define and enforce resource policies in a user-friendly manner.

	The VSD contains a multi-tenant service directory which supports role-based administration of users, compute, and network resources. It also manages network resource assignments such as IP addresses and ACLs.

* **Virtualized Services Controller**. The HP VSC is the industry's most powerful SDN controller. It functions as the robust network control plane for DCs, maintaining a full view of per-tenant network and service topologies.

	Through the VSC, virtual routing and switching constructs are established to program the network forwarding plane, the HP VRS, using the OpenFlow protocol.

	The VSC communicates with the VSD policy engine using Extensible Messaging and Presence Protocol (XMPP). An ejabberd XMPP server/cluster is used to distribute messages between the VSD and VSC entities.

	Multiple VSC instances can be federated within and across DCs by leveraging MP-BGP.

* **Virtual Routing and Switching**. The HP VRS component is an enhanced Open vSwitch (OVS) implementation that constitutes the network forwarding plane. It encapsulates and de-encapsulates user traffic, enforcing L2-L4 traffic policies as defined by the VSD. The VRS tracks VM creation, migration and deletion events in order to dynamically adjust network connectivity. 

## HP DCN Infrastructure Requirements and Recommendations

In order to make use of the HP DCN, the data center environment must meet some key requirements as described in the following sections. 

* **Data Center IP Network**. The HP DCN can be used in any data center with a IP network. The HP VSC actively participates in the IP routing infrastructure. VSCs run OSPF or IS-IS for the IGP in addition to BGP. BGP is used to form a federation of VSCs and to exchange information with external networks. In addition, BGP is also used to exchange routing information with the data center provider edge router.

* **NTP Infrastructure**. Because the HP DCN is a distributed system, it is important that the different elements have a reliable reference clock to ensure the messages exchanged between the elements have meaningful
timestamps. HP DCN relies on each of the elements having clocks synchronized with Network Time Protocol (NTP).

	The VSD and VRS applications rely on the NTP facilities provided by the host operating system. The VSC which is based on DCNOS has an NTP client.

	HP recommends having at least two NTP reference clocks configured for each system with three reference clocks preferred.

* **Domain Name System**. In scaled HP DCN deployments, the VSD functional elements can be distributed across machines into clusters of machines where the failover and load sharing mechanisms for the clusters rely on being referenced as a single DNS entity. DNS naming of VSD and XMPP elements is also required for XMPP communication within the DCN.

* **Certificate Authority**. The northbound ReST API on the HP VSD is accessed within an SSL session. The VSD can use a selfsigned certificate, but having a certificate from a certificate authority will not require the client applications to process security warnings about unrecognized certificate authorities.