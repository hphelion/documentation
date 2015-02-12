---
layout: default-devplatform
permalink: /als/v1/user/console/
product: devplatform
title: "Management Console: User View"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
writer: Jayme P

---
<!--UNDER REVISION-->

# HP Helion Development Platform: Management Console: User View {#index-1}

The Management Console is a web interface for Application Lifecycle Service (ALS). Using the same API as the Helion CLI client, it provides access to a subset of features for deploying, scaling, and configuring applications as well as monitoring quota usage, and viewing logs.

The interface differs for Admin and non-Admin users. The features described below are available and visible to end users. For information on the Management Console view for Admins, see the [Console Admin Guide](/als/v1/admin/console/). 

- [Welcome Page](#welcome)
- [Applications List](#app-list)
	- [Application View](#application-view)
- [Organizations List](#organization-list)
	- [Organization View](#organization-view)
	- [Spaces View](#space-view)
	- [Service Instance View](#service-instance-view)
- [Sample Applications](#sample-apps)
- [Support](#support)

## Welcome Page {#welcome}
The top-level page of the Management Console displays quick links to the most commonly used resources:

-   **Read the Documentation**: By default, this links to the ALS documentation at [docs.hpcloud.com](/als/v1/)
-   **Contact Support**: Link to the [Support](#user-console-support) page.
-   **Download the Client**: Link to the locally hosted [CLI client](/als/v1/user/client/#client) download.
-   **Deploy Sample Applications**: Link to the [Sample Applications](#user-console-app-store).
-   **Organizations Membership**: Link to the end user view of the [Organizations](#user-console-welcome) page.
-   **Account Details**: Shows the account details of the current user. Also accessible from the drop down list at the top left.

## Applications List {#app-list}
The Applications list is accessible from the top menu. It shows all applications deployed under the current user's Organizations.

The list shows:
- the application name
- the Organization it belongs to
- the Space it was deployed to
- the Description field
- its current state (STARTED or STOPPED)
- its staging state (STAGED or FAILED)
- Application Access (i.e. if :ref:`Application SSO <application-sso>` is enabled)

The list can be sorted by name or state, and filtered by:

- State
- Staging State
- Application Access
- Restart Required

The list includes applications deployed to all Spaces in the current user's Organizations, even those for which the user may not have access. Applications in such Spaces are visible, but no changes can be made to them.

Clicking on the application name opens its Application View.

### Application View {#application-view}
The top navigation of the Application view gives the name and status of the application followed by its organization / space. 

This view also includes the following **Tabs**:

-  **Summary**: General information about the app including its description (optional), which buildpack it uses, when it was created, and when it was last modified. The application state will appear in parentheses beside the application name, and will be one of the following:
	- **Staging**: currently staging the application droplet.
	- **Staging Failed. Check Logs**: staging of application droplet has failed
	- **Online**: successfully staged as a droplet and application instances are running
	- **Flapping**: successfully staged as a droplet and application instances are running, but 1 or more instances are flapping (see below)
	- **Down**: successfully staged as a droplet and application instances have been created, but all instances are down. This state will typically not be seen as any one instance will only be down for a short period of time before starting or being removed.
	- **Offline**: successfully staged the application droplet, but no application instances have been created and started.
- **Timeline**: A real-time stream of events and discussions relevant to the Application. Events in the application's history appear here as notifications which can be commented on by members of the Space.
-  **App Versions**: A rolling list of code and setting changes to an application. Clicking Rollback to this version for any listed version reverts the application to the selected version's state and creates a new version. See :ref:`App Versions <app-versions>` for details.
-   **Environment Variables**: Environment variables that have been explicitly set in the application container (via application config, client commands, or this interface). Default variables, those set by the application framework, or those added by the system for data services are excluded from this view.
-   **Settings**: The number of application instances, disk space, and memory allotment used by the application. This usage counts against the organization's quota.
-   -  **Instances**: List of application instances showing the status and host DEA IP address of each.

## Organizations List {#organization-list}

The Organizations list is accessible from the top menu. It shows all :ref:`Organizations <orgs-spaces-organizations>` which the current user is a member of. The list is searchable by name.

Clicking on any Organization name opens the Organization view.

### Organization View {#organization-view}
The Organizations page shows a list of all [Organizations](/als/v1/user/deploy/orgs-spaces/#orgs-spaces) that the current user is a member of. Depending on how ALS has been set up, it is possible be a member of only a single Organization.

Clicking on the Organization's name opens a view of that organization, including the following tabs:

-   **Spaces**: A list of Spaces that belong to the Organization, showing the current number of applications and services deployed to that space. Clicking on a Space in the list opens a [view of that Space](#user-console-space).
-   **Users**: A list of Users who are members of the Organization, showing the Email address and Organization [Roles](/als/v1/user/deploy/orgs-spaces/#orgs-spaces-roles) of each.
    -   **Users**: can view organization quotas, domains, spaces and users.
    -   **Manager**: can add domains and spaces to the organization, but not users.
-   **Space Quota Plans**: A filterable list of space quota plans.
-   **Quota Usage**:
    -   **Memory**: The amount of RAM (in GB) available to the Organization, and how much of it is currently used by applications.
    -   **Services**: The number of deployed / allotted services.
-   **Domains**: Domains belonging to the Organization that can be used by applications deployed to [Spaces](/als/v1/user/deploy/orgs-spaces/#orgs-spaces) in the Organization. Typically, these will be a subdomain of the Application Lifecycle Service system itself. For example, an Organization called *acme* on a PaaS with the address *api.example.org* might have the domain *\*.acme.example.org*.

**Note**: There is currently no interface in the Management Console for Managers, Auditors, or Billing Managers to view or adjust billing/payment info and spending limits.

### Space View {#space-view}

-   **Apps**: A filterable list of applications in the Space. Clicking an app name opens an [administrative view of that application](#user-console-app).
-   **Timeline**: A real-time stream of events and discussions relevant to the Space. The creation, update, and deletion of apps and services appear here as notifications which can be commented on by members of the Space. Discussions can be started by any member, tagged, and assigned to an application (which makes the item visible in the Application view).
-   **Quota Usage**:
    -   **Memory**: The amount of RAM (in GB) available to the Organization, and how much of it is currently used by applications.
    -   **Services**: The number of deployed / allotted services.
    -   **Routes**: The number of created / allotted routes.
-   **Services**: A list of services bound to applications in the Space. Clicking a service name in either section opens an [administrative view of that service](#user-console-service).
	-   **Managed**: A list of managed services bound to applications in the Space.
	-   **User Provided**: A list of user provided services bound to applications in the Space. New user provided services can be created by clicking the **Create User Provided Service** button.
-   **Managers**: Managers can invite/manage users, enable features for a given space.
-   **Developers**: Developers can create, delete, manage applications and services, full access to all usage reports and logs.
-   **Auditors**: Auditors have view-only access to all space information, settings, reports, and logs.

### Service Instance View {#service-instance-view}
Clicking a service instance's name anywhere in the interface brings up a view of that service instance showing the summary.

The summary of a service displays:

- a description of the service instance type
- when it was created
- when it was last modified
- which host it is running on
- which port it is exposed on
- the service instance name (not the canonical database name)
- its current state

For more information on a service instance, such as its credentials, use the [*helion service*](/als/v1/user/reference/client-ref/#command-service) command.

**Credentials**

Lists the credentials for the service instance.
If a the service is a User Provided Service, new credentials can be added and existing credentials may be edited.

**App Bindings**

A list of applications that have bindings to this service instance. Clicking an app name opens an [administrative view of that application] <user-console-app>`.

##Sample Applications {#sample-apps}

The Sample Apps are collection of ready-to-run applications which can be deployed to Application Lifecycle Service by fetching the source code from the repository.

Click the **Deploy App** button to start it on Application Lifecycle Service. You will be
prompted to choose a Space and Domain for the app if there are multiple
options available.

##Support {#support}

A list of resources for getting support on using the Management Console.