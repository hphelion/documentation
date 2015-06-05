---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Host Status and Alarms During System Configuration Changes"
permalink: /helion/openstack/carrier/admin/system/config/alarms/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Host Status and Alarms During System Configuration Changes

<!-- modeled after Wind River Admin Guide -->

For all types of configuration changes, alarms and status messages appear while the system is in transition. You can use the information provided by these messages to help guide the transition successfully.

Configuration changes require multiple hosts to be reconfigured, during which the settings across the cluster are not consistent. This causes alarms to be raised for the system:

* Changes to the DNS server configuration cause transitory alarms. These alarms are cleared automatically when the configuration change is applied.
* Changes to the External OAM network IP addresses or NTP server addresses, and in particular to the controller storage allotments, cause persistent alarms. These alarms must be cleared manually, by locking and unlocking the affected hosts or performing other administrative actions.

Alarms appear on the **Fault Management** pane, and related status messages appear on the **Hosts** tab on the **Inventory** pane. A variety of alarms may be reported on the Fault Management page, depending on the configuration change.

On the **Hosts** tab of the **System Inventory** pane, the status `Config out-of-date` is shown for hosts affected by the change. Each host with this status must be locked and then unlocked to update its configuration and clear the alarm.

**Caution:** To help identify alarms raised during a configuration change, ensure that any existing system alarms are cleared before you begin.

## Viewing alarms {#viewing}

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **Fault Management** link.

The Fault Management tab contains two tabs:

* **Active Alarms:** - A list of all active or set alarms in the system.
* **Historical Alarms** - A history of set and clear alarm operations in the system.

For more information, see [Working with System Alarms](/helion/openstack/carrier/admin/alarms/).

## Viewing alarm status {#status}

To view the status of hosts affected by alarms:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
