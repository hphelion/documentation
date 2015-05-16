---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Installation Overivew"
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

The HP Helion OpenStack Carrier Grade Alpha installation installs HP Helion Lifecycle Management, creates a base HP Helion OpenStack cloud, and configures network virtualization through HP Distributed Cloud Networking. Using a separate installation, you integrate Wind River Linux servers into the HP Helion OpenStack Carrier Grade environment.

After installation, you can interact with the HP Helion OpenStack cloud using the [Horizon graphical interface](/helion/openstack/carrier/services/horizon/overview/) or using the CLIs of the respective [services](/helion/openstack/carrier/services/overview/). 

## Installation process

Use the following process to install HP Helion OpenStack Carrier Grade in a baremetal environment. 

1. Review the [Technical Overview](/helion/openstack/carrier/technical-overview/) for information on the HP Helion OpenStack Carrier Grade environment.

2. Review the [Support Matrix](/helion/openstack/carrier/support-matrix/) to make sure your environment meets the minimum requirements.

3. [Installation Prerequisites](/helion/openstack/carrier/install/pb/prereqs/)

4. [Prepare the Base KVM to have appropriate network setup done](/helion/openstack/carrier/install/bm/network/prepare/). This step initializes the network interfaces for all cloud nodes.

5. [Create the HLM Virtual Machine](/helion/openstack/carrier/install/bm/hlm-vm/). This step will also create the VSD VM.

6. [Initialize network interfaces for all cloud nodes]

7. [Deploy the HLM Cloud](/helion/openstack/carrier/install/bm/hlm-cloud/)

## First Step ##

Before you start, make sure your environment meets the hardware and software requirements. See the [Technical Overview](/helion/openstack/carrier/technical-overview/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
