---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Controller Nodes"
permalink: /helion/openstack/carrier/admin/host/management/active/nodes/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Working with Controller Nodes
<!-- From the Titanium Server Admin Guide -->

You can replace controller nodes or disks while the system is running.
The HP Helion OpenStack Carrier Grade system uses exactly two controllers; you cannot add or remove a controller.
However, you can replace the primary or secondary disks, and you can replace faulty controller nodes.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

**Note:** If you are replacing disks in order to increase the controller storage capacity, follow the instructions for Changing Storage Space Allotments on the Controller.

To replace a controller node on an active system:

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

	* Use the IP address for the appropriate region where you want to make the change, either: the hLinux region or the Wind River Linux region.

2. Click the **Admin** dashboard, then the **System** panel, then the **System Inventory** link.

3. Click the **Hosts** tab.

2. Lock the standby controller by clicking **More** then **Lock Host** for the controller.
Wait for the procedure to be completed.
2. Power down the standby controller and make any required hardware changes.
This may involve replacing disks, or replacing the host completely.
3. Place the new or modified controller into service.
a) Power up the controller.
Wait until the controller is reported as Locked, Enabled, and Available.
b) If required, reinstall the HP Helion OpenStack Carrier Grade software on the controller.
If you are making disk changes to increase storage capacity, you must re-install the HP Helion OpenStack
Carrier Grade software. For more information, see Changing Storage Space Allotments on the Controller on
page 69.
To reinstall the software on a host , click More > Reinstall.
Note:
If the host does not boot from the management network, ensure that the host BIOS is configured for
PXE boot.
Wait for the host to be reported as Locked, Disabled, and Online.
c) Perform a swact.
Click More > Swact Host for the active controller.
The standby controller becomes the active controller, and the original active controller is placed into standby.
4. Lock the original active controller (now in standby).
Open the Hosts list by clicking Inventory on the System Panel section of the Admin menu, and then selecting
the Hosts tab.
Click More > Lock Host for the controller.
Wait for the procedure to be completed.
5. Power down the controller and make the same hardware changes.

Caution:
The configurations for controller-0 and controller-1, including disk types and sizes, must be identical.
6. Power up the new or modified controller.
7. If required, reinstall the HP Helion OpenStack Carrier Grade software on the controller.
The updated controllers are now in service. The controller that was formerly active is now the standby controller.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----