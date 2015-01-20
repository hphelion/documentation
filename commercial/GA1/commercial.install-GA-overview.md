---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/install/overview/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/support-matrix/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install/prereqs/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&#174; Installation Overview 

The HP Helion OpenStack installation follows the standard [TripleO deployment model](/helion/openstack/services/tripleo/overview/), creating a seed, an undercloud and an overcloud.

* **Seed**: The seed VM is started as a VM from a specific seed VM image. It contains a number of self-contained OpenStack components that are used to deploy the undercloud. The seed deploys the undercloud by using Ironic baremetal driver to deploy a specific undercloud machine image.

* **Undercloud**: In a typical HP Helion OpenStack deployment, the undercloud is a baremetal server. The undercloud is a complete OpenStack installation, which is then used to deploy the overcloud.

* **Overcloud**: The overcloud is the end-user OpenStack cloud. In a typical HP Helion OpenStack deployment, the overcloud comprises several baremetal servers.

For more details on the seed, an undercloud and an overcloud, see the [Installation Planning section](/helion/openstack/technical-overview/#install-configure/) in the Technical Overview.

## The Installation Process

HP Helion OpenStack is designed to deliver an open source OpenStack solution at the modest scale. A baremetal multi-node deployment consists of a minimum of 8 baremetal servers, to which you can add up to 100 Compute nodes:

* 1 seed cloud host (installer system)
* 1 undercloud server
* 3 overcloud controllers
* 2 overcloud Swift nodes
* At least 1 overcloud Compute node 

After the installation, you can add additional block storage nodes (not required if 3Par is being used for block storage) and [configure your network securely](/helion/openstack/install/security/).

The high-level process for installing HP Helion OpenStack involves the following:

1. Review the information in the [Support Matrix](/helion/openstack/support-matrix/) and [Technical Overview](/helion/openstack/technical-overview/) for details about hardware and software requirements.

2. Verify that the necessary [Prerequisites](/helion/openstack/install/prereqs) have been performed.

3. Install with either KVM or ESX hypervisor support:
	
	- [Install with KVM hypervisor support](/helion/openstack/install/kvm/) and then [configure HP StoreVirtual VSA for Block Storage](/helion/openstack/install/vsa/) or [configure HP 3PAR StoreServ Storage](/helion/openstack/install/3par/). 

	- [Install with ESX hypervisor support](/helion/openstack/install/esx/) and then [deploy the compute proxy on the ESX hosts](/helion/openstack/install/esx/proxy/) and [deploy OVSvApp for HP Virtual Cloud Networking](/helion/openstack/install/ovsvapp/).

4. Optionally, [install and configure DNSaaS support](/helion/openstack/install/dnsaas/).

There are a few things you should be aware of before you begin your HP Helion OpenStack baremetal installation.

* Loading images is slow, so be patient.

* The seed VM must remain booted while the undercloud and overcloud are up.

* The `stackrc` and `tripleo_*_passwords` files contain credentials for the undercloud and the overcloud; you should ensure that they are securely stored separately from the seed.
 
    `/root/stackrc`

    `/root/tripleo/tripleo_*_passwords`

* The installation will create two initial Object Storage nodes. If you need additional Object Storage nodes, you must create them manually after installation. 


**Important:** When installing HP Helion OpenStack, it is your responsibility to track the physical location (slot number and rack) and associated identifiers (such as MAC addresses) for each physical server to aid in future hardware maintenance. This is necessary because when HP Helion OpenStack is installed on physical servers, the TripleO automation tracks only the MAC network addresses of servers; the physical locations of servers are not tracked. This means there is no automated way to inform a service technician which slot or rack to go to when service is needed on a particular physical server. 

## Next Step ##

Review the information in [Installation Prerequisites](/helion/openstack/install/prereqs/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
