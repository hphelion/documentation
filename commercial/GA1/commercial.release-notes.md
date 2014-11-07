---
layout: default
title: "HP Helion OpenStack&#174; Release Notes"
permalink: /helion/openstack/release-notes/101/
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
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; 1.0.1 Release Notes

Thank you for your interest in HP Helion OpenStack! This document provides an overview of the features contained within HP Helion OpenStack version 1.0.1, including known issues and workarounds, and where to find further information on the product release:

* [Features in HP Helion OpenStack](#features) 
* [Known Issues in this Release](#known-issues)
* [For Further Information](#For-Further-Information) 

##Features in HP Helion OpenStack ## {#features}

The following features have been added to HP Helion OpenStack, by release.

##Features in HP Helion OpenStack 1.0.1 ##

* **Defect fixes** - A number of defects were addressed and fixed in this release.
* ** Security documentation ** - A new document is included in this release that contains recommendations for securing your HP Helion OpenStack network. [Configuring your network securely](/helion/openstack/install/security/) details the firewall rules you can place at the edge of the HP Helion OpenStack deployment to protect against external abuse and defining router rules within the HP Helion OpenStack deployment to protect against insider abuse or administrative errors.
* **Patch update functionality** -- The HP Helion OpenStack 1.0.1 release contains an Ansible-based helper script to facilitate the upgrade process. See [HP Helion OpenStack Update Overview](/helion/openstack/update/overview/101/).

##Features in HP Helion OpenStack 1.0 ##

**OpenStack Juno Services** - The full set of standard OpenStack services is available for you to use: Nova, Swift, Cinder, Neutron, Glance, Keystone, Horizon, Heat, Ceilometer, and TripleO (Ironic) for deployment.

**TripleO (Ironic)** - Using OpenStack technology for deploying OpenStack services in a fully automated manner resulting in a bare-metal control plane deployed in a highly available configuration.

**LogStash/ElasticSearch** - Enhancing security and supportability of the product by offering centralized logging.

**Icinga** - Providing infrastructure monitoring ensuring the health of the cloud. 

**HP StoreVirtual VSA** - The VSA is used as the default fault-tolerant, software-defined storage backend for Cinder, and provides easy deployment on KVM nodes meeting on-demand scale-out requirements of cloud storage without sacrificing performance.

**Support for VMWare ESX** - Makes ESX host onboarding and management easier and lets you setup the ESX proxy node during installation of the overcloud. 

**HP Virtual Cloud Networking (VCN) Application** - Enables you to create networks, subnets and ports, as well as security groups and security group rules for your ESX clusters using OVSvApp.

##Known Issues in this Release## {#known-issues}

The following are the known issues for HP Helion OpenStack:

**Update**

* If you need to restore the overcloud controllers and overcloud database after running the patch upgrade, the registered vCenter clusters might be powered off. You will need to restart the clusters. It is recommended that you perform a [back-up](/helion/openstack/backup.restore/) before running the patch upgrade. If there is a problem with the upgrade, you can use the [restore process](/helion/openstack/backup.restore/) to return the controllers and database to their pre-update state. 

**Operations**

* A snapshot of instance that was launched from a bootable volume might not boot. In addition, the Glance CLI and Horizon Dashboard might not report the snapshot properly. The snapshot is listed as an image (not snapshot) with a size of 0 and a blank disk format <!-- (GLAN-1706) -->.
* If you use the Updates and Extensions tab of the Helion Dashboard for the overcloud (called the *Sherpa UI*) to download two images that use the same name in two different projects, the second image will fail to upload to the Image Operations service (Glance). <!-- (CODN-24) -->
* If you determine that your VM seed has not started correctly when you execute the `hp_ced_start_seed` script, run the script a second time to ensure you start the seed.
* If, for some reason, the overcloud controller is rebooted, the VMs might be in an ERROR state. Execute the following commands to restart the services and remove the error(s):
  
		$ sudo service nova-compute restart
		$ sudo service nova-scheduler restart
		$ sudo service nova-conductor restart
		$ sudo service neutron-openvswitch-agent restart

* In some instances, the centralized logging feature does not function after the  product installation. If this occurs, repeat the following steps on the overcloud controller and all compute nodes

        service rsyslog restart
        

**Helion Dashboard**

* On the **Floating IPs** tab in the Helion Dashboard (**Project > Access & Security > Floating IPs**) all of the buttons (Associate, Disassociate, Release Floating IP) might not appear under certain circumstances. To make the buttons appear, first attempt to allocate a new floating IP. If the buttons are still not present, log out and log in as the same user <!--(HORI-3110) -->.

**Other Issues**

* After updating the undercloud to HP Helion OpenStack 1.0.1, existing HP StoreVirtual clusters might not work. The cluster is listed in the Helion Dashbaord, but you might not be able to activate or unregister the cluster. If this occurs, you can [manually register a new cluster](/helion/openstack/undercloud/storage/storevirtual/#register-cluster) with the same name and information as the non-working cluster. You should be able to activate the cluster <!-- (ANSUPDATE-155) -->.
* When you resize an instance of Nova, it produces an error (NOV-6664). 
* Volume backups that are created in one project are accessible to all projects <!-- (HORI-3009) -->.
* Changing the user settings in a non-admin role affects all users across all projects <!-- (HORI-2934) -->.
* An admin is unable to retrieve object details in an Object Store <!-- (HORI-2930) -->.
* A Kernel Panic error occurs when a user employs SSH to log in to a virtual machine and attempts to connect to an IP address external to HP Helion OpenStack <!-- (EE-21) -->.
* The update overcloud process fails intermittently and occurs when an OLD_BUILD value is set to NULL instead of the correct build number from ce_env.json <!-- (CORE-1697) -->.
* If a set of baremetal servers differ in specifications (such as memory or disk capacity), the installation fails. Specify the server with the lowest specs as the second entry in the `baremetal.csv` file <!-- (CORE-1409) -->.
* When a controller node crashes, it must be rebooted to return to its operational state <!-- (CORE-1387) -->.
* The Helion Core installation process leaves behind a shared private network defined <!-- (CORE-586) -->.
* When the VIP is moved to a new controller, the OpenStack services stop responding to any CLI commands <!-- (CORE-1716) -->.
* Nova does not handle or recover from RabbitMQ Server process failure <!-- (CORE-1559) -->.
* The keepalived processes do not restart automatically when they are killed <!-- (CORE-972) -->.
* The HAProxy does not automatically restart when it is killed <!-- (CORE-943) -->.
* A user can register but cannot update a vCenter through the UI. 


##For Further Information## {#For-Further-Information}

For additional information about HP Helion OpenStack, OpenStack Cloud Software, and the HP Helion Support Center:

* [HP Helion OpenStack Documentation web site](/helion/openstack/): Provides information on topics such as installation and configuration, FAQs, and applications for all of the HP Helion OpenStack product offerings.
* [OpenStack web site](http://www.openstack.org/): Provides information on computing, networking, and storage in OpenStack, various programs such as TripleO, and the OpenStack community.
* [HP Support Center](http://us-support.external.hp.com/portal/site/hpsc/public): Provides a way to report issues with HP Helion OpenStack.


###Legal Notices and Disclaimer### {#legal-notices-disclaimer}

<!--See the [HP Helion OpenStack Open Source and Third-Party Software License Agreements](/helion/openstack/commercial-3rd-party-license-agreements/).-->

Linux&reg; is the registered trademark of Linus Torvalds in the U.S. and other countries.

The OpenStack Word Mark is either a registered trademark/service mark or trademark/service mark of the OpenStack Foundation, in the United States and other countries and is used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.

**HP Helion OpenStack Warranty**: 
The programs included with the Debian Host Linux system are free software. The exact license terms for each program are described in the individual files in /usr/share/doc/*/copyright. Debian Host Linux comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack Trademark Attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*