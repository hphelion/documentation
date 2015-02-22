---
layout: default
title: "HP Helion OpenStack&#174; Release Notes"
permalink: /helion/openstack/release-notes/GA/
product: commercial.ga
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Michael B

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Release Notes

Thank you for your interest in HP Helion OpenStack! This document provides an overview of the features contained within HP Helion OpenStack version 1.0, including known issues and workarounds, and where to find further information on the product release:

* [Features in HP Helion OpenStack](#features) 

* [For Further Information](#For-Further-Information) 

##Features in HP Helion OpenStack## {#features}

**OpenStack Juno Services** - The full set of standard OpenStack services is available for you to use: Nova, Swift, Cinder, Neutron, Glance, Keystone, Horizon, Heat, and TripleO (Ironic) for deployment.

**TripleO (Ironic)** - Using OpenStack technology for deploying OpenStack services in a fully automated manner resulting in a baremetal control plane deployed in a highly available configuration.

**LogStash/ElasticSearch** - Enhancing security and supportability of the product by offering centralized logging.

**Icinga** - Providing infrastructure monitoring ensuring the health of the cloud. 

**HP StoreVirtual VSA** - The VSA is used as the default fault-tolerant, software-defined storage backend for Cinder, and provides easy deployment on KVM nodes meeting on-demand scale-out requirements of cloud storage without sacrificing performance.

**Support for VMWare ESX** - Makes ESX host onboarding and management easier and lets you setup the ESX proxy node during installation of the overcloud. 

**HP Virtual Cloud Networking (VCN) Application** - Enables you to create networks, subnets and ports, as well as security groups and security group rules for your ESX clusters using OVSvApp.

###Known Issues in this Release### {#known-issues}

The following are the known issues for HP Helion OpenStack:

**Operations**

* If you determine that your VM seed has not started correctly when you execute the `hp_ced_start_seed` script, run the script a second time to ensure you start the seed.
* If, for some reason, the overcloud controller is rebooted, the VMs might be in an ERROR state. Execute the following commands to restart the services and remove the error(s):
  
		$ sudo service nova-compute restart
		$ sudo service nova-scheduler restart
		$ sudo service nova-conductor restart
		$ sudo service neutron-openvswitch-agent restart

* In some instances, the centralized logging feature does not function after the  product installation. If this occurs, repeat the following steps on the overcloud controller and all compute nodes

        service rsyslog restart
        
* Updating the overcloud fails because a node is in 
maintenance state. Do NOT proceed with your installation/update if any of the undercloud/overcloud nodes are down, or in a maintenance state. To check if nodes are in maintenance state, source the undercloud credentials:

        ~# ironic node-list
        

	Look in the Maintenance column of your output, and verify all  Ironic nodes report `False`.

**Other Issues**

* When you resize an instance of Nova, it produces an error.
* Volume backups that are created in one project are accessible to all projects.
* Changing the user settings in a non-admin role affects all users across all projects.
* An admin is unable to retrieve object details in an Object Store.
* A Kernel Panic error occurs when a user employs SSH to log in to a virtual machine and attempts to connect to an IP address external to HP Helion OpenStack.
* The update overcloud process fails intermittently and occurs when an OLD_BUILD value is set to NULL instead of the correct build number from ce_env.json.
* If a set of baremetal servers differ in specifications (such as memory or disk capacity), the installation fails.
* When a controller node crashes, it must be rebooted to return to its operational state.
* The installation process can fail if the user is attempting to add more than 2000GB (2TB) to the CSV file (even if the baremetal server has more space).
* The Helion Core installation process leaves behind a shared private network defined.
* When the VIP is moved to a new controller, the OpenStack services stop responding to any CLI commands.
* Nova does not handle or recover from RabbitMQ Server process failure.
* The keepalived processes do not restart automatically when they are killed.
* The HAProxy does not automatically restart when it is killed.
* A user can register but cannot update a vCenter through the UI. 

##For Further Information## {#For-Further-Information}

For additional information about HP Helion OpenStack, OpenStack Cloud Software, and the HP Helion Support Center:

* [HP Helion OpenStack Documentation web site](/helion/openstack/): Provides information on topics such as installation and configuration, FAQs, and applications for all of the HP Helion OpenStack product offerings.
* [OpenStack web site](http://www.openstack.org/): Provides information on computing, networking, and storage in OpenStack, various programs such as TripleO, and the OpenStack community.
* [HP Support Center](http://us-support.external.hp.com/portal/site/hpsc/public): Provides a way to report issues with HP Helion OpenStack.


###Legal Notices and Disclaimer### {#legal-notices-disclaimer}

<!--See the [HP Helion OpenStack Open Source and Third-Party Software License Agreements](/helion/openstack/commercial-3rd-party-license-agreements/).-->

Linux&reg; is the registered trademark of Linus Torvalds in the U.S. and other countries.


**HP Helion OpenStack Warranty**: 
The programs included with the Debian Host Linux system are free software. The exact license terms for each program are described in the individual files in /usr/share/doc/*/copyright. Debian Host Linux comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack Trademark Attribution
