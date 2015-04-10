---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Using Helion Lifecycle Management"
permalink: /helion/openstack/carrier/admin/hlm/
product: commercial.ga
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

<!--
<p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p>
-->

# HP Helion OpenStack&#174; Carrier Grade: Using Helion Lifecycle Management

Using HLM, you can install and upgrade HP Helion OpenStack Carrier Grade and do...

<!-- Taken from https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/HLM+Command+Line+Interface -->

A.	Deploy cloud. An entire cloud is deployed. 

B.	Stop component. A service component is stopped. 

C.	Start service or component in a given control plane. Start and stop can operate on both entire services, or components on the service. 

D.	Restart service. All of the components of the service are restarted. 

E.	Apply a patch to a cloud

F.	Apply a hot-fix to a cloud

G.	Apply a software update to a cloud

H.	Upgrade the cloud. Not supported by HCSP 1.0. 

I.	Change the configuration of the cloud. Cloud configuration changes include changing properties for a given service component, adding a new service, and adding/removing resource nodes.

J.	Rollback the configuration of the cloud. Revert to a previous checkpoint of the cloud configuration. 

K.	Add a compute node to a resource pool. Adding and removing resource nodes. 

L.	Modify the security credentials for mysql

M.	Modify configuration of Swift rings

N.	Put a node into maintenance mode

O.	Shutdown a control plane

P.	Add/remove a control plane. This is not something that will be published to customers, but not something we need to prevent

Q.	Create cloud definition

R.	List sample clouds

S.	Provision nodes to be used in cloud

T.	Display current cloud topology

U.	Display the desired state cloud topology. 

V.	Explain current/desired state cloud topology




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
