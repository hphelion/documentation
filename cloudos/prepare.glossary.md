---
layout: default
title: "HP Cloud OS Glossary"
permalink: /cloudos/prepare/glossary/
product: cloudos

---

<a name="_top"> </a>

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/prepare/cloudtypes/">&#9664; PREV | <a href="/cloudos/prepare/">&#9650; UP</a> | NEXT &#9654; </p>

# HP Cloud OS Glossary

[A](#a) | [B](#b) | [C](#c) | [D](#d) | [E](#e) | [F](#f) | [G](#g) | [H](#h) | [I](#i) | [J](#j) | [K](#k) | [L](#l) | [M](#m) | 
[N](#n) | [O](#o) | [P](#p) | [Q](#q) | [R](#r) | [S](#s) | [T](#t) | [U](#u) | [V](#v) | [W](#w) | [X](#x) | [Y](#y) | [Z](#z)

## A

###Abstraction layer### {#AbstractionLayer}
:     A coding layer that provides an intermediary between a programmer and a more complex underlying base code set.  The abstraction layer simplifies the complexities of the 
underlying [REST](#REST) API and JSON/XML formatting of the [request abstraction](#RequestAbstraction) layer code. 

###ACL###
:    Access control list; a list of permissions attached to an object.

###Allocation###
:    Provisioning cloud resources.

###API### {#API}
:     An Application Programming Interface (API) is a set of routines, protocols, and tools for building software applications. 
An API makes it easier to develop a program by providing all the building blocks. A programmer then puts the blocks together. 
Cloud OS provides a REST API so that programmers can write applications consistent with the operating environment.

###API key
:     An API-based key used for authentication purposes, such as an OpenStack Keystone token.

###Authentication###
:     In the context of the Identity Service, the act of confirming the identity of a user or the truth of a claim. The Identity Service will confirm that incoming request 
are being made by the user who claims to be making the call by validating a set of claims that the user is making. These claims are initially in the form of a set of credentials 
(username &amp; password, or user access keys). After initial confirmation, the Identity Service will issue the user a token which the user can then provide to demonstrate 
that their identity has been authenticated when making subsequent requests.

###Authentication Token###
:     String which must be used for subsequent requests to other services.

## B

###Block storage###
:     Information stored in raw form, with no consideration as to the type of information.

###Bootable Image###
:     *See* [Volume (bootable)](#VolumeBootable).

###Broad network access###
:     Broad network access means the capabilities are available over the network and are accessed through standard 
mechanisms that promote the use by heterogenous thin-client or thick-client platforms.  Examples: mobile phones, tablets, laptops 
and workstations.


## C

###CLI###
:     Command-line interface.

###Cloud computing###
:     Cloud computing is a model for enabling ubiquitous, convenient, on-demand network access to a shared pool of 
configurable computing resources.  These resources include networks, servers, storage, applications and services. 
An advantage of cloud computing is that the resources can be provisioned or released rapidly, with minimal 
management effort or service provider interaction.

###Credentials###
:     Data that belongs to, is owned by, and generally only known by a user, which that user can present to prove their identity.

###Term###
:     Definition...


## D

###Term###
:     Definition...

###Term###
:     Definition...

###Term###
:     Definition...


## E

###EC2###
:     Elastic compute cloud; Amazon's cloud computing platform.

###Eve###
:     An HP Cloud OS composite provisioning service that uses a topology template and profile to create VMs, volumes, and network segments as described in the topology. Eve uses Graffiti service for determining resource pool existence, traits, and User identity mapping.

###Term###
:     Definition...


## F

###Flavor### {#Flavor}
:     A combination of disk space, memory (RAM), and usable CPU.

###Floating IP address###
:     An on-demand, allocatable public IP address on a network. You can allocate a number of floating IP addresses up to the quota limit, and then assign them to server [instances](#Instance).


###Focus###
:     An HP Cloud OS repository for topology templates and profiles that are used for provisioning.
...

###Term###
:     Definition...


## G

###Grafitti###
:     an HP Cloud OS searchable directory to find cloud resources based on their capabilities.


###Term###
:     Definition...

###Term###
:     Definition...


## H

###Hybrid cloud###
:     In a hybrid cloud, the cloud infrastructure is a composition of two or more distinct cloud infrastructures (private or public) 
that remain unique entities, but are bound together by standardized or proprietary technology that enables data and application 
portability, such as cloud bursting for load balancing between clouds.  

###Term###
:     Definition...

###Term###
:     Definition...


## I

###Image### {#Image}
:     1) An installable release package of a program, application, or software system.  2) A copy of a virtual server including the operating system information, system state, and application configurations.

###Instance### {#Instance}
:     A virtual machine or server in the cloud environment.

###Term###
:     Definition...


## J

###Job###
:     A job is created when the user submits a desired topology to the Cloud OS Eve service API, and requests provisioning based on the topology. Eve creates the job, for which the 
Eden Service API -frameworkthen publishes status updates. Once the provisioning is finished, the job is marked as completed.

###Term###
:     Definition...

###Term###
:     Definition...


## K

###Key pair###
:     A pair of key values used for verification purposes; generally one key value is private, and the other public (i.e. user-owned).

###Term###
:     Definition...

###Term###
:     Definition...



## L

###Term###
:     Definition...

###Term###
:     Definition...

###Term###
:     Definition...


## M

###Measured service###
:     Measured service means cloud systems automatically control and optimize resource usage by leveraging a metering capability.  
This metering may occur at some level of abstraction that's appropriate to the type of service, such as storage, processing 
power, bandwidth, and the number of active users.  Resource usage may be monitored, controlled, and reported.  Measured service 
provides transparency for the provider and the consumer of the utilized service. 

###Model abstraction###
:     A coding layer that provides a more functional and user-friendly abstraction for the [REST](#Rest) API programming calls. For example, instead of a direct call to GET containers, via the model abstraction layer the programming call for GET container ###container-name### is `directories.get("container-name")` . 
:     A model layer can also include particular kinds of objects, and expose those objects characteristics using simple properties or attributes. For example, "Server" is a model that represents the concept of a virtual [instance](#Instance), with the "Server" model including properties and attributes such as name, [flavor](#Flavor), [image](#Image), addresses, and so on.   See also, [Abstraction layer](#AbstractionLayer).
...

###Term###
:     Definition...


## N

###Node###
:     A computing resource in a network. In other publications, sometimes called a machine.

###Term###
:     Definition...

###Term###
:     Definition...


## O

###On-demand self service###
:     With on-demand self service, a consumer can unilaterally provision computing capabilities, such as server time and network storage, 
as needed, automatically, without requiring human interaction with each service provider. 

###OpenStack###
:     An open-source cloud computing operating system.

###Term###
:     Definition...


## P

###Private cloud###
:     In a private cloud, the cloud infrastructure is provisioned for exclusive use by a single organization comprising multiple consumers, 
such as business units.  The private cloud may be owned, managed and operated by the organization, a third party. or some combination, 
and it may exist on or off the owner's premises.

###Public cloud###
:     In a public cloud,the cloud infrastructure is provisioned for open use by the general public.  It may be owned, managed and operated 
by a business, academic, or government organization, or some combination.  It exists on the premises of the cloud provider.

###Term###
:     Definition...


## Q

###Term###
:     Definition...

###Term###
:     Definition...

###Term###
:     Definition...


## R

###Rapid elasticity###
:     Rapid elasticity means capabilities can be provisioned and released, in some cases automatically, to scale rapidly outward and inward 
commensurate with demand.  To the consumer, these capabilities available for provisioning often appear to be unlimited and can be 
appropriated in any quantity at any time.

###Resource pooling###
:     Resource pooling means the provider's computing resources are pooled to server multiple consumers using a 
multi-tenant model. Different physical and virtual resources are dynamically assigned and reassigned according to consumer 
demand. A characteristic of resource pooling is location independence.  The customer does not need to know or manage or control 
the exact location of the provided resources, but may be able to specify it at a high-level of abstraction, such as a resource's 
country, state, or data center.  Examples of resources include storage, processing power, memory and network bandwidth.

###REST### {#REST}
:     Representational State Transfer; a model for providing web services of HTTP. 

###Request Abstraction### {#RequestAbstraction}
:     A coding layer that provides programming language-specific access to the underlying core code base REST API HTTP calls.  
For example, instead of including a call to the REST API by using HTTP **verb** (GET), path (/flavors), format (?format=json), 
and the other HTTP attributes, using the request layer you can simplify the call to `list_flavors()` (the specific call depends on the 
details of your specific request layer syntax).  The request layer handles all HTTP request and response parsing and exception handling.  
Also known as the **request layer**.

###Role### {#Role}
:     A personality that a user assumes when performing a specific set of operations. A role includes a set of rights and privileges. A user assuming that role inherits 
those rights and privileges.  A token that is issued to a user includes the list of roles that user can assume. Services that are being called by that user determine 
how they interpret the set of roles a user has and which operations or resources each roles grants access to.


## S

###Server### {#Server}
:     A compute instance that is created from a [flavor](#Flavor) combined with an [image](#Image).

###Term###
:     Definition...

###Term###
:     Definition...


## T

###Term###
:     Definition...

###Term###
:     Definition...

###Term###
:     Definition...


## U

###Term###
:     Definition...

###Term###
:     Definition...

###Term###
:     Definition...


## V

###Volume (bootable)### {#VolumeBootable}
:     A bootable server, previously saved by a user.

###Term###
:     Definition...

###Term###
:     Definition...


## W

###Term###
:     Definition...

###Term###
:     Definition...

###Term###
:     Definition...


## X

###Term###
:     Definition...

###Term###
:     Definition...

###Term###
:     Definition...


## Y

###Term###
:     Definition...

###Term###
:     Definition...

###Term###
:     Definition...


## Z

###Term###
:     Definition...

###Term###
:     Definition...

###Term###
:     Definition...

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

