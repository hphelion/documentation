---
layout: default
title: "HP Helion OpenStack Community Installation and Configuration"
permalink: /helion/community/install-overview/
product: community

---


<p style="font-size: small;"> <a href="/helion/community/hwsw-requirements/">&#9664; PREV</a> | <a href="/helion/community/">&#9650; UP</a> | <a href="/helion/community/install">NEXT &#9654;</a> </p>

# HP Helion OpenStack Community Installation and Configuration
With HP Helion OpenStack Community, you can quickly and easily spin up clouds using two types of installation paths:

* A virtual installation for testing and proof-of-concept use
* A multi-node, barmetal installation for small-scale production

As long as you have a system with at least 48 GB of RAM and Ubuntu 13.10 or 14.04 installed, you can have a cloud in approximately 30 minutes!

## Virtual installation  

This cloud-in-a-box is designed to let you test the functionality of HP Helion OpenStack Community. It is not intended to be used in a production environment to run real workloads, and therefore no support is available. This installation is a fixed, virtual configuration of:

* 1 undercloud
* 1 overcloud controller
* 2 overcloud swift nodes 
* 1 overcloud compute node 

Installer system requirements:

* At least 48 GB of RAM
* At least 200 GB of available disk space


[Register and download the virtual installation package](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221000%22%7D/Show).

[Learn how to to install and configure a virtual cloud](/helion/community/install-virtual/). 

## Baremetal installation 

This HP Helion OpenStack Community baremetal multi-node deployment is for a small-scale, private cloud. The installation deploys to a minimum 5 baremetal server configuration:

* 1 undercloud
* 1 overcloud controller
* 2 overcloud swift nodes 
* At least 1 overcloud compute nodes 

You can add **up to 30 compute nodes** to suit your deployment needs.

System requirements:

* At least 5 and up to 30 baremetal systems
* An additional pre-installed system to run the installer and host the seed VM

[Register and download the multi-node baremetal installation package](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221216%22%7D/Show).

[Learn how to to install and configure a baremetal cloud](/helion/community/install/). 

## For more information
For more information on HP Helion OpenStack Community, see:

* [Hardware and Software Requirements](/helion/community/hwsw-requirements/) 
* [FAQ](/helion/community/faq/) 
* [Release notes](/helion/community/release-notes/) 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>