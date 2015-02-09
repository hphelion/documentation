---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP StoreServ (3PAR) Support"
permalink: /helion/openstack/install/3par/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


# HP Helion OpenStack&#174;: HP StoreServ (3PAR) Support

[HP 3PAR StoreServ](http://www8.hp.com/us/en/products/data-storage/3parstoreserv.html) is a storage array that supports Fibre Channel (FC) as well as iSCSI protocol. [HP 3PAR StoreServ](http://www8.hp.com/us/en/products/data-storage/3parstoreserv.html) is integrated into the plug-in architecture of the Volume Operation service using the HP 3PAR StoreServ block storage driver. HP 3PAR StoreServ is also referred to as 3PAR.

HP Helion OpenStack provides a utility service called Sirius which can be used to configure 3PAR StoreServ arrays to realize block storage within the cloud. 

**Note:** 3PAR support applies only to HP Helion OpenStack with KVM hypervisor support.

<!---The Cinder integration drivers run as Python libraries in the Cinder service to facilitate communication between Cinder and StoreServ arrays.-->

<!---Devices can be connected to Cinder using Fibre Channel (FC) or using the iSCSI protocol.-->

##High-level overview of HP 3PAR StoreServ Integration

The following diagram gives an overview of the steps involved in integrating HP 3PAR StoreServ with your cloud. 

<a href="javascript:window.open('/content/documentation/media/storeserv-integration.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP StoreServ Integration diagram (opens in a new window)</a>

### Prerequisites

The following prerequisites need to be performed before configuring 3PAR StoreServ to use in the cloud.


1 - **Install 3PAR device**

   Install and configure the 3PAR StoreServ device and create Common Provisioning Groups (CPGs) which you are planning to use for the cloud as Cinder backend. The StoreServ device should be accessible from the management network of the cloud. If you are using Fibre Channel, ensure SAN connectivity between the compute host(s), the overcloud controller where the Volume Operations service is running, and the HP 3PAR StoreServ array.

To enable multipathing edit the contents of the `/etc/multipath.conf` file to blacklist the local boot disk. An example to blacklist the local boot disk `/dev/sda` is shown below:

		cat /etc/multipath.conf
		blacklist
		{ devnode ".*" }

Restart the multipath daemon `service multipath-tools restart`.	The "multipath -ll" command  lists the devices and path.

2 - **Install IMC**

  * Download and install the HP 3PAR Inform Management Console(IMC) if it is not installed as part of the HP 3PAR installation. Refer to the URL provided in the undercloud Horizon Dashboard of HP Helion OpenStack. <!---Download the HP 3PAR Inform Management Console(IMC) from the URL provided in the undercloud Horizon Dashboard.-->

  * Create CPGs in StoreServ using IMC. Refer to the online user guide  for managing the StoreServ using IMC.

The subsequent sections provide the detailed instructions on  the integration workflow.

## Working with HP StoreServ

HP 3PAR StoreServ can be configured for the cloud using the Horizon dashboard or using HP Sirius CLI

### Using the dashboards

You can use the [HP Helion OpenStack Dashboard](/helion/openstack/undercloud/manage/resources/overview/) to configure HP StoreServ.(Recommended)

###Using the CLI###

You can use the command-line interface to access the HP Sirius service and configure HP StoreServ. See [Configuring Storage Using Sirius](/helion/openstack/sirius/cli/workflow/)

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
