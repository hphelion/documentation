---
layout: default
title: "HP Helion OpenStack® Community Release Notes"
permalink: /helion/community/release-notes/
product: community

---
# HP Helion OpenStack&reg; Community Release Notes

<!--**Product Name:** HP Helion OpenStack&reg; Community
**OpenStack&reg; release name:** Icehouse-->

<!--Thanks for installing the HP Helion OpenStack Community edition! This initial "cloud-in-a-box" virtual deployment allows you to evaluate the Community edition and Icehouse release of OpenStack.  Frequent updates will be available&mdash;approximately every 6 weeks&mdash;to remain as close to the OpenStack trunk release as possible.  The Community edition is the foundational technology for the HP Helion portfolio of products, allowing HP Helion products to quickly leverage OpenStack capabilities.-->

Thanks for installing the HP Helion OpenStack Community edition! This initial "cloud-in-a-box" virtual deployment targeted towards the enterprises and cloud administrators interested in evaluating, developing and deploying a private cloud based on OpenStack Cloud Software. It's a pure, free-to-license OpenStack distribution that speeds up deployment and simplifies the management of a small scale, open cloud environments and infrastructure services.

This release note contains the following information about the HP Helion OpenStack Community edition release:

* [Features in HP Helion OpenStack Community edition](#features)
* [Supported services](#supported-services)
* [Recommendations for HP Helion OpenStack Community](#recommendations)
* [For further information](#for-further-information) 


##Features in HP Helion OpenStack Community## {#features}

**Pure OpenStack technology** &mdash; One of the first OpenStack distributions based on the Icehouse release, the Community edition contains no mix of proprietary or non-OpenStack tools.  This edition allows you to experience a virtual cloud-in-a-box deployment based on [OpenStack TripleO](https://wiki.openstack.org/wiki/TripleO) and evaluate the Icehouse release of OpenStack technology.

**Speeds cloud service delivery** &mdash; Ideal launch pad for your small-scale open cloud environment or proof-of-concept cloud services, with simple, fast creation of cloud environments and applications to speed business value.

**Close-to-trunk release** &mdash; Allows your lab or small-scale production environment to continue to benefit from the very latest capabilities of OpenStack technology.


##Supported services ## {#supported-services} 

This release of the Community edition is shipped with the following services support:
<!--
<table style="text-align: left; vertical-align: top;">
 <tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;">
 <th>OpenStack-powered capabilities<th>OpenStack version<th>API supported<th>API version<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Compute (Nova)<td>ICEHOUSE<td>Full support<td>v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Object Storage (Swift)<td>ICEHOUSE<td>Full support<td>v1.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Block Storage (Cinder)<td>ICEHOUSE<td>Full support<td>v1.0 and v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Networking (Neutron)<td>ICEHOUSE<td>Full support<td>v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Image Service (Glance)<td>ICEHOUSE<td>Full support<td>v1.0 and v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Identity (Keystone)<td>ICEHOUSE<td>Full support<td>v2.0 and v3.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;">
 <td>Dashboard (Horizon)<td>ICEHOUSE<td>Full support<td>N/A
</table>
-->

<table style="text-align: left; vertical-align: top;"><tr style="background-color: #C8C8C8; text-align: left; vertical-align: top;"><th>OpenStack-powered capabilities<th>OpenStack version<th>API supported<th>API version<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Compute (Nova)<td>ICEHOUSE<td>Full support<td>v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Object Storage (Swift)<td>ICEHOUSE<td>Full support<td>v1.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Block Storage (Cinder)<td>ICEHOUSE<td>Full support<td>v1.0 and v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Networking (Neutron)<td>ICEHOUSE<td>Full support<td>v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Image Service (Glance)<td>ICEHOUSE<td>Full support<td>v1.0 and v2.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Identity (Keystone)<td>ICEHOUSE<td>Full support<td>v2.0 and v3.0<tr style="background-color: white; color: black; text-align: left; vertical-align: top;"><td>Dashboard (Horizon)<td>ICEHOUSE<td>Full support<td>N/A</table>


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

* You must have an Ubuntu 13.10 or 14.04 host operating system installed. Other host operating systems might work but have not been tested. Also, this system will not currently install into a virtual machine.
**Note:** To avoid an install error, where the seed cloud works, but the undercloud and overcloud will not, you must use Ubuntu 13.10 Server **OR** install openssh-server on and Ubuntu 13.10 desktop version and disable all firewalls (ufw). * The host must allow root ssh login.
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

This section describes the HP recommendations for best performance, utility, and functionality with this software version. We have also provided information about some known issues for reference purposes. This section contains:

* [Recommendations for best functionality, performance and reliability](#best-practices) 
* [Known issues in this release](#known-issues) 

###Recommendations ### {#best-practices} 

HP recommends the following best practices for this software version.

**Installation**

* To enable full VM functionality, be sure to install the required `qemu-kvm` package.  You can install this package with the command: 

        sudo apt-get install -y qemu-kvm

**Operations**

* For best results when issuing Neutron commands from inside the seed VM, we recommend you set the `LANG` environment variable to `C`.  Add the following line to the appropriate user configuration file:

        export LANG=C
        
* For best performance on your system, to clean up any VMs using excess space, execute the following commands:
    - Delete the KVM VMs and their storage volumes with the `virish` command.
    - Delete the file `/tmp/seed_options`.
    - Uninstall any packages that you no longer require.

###Known issues in this release### {#known-issues}

The following are the known issues for HP Helion OpenStack Community edition:

**Operations**

* If you determine that your VM seed has not started correctly when you executed the `hp_ced_start_seed` script, run the script a second time to ensure you start the seed.
* VM installations do not currently persist across reboots.  When you reboot your system, be sure to start a new VM installation.


##For further information## {#for-further-information}

For additional information on HP Helion OpenStack Community, OpenStack Cloud Software and TripleO:

* [HP Helion OpenStack Community Documentation web site](/helion/community/): Provides the topics listed below.
* [FAQ](/helion/community/faq/): Contains some frequently asked questions about the HP Helion OpenStack Community edition release
* [Installation and configuration](/helion/community/install-virtual/): A set of tasks that walk you through the installation and configuration process.
* [Related Topics](/helion/community/related-links/): Links to pertinent HP Helion OpenStack Community and OpenStack documentation.
* [OpenStack documentation home page](http://docs.openstack.org/)
* [TripleO documentation](https://wiki.openstack.org/wiki/TripleO)
* [HP Helion OpenStack Support Forum](https://ask.openstack.org) (Tag your questions with HPHelion)


###Legal Notices and Disclaimer### {#legal-notices-disclaimer}

<!--See the [HP Helion OpenStack Community Open Source and Third-Party Software License Agreements](/helion/community/community-3rd-party-license-agreements/).-->

Linux&reg; is the registered trademark of Linus Torvalds in the U.S. and other countries.

The OpenStack Word Mark is either a registered trademark/service mark or trademark/service mark of the OpenStack Foundation, in the United States and other countries and is used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
