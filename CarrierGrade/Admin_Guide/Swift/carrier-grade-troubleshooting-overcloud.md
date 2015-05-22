---
layout: default
title: "HP Helion OpenStack&#174; 1.1: Troubleshooting Node Removal"
permalink: /helion/openstack/carrier/services/troubleshooting/overcloud/
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
authors: Nancy M

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/1.1/services/reporting/overview/"> NEXT &#9654</a> </p> -->


# HP Helion OpenStack&#174; 1.1: Troubleshooting Scale-Out Node Removal

### After removing nodes, Icinga issues alerts.

**System Behavior/Message**

 Icinga issues alerts after node removal.

**Resolution**

Follow this manual procedure for deleting nodes from check&#95;mk and icinga configurations:

  To remove one or more 
  previously discovered nodes from the check_mk and icinga configurations: 

1. Run the following command"
		
		check_mk --flush <node IP> 

	where <node IP> is the IP address of the node to be deleted. 

2. Run the following command to remove the node's host file:

		rm /etc/check_mk/conf.d/<node IP>.mk

3. Repeat steps 1 and 2 for each node you wish to remove:

4. Run the following command to re-generate the Icinga config and reload Icinga:

		check_mk -O


	

<br /><br />
<hr />

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>


