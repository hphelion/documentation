---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Reference Deployment Scenarios Guide"
permalink: /helion/openstack/carrier/deploy/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Reference Deployment Scenarios Guide

You can use the deployment scenarios to familiarize yourself with HP Helion OpenStack Carrier Grade and evaluate its performance.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

Two deployment scenarios are described: 

* **Bridging Scenario** -This scenario uses two virtual L2 switches
* **Routing Scenario** - This scenario uses two virtual L3 switches. 
 
In each scenario, two VM instances are launched, and a test path is established between them for performance evaluations.


**Overview**

[Reference Deployment Scenarios Overview](/helion/openstack/carrier/deploy/)

* [Bridging Scenario Overview](/helion/openstack/carrier/deploy/bridging/overview/)

* [Routing Scenario Overview](/helion/openstack/carrier/deploy/routing/overview/)

[Requirements for the Deployment Scenarios](/helion/openstack/carrier/deploy/requirements/)

[Networks Used in the Deployment Scenarios](/helion/openstack/carrier/deploy/networks/)

[VM Network Interface Options](/helion/openstack/carrier/deploy/interface/)

**Setting Up the Scenario Environments**

[Setting Up the Scenario Environment](/helion/openstack/carrier/deploy/setting/)

* [Components of the Scenario Environment](/helion/openstack/carrier/deploy/setting/components/)
* [Administrative Tasks](/helion/openstack/carrier/deploy/setting/admin/)
* [User Tasks](/helion/openstack/carrier/deploy/setting/user/)

**Deploying the Scenarios** 

[Deploying the Bridging Scenario](/helion/openstack/carrier/deploy/bridging/deploy/)

[Deploying the Routing Scenario](/helion/openstack/carrier/deploy/routing/deploy/)

[Running Traffic Through the Test Paths](/helion/openstack/carrier/deploy/running-traffic/)

**Deployment Scenarios using the CLI**

* [Deployment Scenarios using the CLI](/helion/openstack/carrier/deploy/cli/)

	* [Creating Tenants and Updating Quotas](/helion/openstack/carrier/deploy/cli/tenants/)
	* [Creating Users](/helion/openstack/carrier/deploy/cli/users/)
	* [Establishing Provider Networks](/helion/openstack/carrier/deploy/cli/provider/)
	* [Creating Segmentation Ranges](/helion/openstack/carrier/deploy/cli/segment/)
	* [Setting Up Tenant Networks](/helion/openstack/carrier/deploy/cli/tenant/)
	* [Setting Up the Example Guest Image](/helion/openstack/carrier/deploy/cli/guest/)
	* [Setting Up User Data](/helion/openstack/carrier/deploy/cli/data/)
	* [Setting Up Flavors](/helion/openstack/carrier/deploy/cli/flavors/)
	* [Creating Login Environment Files](/helion/openstack/carrier/deploy/cli/environ/)
	* [Launching Instances Using the CLI](/helion/openstack/carrier/deploy/cli/launch/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
