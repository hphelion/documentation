---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Changing the External Network (OAM) IP Configuration"
permalink: /helion/openstack/carrier/admin/system/config/ext/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Changing the External Network (OAM) IP Configuration #

<!-- modeled after Wind River Admin Guide -->

You can change the External network (ext) subnet, floating IP address, controller addresses, and default gateway at any time after installation of HP Helion OpenStack Carrier Grade.


## Change external network IP using the CLI {#cli}

You can change these addresses using the web administration interface or the CLI.

**Note:** Access to the OAM network is interrupted during this procedure. 

To change the external network configuration:

To view the existing OAM IP configuration, use the following command.

	system oam-show

To change the OAM IP subnet, floating IP address, gateway IP address, or controller IP addresses, use the following command syntax.

	system oam-modify oam_subnet=subnet/netmask \

After changing the OAM server configuration, you must lock and unlock the controllers. This process requires a [swact on the controllers](/helion/openstack/carrier/admin/host/management/inventory/host/#swact). Then you must [lock and unlock the compute nodes](/helion/openstack/carrier/admin/host/management/inventory/lock/) one at a time, ensuring that sufficient resources are available to migrate any running instances.


 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
