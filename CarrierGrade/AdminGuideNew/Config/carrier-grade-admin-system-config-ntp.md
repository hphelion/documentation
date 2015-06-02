---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Changing the NTP Server Configuration"
permalink: /helion/openstack/carrier/admin/system/config/ntp/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Changing the NTP Server Configuration #

<!-- modeled after Wind River Admin Guide -->

You can change the NTP server addresses defined for HP Helion OpenStack Carrier Grade at any time after installation.

During installation, the HP Helion OpenStack Carrier Grade is configured with up to three NTP server IP addresses. You change these addresses using the web administration interface or the CLI.

Before changing NTP server addresses, review the Fault Management page and ensure that any existing system alarms are cleared.

**Note:** For the HP Helion OpenStack Carrier Grade system to use FQDN servers instead of IPv4 servers, at least one valid DNS server must be specified.

1. [Launch the HP Helion OpenStack Horizon Dashboard](/helion/openstack/carrier/dashboard/login/).

	* Use the IP address for the appropriate region where you want to make the change, either: the hLinux region or the Wind River Linux region.
	
	The **System Configuration** pane is available from the System Panel section of the Admin menu.

2. Select the **NTP** tab.

	The **NTP** page appears, showing the currently defined NTP servers and their IP addresses.

3. Click **Edit NTP**.

	The **Edit NTP** dialog box appears.

4. Replace the NTP Server IP addresses or names with different ones as required.

	If you specify the NTP servers using FQDNs you must have at least one valid DNS server defined on your system.

5. Click **Save**.

	This raises major alarms against the controllers and services. You can view the alarms on the Fault Management page.

6. Lock then unlock the controllers to clear the alarms. 

	For more information, see [Locking and Unlocking a System](/helion/openstack/carrier/admin/system/config/ntp/).

	Wait for the host to become available. It is updated with the new NTP server addresses, and its error message is cleared.

7. Perform a swact on the active controller.

	Click **More > Swact Host** for the active controller.

8. Lock the original controller (now in standby mode).

	Wait for the lock operation to be completed.

9. Unlock the original controller.

	Wait for it to become available. It is updated with the new NTP server addresses, and its error message is cleared.

10. Make sure that the 250.001 Configuration out-of-date alarms are cleared for both controllers.


 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
