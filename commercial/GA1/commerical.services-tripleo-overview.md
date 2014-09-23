---
layout: default
title: "HP Helion OpenStack&#174; TripleO Service Overview"
permalink: /helion/openstack/ga/services/tripleo/overview/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/services/dns/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/compute/overview/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&reg; TripleO Service Overview#

TripleO (OpenStack-On-OpenStack) is a service that handles installing, upgrading and operating OpenStack clouds using OpenStack's own cloud facilities as the foundation. TripleO builds on the [Compute](/helion/openstack/ga/services/compute/overview/), [Networking](/helion/openstack/ga/services/networking/overview/) and [Orchestration](/helion/openstack/ga/services/orchestration/overview/) services to automate fleet management for as few as two machines or a full data center.

The [HP Helion OpenStack installation](/helion/openstack/ga/install/) follows the standard TripleO deployment model, creating a Seed, an Undercloud and an Overcloud.


##Key Terms

Key terms include:

- **Seed** - The Seed cloud is a bootable image that is deployed in a VM instance. This image, which is provided as part of HP Helion OpenStack, contains the minimum services required for OpenStack to function and to provision physical hardware to deploy the Undercloud.

- **Undercloud** - The Undercloud server is a basic single-node OpenStack installation running on a single physical server used to deploy, test, manage, and update the overcloud servers. There is no HA configuration for the Undercloud. It contains a strictly limited sub-set of OpenStack services; just enough to  permit interaction with the Overcloud. 

- **Overcloud** - The Overcloud is the functional cloud available to end users for running guest virtual machines and workloads. 

## For more information ##

For information on TripleO, see the official [OpenStack TripleO wiki](https://wiki.openstack.org/wiki/TripleO).

For more information on the HP Helion OpenStack deployment model, see [HP Helion OpenStack Technical Overview](/helion/openstack/ga/technical-overview/).

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

