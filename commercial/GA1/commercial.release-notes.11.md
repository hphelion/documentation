---
layout: default
title: "HP Helion OpenStack&#174; Release Notes"
permalink: /helion/openstack/release-notes/11/
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
# HP Helion OpenStack&reg; 1.1 Release Notes

Thank you for your interest in HP Helion OpenStack. This document provides an overview of the features contained within HP Helion OpenStack version 1.01, including known issues and workarounds, and where to find further information on the product release:

* [Features in HP Helion OpenStack](#features) 
* [Known Issues in this Release](#known-issues)
* [For Further Information](#For-Further-Information) 

## Features in HP Helion OpenStack ## {#features}

The following features have been added to HP Helion OpenStack, by release.

* [HP Helion OpenStack 1.1](#110)
* [HP Helion OpenStack 1.01](#101)
* [HP Helion OpenStack 1.0](#10)

### Features in HP Helion OpenStack 1.1 ### {#110}

The following features have been added to HP Helion OpenStack 1.1:

**OpenStack Juno support** All of the [HP Helion OpenStack services](/helion/openstack/services/overview/#OpenStack) have been updated to OpenStack Juno.

**HP Helion OpenStack Metering services** The [HP Helion OpenStack Telemetry and Reporting service](/helion/openstack/services/reporting/overview/) leverages the OpenStack Ceilometer metering service. The Metering Operations service takes specified measurements of both physical and virtual resources, including physical servers and network devices such as switches and firewalls.

**AppArmor profiles enabled for Compute nodes** AppArmor proactively protects the operating system and applications from external or internal threats, even zero-day attacks, by enforcing good behavior and preventing even unknown application flaws from being exploited. <!--HPM27-->

**Additional Components in Centralized Logging** Centralized logging support has now been added for the following additional components: <!--HPM-28-->
- HAProxy
- syslog
- keepalived 

**Windows certification as a guest O/S on KVM** Microsoft Windows Server 2008 and 2012 have received Windows Server Virtualization Verification Program (SVVP) status. Windows Server can operate as a *guest* operating system in a virtual environment as if it were installed on bare metal (with certain exceptions allowed by MS). <!--HPM-29--> 

	For information on the SVVP program, see Windows Server Catalog [Server Virtualization Validation Program](http://www.windowsservercatalog.com/svvp/).

**Swift diagnostic checks** New diagnostics checks have been implemented for [Swift cluster](/helion/openstack/services/object/overview/). Diagnostic messages are sent to the [Icinga service](/helion/openstack/services/object/swift/replica-status/). <!--HPM15-->

**Improved recovery time** When a virtual IP is moved to another overcloud controller the system, the controller will become available in approximately one minute. <!--HPM121-->

**New Horizon Dashboard functionality** 

**Multipath suppport for 3PAR** HP Helion OpenStack now supports multipathing for network redundancy. Multipathing helps maintain a constant connection between an ESXi host and its storage. See [Configuring Multipath for 3PAR](/helion/openstack/install/3par/multipath/).<!--HPM121-->

**Transport Layer Security (TLS) support** HP Helion OpenStack now supports TLS protocols to protect internal traffic for Overcloud OpenStack API and endpoints. <!--HPM16-->

**Ceph storage support** Ceph is an open source storage platform designed to present object, block, and file storage from a single distributed computer cluster. <!--HPM-30-->

**HP Helion OpenStack Identity service** The Identity service, based on OpenStack Keystone V3 provides one-stop authentication, including Identity, Token, Catalog and Policy services. See [Identity Service Overview](/helion/openstack/services/identity/overview/).

**Fiber Channel Zone Manager support** The OpenStack Fiber Channel Zone Manager creates the necessary fiber channel zones during an attach of a Block Storage (Cinder) volume. Brocade Fibre Channel Zone Driver performs zoning operations via SSH. See [Configuring Fiber Channel Zone Manager](/helion/openstack/services/volume/fibre/).<!--HMP32-->

**Enable Unified Extensible Firmware Interface (UEFI) support for Gen8 and Gen9 HP Servers** UEFI is industry standard set of interfaces between the system firmware, the operating system, and between various components of the system firmware delivers enhanced security benefits for the HP ProLiant Gen8 and Gen9 Server family. UEFI is meant to replace the Basic Input/Output System (BIOS) firmware interface. For more information, see [HP Unified Extensible Firmware Interface](http://www8.hp.com/us/en/products/server-software/product-detail.html?oid=6935826).<!--HPM12-->

### Features in HP Helion OpenStack 1.01 ### {#101}

The following features have been added to HP Helion OpenStack 1.01:

**Defect fixes** - A number of defects were addressed and fixed in this release.

**Security documentation** - A new document is included in this release that contains recommendations for securing your HP Helion OpenStack network. [Configuring your network securely](/helion/openstack/install/security/) details the firewall rules you can apply at the edge of the HP Helion OpenStack deployment to protect against external abuse and defines router rules within the HP Helion OpenStack deployment to protect against insider abuse or administrative errors.

**Patch update functionality** -- The HP Helion OpenStack 1.01 release contains an Ansible-based helper script to facilitate the upgrade process. See [HP Helion OpenStack Update Overview](/helion/openstack/update/overview/101/).

### Features in HP Helion OpenStack 1.0 ### {#10}

The following features have been added to HP Helion OpenStack 1.0:

**OpenStack Services** - The full set of standard [OpenStack services](/helion/openstack/services/overview/#OpenStack) is in HP Helion OpenStack: Nova (Compute), Swift (Object Operations), Cinder (Volume Operations), Neutron (Networking Operations), Glance (Image OPerations), Keystone (Identity Management), Horizon (Helion dashboard), Heat (Orchestration), TripleO, and Ironic.

**Other Services** [Other services](/helion/openstack/services/overview/#OpenStack/#Other) included in the release include: Sherpa, Sirius, EON, DNSaaS, and DVR. 

**LogStash/ElasticSearch** - This service provides enhanced security and supportability of the cloud by offering centralized logging.

**Icinga** - This service provides infrastructure monitoring ensuring the health of the cloud. 

**HP StoreVirtual VSA** -  [HP StoreVirtual VSA](http://www8.hp.com/us/en/products/storage-software/product-detail.html?oid=5306917) is storage virtualization software used as the default fault-tolerant, software-defined storage backend for the Volume Operations service, and provides easy deployment on KVM nodes meeting on-demand scale-out requirements of cloud storage without sacrificing performance.

**Support for VMWare ESX** - [VMWare ESX](bare-metal hypervisor) is a bare-metal hypervisor. HP Helion OpenStack makes ESX host onboarding and management easier and lets you setup the ESX proxy node during installation of the overcloud. 

**HP Virtual Cloud Networking (VCN) Application** - Enables you to create networks, subnets and ports, as well as security groups and security group rules for your ESX clusters using OVSvApp.

## Known Issues in this Release ## {#known-issues}

The following are the known issues for HP Helion OpenStack:

**Patch Update Issues**

You might experience the following issues when performing the upgrade to HP Helion OpenStack 1.01:

* It is recommended that you perform a [back-up](/helion/openstack/backup.restore/) before running the patch upgrade. If there is a problem with the upgrade, you can use the [restore process](/helion/openstack/backup.restore/) to return the controllers and database to their pre-update state. 

* If you need to restore the overcloud controllers and overcloud database after running the patch upgrade, the registered vCenter clusters might have gotten powered off during the upgrade process. <!-- ALM 11335 -->

	You will need to restart the clusters.

* If using the Ansible-based helper script to update, the Ironic service might not restart because of a lock situation in Ironic. If you experience this issue, refer to [Update Troubleshooting](/helion/openstack/update/troubleshooting/101/#ansible). <!-- CORE 2043 -->

* The update overcloud process fails intermittently because of build number settings in the `ce_env.json` file. <!-- (CORE-1697) -->

	If the update fails with the following error:
	 `Inconsistency between heat description ($OVERCLOUD_NODES) and overcloud configuration ($OVERCLOUD_INSTANCES) `

	Ensure that tripleo/ce_env.json on seed node has right build number for the `build_number` and `installed_build_number`. See [Troublshooting](/helion/openstack/services/troubleshooting/#failure-update-overcloud).

**Installation Issues**

When installing HP Helion OpenStack you might experience the following issues:

* If a set of baremetal servers differ in specifications (such as memory or disk capacity), the installation fails. Specify the server with the lowest specs as the second entry in the `baremetal.csv` file. <!-- (CORE-1409) -->


**Operational Issues**

When using HP Helion OpenStack you might experience the following issues:

* A snapshot of an instance that was launched from a bootable volume might not boot. In addition, the Glance CLI and Horizon Dashboard might not report the snapshot properly. The snapshot will be listed as an image (not a snapshot) with a size of 0 and a blank disk format.

	Even though with Horizon and CLI report the snapshot incorrectly,  the snapshot launches properly. <!-- (GLAN-1706) -->

* If you use the Updates and Extensions tab of the Helion Dashboard for the overcloud (known as the *Sherpa UI*) to download two images that use the same name in two different projects, the second image will fail to upload to the Image Operations service (Glance). Avoid using images that use the same name. <!-- (CODN-24) -->

* If you determine that your VM seed has not started correctly when you execute the `hp_ced_start_seed` script, run the script a second time to ensure you start the seed.

* If, for some reason, the overcloud compute service is rebooted, the VMs might be in an ERROR state. Execute the following commands to restart the services and remove the error(s):
  
		$ sudo service nova-compute restart
		$ sudo service nova-scheduler restart
		$ sudo service nova-conductor restart
		$ sudo service neutron-openvswitch-agent restart

* In some instances, the centralized logging feature does not function after the  product installation. If this occurs, perform the following steps on the overcloud controller and all compute nodes:

        service rsyslog restart
        

**Helion Dashboard**

When using HP Helion OpenStack you might experience the following issues:

* On the **Floating IPs** tab in the Helion Dashboard (**Project > Access & Security > Floating IPs**) all of the buttons (Associate, Disassociate, Release Floating IP) might not appear under certain circumstances. To make the buttons appear, first attempt to allocate a new floating IP. If the buttons are still not present, log out and log in as the same user. 

	To potentially avoid this issue, when creating users and projects, .  first create the project, then create user(s), and add those users to the project (rather than creating the user first, then creating a project).<!--(HORI-3110) -->

* Volume backups that are created in one project are accessible to all projects. In other projects, the information displayed might not be correct. Volume backups should not appear in other projects. There is no workaround. <!-- (HORI-3009) -->

* Changing the user settings in a non-admin role affects all users across all projects. Changes to a user role should not affect other roles. There is no workaround. <!-- (HORI-2934) -->

* An admin is unable to retrieve object details in an Object Store. The admin might see a blank dialog box or receive the *Error: Unable to retrieve details.* error. Access object details as a non-admin user. <!-- (HORI-2930) -->

* An admin user will receive an error message *Error: Unable to retrieve user list.* while trying to access **Users** from the **Identity Panel**.  To wirk with users, an admin should use the CLI tools rather than the Horizon console. <!-- DOCS-723 --> 

* An admin user in default domain is not able to edit Projects. <!--DOCS-727, DOCS-731 --> 



**Other Issues**

Other issues you might experience when using HP Helion OpenStack:

* If a project and user has been deleted, there is no way in the Helion Dashboard delete the networks associated with the project and user. To clean up artifacts created by a user account that has been deleted, use the CLI tools rather than the Horizon console. <!--(DOCS-733) -->


* When you resize an instance of Nova, it produces an error <!--(NOV-6664) -->. 
* After updating the undercloud to HP Helion OpenStack 1.01, existing HP StoreVirtual clusters might not work. The cluster is listed in the Helion Dashboard, but you might not be able to activate or unregister the cluster. If this occurs, you can [manually register a new cluster](/helion/openstack/undercloud/storage/storevirtual/#register-cluster) with the same name and information as the non-working cluster. You should be able to activate the cluster. <!-- (ANSUPDATE-155) -->

* A Kernel Panic error occurs when a user employs SSH to log in to a virtual machine and attempts to connect to an IP address external to HP Helion OpenStack. <!-- (EE-21) -->

* When a controller node crashes, it must be rebooted to return to its operational state. <!-- (CORE-1387) -->

* The Helion Core installation process leaves behind a shared private network defined. <!-- (CORE-586) -->

* When a virtual IP address (VIP) is moved to a new controller, the OpenStack services stop responding to any CLI commands. The system will recover after several minutes. <!-- (CORE-1716) -->

* The Compute service does not handle or recover from RabbitMQ Server process failure. <!-- (CORE-1559) -->

* The keepalived processes do not restart automatically when they are killed. Use the service `keepalived start` to restart keepalived. <!-- (CORE-972) -->

* The HAProxy does not automatically restart when it is killed. Restart haproxy manually using `service haproxy restart`. <!-- (CORE-943) -->

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