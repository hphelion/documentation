---
layout: default-devplatform
permalink: /als/v1/admin/reference/architecture/
product: devplatform
title: "Architectural Design"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer
role2: Security Engineer
role3: ISV Developer 
role4: Service Developer
role5: Network Administrator
role6: Systems Administrator 
role7: Net Ops Engineer 
role8: NOC Engineer 
role9: Network Architect 
role10: Application Architect 
authors: Jayme P

---
<!--UNDER REVISION-->

#  HP Helion Development Platform: Architectural Design[](#architectural-design "Permalink to this headline")
===========================================================================


- [Roles](#roles)
 -   [Base](#base)
 -   [Primary](#primary)
 -   [Cloud Controller](#cloud-controller)
 -   [Router](#router)
 -   [Droplet Execution Agents](#droplet-execution-agents)
-   [Service Roles](#service-roles)
 -   [Databases](#databases)
 -   [Other data services](#other-data-services)
-   [Role Groups](#role-groups)

The Application Lifecycle Service VM is a stand-alone [micro cloud](/als/v1/user/reference/glossary/#term-micro-cloud) virtual machine with all the components necessary for running a test environment in one instance. For use on a larger scale, the VM can be cloned and assigned specific roles: Router, Cloud Controller, Droplet Execution
Agents (DEAs, or worker nodes), or specific database services.

<img src="/content/documentation/devplatform/helion/images/helion-architecture-diagram.png" />

Roles[](#roles "Permalink to this headline")
---------------------------------------------

### Base[](#base "Permalink to this headline")

The Base role comprises several processes that are necessary for any node to function as part of an Application Lifecycle Service cluster, and is mostly responsible for communicating with the primary node and forwarding log information.

This role cannot be disabled on any node.

### Primary[](#primary)

The Primary role is a mandatory part of a Core node (or micro cloud) and runs a number of critical system processes, including the Cloud Controller, Health Manager, and Router.

The Health Manager keeps track of the apps on each DEA and provides feedback on the number currently running. It works in conjunction with the Cloud Controller and must be run on the same VM.

In a cluster setup, all nodes performing other roles are attached to the MBUS IP of the Core node. Every cluster must include exactly one Primary role. Note that the Router role must be run along with the Primary even if there are other Routers in the cluster and even if the node is not exposed to the internet.  

### Cloud Controller[](#cloud-controller)

The Controller manages most of the operations of an Application Lifecycle Service system. It hosts the Management Console, provides the API endpoint for client access, manages the cloud\_controller\_ng process, provisions services, dispatches applications for staging and deployment, and (with the Health Manager) tracks the availability of DEA nodes. The Cloud Controller allocates instances of an application across available DEA nodes, prioritizing eligible nodes that are running the fewest instances of that app already. This maintains an even distribution of instances of an app across the pool. 

In a cluster setup, the Controller role must run on the [Core node](/als/v1/admin/cluster/#server-cluster-core-node) that all other VM's in the cluster connect to.

A single Controller is sufficient for small and mid-sized clusters, but [multiple Controllers](/als/v1/admin/cluster/#cluster-multi-controllers) can be configured if necessary for larger implementations.

### Router[](#router)

The router directs incoming network traffic to the appropriate
application.

For smaller configurations, the router can be run on the same Application Lifecycle Service VM as the other components.

When additional DEAs are in use and traffic increases, additional
routers can be added to handle the load. This will require a [load
balancer](/als/v1/admin/cluster/#cluster-load-balancer) to be available
in the cluster.

### Droplet Execution Agents[](#droplet-execution-agents)

The Droplet Execution Agent (DEA) role in Application Lifecycle Service is responsible for
staging applications and running application instances within Linux
containers. In an Application Lifecycle Service cluster, there will typically be a number of
nodes running the DEA role, which in turn each host multiple user
application instances.

The DEA role is comprised of a number of processes:

-   dea\_ng: Master process for staging and starting application instances and then reporting their state via NATS to the Health Manager.
-   dir\_server: Handles requests for directories/files and responds with an HTTP URL.
-   fence: Responsible for the management of application containers using Docker.
-   apptail: Streams application logs via Logyard to various log drains.

The Docker image used for the containers can be customized by admins.

Service Roles[](#service-roles)
-------------------------------------------------------------

Application Lifecycle Service nodes can also be assigned roles for data services. The data
services can be run separately on their own nodes, or grouped together.

### Databases:[](#databases)

-   mysql
-   postgresql
-   redis

### Other data services:[](#other-data-services "Permalink to this headline")

-   filesystem ( Persistent filesystem service )
-   rabbit ( RabbitMQ message queue service )
-   memcached
-   Harbor ( Ports service )

Role Groups[](#role-groups "Permalink to this headline")
---------------------------------------------------------

Role groups represent a set of roles. For example the **data-services**
group provides all databases plus RabbitMQ and the filesystem service:

    $ kato role add data-services

Additional groups can be defined by administrators in
*/s/etc/kato/role\_groups.yml*.
