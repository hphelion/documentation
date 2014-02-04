---
layout: default
title: "Deploy Swift"
permalink: /cloudos/moonshot/install/deploy-swift/
product: moonshot

---


<script> 
 
function PageRefresh { 
onLoad="window.refresh" 
} 
 
PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/advanced-cloud-setup/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/install-modules-reference/">NEXT &#9654;</a> </p>

# Deploy Swift 

Swift is the OpenStack object/blob storage service for cloud computing. You can use Swift to store lots of data efficiently, safely, and cheaply.

If you [Setup Swift](/cloudos/moonshot/install/setup-swift) already, this topic explains how to deploy the service.

## Swift Deployment Steps

After creating the cloud and defining your compute regions (see [Create a Cloud](/cloudos/moonshot/install/create-cloud) ), you can deploy Swift in your cloud by following these steps:

1. Launch the HP Cloud OS Installation Dashboard. Its URL is http://192.168.124.10:3000.  For the Installation Dashboard's login, see the dashboard credentials topic on the <a href="https://cloudos.hpwsportal.com" target="new"> HP Cloud OS Catalog</a> portal. (Requires registration and login.)

2. The Swift barclamp is pre-installed with a default proposal created (without assigned nodes).

3. From the UI's top menu, select Barclamps > Cloud Infrastructure > Hp Cos Swift 100.

4. Click the Edit button for the pre-existing Swift proposal.

4. Assign the controller node to the Swift ring-compute, proxy and dispersion roles. For background information, see the next section, [Swift Roles](#swift-roles). 

5. Assign between 2-5 nodes to the Swift storage role. 

6. All the other defaults should be adequate.

7. Click the Apply button to deploy Swift in your cloud. 

## Swift Roles

### Proxy

The proxy server is responsible for tying together the Swift storage architecture. For each request sent to the proxy server, 
it will look up the location of the account, container, or object in the ring (see below) and route the request accordingly. The 
proxy server also exposes the public API. 

A large number of failures are also handled in the proxy server. For example, if a server is unavailable for an object PUT, 
it will ask the ring for a handoff server and route there instead.

When objects are streamed to (or from) an object server, they are streamed directly through the proxy server to (or from) the user.  The 
proxy server does not spool them.

### Ring-compute

In a Swift environment, a ring represents a mapping between the names of entities stored on disk and their physical location. 
There are separate rings for accounts, containers, and objects. When other components need to perform any operation on an object, 
container, or account, they need to interact with the appropriate ring to determine its location in the cluster.

The Ring maintains this mapping using zones, devices, partitions, and replicas. Each partition in the ring is replicated, by default, 
three times across the cluster.  The locations for a partition are stored in the mapping maintained by the ring. The ring is 
also responsible for determining which devices are used for handoff in failure scenarios.

Data can be isolated with the concept of zones in the ring. Each replica of a partition is guaranteed to reside in a different zone. 
A zone could represent a drive, a server, a cabinet, a switch, or even a datacenter. The partitions of the ring are equally divided 
among all the devices in the Swift installation. When partitions need to be moved around (for example if a device is added to the cluster), 
the ring ensures that a minimum number of partitions are moved at a time, and only one replica of a partition is moved at a time.

Weights can be used to balance the distribution of partitions on drives across the cluster. This can be useful, for example, 
when different sized drives are used in a cluster. The ring is used by the proxy server and several background processes (like replication).

### Dispersion

The Swift dispersion role is used for cluster health monitoring. 

There is a swift-dispersion-report tool that you can use to measure the overall cluster health. This is accomplished by checking if a 
set of deliberately distributed containers and objects are currently in their proper places within the cluster. 

For instance, a common deployment has three replicas of each object. The health of that object can be measured by checking if each 
replica is in its proper place. If only two of the three is in place, the object's health can be said to be at 66.66%.

A single object's health, especially an older object, usually reflects the health of that entire partition the object is in. 
If you make enough objects on a distinct percentage of the partitions in the cluster, you can get a valid estimate of the overall 
cluster health. In practice, about 1% partition coverage seems to balance well between accuracy and the amount of time 
it takes to gather results.

## Next Step

Proceed to the next topic, [Install Modules Reference](/cloudos/moonshot/install/install-modules-reference/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

