---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): System Configuration Management"
permalink: /helion/openstack/carrier/admin/system/config/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): System Configuration Management #

<!-- modeled after Wind River Admin Guide -->

You can make changes to the HP Helion OpenStack Carrier Grade initial configuration at any time after installation.

The initial configuration of the networking and interfaces is defined during software installation. After installation, you can make changes using the web administration interface or the CLI.

For most types of changes, you can do this without interrupting system operations.

You can change the initial configuration as follows:

* Reconfigure aspects of the External OAM network, including the subnet, controller IP addresses, gateway IP address, and floating IP address.
* Change the DNS server IP addresses.
* Change the NTP server IP addresses.
* Change the disk allocations for database storage, image storage, backup storage, and Cinder volume storage.
* Add an infrastructure network if one is not already configured.

	**Note:** A service interruption is required to add an infrastructure network; all nodes except the active controller must be locked. In addition, you must use the CLI to make this change.

To make changes using the web administration interface, you must be logged in as the admin user. Use the System Configuration pane, is available from the System Panel section of the Admin menu.

To make changes using the CLI, you must be logged in as the `root` user on the active controller, and sourced as the Keystone admin user. 

See the following topics:

* [Host Status and Alarms During System Configuration Changes](/helion/openstack/carrier/admin/system/config/alarms/)
* [Changing the External Network (OAM) IP Configuration](/helion/openstack/carrier/admin/system/config/ext/)
* [Changing the DNS Server Configuration](/helion/openstack/carrier/admin/system/config/dns/)
* [Changing the NTP Server Configuration](/helion/openstack/carrier/admin/system/config/ntp/)
* [Changing Storage Space Allotments on the Controller](/helion/openstack/carrier/admin/system/config/allotment/)
* [Adding an Infrastructure Network Using the CLI](/helion/openstack/carrier/admin/system/config/cli/)

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
