---
layout: default
title: "HP Helion OpenStack&#174; Support Matrix"
permalink: /helion/openstack/tls/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/overview/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install/overview/">NEXT &#9654;</a> </p>
-->
<!-- IMPORTANT!!! The HW support Matrix should be approved by:
* Gavin Brebner for Helion QA support
* Lynne Christofanelli  for HW Support qualified with hLinux
* Marty Duey for third party HW support (IHV Support)
-->

# HP Helion OpenStack&#174; TLS Support

The Transport Layer Security (TLS) protocol provides the mechanisms to ensure authentication, non-repudiation, confidentiality, and integrity of user communications to the HP Helion OpenStack services and between the HP Helion OpenStack services themselves.

Given the complexity of the OpenStack components and the number of deployment possibilities, you must take care to ensure that each component gets the appropriate configuration of SSL certificates, keys, and CAs. Subsequent sections discuss the following services:

* Compute API endpoints
* Identity API endpoints
* Networking API endpoints
* Storage API endpoints
* Messaging server
* Database server
* Dashboard

OpenStack endpoints are HTTP services providing APIs to both end-users on public networks and to other OpenStack services on the management network. It is highly recommended that all of these requests, both internal and external, operate over TLS.


<!-- Sources:
http://docs.openstack.org/security-guide/content/introduction-to-ssl-tls.html
http://docs.openstack.org/security-guide/content/tls-proxies-and-http-services.html