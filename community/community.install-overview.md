---
layout: default
title: "HP Helion OpenStack&#174; Community Installation and Configuration"
permalink: /helion/community/install-overview/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/hwsw-requirements/">&#9664; PREV</a> | <a href="/helion/community/">&#9650; UP</a> | <a href="/helion/community/install">NEXT &#9654;</a> </p>
-->

# HP Helion 1.0 1.0 OpenStack&#174; Community Installation Overview

HP Helion OpenStack Community is installed using <a href ="https://wiki.openstack.org/wiki/TripleO">TripleO</a> which uses three linked installation phases to deploy a complete OpenStack cloud.  

* Seed  - The seed VM is started as a VM from a specific seed VM image. It contains a number of self-contained OpenStack components that are used to deploy the undercloud. The seed deploys the undercloud by using the HP Ironic service to deploy a specific undercloud machine image.

* Undercloud - The undercloud is a complete OpenStack installation, which is then used to deploy the overcloud. In HP Helion OpenStack Community, the undercloud can be a separate baremetal server or a virtual machine on the Seed host. 

* Overcloud<a name="overcloud"></a> - The overcloud is the end-user OpenStack cloud. In HP Helion OpenStack Community, the undercloud can be separate baremetal servers or virtual machines on the Seed host. 

With HP Helion OpenStack Community, you can quickly and easily spin up clouds using two types of installation paths:

* A virtual installation for testing and proof-of-concept use. In the virtual installation, TripleO simulates the deployment of OpenStack by creating and configuring a set of virtual machines (VMs) that play the roles that baremetal machines would in a non-cloud deployment.
* A multi-node, barmetal installation for small-scale production. For the baremetal installation, you will need to have available enough baremetal servers to accommodate your installation, as described in [Community Hardware and Software Requirements](/helion/community/hwsw-requirements/).

## Virtual installation  

This demonstration release is designed to let you test the functionality of HP Helion OpenStack Community. It is not intended to be used in a production environment to run real workloads, and therefore no support is available. 

This installation is a fixed, virtual configuration of:

* 1 undercloud
* 3 overcloud controllers
* 2 overcloud swift nodes 
* 1 overcloud compute node 

In addition, an installation system, called the seed cloud host, that meets the following configuration is required:

* At least 64 GB of RAM
* At least 200 GB of available disk space

[Learn how to install and configure a virtual cloud](/helion/community/install-virtual/). 

## Baremetal installation 

This HP Helion OpenStack Community baremetal multi-node deployment is for a small-scale, private cloud. 

The installation deploys to a minimum 7 baremetal server configuration:

* 1 undercloud
* 3 overcloud controllers
* 2 overcloud swift nodes 
* At least 1 overcloud compute node 

	Two of the overcloud controllers provide for high availability failover. You can use the **Icinga Dashboard** as described in [Using the Icinga Service](/helion/community/services/icinga/).


In addition, an installation system, called the seed cloud host, that meets the following configuration is required:

* At least 64 GB of RAM
* At least 200 GB of available disk space


[Learn how to install and configure a baremetal cloud](/helion/community/install/). 

## Next Steps:

* Review the information on the minimum requirements for your hardware and software before starting the installation. See [Hardware and Software Requirements](/helion/community/hwsw-requirements/).

* For more information on HP Helion OpenStack Community, see:

	* [FAQ](/helion/community/faq/) 
	* [Release notes](/helion/community/release-notes/) 

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
