---
layout: default-devplatform
permalink: /als/v1/client/reference
product: devplatform
title: "HP Application Lifecyle Service (ALS) Client"

---

<!--UNDER REVIEW-->
# HP Application Lifecycle Service (ALS) Client Configuration Reference

The ALS command-line interface (CLI) provides an option for executing commands that construct, manage, update, or delete ALS clusters. Use the CLI when the Horizon management console is unavailable or when direct access is preferred. 

There are three ways to pass configuration values into ALS:

- Direct entry into the CLI
- Defined in an environment variable
- Recorded in a configuration file

##Configuration Files
ALS maintains two separate configuration files; one for local and one for global variables. Values must be included in the appropriate file for their applicable scope.

The global configuration file is located in the home <!--root?--> directory and is named *alsconfig.yml*. Global level commands create, delete, and add clusters. Global level configurations manage tenant, user, version, and other OpenStack information. 

The command-specific configuration file is located at the file specified by the --load argument. s named ??. This file records values that should be passed to arguments used in specific commands.

##Global Commands
These variables affect the entire cluster; they are global in scope.

###Use Syntax
<pre>als [global options] command [command options] [arguments...] </pre>

###Commands
<table>
<tr><td>Command</td><td>Description</td></tr>
<tr><td>cluster-create,	cc<td>Creates a cluster</td></tr>
<tr><td>cluster-delete, cd<td>Deletes a cluster</td></tr>
<tr><td>dea-add,da<td>Adds DEA nodes to an existing cluster</td></tr>
<tr><td>help, h</td><td>Displays help.</td></tr>
</table>

###Global Options
<table>
<tr><td>Option</td><td>Description</td><td>Environment Variable</tr>
<tr><td>--config 'path\path\path' <td>Enter a new file path to change the current location of the configuration file.</td><td>n/a</td></tr>
<tr><td>--debug<td>Enables additional debug information.</td><td>$ALS_DEBUG</td></tr>
<tr><td>--os-username</td><td>OpenStack user name</td><td>$OS_USERNAME</td></tr>
<tr><td>--os-password</td><td>OpenStack password</td><td>$OS_PASSWORD</td></tr>
<tr><td>--os-auth-url</td><td>OpenStack authentication URL</td><td>$OS_AUTH_URL</td></tr>
<tr><td>--os-tenant-id</td><td>OpenStack tenant id</td><td>$OS_TENANT_ID</td></tr>
<tr><td>--os-tenant-name</td><td>OpenStack tenant name</td><td>$OS_TENANT_NAME</td></tr>
<tr><td>--os-region-name</td><td>OpenStack region</td><td>$OS_REGION_NAME</td></tr>
<tr><td>--help, -h</td><td>Displays help.</td><td>n/a</td></tr>
<tr><td>--version, -v</td><td>Print the version.</td><td>n/a</td></tr>
</table>