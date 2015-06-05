---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Monitoring the Drive Audit"
permalink: /helion/openstack/carrier/services/object/swift/monitor-swift-drive-audit/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Karthik P, Keshava HP, Binamra S

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/carrier/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174; Carrier Grade (Beta): Monitoring the Drive Audit

 Drive audit runs `swift-drive-audit` <which finds>to find an errors in `kern.log`. It reports the list of drives which have errors. The devices which are used for Swift are verified for an error and then reported.  The devices are not automatically unmounted. <!-- so as to allow for the disk to self-heal?(we can use "recover"), if possible.-->

If the disk errors occur the operator must perform the maintenance on the disk by [removing the disk](/helion/openstack/carrier/services/swift/deployment/remove-existing-disk/) from the Swift cluster or [replacing the disk](/helion/openstack/carrier/services/swift/deployment/add-disk-scale-out/) with a new one. 

Note: Run **Icinga** check once in every 30 minutes for drive audit to complete one run on  a large system.

##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed. <br /> *(Starter Object Storage (Swift) nodes are functional by default as they are part of cloud deployment)*
* The Icinga service is active and running in the undercloud


##Monitor Drive Audit

Perform the following steps to monitor the drive audit: 

1. In the undercloud Horizon dashboard, log in to the **Icinga Dashboard** (http://&lt;Undercloud_IP&gt;/icinga/). The default login credentials are as follows:
		
    * Username: *icingaadmin*
	* Password: *icingaadmin* 

2. Click **Status** on the left panel and then click 
<a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Host Detail</i></b><!--(opens in a new window)--></a>.

3. In the **Host** column, <a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>click the icon</b><!-- (opens in a new window)--> </a> next to the host IP when the tooltip displays as "View Service Details For This Host". <br />
The page navigates to Service Status Details For Host &lt;Swift node IP address &gt; and displays the <a href="javascript:window.open('/content/documentation/media/swift_icinga-drive-audit.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b> status of the audit drive</b><!-- (opens in a new window)--></a>   of the selected Swift node.


<!--
4. Click the target Swift node IP address to open the  <a href="javascript:window.open('/content/documentation/media/swift_icinga-drive-audit.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b><i>Service Status Details For Host &lt;Swift node IP address &gt;</i></b>--></a>. 



##Status Messages

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
  </tr>
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>Drive audit found no error.</td>
</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>The following drives have errors: &lt;drives&gt;
</td>
    </table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

 



