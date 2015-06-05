---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Controller Nodes and High Availability"
permalink: /helion/openstack/carrier/admin/host/management/controller/ha/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Controller Nodes and High Availability
<!-- From the Titanium Server Admin Guide -->

Services in the controller nodes run constantly in active/standby mode to provide continuity in the event of a
controller failure.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

This topic covers the following:

* [About controller HA](#about)
* [Viewing the active controller](#controller)
* [Taking a controller out of service](#takeout)

## About controller HA {#about}

Controller services are organized internally into the following groups:

* Cloud Services - The enhanced OpenStack components, including Nova, Neutron, Cinder, Ceilometer, and Heat
* Controller Services - Core HP Helion OpenStack Carrier Grade services such as maintenance and inventory
* Directory Services - LDAP services 
* OAM Services - OAM access services
* Patching Services - Patching alarm services
* Storage Monitoring Services - Storage alarm services
* Storage Services - Storage REST API services
* Web Services - The HP Helion OpenStack Carrier Grade OpenStack Horizon service and web server

Each of these groups is run in 1:1 HA mode by the controllers. This means that while some service groups can be active on controller-0, and in standby on controller-1, others are active on controller-1, and in standby on controller-0.

The high-availability framework constantly monitors and reports on the health of the individual services within each of the service groups on both controllers. When a service fails, a decision is made on whether to restart it on the same controller, or to switch the corresponding service group to the other controller. This decision depends on the criticality and the dependencies of the affected service.

## Viewing the active controller {#controller}

Services in the Controller Services group drive core functionality in the HP Helion OpenStack Carrier Grade. The controller where they are running is referred to as the active controller. 

When working from the CLI on a controller node it is often important to ensure that you are working on the active controller, for example, to execute OpenStack admin operations, or to change the password of the wrsroot user account. See Linux User Accounts on page 16 for further details on the wrsroot account.

You can ensure you are working on the active controller by using the OAM floating IP address as the destination address in the SSH command.

To determine which host is the active controller:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

The **Hosts** tab lists the status of all hosts in the cluster; it reports the active controller as having the `Controller-Active` personality.

## Taking a controller out of service {#takeout}

For maintenance purposes, when one of the controller nodes needs to be powered down for service, it is necessary to force all currently active service groups in one controller to switch to the other. 

This can be done from the Hosts tab on the Inventory page, by selecting the option swact (switch active) in the More menu of the controller you want to take out of service:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

4. For the host you want to take out of service, click **More** then **Swact Host**. 




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----