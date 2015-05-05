---
layout: default-devplatform
permalink: /helion/devplatform/als/admin/
product: devplatform2.0
title: "HP Helion 1.2 Development Platform: Application Lifecycle Service Admin Guide "
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer
role2: ISV Developer 
role3: Service Developer
role4: Network Administrator
role5: Systems Administrator 
role6: Security Engineer
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Application Lifecycle Service Admin Guide {#helion-admin-guide}


Application Lifecycle Service is HP's cloud application framework for creating a
multi-language, secure and private Platform-as-a-Service (PaaS). This
guide covers how to set it up and how to configure it for your end
users.

##Wizard-Based Cluster Creation {#wizard-based-cluster-creation}
You can easily create and access Application Lifecycle Service clusters from the [Project Dashboard](/helion/devplatform/deploy/)       


##Helion Development Platform Management Console {#management-console}

-   [Management Console](/helion/devplatform/als/user/console/#management-console)
-   [Sample Applications](console/app-store)

##Advanced/Manual Server Configuration {#server-configuration}
This section covers advanced configuration settings that allow you to modify default cluster component behavior. 

-   [Server Configuration](/helion/devplatform/als/admin/server/)
    -   [Accessing Server via the Command
        Line](/helion/devplatform/als/admin/server/#accessing-server-via-the-command-line)
    -   [Common Operations](/helion/devplatform/als/admin/server/#common-operations)
    -   [Detailed
        Configuration](/helion/devplatform/als/admin/server/#detailed-configuration)
-   [Router](/helion/devplatform/als/admin/server/router/)
    -   [Settings](/helion/devplatform/als/admin/server/router/#settings)
    -   [WebSockets](/helion/devplatform/als/admin/server/router/#websockets)
    -   [SPDY](/helion/devplatform/als/admin/server/router/#router-spdy)
-   [Docker & Fence](/helion/devplatform/als/admin/server/docker/)
    -   [Modifying or Updating the Container
        Image](/helion/devplatform/als/admin/server/docker/#modifying-or-updating-the-container-image)
    -   [Admin Hooks](/helion/devplatform/als/admin/server/docker/#admin-hooks)
    -   [Creating a Docker
        Registry](/helion/devplatform/als/admin/server/docker/#creating-a-docker-registry)
-   [Log Streams](/helion/devplatform/als/admin/server/logging/)
    -   [Logyard](/helion/devplatform/als/admin/server/logging/#logyard)
    -   [Drains](/helion/devplatform/als/admin/server/logging/#drains)
    -   [Configuration](/helion/devplatform/als/admin/server/logging/#configuration)
    -   [Debugging Logyard](/helion/devplatform/als/admin/server/logging/#debugging-logyard)
-   [AOK Authentication Server](/helion/devplatform/als/admin/server/aok/)
    -   [End User Login](/helion/devplatform/als/admin/server/aok/#end-user-login)
    -   [Strategies](/helion/devplatform/als/admin/server/aok/#strategies)
    -   [Configuration](/helion/devplatform/als/admin/server/aok/#configuration)
    -   [User Management](/helion/devplatform/als/admin/server/aok/#user-management)
    -   [First Admin User Setup](/helion/devplatform/als/admin/server/aok/#first-admin-user-setup)
    -   [Regular LDAP User
        Setup](/helion/devplatform/als/admin/server/aok/#regular-ldap-user-setup)
-   [Upgrading Application Lifecycle Service](/helion/devplatform/als/admin/server/upgrade/)
    -   [Before an upgrade](/helion/devplatform/als/admin/server/upgrade/#before-an-upgrade)
    -   [Executing the
        upgrade](/helion/devplatform/als/admin/server/upgrade/#executing-the-upgrade)

##Advanced/Manual Cluster Configuration {#cluster-configuration}

This section provides information on how to set up a standalone cluster and modify default cluster level settings.

-   [Cluster Setup](/helion/devplatform/als/admin/cluster/)
    -   [Roles](/helion/devplatform/als/admin/cluster/#roles)
    -   [Preparing the Core
        Node](/helion/devplatform/als/admin/cluster/#preparing-the-core-node)
    -   [Attaching Nodes and Enabling
        Roles](/helion/devplatform/als/admin/cluster/#attaching-nodes-and-enabling-roles)
    -   [Example Clusters](/helion/devplatform/als/admin/cluster/#example-clusters)
    -   [Roles Requiring Persistent or Shared
        Storage](/helion/devplatform/als/admin/cluster/#roles-requiring-persistent-or-shared-storage)
    -   [Port Configuration](/helion/devplatform/als/admin/cluster/#port-configuration)
    -   [Multiple Controllers](/helion/devplatform/als/admin/cluster/#multiple-controllers)
    -   [Load Balancer and Multiple
        Routers](/helion/devplatform/als/admin/cluster/#load-balancer-and-multiple-routers)
-   [cloud-init](/helion/devplatform/als/admin/cluster/cloud-init/)
    -   [Securing the new
        node](/helion/devplatform/als/admin/cluster/cloud-init/#securing-the-new-node)
    -   [Custom System
        Configuration](/helion/devplatform/als/admin/cluster/cloud-init/#custom-system-configuration)
-   [External Data Services](/helion/devplatform/als/admin/cluster/external-db/)
    -   [General
        Principles](/helion/devplatform/als/admin/cluster/external-db/#general-principles)
    -   [MySQL](/helion/devplatform/als/admin/cluster/external-db/#mysql)
    -   [PostgreSQL](/helion/devplatform/als/admin/cluster/external-db/#postgresql)
    -   [Troubleshooting](/helion/devplatform/als/admin/cluster/external-db/#troubleshooting)
-   [Harbor: TCP/UDP Port Service](/helion/devplatform/als/admin/cluster/harbor/)
    -   [Architecture](/helion/devplatform/als/admin/cluster/harbor/#architecture)
    -   [Requirements & Setup](/helion/devplatform/als/admin/cluster/harbor/#requirements-setup)
    -   [Troubleshooting](/helion/devplatform/als/admin/cluster/harbor/#troubleshooting)

##Best Practices {#best-practices}

-   [Best Practices](/helion/devplatform/als/admin/best-practices/)
    -   [Applying Updates](/helion/devplatform/als/admin/best-practices/#applying-updates)
    -   [Backup & Migration](/helion/devplatform/als/admin/best-practices/#backup-migration)
    -   [Upgrading (v1.0 and
        later)](/helion/devplatform/als/admin/best-practices/#upgrade)
	- [Persistent
        Storage](/helion/devplatform/als/admin/best-practices/#storage)
- [Hello World Custom Drain Sample](/helion/devplatform/als/admin/best-practices/logging-examples/#hello-world-custom-drain)

##Reference {#reference}
-   [Kato Command Reference](/helion/devplatform/als/admin/reference/kato-ref/)
-   [Client Command Reference](/helion/devplatform/als/user/reference/client-ref/)
-   [Managing Groups, Users & Limits](/helion/devplatform/als/user/deploy/orgs-spaces/#orgs-spaces)
-   [Architectural Design](/helion/devplatform/als/admin/reference/architecture/)
-   [Glossary](/helion/devplatform/als/user/reference/glossary/)
-   [Troubleshooting](/helion/devplatform/als/admin/reference/troubleshoot/)
-   [Adding System Services](/helion/devplatform/als/admin/reference/add-service/)

