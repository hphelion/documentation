---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/ga/install/overview/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/support-matrix/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install/prereqs/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174; Installation Overview

The HP Helion OpenStack installation follows the standard [TripleO deployment model](/helion/openstack/ga/services/tripleo/overview/), creating a seed, an undercloud and an overcloud.

* **Seed**: The seed VM is started as a VM from a specific seed VM image. It contains a number of self-contained OpenStack components that are used to deploy the undercloud. The seed deploys the undercloud by using Ironic baremetal driver to deploy a specific undercloud machine image.

* **Undercloud**: In a typical HP Helion OpenStack deployment, the undercloud is a baremetal server. The undercloud is a complete OpenStack installation, which is then used to deploy the overcloud.

* **Overcloud**: The overcloud is the end-user OpenStack cloud. In a typical HP Helion OpenStack deployment, the overcloud comprises several baremetal servers.

## The Installation Process

The high-level process for installing HP Helion OpenStack involves the following:

1. Review the information in the [Support Matrix](/helion/openstack/ga/support-matrix/) and [Technical Overview](/helion/openstack/technical-overview/) for details about hardware and software requirements.

2. Verify that the necessary [Prerequisites](/helion/openstack/ga/install/prereqs) have been performed.

3. Install with either KVM or ESX hypervisor support:

	
	- [Install with KVM hypervisor support](/helion/openstack/ga/install/kvm/) and then [configure HP StoreVirtual VSA for Block Storage](/helion/openstack/ga/install/vsa/) or [configure HP 3PAR StoreServ Storage](/helion/openstack/ga/install/3par/). 

	- [Install with ESX hypervisor support](/helion/openstack/ga/install/esx/) and then [deploy the compute proxy on the ESX hosts](/helion/openstack/ga/install/esx/proxy/) and [deploy OVSvApp for HP Virtual Cloud Networking](/helion/openstack/ga/install/ovsvapp/).

4. Optionally, [install and configure DNSaaS support](/helion/openstack/ga/install/dnsaas/).

There are a few things you should be aware of before you begin your HP Helion OpenStack baremetal installation.

* Loading images is slow, so be patient.

* The seed VM must remain booted while the undercloud and overcloud are up.

* The `stackrc` and `tripleo_*_passwords` files contain credentials for the undercloud and the overcloud; you should ensure that they are securely stored separately from the seed.
 
    `/root/stackrc`

    `/root/tripleo/tripleo_*_passwords`


For more information on HP Helion OpenStack Community, see:

* [FAQ](/helion/openstack/ga/faq/) 
* [Release notes](/helion/openstack/ga/release-notes/) 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
