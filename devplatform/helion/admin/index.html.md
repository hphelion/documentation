---
layout: default-devplatform
permalink: /als/v1/admin/
product: devplatform
title: "Application Lifecycle Service Admin Guide" 
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.0
product-version3: HP Helion Development Platform 1.01
product-version4: HP Helion Development Platform 1.1

---
<!--PUBLISHED-->

# HP Helion Development Platform: Application Lifecycle Service Admin Guide {#helion-admin-guide}

Application Lifecycle Service is HP's cloud application framework for creating a
multi-language, secure and private Platform-as-a-Service (PaaS). This
guide covers how to set it up and how to configure it for your end
users.

##Wizard-Based Cluster Creation {#wizard-based-cluster-creation}
You can easily create and access Application Lifecycle Service clusters from the [Project Dashboard](/helion/devplatform/deploy/)       


##Helion Development Platform Management Console {#management-console}

-   [Management Console](/als/v1/user/console/#management-console)
-   [Sample Applications](console/app-store)

##Advanced/Manual Server Configuration {#server-configuration}
This section covers advanced configuration settings that allow you to modify default cluster component behavior. 

-   [Server Configuration](/als/v1/admin/server/)
    -   [Accessing Server via the Command
        Line](/als/v1/admin/server/#accessing-server-via-the-command-line)
    -   [Common Operations](/als/v1/admin/server/#common-operations)
    -   [Detailed
        Configuration](/als/v1/admin/server/#detailed-configuration)
-   [Router](/als/v1/admin/server/router/)
    -   [Settings](/als/v1/admin/server/router/#settings)
    -   [WebSockets](/als/v1/admin/server/router/#websockets)
    -   [SPDY](/als/v1/admin/server/router/#router-spdy)
-   [Docker & Fence](/als/v1/admin/server/docker/)
    -   [Modifying or Updating the Container
        Image](/als/v1/admin/server/docker/#modifying-or-updating-the-container-image)
    -   [Admin Hooks](/als/v1/admin/server/docker/#admin-hooks)
    -   [Creating a Docker
        Registry](/als/v1/admin/server/docker/#creating-a-docker-registry)
-   [Log Streams](/als/v1/admin/server/logging/)
    -   [Logyard](/als/v1/admin/server/logging/#logyard)
    -   [Drains](/als/v1/admin/server/logging/#drains)
    -   [Configuration](/als/v1/admin/server/logging/#configuration)
    -   [Debugging Logyard](/als/v1/admin/server/logging/#debugging-logyard)
-   [AOK Authentication Server](/als/v1/admin/server/aok/)
    -   [End User Login](/als/v1/admin/server/aok/#end-user-login)
    -   [Strategies](/als/v1/admin/server/aok/#strategies)
    -   [Configuration](/als/v1/admin/server/aok/#configuration)
    -   [User Management](/als/v1/admin/server/aok/#user-management)
    -   [First Admin User Setup](/als/v1/admin/server/aok/#first-admin-user-setup)
    -   [Regular LDAP User
        Setup](/als/v1/admin/server/aok/#regular-ldap-user-setup)
-   [Upgrading Application Lifecycle Service](/als/v1/admin/server/upgrade/)
    -   [Before an upgrade](/als/v1/admin/server/upgrade/#before-an-upgrade)
    -   [Executing the
        upgrade](/als/v1/admin/server/upgrade/#executing-the-upgrade)

##Advanced/Manual Cluster Configuration {#cluster-configuration}

This section provides information on how to set up a standalone cluster and modify default cluster level settings.

-   [Cluster Setup](/als/v1/admin/cluster/)
    -   [Roles](/als/v1/admin/cluster/#roles)
    -   [Preparing the Core
        Node](/als/v1/admin/cluster/#preparing-the-core-node)
    -   [Attaching Nodes and Enabling
        Roles](/als/v1/admin/cluster/#attaching-nodes-and-enabling-roles)
    -   [Example Clusters](/als/v1/admin/cluster/#example-clusters)
    -   [Roles Requiring Persistent or Shared
        Storage](/als/v1/admin/cluster/#roles-requiring-persistent-or-shared-storage)
    -   [Port Configuration](/als/v1/admin/cluster/#port-configuration)
    -   [Multiple Controllers](/als/v1/admin/cluster/#multiple-controllers)
    -   [Load Balancer and Multiple
        Routers](/als/v1/admin/cluster/#load-balancer-and-multiple-routers)
-   [DEA Auto Scaling](/als/v1/admin/cluster/autoscaling/)
    -   [DEA Template](/als/v1/admin/cluster/autoscaling/#dea-template)
    -   [DEA Scaling
        configuration](/als/v1/admin/cluster/autoscaling/#dea-scaling-configuration)
    -   [Enabling
        Auto-Scaling](/als/v1/admin/cluster/autoscaling/#enabling-auto-scaling)
    -   [Configuration and Tuning](/als/v1/admin/cluster/autoscaling/#configuration-and-tuning-advanced)
    -   [Writing custom scaling plugins](/als/v1/admin/cluster/autoscaling/#writing-custom-scaling-plugins-advanced)
    -   [Troubleshooting](/als/v1/admin/cluster/autoscaling/#troubleshooting)
    -   [Testing](/als/v1/admin/cluster/autoscaling/#testing)
-   [cloud-init](/als/v1/admin/cluster/cloud-init/)
    -   [Securing the new
        node](/als/v1/admin/cluster/cloud-init/#securing-the-new-node)
    -   [Custom System
        Configuration](/als/v1/admin/cluster/cloud-init/#custom-system-configuration)
-   [External Data Services](/als/v1/admin/cluster/external-db/)
    -   [General
        Principles](/als/v1/admin/cluster/external-db/#general-principles)
    -   [MySQL](/als/v1/admin/cluster/external-db/#mysql)
    -   [PostgreSQL](/als/v1/admin/cluster/external-db/#postgresql)
    -   [Troubleshooting](/als/v1/admin/cluster/external-db/#troubleshooting)
-   [Harbor: TCP/UDP Port Service](/als/v1/admin/cluster/harbor/)
    -   [Architecture](/als/v1/admin/cluster/harbor/#architecture)
    -   [Requirements & Setup](/als/v1/admin/cluster/harbor/#requirements-setup)
    -   [Troubleshooting](/als/v1/admin/cluster/harbor/#troubleshooting)

##Best Practices {#best-practices}

-   [Best Practices](/als/v1/admin/best-practices/)
    -   [Applying Updates](/als/v1/admin/best-practices/#applying-updates)
    -   [Backup & Migration](/als/v1/admin/best-practices/#backup-migration)
    -   [Upgrading (v1.0 and
        later)](/als/v1/admin/best-practices/#upgrade)
	- [Persistent
        Storage](/als/v1/admin/best-practices/#storage)
- [Hello World Custom Drain Sample](/als/v1/admin/best-practices/logging-examples/#hello-world-custom-drain)

##Reference {#reference}
-   [Kato Command Reference](/als/v1/admin/reference/kato-ref/)
-   [Client Command Reference](/als/v1/user/reference/client-ref)
-   [Managing Groups, Users & Limits](/als/v1/user/deploy/orgs-spaces/#orgs-spaces)
-   [Architectural Design](/als/v1/admin/reference/architecture/)
-   [Glossary](reference/glossary)
-   [Troubleshooting](reference/troubleshoot)
-   [Adding System Services](/als/v1/admin/reference/add-service/)

