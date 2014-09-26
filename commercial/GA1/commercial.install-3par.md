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

<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>


# HP Helion OpenStack&#174;: HP StoreServ (3PAR) Support

[HP 3PAR StoreServ](http://www8.hp.com/us/en/products/data-storage/3parstoreserv.html) is a storage array (a physical device) integrated with HP Helion Openstack to realize block storage within the cloud. 

[HP 3PAR StoreServ](http://www8.hp.com/us/en/products/data-storage/3parstoreserv.html) is integrated into the plug-in architecture of Cinder using the OpenStack block storage driver of HP 3PAR StoreServ. It supports Fiber Channel (FC) as well as iSCSI protocol. <!---The Cinder integration drivers run as Python libraries in the Cinder service to facilitate communication between Cinder and StoreServ arrays.-->

<!---Devices can be connected to Cinder using Fiber Channel (FC) or using the iSCSI protocol.-->The StoreServ driver supports both iSCSI and Fiber Channel (FC) for Storage Area Networking (SAN) connectivity.

Sirius service is used to facilitate configuration and deployment of StoreServ and StoreVirtual arrays.

##High level overview of HP 3PAR StoreServ Integration

<a href="javascript:window.open('/content/documentation/media/storeserv-integration.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP StoreVirtual Integration diagram (opens in a new window)</a>

The following section briefly explains the above diagram and the steps involved in 3PAR StoreServ integration.

1 - **Install 3PAR device**

   Configure the 3PAR StoreServ device and create CPG's which are used as Cinder backend. The StoreServ device should be accessible from the management network of the cloud.

2 - **Install IMC**

  * Download the IMC from the Undercloud Horizon (the link is provided for downloading IMC) to manage the StoreServ device.

  * Create CPG's in StoreServ using IMC. Refer to the online user guide  for managing the StoreServ using IMC.

3a - **Launch Undercloud Horizon**

3b - **Register 3PAR StoreServ**

3c - **Allocate CPGs for your cloud**

3d - **Create 3PAR backend** 

3e - **Get Cinder configuration for 3PAR backends**

  * Launch the Horizon dashboard and navigate to Resources->Storage->StoreServ page.

  * Register the StoreServ device and then register the CPG's of the StoreServ.

  * [Create the StoreServ backend with registered CPG](/helion/openstack/ga/undercloud/storage/storeserv/) details and get the Cinder configuration advise for StoreServ.
  
 4a - **Update overcloud-config.json file with Cinder configuration**

  With the advise generated from the above steps, update the overcloud-config.json file in the Seed cloud

4b - **Run update cloud script to update cinder.conf**

* The cinder.conf in Overcloud should be updated after updating the overcloud-config.json file in the Seed cloud. 

* Execute [update cloud script](/helion/openstack/ga/undercloud/oc/config/storeserv/) from the Seed cloud.
 

## Working with HP StoreServ

HP 3PAR StoreServ can be managed from either the Horizon dashboard or using CLI.

### Using the dashboards

You can use the [HP Helion OpenStack Dashboard](/helion/openstack/ga/undercloud/storage/storeserv/) to configure HP StoreServ.

###Using the CLI###

You can use the command-line interface to access the HP Sirius service and configure HP StoreServ. See [Configuring Storage Using Sirius](/helion/openstack/ga/sirius-cli/)

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
