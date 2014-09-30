---
layout: default
title: "HP Helion OpenStack&#174; Edition: VSA Support"
permalink: /helion/openstack/ga/install/3par/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174;: HP StoreServ (3PAR) Support

[HP 3PAR StoreServ](http://www8.hp.com/us/en/products/data-storage/3parstoreserv.html) is a storage array which supports Fiber Channel (FC) as well as iSCSI protocol. [HP 3PAR StoreServ](http://www8.hp.com/us/en/products/data-storage/3parstoreserv.html) is integrated into the plug-in architecture of Cinder using the OpenStack block storage driver of HP 3PAR StoreServ. 


HP Helion Openstack&#174; provides a utility service called Sirius which can be used to configure 3PAR StoreServ arrays to realize block storage within the cloud. 

<!---The Cinder integration drivers run as Python libraries in the Cinder service to facilitate communication between Cinder and StoreServ arrays.-->

<!---Devices can be connected to Cinder using Fiber Channel (FC) or using the iSCSI protocol.-->

##High level overview of HP 3PAR StoreServ Integration

The following diagram gives an overview of the steps involved in integrating HP 3PAR StoreServ with your cloud. 

<a href="javascript:window.open('/content/documentation/media/storeserv-integration.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP StoreServ Integration diagram (opens in a new window)</a>

The following prerequisites need to be performed before configuring 3PAR StoreServ to use in the cloud.


1 - **Install 3PAR device**

   Install and configure the 3PAR StoreServ device and create Common Provisioning Groups(CPGs) which you are planning to use for the cloud as Cinder backend. The StoreServ device should be accessible from the management network of the cloud.If you are using Fibre Channel, ensure SAN connectivity between the compute host(s), the Overcloud Controller where Cinder service is running and HP 3PAR StoreServ array.

2 - **Install IMC**

  * Download the HP 3PAR Inform Management Console(IMC) from the URL provided in the Undercloud Horizon Dashboard.

  * Create CPGs in StoreServ using IMC. Refer to the online user guide  for managing the StoreServ using IMC.

The subsequent sections provide the detailed instructions on integration workflow.

## Working with HP StoreServ

HP 3PAR StoreServ can be managed from either the Horizon dashboard or using CLI.

### Using the dashboards

You can use the [HP Helion OpenStack Dashboard](/helion/openstack/ga/undercloud/manage/resources/Overview/) to configure HP StoreServ.(Recommended)

###Using the CLI###

You can use the command-line interface to access the HP Sirius service and configure HP StoreServ. See [Configuring Storage Using Sirius](/helion/openstack/ga/sirius/cli/workflow/)

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
