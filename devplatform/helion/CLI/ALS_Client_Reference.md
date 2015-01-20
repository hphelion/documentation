---
layout: default-devplatform
permalink: /als/v1/client/reference
product: devplatform
title: "HP Application Lifecyle Service (ALS) Client"

---

<!--UNDER REVISION-->
# HP Application Lifecycle Service (ALS) Client Configuration Reference

The ALS command-line interface (CLI) provides an option for executing commands that construct, manage, update, or delete ALS clusters. Use the CLI when the Horizon management console is unavailable or when direct access is preferred. 

- [Global Options](#global)
- [Cluster Commands](#commands)
	- [Create a Cluster](#create)
	- [Delete a Cluster](#delete)
	- [Add DEA Nodes to Existing Clusters](#addnode)

##Configuration Files
There are three ways to pass configuration values into ALS:

- Direct entry into the CLI
- Defined in an environment variable
- Recorded in a configuration file
 
ALS maintains separate configuration files. One configuration file contains the values for the global variables. The other configuration files, specified by the **--load** option, includes the values that should be passed to arguments for that specific command. Values must be included in the appropriate file for their applicable scope.

The global configuration file is located in the home directory and is named *alsconfig.yml*. </br>Global level **commands** create, delete, and add clusters. </br>
 Global level **configurations** manage tenants, users, versions, and other system information. 

##Global Options {#global}
These variables affect the entire cluster; they are **global** in scope.
<pre>als <b>[global options]</b> command [command options] [arguments...] </pre>

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<th width="150">Option</th><th>Description</th><th>Environment Variable</th>
<tr><td>--config 'path\path\path' <td>Enter a new file path to change the current location of the configuration file.</td><td>n/a</td></tr>
<tr><td>--debug<td>Enables additional debug information.</td><td>$ALS_DEBUG</td></tr>
<tr><td>--os-username</td><td>OpenStack user name</td><td>$OS_USERNAME</td></tr>
<tr><td>--os-password</td><td>OpenStack password</td><td>$OS_PASSWORD</td></tr>
<tr><td>--os-auth-url</td><td>OpenStack authentication URL</td><td>$OS_AUTH_URL</td></tr>
<tr><td>--os-tenant-id</td><td>OpenStack tenant ID</td><td>$OS_TENANT_ID</td></tr>
<tr><td>--os-tenant-name</td><td>OpenStack tenant name</td><td>$OS_TENANT_NAME</td></tr>
<tr><td>--os-region-name</td><td>OpenStack region</td><td>$OS_REGION_NAME</td></tr>
<tr><td>--help, -h</td><td>Displays help.</td><td>n/a</td></tr>
<tr><td>--version, -v</td><td>Displays the version of the client.</td><td>n/a</td></tr>
</table>

##Cluster Commands {#commands}
These commands are available from the command line interface.

###Use Syntax
<pre>als [global options] <b>command</b> [command options] [arguments...] </pre>

###Command Options
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;"><th>Command</th><th>Description</th></tr>
<tr><td>cluster-create,	cc<td>Creates a cluster</td></tr>
<tr><td>cluster-delete, cd<td>Deletes a cluster</td></tr>
<tr><td>dea-add, da<td>Adds DEA nodes to an existing cluster</td></tr>
<tr><td>help, h</td><td>Displays a list of available commands or help for a command.</td></tr>
</table>

##Create a Cluster {#create}
Options that can be passed to the command that creates a cluster 
(*cluster-create*).

<pre>als [global options] <b>cluster-create</b> [command options] [arguments...] </pre>

For help with this command within the application, enter

<pre>als help cluster-create</pre>

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;"><th>Command (with example input)</th><th>Description</th>
</tr>
<tr>
<td>--load </td><td>Load flag values from the specified file</td>
</tr><tr>
<td>--save</td><td>Save flag values to the specified file</td>
</tr><tr>
<td>--admin-email</td><td>Email address for the ALS admin</td>
</tr>
<tr>
<td>--admin-password</td><td>Password for the ALS admin user</td>
</tr>
<tr>
<td>--admin-org 'org1'</td><td>Organization the ALS admin user is part of</td>
</tr><tr>
<td>--cluster-title 'stack1'</td><td>Title of the ALS cluster</td>
</tr><tr>
<td>--cluster-prefix 'als'</td><td>Prefix of the ALS cluster</td>
</tr><tr>
<td>--dea-count '1'</td><td>Number of DEAs nodes in the cluster</td>
</tr><tr>
<td>--services 'mysql,rabbitmq' </td><td>The list of services to be enabled for the cluster</td>
</tr><tr>
<td>--services-on-core 'false'</td><td>Should services be enabled on core nodes? True/False</td>
</tr>
<tr>
<td>--az 'az1'</td><td>Availability zone for the cluster</td>
</tr>
<tr>
<td>--core-size 'standard.medium' </td><td>Flavor of core nodes in the cluster</td>
</tr><tr>
<td>--dea-size 'standard.medium'</td><td>Flavor for DEA nodes</td>
</tr><tr>
<td>--service-size 'standard.medium'</td><td>Flavor for service nodes in the cluster</td>
</tr><tr>
<td>--keypair-name</td><td>The name of the key pair on instances</td>
</tr>
<tr>
<td>--seed-node-image-id</td><td>The seed node image id</td>
</tr>
<tr>
<td>--seed-node-image-name</td><td>The seed node image name</td>
</tr>
<tr>
<td>--seed-node-image-password 'password'</td><td>The seed node image password</td>
</tr>
<tr>
<td>--database-instance-id</td><td>Database instance id</td>
</tr>
<tr>
<td>--database-flavor-id</td><td>Database flavor id</td>
</tr>
<tr>
<td>--database-volume-size </td><td>Database volume size</td>
</tr>
<tr>
<td>--max-cluster-wait-duration '15'</td><td>Number of minutes to wait for the cluster creation to occur, defaults to 15</td>
</tr>
<tr>
<td>--max-corenode-wait-duration '3'</td><td>Number of minutes to wait for the core node to come up on cluster creation; defaults to 3</td>
</tr>
<tr>
<td>--network-id</td><td>Network ID</td>
</tr><tr>
<td>--subnet-name 'Test Network Subnet'</td><td>Subnet name.</td>
</tr><tr>
<td>--upstream-proxy </td><td>Upstream proxy</td>
</tr><tr>
<td>--http-proxy</td><td>HTTP proxy</td>
</tr><tr>
<td>--https-proxy</td><td>HTTPS proxy</td>
</tr>
<tr>
<td>--constructor-instance-name 'constructor-server'</td><td>Name of the instance of the constructor server</td>
</tr><tr>
<td>--constructor-ip-address </td><td>IP Address of the constructor server</td>
</tr>
<tr>
<td>--constructor-image-name</td><td>Name of the image of the constructor server</td>
</tr>
<tr>
<td>--constructor-image-id </td><td>ID of the image of the constructor server</td>
</tr><tr>
<td>--constructor-flavor-ref '101' </td><td>Flavor ref to use when creating a constructor server</td>
</tr>
</table>

##Delete a Cluster {#delete}
Options that can be passed to the command that deletes a cluster (*cluster-delete*).
###Use Syntax
<pre>als [global options] <b>command cluster-delete</b> [command options] [arguments...] </pre>

For help with this command within the application, enter

<pre>als help cluster-delete</pre>

###Options
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;"><th>Command (with example input)</th><th>Description</th>
</tr>
<tr>
<td>--load</td><td>Load flag values from the specified file</td>
</tr>
<tr>
<td>--save </td><td>Save flag values to the specified file</td>
</tr><tr>
<td>--cluster-prefix 'als'</td><td>Prefix of the ALS cluster</td>
</tr><tr>
<td>--keypair-name</td><td>The name of the key pair on instances</td>
</tr><tr>
<td>--constructor-instance-name 'constructor-server'</td><td>Name of the instance of the constructor server</td>
</tr><tr>
<td>--constructor-ip-address</td><td>IP Address of the constructor server</td>
</tr><tr>
<td>--constructor-image-name</td><td>Name of the image of the constructor server</td>
</tr><tr>
<td>--constructor-image-id</td><td>ID of the image of the constructor server</td>
</tr><tr>
<td>--constructor-flavor-ref '101'</td><td>Flavor ref to use when creating a constructor server</td>
</tr><tr>
<td>--subnet-name 'Test Network Subnet'</td><td>The name of the subnet</td>
</tr>
</table>
 
##Add DEA Nodes to an Existing Cluster {#addnode}
Options that can be passed when adding nodes to an existing cluster (*dea-add*).

###Use Syntax

<pre>als [global options] <b>dea-add</b> [command options] [arguments...]</pre>

For help with this command within the application, enter

<pre>als help dea-add</pre>

###Options
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;"><th>Command (with example input)</th><th>Description</th></tr>
<tr>
<td>--load</td><td>Load flag values from the specified file</td>
</tr>
<tr>
<td>--save</td><td>Save flag values to the specified file</td>
</tr><tr>
<td>--cluster-prefix 'als'</td><td>Prefix of the ALS cluster</td>
</tr><tr>
<td>--dea-count '1'</td><td>Number of DEAs nodes in the cluster</td>
</tr><tr>
<td>--seed-node-image-name</td><td>The seed node image name</td>
</tr><tr>
<td>--seed-node-image-password 'stackato'</td><td>The seed node image password</td>
</tr><tr>
<td>--keypair-name</td><td>The name of the key pair on instances</td>
</tr><tr>
<td>--constructor-instance-name 'constructor-server'</td><td>Name of the instance of the constructor server</td>
</tr><tr>
<td>--constructor-ip-address</td><td>IP Address of the constructor server</td>
</tr><tr>
<td>--constructor-image-name</td><td>Name of the image of the constructor server</td>
</tr><tr>
<td>--constructor-image-id</td><td>ID of the image of the constructor server</td>
</tr><tr>
<td>--constructor-flavor-ref '101'</td><td>Flavor reference to use when creating a constructor server</td>
</tr>
</table>