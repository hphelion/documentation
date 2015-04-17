---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Using Helion Lifecycle Management"
permalink: /helion/openstack/carrier/admin/hlm/
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

<!--
<p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p>
-->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Using Helion Lifecycle Management

Using HLM, you can install and upgrade HP Helion OpenStack Carrier Grade and can perform the following:

<!-- From Kenobi LCM4Cloud.pptx per Bryan Murray -->

## Provisioning

* Provision <Type> Node
* Deprovision <Type> Node
* Prepare SAN Storage to boot <Type> Node
* Prepare additional SAN Storage for <Type> Node
* Prepare additional local storage for <Type> Node
* Prepare Bonded NIC for <Type> Node
* Provision virtual <Type> Node on physical <Type> Node
* Deprovision virtual <Type> Node on physical <Type> Node
* Determine NIC port enumeration map for <Type> Node
* Determine Storage map for <Type> Node


## Deployment

* Build <Type> Control Plane - Service Tier <ID>
* Destroy <Type> Control Plane - Service Tier <ID>
* Build <Type> Resource Cluster
* Destroy <Type> Resource Cluster
* Add Member to <Type> Control Plane - Service Tier <ID>
* Remove Member from <Type> Control Plane - Service Tier <ID>
* Add <Type> Resource Single Node to <Type> Control Plane
* Remove <Type> Resource Single Node from <Type> Control Plane
* Add <Type> Resource Cluster to <Type> Control Plane
* Remove <Type> Resource Cluster from <Type> Control Plane

## Maintenance

* Modify <Type> Control Plane Options
* Offline Member <ID> of <Type> Control Plane - Service Tier <ID>
* Online Member <ID> of <Type> Control Plane - Service Tier <ID>
* Offline <Type> Resource Single <ID>
* Online <Type> Resource Single <ID>
* Offline <Type> Resource Cluster <ID>
* Online <Type> Resource Cluster <ID>
* Audit <Type> Resource Node compliance

## Recovery

* Backup data from <Type> Control Plane
* Restore data to a <Type> Control Plane
* Rebuild <Type> Control Plane - Service Tier <ID>
* Rebuild <Type> Resource Cluster
* Rebuild <Type> Cloud Instance <ID>

## Migration

* Offline Migration of <Type> Control Plane:  <Type> Service Cluster from Service Tier <ID> to Service Tier <ID>
* Rolling Migration of <Type> Control Plane:  <Type> Service Cluster from Service Tier <ID> to Service Tier <ID>
* Offline Migration of <Type> Control Plane:  <Type> Service Single from Service Tier <ID> to Service Tier <ID>

## Update/Upgrade
* Rolling Hot-fix to <Type> Control Plane
* Rolling Hot-fix to <Type> Resource Single
* Rolling Hot-fix to <Type> Resource Cluster
* Rolling Update to <Type> Control Plane
* Rolling Update to <Type> Resource Single
* Rolling Update to <Type> Resource Cluster
* Rolling Upgrade to <Type> Control Plane
* Rolling Upgrade to <Type> Resource Single
* Rolling Upgrade to <Type> Resource Cluster


<!-- Taken from https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/HLM+Command+Line+Interface

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
-->



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
