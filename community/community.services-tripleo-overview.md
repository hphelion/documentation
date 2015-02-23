---
layout: default
title: "HP Helion OpenStack&#174; TripleO Service Overview"
permalink: /helion/community/services/tripleo/overview/
product: community

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/services/overview/">&#9650; UP</a> | <a href="/helion/community/services/compute/overview/"> NEXT &#9654</a> </p>
-->

# HP Helion OpenStack&reg; Community TripleO Service Overview#

TripleO (OpenStack-On-OpenStack) is a service that handles installing, upgrading and operating OpenStack clouds using OpenStack cloud facilities as the foundation. TripleO builds on the [Compute](/helion/community/services/compute/overview/), [Networking](/helion/community/services/networking/overview/) and [Orchestration](/helion/community/services/orchestration/overview/) services to automate fleet management for as few as two machines or a full data center.

The [HP Helion OpenStack installation](/helion/community/install-overview/) follows the standard TripleO deployment model, creating a seed, an undercloud and an overcloud.


##Key Terms

Key terms include:

- **seed** - The seed cloud is a bootable image that is deployed in a VM instance. This image, which is provided as part of HP Helion OpenStack, contains the minimum services required for OpenStack to function and to provision physical hardware to deploy the undercloud.

- **undercloud** - The undercloud server is a basic single-node OpenStack installation running on a single physical server used to deploy, test, manage, and update the overcloud servers. There is no HA configuration for the undercloud. It contains a strictly limited sub-set of OpenStack services; just enough to  permit interaction with the overcloud. 

- **overcloud** - The overcloud is the functional cloud available to end users for running guest virtual machines and workloads. 

## For more information ##

For information on TripleO, see the official [OpenStack TripleO wiki](https://wiki.openstack.org/wiki/TripleO).


 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

