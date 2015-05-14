---
layout: default
title: "HP Helion OpenStack&#174; Installation Overivew"
permalink: /helion/openstack/carrier/install/bm/overview/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade (Beta): Installation Overview

This document describes the installation process for HP Helion OpenStack Carrier Grade in a baremetal environment. 
## About the installation 

The HP Helion OpenStack Carrier Grade Alpha installation will create a base HP Helion OpenStack cloud that uses the [HP Networking (Neutron) service](/helion/openstack/carrier/services/networking/overview/) using Open vSwitch (OVS). 

The HP Helion OpenStack cloud will consist of three controller systems and two [compute](/helion/openstack/carrier/services/compute/overview/) nodes. The installation also creates a KVM node virtual machine from which you can deploy [Volume Operation (Cinder) block storage](/helion/openstack/carrier/services/volume/overview/). See the Technical Overview and Support Matrix for more information.

After installation, you can interact with the HP Helion OpenStack cloud using the [Horizon graphical interface](/helion/openstack/carrier/services/horizon/overview/) or using the APIs of the respective [services](/helion/openstack/carrier/services/overview/). 

## Installation process

Use the following process to install HP Helion OpenStack Carrier Grade in a baremetal environment. 

1. Review the [Technical Overview](/helion/openstack/carrier/technical-overview/) for information on the HP Helion OpenStack Carrier Grade environment.

2. Review the [Support Matrix](/helion/openstack/carrier/support-matrix/) to make sure your environment meets the minimum requirements.

3. [Installation Prerequisites](/helion/openstack/carrier/install/prereqs/)

4. [Prepare the Base KVM to have appropriate network setup done](/helion/openstack/carrier/install/bm/network/prepare/). This step initializes the network interfaces for all cloud nodes.

5. [Create the HLM Virtual Machine](/helion/openstack/carrier/install/bm/hlm-vm/). This step will also create the VSD VM.

6. [Initialize network interfaces for all cloud nodes]

7. [Deploy the HLM Cloud](/helion/openstack/carrier/install/bm/hlm-cloud/)

## First Step ##

Before you start, make sure your environment meets the hardware and software requirements. See the [Technical Overview](/helion/openstack/carrier/technical-overview/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
