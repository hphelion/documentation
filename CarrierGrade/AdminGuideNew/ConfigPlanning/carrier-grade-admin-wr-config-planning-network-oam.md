---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the OAM Network"
permalink: /helion/openstack/carrier/configuration/plan/network/oam/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the OAM Network
<!-- From the Titanium Server Admin Guide -->

The OAM (operations, administration, and management) network enables the web administration interface, the command-line management clients, SNMP interface, and the REST APIs to manage the HP Helion OpenStack Carrier Grade cluster.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

You must consider the following guidelines:

* Deploy proper firewall mechanisms to access this network. Ensuring that access to the HP Helion OpenStack Carrier Grade management interfaces is not compromised should be of primary concern.

* Consider whether the OAM management network needs access to the open Internet. Limiting access to an internal network might be advisable, keeping in mind that access to configured DNS and NTP servers may still be needed.

* VLAN tagging is supported, enabling this network to share an interface with the management or infrastructure networks.

* For the IPv4 address plan, consider the following:

* The OAM IP floating address is the only address that needs to be visible externally. Therefore you must plan for valid definitions of its IPv4 subnet and default gateway.

* The physical IPv4 addresses for the controllers don't need to be visible externally, unless you plan to use them during ssh sessions to prevent potential service breaks during the connection. You still need to plan for their IPv4 subnet, but you can limit access to them as required.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----