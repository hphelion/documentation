---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): The Life Cycle of a Host System"
permalink: /helion/openstack/carrier/admin/host/management/lifecycle/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): The Life Cycle of a Host System
<!-- From the Titanium Server Admin Guide -->


The life cycle of a host is the set of state transitions the host goes through as its current state changes. The host states in the HP Helion OpenStack Carrier Grade are based on the ITU X.731 State Management Function Specification for Open Systems.

The current state of a host is determined by the allowed combinations of the administrative, operational, and availability states at any given time. The following figure illustrates the life cycle of a host.

The description that follows uses the availability states only.

The life cycle of a new host starts when it is discovered by the active controller on the internal management network.

A new host is initially reported as Offline. As an exception, the first controller, controller-0, is automatically set to available during initial commissioning. The following are the available transitions. Numbers are attached to them for easier reference:

* **Offline to Online** -  This transition takes place once the administrator configures the host name and personality of the host. During the transition, the HP Helion OpenStack Carrier Grade software is installed and the host reboots. The transition concludes when the controller establishes maintenance and inventory connectivity with the new host.
* **Online to InTest** - This transition takes place when the administrator requests to move the host from the locked to the unlocked
administrative states. The host reboots first. After it finishes booting, it establishes maintenance communication and enters the transient InTest state. 
	While in this state, the configuration is applied, and a set of hardware and software tests are executed to ensure the integrity of the host.
* **InTest to Available, Degraded, or Failed** - The transition is initiated automatically after the activities in the transient state inTest are complete. Depending on the outcome, the host goes into one the three states.
* **Failed to InTest** - This is a value-added maintenance transition that the HA framework executes automatically to recover failed
hosts.
* **Available to/from Degraded, Available to Failed, and Degraded to Failed** These are transitions that may occur at any time due to changes on the operational state and faults on unlocked hosts.
* **Available, Degraded, or Failed, to Offline** - These are maintenance transitions that take place automatically to reflect the operational state of a host.
	On a compute node in Available or Degraded state, the transition triggers the live migration of the active instances to another available compute node.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----