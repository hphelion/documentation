---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring SNMP Trap Destinations"
permalink: /helion/openstack/carrier/admin/alarms/snmp/traps/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Configuring SNMP Trap Destinations
<!-- From the Titanium Server Admin Guide -->

SNMP trap destinations are hosts configured in the HP Helion OpenStack Carrier Grade to receive unsolicited SNMP notifications.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

Destination hosts are specified by IP address, or by host name if it can be properly resolved by the HP Helion OpenStack Carrier Grade. 

Notifications are sent to the hosts using a designated community string so that they can be validated.

1. Configure IP address 10.10.10.1 to receive SNMP notifications using the community string commstr1.

	system snmp-trapdest-add -c commstr1 --ip_address 10.10.10.1

	The following are attributes associated with the new community string:

	* uuid -The UUID associated with the trap destination object.
	* ip_address - The trap destination IP address.
	* community - The community string value to be associated with the notifications.
	* type - snmpv2c_trap, the only supported message type for SNMP traps.
	* port -  The destination UDP port that SNMP notifications are sent to.
	* transport - The transport protocol used to send notifications.

2. List defined trap destinations.

		system snmp-trapdest-list

3. Query access details of a specific trap destination.

		system snmp-trapdest-show 10.10.10.1

4. Disable the sending of SNMP notifications to a specific IP address.

		$ system snmp-trapdest-delete 10.10.10.1


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----