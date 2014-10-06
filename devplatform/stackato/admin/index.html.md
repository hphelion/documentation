---
layout: default-devplatform
permalink: /als/v1/admin/
---
<!--PUBLISHED-->

Application Lifecycle Service Admin Guide[](#helion-admin-guide "Permalink to this headline")
===========================================================================

Application Lifecycle Service is HP's cloud application framework for creating a
multi-language, secure and private Platform-as-a-Service (PaaS). This
guide covers how to set it up and how to configure it for your end
users.

Management Console[](#management-console "Permalink to this headline")
-----------------------------------------------------------------------

-   [Management Console](/als/v1/admin/console/customize/)
-   [Sample Applications](console/app-store)
-   [Customization](/als/v1/admin/console/customize/)

Server Configuration[](#server-configuration "Permalink to this headline")
---------------------------------------------------------------------------

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

Cluster Configuration[](#cluster-configuration "Permalink to this headline")
-----------------------------------------------------------------------------

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
    -   [Amazon RDS for
        MySQL](/als/v1/admin/cluster/external-db/#amazon-rds-for-mysql)
    -   [PostgreSQL](/als/v1/admin/cluster/external-db/#postgresql)
    -   [Troubleshooting](/als/v1/admin/cluster/external-db/#troubleshooting)
-   [Harbor: TCP/UDP Port Service](/als/v1/admin/cluster/harbor/)
    -   [Architecture](/als/v1/admin/cluster/harbor/#architecture)
    -   [Requirements & Setup](/als/v1/admin/cluster/harbor/#requirements-setup)
    -   [Troubleshooting](/als/v1/admin/cluster/harbor/#troubleshooting)

Best Practices[](#best-practices "Permalink to this headline")
---------------------------------------------------------------

-   [Best Practices](/als/v1/admin/best-practices/)
    -   [Applying Updates](/als/v1/admin/best-practices/#applying-updates)
    -   [Backup & Migration](/als/v1/admin/best-practices/#backup-migration)
    -   [Upgrading (v1.0 and
        later)](/als/v1/admin/best-practices/#upgrading-v1-0-and-later)
<!--    -   [Server Monitoring with New
        Relic](/als/v1/admin/best-practices/#server-monitoring-with-new-relic)
    -   [System Monitoring with
        Nagios](/als/v1/admin/best-practices/#system-monitoring-with-nagios)
    -->-   [Persistent
        Storage](/als/v1/admin/best-practices/#persistent-storage)
- [Hello World Custom
        Drain Sample](/als/v1/admin/best-practices/logging-examples/#hello-world-custom-drain)
<!---   [Log Drain Examples](/als/v1/admin/best-practices/logging-examples/)
    -   [Papertrail](/als/v1/admin/best-practices/logging-examples/#papertrail)
    -   [Loggly](/als/v1/admin/best-practices/logging-examples/#loggly)
    -   [Splunk](/als/v1/admin/best-practices/logging-examples/#splunk)
   -->

Reference[](#reference "Permalink to this headline")
-----------------------------------------------------

-   [Kato Command Reference](/als/v1/admin/reference/kato-ref/)
-   [Managing Groups, Users & Limits](/als/v1/admin/reference/groups/)
-   [Architectural Design](/als/v1/admin/reference/architecture/)
-   [Glossary](reference/glossary)
-   [Troubleshooting](reference/troubleshoot)
-   [Adding System Services](/als/v1/admin/reference/add-service/)

