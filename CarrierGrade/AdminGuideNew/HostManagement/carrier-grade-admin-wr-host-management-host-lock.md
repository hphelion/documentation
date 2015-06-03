---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Locking and Unlocking a System"
permalink: /helion/openstack/carrier/admin/host/management/inventory/lock/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Locking and Unlocking a System

You can lock and unlock a system, for example when you need to make a change to the system.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

* [Lock a system](#lock)
* [Unlock a system](#unlock)
* [Forcing a Host Lock](#force)


## Lock a system {#lock}

You can lock a host in order to bring the host out of service.

On a controller node, the state transition only succeeds if there are no services running in active mode on the host.

On a compute node, the state transition only succeeds if all currently running instances on the host can be live-migrated to alternative compute nodes. Live-migration of the virtual machine instances is initiated automatically by the HP Helion OpenStack Carrier Grade as soon as the state transition is requested.

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Clicking **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

3. In the **Hosts** list, for the system to lock, select Lock Host from the **More** menu.

	Wait for the host to be reported as Locked

You can try to lock a host from the controller's command line, as follows:

	system host-lock hostname

## Unlock a host {#unlock}

Used to bring a host into service. The first step is to reset the target host to ensure that it starts from a wellknown state. The host is automatically configured, and any required software patches are applied.

The state transition only succeeds if all the necessary configuration components for the host are already in place. For example, the state transition is rejected on a compute node for which no data interfaces are defined.

To unlock the host:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Clicking **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

3. In the **Hosts** list, for the system to lock, select **Unlock Host** from the **More** menu.

	Wait for the host to be reported as unlocked

You can unlock a host from the controller's command line, as follows:

	system host-unlock hostname

## Forcing a Host Lock {#force}

If for some reason, the Lock Host command does not lock the host, you can force a lock. When selected, the system displays a warning message appropriate to the personality of the host. Use this option with caution.

To force a lock on the host:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Clicking **Inventory** on the **System Panel** section of the **Admin** menu, and then selecting the **Hosts** tab. 

3. In the **Hosts** list, for the system to lock, select **Force Lock Host** from the **More** menu.

	Wait for the host to be reported as Locked

You can force lock a host from the controller's command line, as follows:
~(keystone_admin)$ system host-lock --force hostname
Note that a force lock operation on a compute node causes an immediate service outage on all hosted
virtual machines.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----