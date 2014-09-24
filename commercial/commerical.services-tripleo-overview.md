---
layout: default
title: "HP Helion OpenStack&#174; TripleO Service Overview"
permalink: /helion/openstack/services/tripleo/overview/
product: commercial

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/services/dns/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/compute/overview/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&reg; TripleO Service Overview#

TripleO (OpenStack-On-OpenStack) is a service aimed at installing, upgrading and operating OpenStack clouds using the OpenStack cloud facilities as the foundations. It builds on the [Compute](/helion/openstack/services/compute/overview/), [Networking](/helion/openstack/services/networking/overview/) and [Orchestration](/helion/openstack/services/orchestration/overview/) services to automate fleet management at data center scale or scale down to as few as two machines.

The [HP Helion OpenStack installation](/helion/openstack/install-beta/) includes the standard TripleO deployment model,  which creates a Seed cloud, an Undercloud and an Overcloud.


##Key Terms

Key terms include:

- **Seed** - The Seed cloud is a bootable image that is deployed in a VM instance. It is provided as part of HP Helion OpenStack.  This image contains the minimum services required for an OpenStack cloud platform to function and to be able to provision physical hardware to deploy the undercloud.

- **Undercloud** - The Undercloud server is a basic single-node OpenStack installation running on a single physical server. The Undercloud is used to deploy, test, manage, and update the Overcloud servers. There is no HA configuration for the Undercloud. It contains a strictly limited sub-set of OpenStack technology: the absolute minimum required to interact with the Overcloud. 

- **Overcloud** -- The Overcloud is the functional cloud available to end users for running guest virtual machines and workloads. 

## For more information ##

For information on TripleO, see the official [OpenStack TripleO wiki](https://wiki.openstack.org/wiki/TripleO).

For more information on the HP Helion OpenStack deployment model, see the [HP Helion OpenStack Technical Overview](/helion/openstack/technical-overview/).

####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>
