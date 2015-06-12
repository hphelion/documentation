---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Deployment Scenarios using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Deployment Scenarios using the CLI

As an alternative to the web administration interface, you can work through the scenarios using the command-line interface.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

Users who are comfortable with text-based commands and Linux-based operating systems can use a command-line interface (CLI) to install and manage all aspects of HP Helion OpenStack Carrier Grade, including setting up the scenario environment and deploying scenarios. In addition to providing a compact and efficient environment, the CLI offers some capabilities not afforded by the web administration interface, such as the ability to save customization scripts (user data) for re-use.

For general information about the scenarios, see [Reference Deployment Scenarios](/helion/openstack/carrier/deploy/). For more information on command-line systems, see [Before you begin](#before) below.

To use the CLI, log in to the controller console as the admin user, or as `user1` or `user2`, depending on the task to be performed:

* [Creating Tenants and Updating Quotas](/helion/openstack/carrier/deploy/cli/tenants/)
* [Creating Users](/helion/openstack/carrier/deploy/cli/users/)
* [Establishing Provider Networks](/helion/openstack/carrier/deploy/cli/provider/)
* [Creating Segmentation Ranges](/helion/openstack/carrier/deploy/cli/segment/)
* [Setting Up Tenant Networks](/helion/openstack/carrier/deploy/cli/tenant/)
* [Setting Up the Example Guest Image](/helion/openstack/carrier/deploy/cli/guest/)
* [Setting Up User Data](/helion/openstack/carrier/deploy/cli/data/)
* [Setting Up Flavors](/helion/openstack/carrier/deploy/cli/flavors/)
* [Creating Login Environment Files](/helion/openstack/carrier/deploy/cli/environ/)
* [Launching Instances Using the CLI](/helion/openstack/carrier/deploy/cli/launch/)

## Before you begin {#before}

Before you being the deployment scenarios using the CLI, you can review the following section for more information on command-line systems.

## Working with system objects: UUIDs {uuid}

Each system component (see [Components of the Scenario Environment](/helion/openstack/carrier/deploy/setting/components/) is identified by a string of hexadecimal characters known as a universal unique identifier (UUID). In the CLI, UUIDs are sometimes required for working with a component. You can display them using an appropriate command. For example, you can display the UUIDs of currently defined tenants using the following command:

	keystone tenant-list

The command line environment provides methods for working with UUIDs conveniently and efficiently, without typing them manually.

* You can store them in variables, and use the variables in subsequent commands.
* You can filter the output of commands so that the UUID is passed directly to a variable.

	For example, the following command stores the UUID of the admin tenant in the variable `admin_tenant_UUID`.

		export admin_tenant_UUID=`keystone
		tenant-list | grep admin | \
		awk '{print $2}'`

	The command keystone `tenant-list` generates a list of all tenants. This is piped to the grep command, which filters for the line containing the string admin. This in turn is piped to an awk command, which prints the content of the id column to the console. The result, the UUID, is stored in the variable `admin_tenant_UUID`.

	You can supply variables to other commands using the shell syntax ${variable}. For example, to adjust resource quotas for a tenant, you need to supply the UUID of the tenant. With the UUID stored as a variable, you can do this as shown in the following example:

		neutron quota-update --subnet 32 --tenant-id ${admin_tenant_UUID}

	Note the use of `admin_tenant_UUID` to supply the UUID. 

	These techniques are used throughout the CLI-based exercises. If you prefer, you can copy UUIDs from the display and paste them directly to the command line.

## User Login Environment

For the HP Helion OpenStack Carrier Grade server to identify the user who is executing system commands, a shell environment with the proper set of variables must be in place. For the cloud admin account, the shell is set up automatically when you log in as the Linux admin user.

You can create scripts for other users. Later in this presentation, the scripts `/etc/nova/openrc.user1` and `/etc/nova/openrc.user2` are created (for details, see [Creating Login Environment Files for Users]{#loginuser}

To execute commands with the corresponding user identities, use the
source command to invoke the scripts.

For more information on login accounts, see the *HP Helion OpenStack Carrier Grade Installation Guide: About Login Accounts*.








<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----