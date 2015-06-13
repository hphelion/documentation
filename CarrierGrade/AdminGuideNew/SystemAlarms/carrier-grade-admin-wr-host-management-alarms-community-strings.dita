---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Adding an SNMP Community String"
permalink: /helion/openstack/carrier/admin/alarms/community/strings/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Adding an SNMP Community String
<!-- From the Titanium Server Admin Guide -->

To enable SNMP services you need to define one or more SNMP community strings using the command line interface.

No default community strings are defined on the HP Helion OpenStack Carrier Grade after the initial commissioning of the cluster. This means that no SNMP operations are enabled by default.

The following exercise illustrates the system commands available to manage and query SNMP community strings. It uses the string commstr1 as an example.

All commands must be executed on the active controller's console, which can be accessed using the OAM floating IP address. You must log in as user admin in order to execute the commands.

1. Add the SNMP community string commstr1 to the system.

		system snmp-comm-add -c commstr1

	The following are attributes associated with the new community string:

	* **access** - The SNMP access type. In the HP Helion OpenStack Carrier Grade all community strings are read-only.
	* **uuid** - The UUID associated with the community string.
	* **community** - The community string value.
	* **view** - The is always the full MIB tree.

2. List available community strings.

		system snmp-comm-list

3. Query details of a specific community string.

		**system snmp-comm-show commstr1**

4. Delete a community string.

		system snmp-comm-delete commstr1

Community strings in the HP Helion OpenStack Carrier Grade provide query access to any SNMP monitor workstation that can reach the controller's OAM address on UDP port 161.

You can verify SNMP access using any monitor tool. For example, the freely available command snmpwalk can be issued from any host to list the state of all SNMP Object Identifiers (OID):

		$ snmpwalk -v 2c -c commstr1 10.10.10.100 > oids.txt

In this example, 10.10.10.100 is the HP Helion OpenStack Carrier Grade's OAM floating IP address. The output, which is a large file, is redirected to the file oids.txt.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----