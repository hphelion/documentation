---
layout: default
title: "HP Helion OpenStack&#174; Community Release Notes"
permalink: /helion/community/release-notes/
product: community

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


# HP Helion OpenStack&reg; Community Release Notes

<!--**Product Name:** HP Helion OpenStack&reg; Community
**OpenStack&reg; release name:** Icehouse-->

<!--Thanks for installing the HP Helion OpenStack Community edition! The initial "cloud-in-a-box" virtual deployment allows you to evaluate the Community edition and Icehouse release of OpenStack.  Frequent updates will be available&mdash;approximately every 6 weeks&mdash;to remain as close to the OpenStack trunk release as possible.  The Community edition is the foundational technology for the HP Helion portfolio of products, allowing HP Helion products to quickly leverage OpenStack capabilities.-->

Thanks for your interest in HP Helion OpenStack Community! These release notes contain the following information about this release:

* [Available product versions](#versions)
* [Features in HP Helion OpenStack Community edition](#features) 
* [Supported services](#supported-services)
* [Recommendations for HP Helion OpenStack Community](#recommendations)
* [For further information](#for-further-information) 


##Available product versions## {#versions}

This release of the HP Helion OpenStack Community edition contains a single download of the product that covers both virtual and bare metal deployment:

* *A virtual deployment of HP Helion OpenStack Community*. First released in early May, 2014, this provides a "cloud-in-a-box" virtual deployment targeted towards enterprises and cloud administrators interested in evaluating, developing and deploying a private cloud based on OpenStack Cloud Software. It's a pure, free and downloadable OpenStack distribution that speeds up deployment and simplifies the management of small-scale, open cloud environments and infrastructure services. 
* *A bare-metal deployment of HP Helion OpenStack Community*. First released in June, 2014, this edition installs in a physical environment. The baremetal installation allows you to build an OpenStack cloud spanning multiple physical nodes. During installation, this edition sets up an undercloud host and deploys the overcloud on a controller host, 2 physical Swift nodes, and up to 30 physical compute nodes. 

These release notes cover both deployments.


##Features in HP Helion OpenStack Community## {#features}

**Pure OpenStack technology** &mdash; This edition allows you to experience a cloud deployment using [OpenStack TripleO](https://wiki.openstack.org/wiki/TripleO).

**Speeds cloud service delivery** &mdash; Outstanding launch pad for your small-scale open cloud environment or proof-of-concept cloud services, with simple, fast creation of cloud environments and applications to speed business value.

**Close-to-trunk release** &mdash; Allows your lab or small-scale production environment to continue to benefit from the very latest capabilities of OpenStack technology – we closely track the community trunk release.


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

<!--
<table style="text-align: left; vertical-align: top;"><tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;"><th>OpenStack-powered capabilities<th>OpenStack version<th>API supported<th>API version<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Compute (Nova)<td>ICEHOUSE<td>Full support<td>v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Object Storage (Swift)<td>ICEHOUSE<td>Full support<td>v1.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Block Storage (Cinder)<td>ICEHOUSE<td>Full support<td>v1.0 and v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Networking (Neutron)<td>ICEHOUSE<td>Full support<td>v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Image Service (Glance)<td>ICEHOUSE<td>Full support<td>v1.0 and v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Identity (Keystone)<td>ICEHOUSE<td>Full support<td>v2.0 and v3.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Dashboard (Horizon)<td>ICEHOUSE<td>Full support<td>N/A</table>
-->

<!--


## Prerequisites 

Note: This section commented out; appears to be a duplicate--and out of date--version of the same information in the install page

This release of the Community edition requires the following:

* [Hardware requirements](#hardwarereqs)
* [System software preparation](#softwareprep)

### Hardware requirements ## {#hardwarereqs}

The [OpenStack TripleO utility](https://wiki.openstack.org/wiki/TripleO) creates several large virtual machines (VMs) as part of the cloud-in-a-box deployment process, so you must use a system that meets or exceeds the following hardware specifications:

* At least 16 GB of RAM
* At least 200 GB of available disk space
* Virtualization support enabled in the BIOS

**Host OS:** Ubuntu 13.10 or 14.04, running on the physical machine
**Supported Guest OS:** Ubuntu 13.10


### Software system preparation ## {softwareprep}

* You must have an Ubuntu 13.10 or 14.04 host operating system installed. Other host operating systems might work but have not been tested. Also, this system does not currently install into a virtual machine.
**Note:** To avoid an install error, where the seed cloud works, but the undercloud and overcloud does not, you must use Ubuntu 13.10 Server **OR** install openssh-server on and Ubuntu 13.10 desktop version and disable all firewalls (ufw). * The host must allow root ssh login.
* The following packages must be installed:
$ sudo apt-get install -y libvirt-bin openvswitch-switch openvswitch-common python-libvirt qemu-system-x86 qemu-kvm
* If you have just installed the libvirt packages, you must reboot or restart libvirt:
$ sudo /etc/init.d/libvirt-bin restart
* Ensure that the root user has a private/public keypair. 1. Login as root:
$ sudo su -
2. Check whether .ssh/id_rsa exists:
      # ls ~root/.ssh/id_rsa
3. If the key does not exist, create one, omitting a passphrase and accepting the defaults by pressing Enter:
      # ssh-keygen -t rsa


-->

##Recommendations for HP Helion OpenStack Community## {#recommendations}

This section describes the HP recommendations for optimizing performance, utility, and functionality with this software version. We have also provided information about some known issues for reference purposes. This section contains:

* [Recommendations for optimizing functionality, performance and reliability](#best-practices) 
* [Known issues in this release](#known-issues) 

###Recommendations ### {#best-practices} 

HP recommends the following best practices for this software version.

**Installation**

* To enable VM functionality, be sure to install the required `qemu-kvm` package.  You can install this package with the command: 

        sudo apt-get install -y qemu-kvm

**Operations**

* When issuing Neutron commands from inside the seed VM, we recommend you set the `LANG` environment variable to `C`.  Add the following line to the appropriate user configuration file:

        export LANG=C
        
* We recommend cleaning up any VMs using excess space, by executing the following commands:
    - Delete the KVM VMs and their storage volumes with the `virsh` command.
    - Delete the file `/tmp/seed_options`.
    - Uninstall any packages that you no longer require.

* For optimum VM operation and to avoid generating inaccurate error codes, we recommend you not reboot the overcloud controller but rather restart the applicable services by executing the following commands:
    - sudo service nova-compute restart
    - sudo service nova-scheduler restart
    - sudo service nova-conductor restart
    - sudo service neutron-openvswitch-agent restart

* After deleting a cloud or an entire HP Helion OpenStack Community installation, make sure you perform a full disk erasure on the associated storage devices to prevent exposure of sensitive data that might have been stored there.

###Known issues in this release### {#known-issues}

The following are the known issues for HP Helion OpenStack Community edition: 

**Operations**

* If you determine that your VM seed has not started correctly when you executed the `hp_ced_start_seed` script, run the script a second time to ensure you start the seed.
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

<!--See the [HP Helion OpenStack Community Open Source and Third-Party Software License Agreements](/helion/community/community-3rd-party-license-agreements/).-->

Linux&reg; is the registered trademark of Linus Torvalds in the U.S. and other countries.

The OpenStack Word Mark is either a registered trademark/service mark or trademark/service mark of the OpenStack Foundation, in the United States and other countries and is used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
