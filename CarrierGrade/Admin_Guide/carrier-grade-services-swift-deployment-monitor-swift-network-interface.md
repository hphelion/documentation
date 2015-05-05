---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Monitor the Speed of Network Interface Card"
permalink: /helion/openstack/carrier/services/object/swift/monitor-speed-of-NIC/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Karthik P, Binamra S

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/carrier/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174; Carrier Grade (Alpha): Monitor the Speed of Network Interface Card

The ***Icinga*** service, which runs in the undercloud, helps cloud admins monitor the speed of  Network Interface Card (NIC) of the all the swift nodes.


##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed. <br /> (*Starter Object Storage (Swift) nodes are functional by default as they are part of cloud deployment*)
* The Icinga service is active and running in the undercloud


##Monitoring the Speed of NIC

The Icinga monitors the minimum NIC speed requirement of the host. The performance of Swift cluster is dependent on the Ethernet speed and on the NIC of the machine.  It is recommended to have a minimum  NIC speed. If the host does not meet the required NIC speed then an error occurs.

Perform the following steps to monitor minimum NIC speed:

1. In the undercloud Horizon dashboard, log in to the **Icinga Dashboard** (http://&lt;Undercloud_IP&gt;/icinga/). The default login credentials are as follows:
		
    * Username: *icingaadmin*
	* Password: *icingaadmin* 

2. Click **Status** on the left panel and then click 
<a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Host Detail</i></b><!--(opens in a new window)--></a>.

3. In the **Host** column, <a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>click the icon</b><!-- (opens in a new window)--> </a> next to the host IP when the tooltip displays as "View Service Details For This Host". <br />
The page navigates to Service Status Details For Host &lt;Swift node IP address &gt; and displays the <a href="javascript:window.open('/content/documentation/media/swift_icinga-network-interface.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>status of the NIC speed</b><!-- (opens in a new window)--></a>   of the selected Swift node.


<!--
4. Click the target Swift node IP address to open the  <a href="javascript:window.open('/content/documentation/media/swift_icinga-mount-points.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Service Status Details For Host &lt;Swift node IP address &gt;</i></b></a> to view the disk usage of the selected Swift node.-->


##Status Messages

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
    <th><center>Cause/Resolution</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>Network interface check completed:OK
</td>
    <td> </td>
</tr>
<tr style="background-color: white; color: black;">
	<td>WARNING </td>
	<td>WARNS- Network Interface check completed: Rx Over runs warning -15 
</td>
    <td>Verify for the errors in <b>/proc/net/dev</b>.  
</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>CRITICAL </td>
	<td>CRIT - Network interface check completed: The network speed is 1000Mb/s and not matching.</td>
    <td>Check for the network speed using ethtool.
</td>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

 



