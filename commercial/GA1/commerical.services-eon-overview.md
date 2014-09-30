---
layout: default
title: "HP Helion OpenStack&#174; EON Overview"
permalink: /helion/openstack/ga/services/eon/overview/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/compute/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/imaging/overview/"> NEXT &#9654</a> </p>
-->


# HP Helion OpenStack&#174;EON Service Overview #

ESX integration in HP Helion OpenStack enables administrators to connect their cloud to an existing VMware vCenter installation. The VMware vCenter driver connects to ESXi clusters in a vCenter through Compute proxy nodes. A Nova scheduler sees each cluster as compute and uses the same for scheduling a new instance. 

An ESX Proxy Compute driver communicates to VMware vCenter server through VI SDK. Therefore, it is required to capture the details of vCenter in the Cloud Controller and configures the ESX Proxy Compute node to manage a list of clusters from a vCenter server. EON, a new service sub component, captures details of the vCenter server in a Cloud Controller and provides the details of the clusters for configuring the list of clusters managed by ESX Proxy Compute node.


ESX on border (EON) service is an inventory which interacts with the VMware vCenter server and collects the information available at the datacenters and clusters. These information is used for deployment and configuration of ESX Proxy Compute node. EON service is deployed in UnderCloud controller node. 


<!---
*  A RESTful API service

* A Conductor service <!--, which does the bulk of the work of interacting with VMWare vCenter Server, collects and monitors the inventory of Datacenters, Clusters and vSwitch / dvSwitch details and makes it available to other services through REST APIs-->
<!--
* A Database and DB API <!---for storing the list of managed vCenter Servers and its associated Datacenter vSwitch / dvSwitch,  activated / imported Clusters details--->
<!--
* The message bus is used to communicate between eon-api and eon-conductor.
--->

## EON Architecture

The following diagram depicts the EON architecture of HP Helion OpenStack.

<img src="media/eon-architecture.png/">

## Working with the EON Service

To perform tasks using the EON service, you can use the dashboard or CLI.

### Using the dashboards<a name="UI"></a>

You can use the [HP Helion OpenStack Dashboard](/helion/openstack/ga/undercloud/resource/esx/compute/) to work with the EON service.

###Using the CLI<a name="cli"></a>

You can use the command-line interface software to access HP EON service. See [Command Line Interface-EON](/helion/openstack/undercloud/eon/cli/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
