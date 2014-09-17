---
layout: default-devplatform
permalink: /als/v1/
product: devplatform

---
<!--PUBLISHED-->

Application Lifecycle Service Documentation[](#helion-documentation "Permalink to this headline")
===============================================================================
 The **Application Lifecycle Service**  is polyglot
Platform-as-a-Service (PaaS) software. Whether you run it in your own data
center using the hypervisor of your choice or on your favorite cloud
hosting provider, it provides the backbone for your private or public PaaS.


**Upgrade and Release Notes**

- All [Release & Support](#release-support) documentation.
 
- Application Lifecycle Service 3.0 is based on Cloud Foundry v2 and there are a number of important differences to be aware of if you are moving from Application Lifecycle Service 2.x:
	-   App deployment is now primarily done using [*buildpacks*](/als/v1/user/deploy/buildpack/#buildpacks)
	-   Some keys in [*stackato.yml*](/als/v1/user/deploy/stackatoyml/#stackato-yml) have changed
	-   Groups have been replaced with [*Organizations and Spaces*](/als/v1/user/deploy/orgs-spaces/#orgs-spaces)
	-   The Application Lifecycle Service v3 API is compatible with the [*Cloud Foundry v2 API*](/als/v1/user/reference/api/)


ALS Admin Guide[](#admin-guide "Permalink to this headline")
---------------------------------------------------------
Documentation intended for system operators in charge of setting up, configuring, and maintaining the PaaS.

-   [Application Lifecycle Service Admin Guide](/als/v1/admin/)
    -   [Management Console](/als/v1/admin/#management-console)
    -   [Server Configuration](/als/v1/admin/#server-configuration)
    -   [Cluster Configuration](/als/v1/admin/#cluster-configuration)
    -   [Best Practices](/als/v1/admin/#best-practices)
    -   [Reference](/als/v1/admin/#reference)

ALS User Guide[](#user-guide "Permalink to this headline")
-------------------------------------------------------
Documentation intended for developers and other end users who will be using a PaaS set up and maintained by others.

-   [Application Lifecycle Service User Guide](/als/v1/user/)
    -   [Quick Start](/als/v1/user/#quick-start)
    -   [Application Lifecycle Service Client](/als/v1/user/#helion-client)
    -   [Deploying Applications](/als/v1/user/#deploying-applications)
    -   [Services](/als/v1/user/#services)
    -   [Logging & Monitoring](/als/v1/user/#logging-monitoring)
    -   [Management Console](/als/v1/user/#management-console)
    -   [Reference](/als/v1/user/#reference)