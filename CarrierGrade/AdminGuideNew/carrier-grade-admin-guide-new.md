---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Administrators Guide"
permalink: /helion/openstack/carrier/admin/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Administrators Guide 

This guide covers how administrators can manage the day-to-day operation of HP Helion OpenStack Carrier Grade.

**Managing Hypervisors**

**Managing Host Aggregates**

* [Managing Host Aggregates](/helion/commercial/carrier/dashboard/managing/aggregates/)

**Managing Virtual Instances**

The following tasks involve the Compute Operations (Nova) service to create and maintain virtual machine instances.

* [Working with Instances](/helion/commercial/carrier/dashboard/managing/instances/)
	* [Create a new instance](/helion/commercial/carrier/dashboard/managing/instances/create/)
	* [Terminate an instance](/helion/commercial/carrier/dashboard/managing/instances/terminate/)
	* [Reboot an instance](/helion/commercial/carrier/dashboard/managing/instances/reboot/)
	* [Rebuild an instance](/helion/commercial/carrier/dashboard/managing/instances/rebuild/)
	* [Resize an Instance](/helion/commercial/carrier/dashboard/managing/instances/resize/)
	* [Suspend and resume an instance](/helion/commercial/carrier/dashboard/managing/instances/suspend/)
	* [Pause and un-pause an instance](/helion/commercial/carrier/dashboard/managing/instances/pause/)
	* [Create an instance snapshot](/helion/commercial/carrier/dashboard/managing/images/public/)
	* [Associate, or assign, a floating IP address to an instance](/helion/commercial/carrier/dashboard/managing/instances/ipaddresses/) 
	* [Launch a console session to an instance](/helion/commercial/carrier/dashboard/managing/instances/console/)
	* [Migrate or Live Migrate and instance](/helion/commercial/carrier/dashboard/managing/instances/migrate/)
* [Working with Volumes](/helion/commercial/carrier/dashboard/managing/volumes/)
	* [Create, edit and delete a volume](/helion/commercial/carrier/dashboard/managing/volume/create/)
	* [Create a snapshot from a volume](/helion/commercial/carrier/dashboard/managing/volume/snapshot/create/)
	* [Extend the size of a volume](/helion/commercial/carrier/dashboard/managing/volume/extend/)
	* [Attach a volume to a VM instance and detach a volume from VM instance](/helion/commercial/carrier/dashboard/managing/volume/attach/)
* [Working with Flavors](/helion/commercial/carrier/dashboard/managing/flavors/)
	* [Create a flavor](#createflavor)
	* [Edit a flavor](#editflavor)
	* [Edit flavor metadata](#editmeta)
	* [Configure extra specifications](#extra)
	* [Delete a flavor](#deleteflavor)
* [Working with Images](/helion/commercial/carrier/dashboard/managing/images/)
	* [Create an image](/helion/commercial/carrier/dashboard/managing/images/create/)
	* [Modify an image](/helion/commercial/carrier/dashboard/managing/images/modify/)
	* [Delete an image](/helion/commercial/carrier/dashboard/managing/images/delete/)
	* [View image details](/helion/commercial/carrier/dashboard/managing/images/details/)
	* [Protect an image or snapshot from being edited](/helion/commercial/carrier/dashboard/managing/images/protect/)
	* [Make an image or snapshot public](/helion/commercial/carrier/dashboard/managing/images/public/)
* [Viewing Services Information](/helion/commercial/carrier/dashboard/managing/system-info/)
* [Managing Metadata](/helion/commercial/carrier/dashboard/managing/metadata/)

**Managing Virtual Networks**

The following tasks involve the Networking Operations (Nova) service to create and maintain virtual networks.

* [Viewing the Topology](/helion/commercial/carrier/dashboard/managing/network/viewing/)
* [Working with Networks](/helion/commercial/carrier/dashboard/managing/networks/)
	* [Create or delete a tenant network](/helion/commercial/carrier/dashboard/managing/network/create/)
	* [Enable or disable a tenant network](/helion/commercial/carrier/dashboard/managing/network/enable/)
	* [Creating provider networks](/helion/commercial/carrier/dashboard/managing/network/external/create/)
	* [Enable or disable a provider network](/helion/commercial/carrier/dashboard/managing/network/enable/provider/)
	* [Delete a provider network](/helion/commercial/carrier/dashboard/managing/network/external/delete/provider/)
	* [Create, Modify, or Delete a port on a Network](/helion/commercial/carrier/dashboard/managing/network/ports/)
* [Working with Routers](/helion/commercial/carrier/dashboard/managing/routers/)
	* [Create a Router](/helion/commercial/carrier/dashboard/managing/router/create/)
	* [Delete a Router](/helion/commercial/carrier/dashboard/managing/router/delete/)
	* [Connect a network to a router](/helion/commercial/carrier/dashboard/managing/router/connect/)
	* Add / Remove an external network to/from a Router
	* [Delete a router](/helion/commercial/carrier/dashboard/managing/router/admin/delete/)

**Managing Storage**

* [Managing Object Storage](/helion/commercial/carrier/dashboard/managing/objects/)
	* [Create and delete a container](/helion/commercial/carrier/dashboard/managing/container/create/)
	* [Upload an object into or download an object from a container](/helion/commercial/carrier/dashboard/managing/container/upload/)
	* [Edit and delete an object in a container](/helion/commercial/carrier/dashboard/managing/container/edit/)
* [About Swift Scale-out Object Storage](/helion/openstack/carrier/services/object/overview/scale-out-swift/)
* [Deploying Additional Scale-out Object Storage (Swift) Nodes](/helion/openstack/carrier/services/swift/deployment-scale-out/)

* Configure HP StoreVirtual VSA

	For instructions, see the Configuring HP StoreVirtual VSA for Block Storage document.

* Configure an HP 3Par storage array

	For instructions, see the HP StoreServ (3PAR) Support document.


**Managing Orchestration**

The following tasks involve the Orchestration service (Heat) service to create and maintain virtual networks.

* [Creating a Stack](/helion/openstack/carrier/dashboard/managing/stacks/create/)
* [Using Stacks, Templates, and Parameters](/helion/openstack/carrier/admin/stacks/)
	* [Creating a Stack](/helion/openstack/carrier/admin/stacks/create)
	* [Customizing Guest Images with User Data](/helion/openstack/carrier/admin/stacks/user-data)
	* [Resource Scaling (Autoscaling)](/helion/openstack/carrier/admin/stacks/autoscale/)
	* [Reporting a Guest Metric](/helion/openstack/carrier/admin/stacks/guest/)

**Managing System Defaults**

* [Working with System Default Quotas](/helion/commercial/carrier/dashboard/managing/quotas/)

**Managing System Security**

* [Create a security group](/helion/commercial/carrier/dashboard/managing/security/groups/)
* [Create security group rules](/helion/commercial/carrier/dashboard/managing/security/groups/)
* [Managing Key Pairs](/helion/commercial/carrier/dashboard/managing/security/keypairs/)
* [Changing a User Password](/helion/commercial/carrier/dashboard/managing/users/password/change/)

**Managing Project and User Identity**

The following tasks involve the Identity Operations (Keystone) service to create and maintain virtual networks.

* [Create and delete users](/helion/commercial/carrier/dashboard/managing/users/create/)
* [Disable and enable a user](/helion/commercial/carrier/dashboard/managing/users/enable/)
* [Change a user password](/helion/commercial/carrier/dashboard/managing/users/password/)
* [Specify a primary project for a user](/helion/commercial/carrier/dashboard/managing/projects/primary/)

**System Configuration Management**

You can make changes to the HP Helion OpenStack Carrier Grade initial configuration at any time after installation.

* [System Configuration Management](/helion/openstack/carrier/admin/system/config/)

	* [Changing the External Network IP Configuration](/helion/openstack/carrier/admin/system/config/ext/)
	* [Changing the DNS Server Configuration](/helion/openstack/carrier/admin/system/config/dns/)
	* [Changing the NTP Server Configuration
	* [Changing Storage Space Allotments on the Controller

**Scaling Virtual Machine Resources**

You can scale the resources of individual instances up or down. Currently, the CPU resources for an instance are scalable.

* [Scaling Virtual Machine Resources](/helion/commercial/carrier/dashboard/managing/instances/scaling/)

**Virtual Machines and Carrier-Grade Availability**

The Wind River Linux servers in HP Helion OpenStack Carrier Grade provide a health monitoring mechanism that can be used to implement and support the deployment of guest applications in Carrier-Grade High Availability (HA) mode.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

* [Virtual Machines and Carrier-Grade Availability](/helion/openstack/carrier/admin/carrier-grade-avail/).

## System Backups

The HP Helion OpenStack Carrier Grade provides tools to back up system
data and Cinder volumes so that they can be stored in external storage
resources and used to restore a full cluster.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

* [Performing a System Data Backup](/helion/openstack/carrier/admin/backup/)
* [Cinder Volume Backups
* [Restore Procedure](/helion/openstack/carrier/admin/backup/restore/)


<!-- Hide for alpha
- [Troubleshooting](/helion/openstack/carrier/services/troubleshooting/) -->


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----
