---
layout: default
title: "HP Helion OpenStack&#174; Community Release Notes"
permalink: /helion/community/release-notes/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


# HP Helion OpenStack&reg; Community 1.4 Release Notes

<!--**Product Name:** HP Helion OpenStack&reg; Community
**OpenStack&reg; release name:** Icehouse-->

Thanks for your interest in HP Helion OpenStack Community! These release notes contain the following information about this release:

* [Available product versions](#versions)
* [Features in HP Helion OpenStack Community edition](#features) 
* [Supported services](#supported-services)
* [Recommendations for HP Helion OpenStack Community](#recommendations)
* [For further information](#for-further-information) 


##Available product versions## {#versions}

This release of the HP Helion OpenStack Community edition contains a single download of the product that covers both virtual and bare metal deployment:

* *A virtual deployment of HP Helion OpenStack Community*. First released in early May, 2014, this provides a "cloud-in-a-box" virtual deployment targeted towards enterprises and cloud administrators interested in evaluating, developing and deploying a private cloud based on OpenStack Cloud Software. It's a pure, free and downloadable OpenStack distribution that speeds up deployment and simplifies the management of small-scale, open cloud environments and infrastructure services. It is not intended to be used in a production environment to run real workloads.
* *A bare-metal deployment of HP Helion OpenStack Community*. First released in June, 2014, this edition installs in a physical environment. The baremetal installation allows you to build an OpenStack cloud spanning multiple physical nodes. During installation, this edition sets up an undercloud host and deploys the overcloud on 3 controller hosts, 2 physical Swift nodes, and up to 36 physical compute nodes. 

These release notes cover both deployments.


##Features in HP Helion OpenStack Community## {#features}

The following sections list the features in the current version, 1.4, and previous versions.

### Features in HP Helion OpenStack Community 1.4

**Additional overcloud controllers for high availability** &mdash; The number of installed overcloud controller nodes has been increased to 3. The additional nodes should allow Community to continue operating if a single control node fails. Previously, the Community edition installed a single overcloud controller node. 

**Icinga monitoring support** &mdash; Icinga V1.11.5 is an open source monitoring system which checks the availability of your network resources, notifies users of outages, and generates performance data for reporting. For more information, see the [Icinga web site](https://www.icinga.org/). 

**Kibana interface support** &mdash; Kibana is an open source (Apache Licensed), browser based analytics and search dashboard for ElasticSearch. For more information, see the [Kibana web site](http://www.elasticsearch.org/guide/en/kibana/current/_introduction.html) 

**OpenStack Juno-2 development milestone** &mdash; HP Helion OpenStack Community edition fully supports the second milestone of the OpenStack Juno development cycle, including features and bug fixes implemented since Juno-1.

**Distributed Virtual Routing (DVR)** &mdash; HP Helion OpenStack Community edition fully supports the DVR implemented in OpenStack Juno-3 plus some fixes from Juno-final.

### Features in HP Helion OpenStack Community GA

**Pure OpenStack technology** &mdash; This edition allows you to experience a cloud deployment using [OpenStack TripleO](https://wiki.openstack.org/wiki/TripleO).

**Speeds cloud service delivery** &mdash; Outstanding launch pad for your small-scale open cloud environment or proof-of-concept cloud services, with simple, fast creation of cloud environments and applications to speed business value.

**Close-to-trunk release** &mdash; Allows your lab or small-scale production environment to continue to benefit from the very latest capabilities of OpenStack technology, closely tracking the community trunk release.


##Supported services ## {#supported-services} 

This release of the Community edition is shipped with the following supported services:

<table style="text-align: left; vertical-align: top;">
 <tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
 <th>OpenStack-powered capabilities<th>API supported<th>API version<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Compute (Nova)<td>Full support<td>v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Object Storage (Swift)<td>Full support<td>v1.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Block Storage (Cinder)<td>Full support<td>v1.0 and v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Networking (Neutron)<td>Full support<td>v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Image Service (Glance)<td>Full support<td>v1.0 and v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Identity (Keystone)<td>Full support<td>v2.0 and v3.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Dashboard (Horizon)<td>Full support<td>N/A
<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Orchestration (Heat)<td>Full support<td>N/A
</table>

##Recommendations for HP Helion OpenStack Community## {#recommendations}

This section describes the HP recommendations for optimizing performance, utility, and functionality with this software version. We have also provided information about some known issues for reference purposes. This section contains:

* [Recommendations for optimizing functionality, performance and reliability](#best-practices) 
* [Known issues in this release](#known-issues) 

###Recommendations ### {#best-practices} 

HP recommends the following best practices for this software version.

**Installation**

* To enable VM functionality, be sure to install the required Ubuntu packages, as described in the [Software configuration](/helion/community/hwsw-requirements/#software) section in Community Hardware and Software Requirements.

**Operations**

* When issuing Neutron commands from inside the seed VM, we recommend you set the `LANG` environment variable to `C`.  Add the following line to the appropriate user configuration file:

		export LANG=C

* We recommend cleaning up any VMs using excess space, by executing the following commands:
	- Delete the KVM VMs and their storage volumes with the `virsh destroy` command.
	- Uninstall any packages that you no longer require.

* For optimum VM operation and to avoid generating inaccurate error codes, we recommend you not reboot the overcloud controller but rather restart the applicable services by executing the following commands:
	- sudo service nova-compute restart
	- sudo service nova-scheduler restart
	- sudo service nova-conductor restart
	- sudo service neutron-openvswitch-agent restart

* It is possible in busier systems that Kibana logging system might not cope with amount of logs collected. You can correct this issue by increasing the heap size specified in the `/etc/default/elasticsearch` file from the default 2G to a higher value and restarting elasticsearch service.

* After deleting a cloud or an entire HP Helion OpenStack Community installation, make sure you perform a full disk erasure on the associated storage devices to prevent exposure of sensitive data that might have been stored there.

###Known issues in this release### {#known-issues}

The following are the known issues for HP Helion OpenStack Community edition: 

**Operations**

* When accessing Horizon in a virtual environment, use the public network address, not the management network address. In a default configuration, the URL is http://192.0.8.2.
* If you determine that your VM seed has not started correctly when you executed the `hp_ced_host_manager.sh` script, run the script a second time to ensure you start the seed.
* VM installations do not currently persist across reboots.  When you reboot your system, be sure to start a new VM installation.
* If after an overcloud controller reboot you determine the VMs are in an ERROR state, execute the following commands to restart the services and remove the error:
  
		$ sudo service nova-compute restart
		$ sudo service nova-scheduler restart
		$ sudo service nova-conductor restart
		$ sudo service neutron-openvswitch-agent restart


##For further information## {#for-further-information}

The kit comes with a README.txt which lists a number of recommendations and requirements. Please read and follow it carefully.

For additional information on HP Helion OpenStack Community, OpenStack Cloud Software and TripleO:

* [HP Helion OpenStack Community Documentation web site](/helion/community/): Provides the topics listed below.
* [FAQ](/helion/community/faq/): Contains some frequently asked questions about the HP Helion OpenStack Community edition release
* [Installation and configuration](http://docs.hpcloud.com/helion/community/install-overview/): A set of tasks that walk you through the installation and configuration process.
* [Related Topics](/helion/community/related-links/): Links to pertinent HP Helion OpenStack Community and OpenStack documentation.
* [OpenStack documentation home page](http://docs.openstack.org/)
* [TripleO documentation](https://wiki.openstack.org/wiki/TripleO)
* [HP Helion OpenStack Support Forum](https://ask.openstack.org/en/questions/scope:all/sort:activity-desc/tags:hphelion/page:1/) (Tag your questions with HPHelion)


###Legal Notices and Disclaimer### {#legal-notices-disclaimer}

* [Open Source and Third-Party Software License Agreements](/helion/community/community-3rd-party-license-agreements/)
* [End User License Agreement](/helion/community/eula/)

----
