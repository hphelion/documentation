---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Provider Networks"
permalink: /helion/openstack/carrier/configuration/plan/network/provider/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: Systems Administrator 
role2: Cloud Architect 
role3: Storage Administrator 
role4: Network Administrator 
role5: Service Developer 
role6: Cloud Administrator 
role7: Application Developer 
role8: Network Engineer 
authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/carrier/services/imaging/overview/">&#9664; PREV</a> | <a href="/helion/openstack/carrier/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/carrier/services/object/overview/"> NEXT &#9654</a> </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Planning the Provider Networks
<!-- From the Titanium Server Admin Guide -->

Provider networks are the payload-carrying networks used implicitly by end users when they move traffic over their
tenant networks.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

You must consider the following guidelines:

* From the point of view of the tenants, all networking happens over the tenant networks created by them, or by the admin user on their behalf. Tenants are not necessarily aware of the available provider networks. In fact, they cannot create tenant networks over provider networks not already accessible to them. For this reason, the system administrator must ensure that proper communication mechanisms are in place for tenants to request access to
specific provider networks when required.

	For example, a tenant may be interested in creating a new tenant network with access to a specific network access device in the data center, such as an access point for a wireless transport. In this case, the system administrator must create a new tenant network on behalf of the tenant, using a VLAN ID in the provider network's segmentation range that provides connectivity to the said network access point.

* Consider how different offerings of bandwidth, throughput commitments, and class-of-service, can be used by your users. Having different provider network offerings available to your tenants enables end users to diversify their own portfolio of services. This in turn gives the HP Helion OpenStack Carrier Grade administration an opportunity to put different revenue models in place.

* For the IPv4 address plan, consider the following:

	* Tenant networks attached to a public network, such as the Internet, have to have external addresses assigned to them. Therefore you must plan for valid definitions of their IPv4 subnets and default gateways.

	* As with the OAM network, you must ensure that suitable firewall services are in place on any tenant network with a public address.

* Segmentation ranges defined on a provider network may be owned by the administrator, a specific tenant, or may be shared by all tenants. With this ownership model:

	* A base deployment scenario has each compute node using a single data interface defined over a single provider network. In this scenario, all required tenant networks can be instantiated making use of the available VLANs or VNIs in each corresponding segmentation range. You may need more than one provider network when the underlying physical networks demand different MTU sizes, or when boundaries between provider networks are dictated by policy or other non-technical considerations.

	* Segmentation ranges can be reserved and assigned on-demand without having to lock and unlock the compute nodes. This facilitates day-to-day operations which can be performed without any disruption to the running environment.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----