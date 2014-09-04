---
layout: default
title: "HP Helion OpenStack&#174; Sirius Service Overview"
permalink: /helion/openstack/ga/services/sirius/overview/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/services/tripleo/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/identity/overview/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&#174; Sirius Service Overview #

HP Helion OpenStack Sirius Service is a REST based web service for storage device  management. It is compliant with Keystone authentication mechanism like various  other OpenStack services. It assists the Cloud Administrator in the configuration of storage services (like Cinder, Swift) running in the Overcloud with various storage devices. It also provides REST based  automated deployment and management for certain sets of storage devices, for example HP StoreServ FC, HP StoreServ iSCSI, HP StoreVirtual. 

Cloud Administrator is the primary user and uses the service to manage storage devices and configure storage service running in Overcloud.

All the devices managed by Sirius are consumed by the Overcloud to realize a cloud storage offered to cloud users. The service runs in the Undercloud and closely interacts with ThunderChicken i.e. EE Installer Service to realize all its operation.


## Working with the Sirius Service ##

To perform tasks using the Sirius service, you can use the Horizon dashboards or CLI.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack Dashboard](/helion/openstack/dashboard/how-works/) to work with the Sirius service.

###Using the CLI### {#cli}

You can use the command-line interface software to access HP Sirius. See **the to give URL.**

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).


## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.

The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

