---
layout: default-devplatform
permalink: /helion/devplatform/1.2/als/admin/console/
product: devplatform2.0
title: "HP Helion 1.2 Development Platform: Management Console (Admin View) "
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
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Management Console (Admin View) {#management-console-admin-view}
[See the Helion 1.0 Development Platform version of this page](/als/v1/admin/console/)
The Application Lifecycle Service Management Console is a web interface that allows the
administration and management of the Application Lifecycle Service Server. Many of the features described below are only available to Administrator users from the Admin view.


- [Management Console Setup and Access](#setup)
- [Welcome Page](#welcome)
- [Applications](#applications)
- [Organizations](#organizations)
- [Support](#support)
- [Admin](#admin)
	- [Cluster Management](#clustermanagement)
		- [Summary](#clustersummary)
		- [Cluster Nodes](#cluster-nodes)
	- [Available Patches](#patches)
	- [Applications & Organizations](#app-org)
	- [Domains](#domains)
	- [Routes](#routes)
	- [Services](#services)
		- [Managed Services Instances](#managed-services)
		- [User-provided Service Instances](#user-services)
		- [Available Services](#avail-services)
	- [Users](#users)
	- [Dashboards](#dashboards)
		- [Memory Summary](#memory-summary)
		- [DEA Usage](#dea-usage)
		- [Placement Zone Usage](#zone-usage)
		- [Availability Zone Usage](#avail-zone-usage)
		- [Router Stats](#router-stats)
		- [Primary Node Status Graphs](#primary-node-status-graphs)
		- [Cloud Events](#cloud-events)
- [Settings](#settings)
	- [Cloud Controller](#cloud-controller)
	- [Applications](#console-settings-applications)
	- [Console](#console)
	- [DEA](#dea)
		- [DEA Settings](#console-settings-dea)
		- [DEA Placement Zones](#dea-zones-placement)
		- [Availability Zones](#dea-zones-available)
		- [Feature Flags](#feature-flags)
	- [Logyard](#logyard)
	- [Quota Plans](#console-settings-quota-definitions)
	- [File System](#file-system)
	- [Harbor](#harbor)
	- [Data Services](#data-services)

## Management Console Setup and Access {#setup}
Your hypervisor provides [tty console](/helion/devplatform/1.2/als/user/reference/glossary/#term-tty-console) access to each of its virtual machines. After startup, an Application Lifecycle Service VM displays:

    Application Lifecycle Service Management Console at
    https://helion-xxxx.local

On a [micro cloud](/helion/devplatform/1.2/als/user/reference/glossary/#term-micro-cloud) VM where the local network supports [multicast DNS](/helion/devplatform/1.2/als/user/reference/glossary/#term-multicast-dns), the hostname will be `helion-xxxx.local`. If you have configured the
[hostname](/helion/devplatform/1.2/als/admin/server/configuration/#server-config-hostname) and
[DNS](/helion/devplatform/1.2/als/admin/server/configuration/#server-config-dns) of the Application Lifecycle Service server manually, or are connecting to a server administered by someone
else, supply the assigned hostname instead (ex: *api.helion-test.example.com*).

Enter the URL into your web browser and the Management Console will load. The Console is supported on the following browsers:

-   Chrome 30+ (WebKit)
-   Firefox 20+
-   IE 10+

Using a browser which fully support WebSockets is recommended.

**Note**:  The SSL certificate for the Application Lifecycle Service Management Console is self-signed. You will need to manually accept this certificate in your browser. See the [HTTPS section](/helion/devplatform/1.2/als/admin/server/configuration/#server-config-https)
for information on using your own certificate.

When you first access the Management Console, you will be prompted to create a primary administrative user for ALS. Enter an email address as the username, set a secure password, and then review and accept the license agreement.

**Note: The password you choose here becomes the login password for the *helion* user on the VM for SSH access.** This is critical since all login is done as the *helion* user, not as *root*.

Once you've logged in, you can begin to add other users and admins, enable and disable services, and generally set up the system to your requirements.

Basic Application Lifecycle Service administration can be done through the Management
Console, but some maintenance and configuration tasks may need to be done at the command line using the *kato* command. See the [Kato Command Reference](/helion/devplatform/1.2/als/admin/reference/kato-ref/#kato-command-ref) for a full list of options.

The Application Lifecycle Service Management Console will periodically send non-identifying pingbacks (Application Lifecycle Service version number and UUID) to HP servers to help improve the web console experience. You can disable this option by setting 

	theme_settings['pingback_allowed'] = false;

in the *settings.js* file as described in the [Customization](/helion/devplatform/1.2/als/admin/console/customize/#customize) documentation.

## Welcome Page {#welcome}

The top-level page of the Management Console displays quick links to the most used resources and views. The blue buttons are for features also available to regular end users. See [Management Console (User View)](/helion/devplatform/1.2/als/user/console/#user-console-welcome).

Available patches for the system, new releases, and the latest news are also displayed on this page.

Green buttons expose Admin-only functionality:

- Configure Available Services: Opens the [Cluster Nodes](#console-cluster-nodes) view showing which roles are running on which nodes. From this view you can add or remove Service roles on the various nodes in the cluster (or on 127.0.0.1 for micro clouds).
- Manage Organizations: Opens the [Organizations](#console-organizations) view.
- Manage Users: Opens the [Users](#console-users) view.
- View All Deployed Applications: Opens the [Console Applications](#applications) view.
- View Cloud Events: Opens the [Cloud Events](#cloud-events) view.
- View Dashboard: Opens the [Dashboard](#dashboard).

## Applications {#applications}

The Applications section displays a list of all apps on the server. Click anywhere on the line for an app to view its details. Admins have the same permissions in the [Application View](/helion/devplatform/1.2/als/user/console/#user-console-app) as a Developer of the space it was deployed to.

## Organizations {#organizations}
The top level Organizations page allows Admins to add and delete [Organizations](/helion/devplatform/1.2/als/user/deploy/orgs-spaces/#orgs-spaces). Clicking on an organization name opens its details. This view is the same as a regular user's [Organizations view](/helion/devplatform/1.2/als/user/console/#user-console-organizations), but admin users can also edit quotas and add/remove domains, spaces, and users.

## Support {#support}

The Support menu includes the same options as the regular user's menu.

## Admin {#admin}

Several views that are only available to administrators are in the Admin menu.

### Cluster Management {#clustermanagement}
Commands for managing a cluster as a whole.

#### Summary {#clustersummary}

Displays a list of roles and their status in the system. Additionally, the following system information is displayed:

- **Number of nodes**: The number of nodes in the cluster.
- **Version**: Version (release) number of the system.
- **MBUS IP**: The IP address that hosts the primary node. Cluster nodes (if any) will connect via this IP address. In a micro cloud setting, it will be 127.0.0.1.
- **API Endpoint**: The URL for ALS clients to target. Normally also the URL for the Management Console.

#### Cluster Nodes {#cluster-nodes}

Displays a list of nodes in the current cluster, and what services are running on each node. In a micro cloud configuration, only the current local node (127.0.0.1) is shown.

To enable or disable services on a node, click the Configure Roles button (cog icon) to see the Node Settings, showing a list of all available roles and checkboxes to enable or disable each one. Click Save to apply changes.

See also the [kato role](/helion/devplatform/1.2/als/admin/reference/kato-ref/#kato-command-ref-role-add) and [kato info](/helion/devplatform/1.2/als/admin/reference/kato-ref/#kato-command-ref-info) command documentation for the CLI equivalents, and the [Cluster Setup](/helion/devplatform/1.2/als/admin/cluster/#cluster-setup) documentation for information on adding nodes to the cluster.

### Available Patches {#patches}

Displays a list of available patches for the current cluster.

### Applications & Organizations {#app-org}

Links to the [Applications](/helion/devplatform/1.2/als/user/console/#application-view) and [Organizations](/helion/devplatform/1.2/als/user/deploy/orgs-spaces/#orgs-spaces) lists.

### Domains {#domains}

A filterable list of all domains configured on the system, showing whether they are [Shared or Owned domains](/helion/devplatform/1.2/als/user/deploy/orgs-spaces/#orgs-spaces-domains).

### Routes {#routes}

A filterable list of routes in the system.

### Services {#services}

#### Managed Services Instances {#managed-services}

A filterable list of managed service instances on the system.

#### User-provided Service Instances {#user-services}

A filterable list of user provided service instances on the system.

#### Available Services {#avail-services}

A list of available service types (with their version).

### Users {#users}

The Users section displays a list of users and admins.

- Click **+ Add User** to add users.
- Click on the user name or email address to view account details or change the password.

## Dashboards {#dashboards}
A list of available dashboards and their functionality.

### Memory Summary {#memory-summary}

Helion tracks the amount of memory used by applications across all DEA nodes and shows various reports. Available memory is calculated based on the system memory of the DEA nodes multiplied by the [Max Memory Percentage](#console-settings-dea). 

Memory Summary shows how much memory:

- has been assigned to Organizations via [Quota Plans](#console-settings-quota-definitions)
- is available on DEA nodes
- remains unallocated
- has been allocated
- is currently in use

### DEA Usage {#dea-usage}

Memory usage statistics and a usage bar graph for each DEA node in the pool.

### Placement Zone Usage {#zone-usage}

Memory usage statistics and a usage bar graph for all configured [Placement Zones](#dea-zones-placement).

### Availability Zone Usage {#avail-zone-usage}

Memory usage statistics and a usage bar graph for all configured [Availability Zones](#dea-zones-availability)

### Router Stats {#router-stats}

Shows realtime results for incoming requests (connections per second), routing errors (errors per second), and an overview of the cumulative requests to the system.

### Primary Node Status Graphs {#primary-node-status-graphs}
 
Displays graphs for server statistics: CPU, Load, Memory, Disk Operations, Disk Space, Processes, and Swap (primary node or micro cloud only).

### Cloud Events {#cloud-events}

The Cloud Events section displays a list of events (including errors and warnings) on the ALS server. The events can be filtered by Severity, Node ID, or Type, or by using a substring match in the Search field.

## Settings {#settings}

The Settings menu provides access to the following Console and system settings:

### Cloud Controller {#cloud-controller}
-   **Maintenance Mode**: Shuts down API requests but continues to serve web requests, useful when performing system operations such as importing and exporting data for upgrades. When the primary node enters maintenance mode, the Management Console becomes "read only" with the exception of this toggle (so that it can be brought back online).
- **Logging Level**: Changes the verbosity of logs from 'debug2' (most verbose) through 'off' (silent).
- **Support Email**: The email address displayed to end users when errors are encountered. Use an address which is monitored by administrators.
- **Sample App URLs**: URIs for URIs for JSON files which populate the [Sample Applications](app-store.html#app-store) The URIs need not be public, but must be accessible from the controller node.
- **Allowed Repos**: Debian package repositories allowed in application containers. End users can install additional packages (e.g. with  apt-get  or  aptitude) only from these repositories. When adding new repositories, GPG keys for each new repo must also be added to the Docker base container See [Allowed Repositories](/helion/devplatform/1.2/als/admin/server/configuration/#allowed-repositories).

### Applications {#console-settings-applications}

- Reserved URIs: Virtual hostnames and URIs reserved for use by the system which cannot be used for end user applications. This prevents users from deploying applications on URIs which the system requires (ex: 'api'), or for cases where a particular DNS sub-domain record is not being resolved to the system.

### Console {#console}

Various settings and templates to customize the look and feel of the Management Console. The settings are divided into the following categories:

- Product: Options to rename and reversion ALS for OEM deployments, change the default locale (currently only 'en' and 'de' available), choose a different URL for documentation, or disable console pingbacks.
- Client: A version number setting and alternative paths/URLs for alternative or renamed CLI clients.
- Look and Feel: Change the favicon, header, footer, or background color.
- Welcome Page: EJS templated HTML to display on the Welcome page (see above).
- Support Page: EJS templated HTML to display on the Support page. Change this if you are supporting your end users directly.
- Eula Content: End User License Agreement. Change this only if you are an OEM customer exposing Helion to end users under your own specific licensing terms.
- Custom Stylesheet: A single CSS file used to override any existing styling in the Management Console. Inspect the Console with browser tools such as Firebug or Chrome Developer Tools to see the class names and IDs.

Detailed instructions for customizing the Console can be found in the [Customization](/helion/devplatform/1.2/als/admin/console/customize/#customize) documentation.

## DEA {#dea}

### DEA Settings {#console-settings-dea}

- **Max Memory Percentage**: The percentage of physical memory each DEA node can use for hosted applications. The 80% default setting leaves enough memory for the OS and DEA processes on a node with 4GB of RAM. This can be increased on nodes with more memory available (e.g. to 90% on a node with 8GB of RAM). Do not exceed 100% unless the system correctly supports swap space and has it enabled. Restart all DEA roles/nodes to apply the change.
- **Max Staging Duration**: The maximum time allowed for application staging.

### DEA Placement Zones {#dea-zones-placement}

A filterable list of DEA Placement Zones on the system.

### DEA Availability Zones {#dea-zones-available}

A filterable list of Availability Zones on the system.

### Feature Flags {#feature-flags}

- **Enable User Organization Creation**: When enabled, any user can create an organization via the API. When disabled, only admin users can create organizations via the API. Default: **Disabled**.
- **Enable Private Domain Creation**: When enabled, an organization manager can create private domains for that organization. When disabled, only admin users can create private domains. Default: **Enabled**

## Logyard {#logyard}
Lists current log [Drains](/helion/devplatform/1.2/als/admin/server/logging/#logging-drains-system) and the log
drain retry limits. Drains and limits cannot be changed in this interface; use the [*kato log drain*](/helion/devplatform/1.2/als/admin/reference/kato-ref/#kato-command-ref-log-drain-add)
commands and [*kato config*](/helion/devplatform/1.2/als/admin/reference/kato-ref/#kato-command-ref-config) commands.

## Quota Plans {#console-settings-quota-definitions}

Lists the Quota Plans available to apply to Organizations on the system. To edit a definition, click the edit button on the right. To create a new definition, use the [*quota create*](/helion/devplatform/1.2/als/user/reference/client-ref/#command-quota-create) command. 

The following fields can be modified:

- **Name**: The definition name. Do not change this without also changing the settings of any Organization using the definition.
- **Memory Usage Limit**: The total amount of application RAM (in MB) that can be allocated to user applications.
- **Total Services**: The total number of service instances that can be allocated.
- **Total Routes**: The total number of routes that can be created.
- **Droplets per App**: The number of droplets stored (per application) for versioning and rollback.
- **Allow Sudo**: Allow users in the Organization sudo privileges within their application containers.

## File System {#file-system}

- **Capacity**: Maximum number of service slots to allocate.
- **Max FS Size**: Maximum size on disk for filesystem services in MB.
- **Allow Over-provisioning**: Ignore the Capacity setting.

## Harbor {#harbor}

Settings for the [Harbor](/helion/devplatform/1.2/als/admin/cluster/harbor/#harbor) TCP/UDP port service. See [Harbor: Requirements & Setup](/helion/devplatform/1.2/als/admin/cluster/harbor/#harbor-setup) for more information.

- **External Host**: The public IP (if configured) for the Harbor node.
- **External Hostname**: The public hostname for the Harbor node.
- **Port Range Minimum**: Sets the minimum for the exposed port range (default: 35000).
- **Port Range Maximum**: Sets the maximum for the exposed port range (default: 40000).

## Data Services {#data-services}

- **Allow Over-provisioning**: Ignore the Capacity setting.
- **Capacity**: Maximum number of service slots to allocate.
- **Max DB size**: Maximum size on disk for database services.
- **Max Memory**: Maximum amount of physical memory to allocate the service.
- **Memcached Memory**: Maximum amount of physical memory to allocate for memcached instances.
- **Max FS Size**: Maximum size on disk for filesystem services.
