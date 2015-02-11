---
layout: default
title: "How To's with the HP Helion OpenStack&#174; Community Compute Service"
permalink: /cloudos/community/services/compute/howto/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/cloudos/community/services/compute/overview">&#9664; PREV</a> | <a href="/cloudos/community/services/overview/">&#9650; UP</a> | <a href="/cloudos/community/services/identity/overview/"> NEXT &#9654</a> </p>
-->

#  HP Helion 1.0 1.0 OpenStack&#174; Community How To's with the Compute Service  

<!-- Taken from http://wiki.hpcloud.net/display/core/Core+Edition+Use+cases#CoreEditionUsecases-OverCloud -->

Leveraging OpenStack Compute, the HP Helion OpenStack Community Compute provides a way to instantiate virtual servers on publicly accessible physical machines hosted in HP data centers.

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack Community Dashboard](/cloudos/manage/operational-dashboard/how-opdash-works/), the OpenStack CLI or OpenStack API.

For details on performing these tasks using the API or CLI, see the following OpenStack documentation:

- [OpenStack Compute API v2.0 Reference](http://api.openstack.org/api-ref-compute-v2.html)
- [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/novaclient_commands.html)

Depending upon your user type, [user](#user) or [administrator](#admin), you can perform the following tasks.

## Tasks performed by users ##

The following Compute service tasks are usually performed by someone with the *user* role.

### Working with a virtual machine ###

When working with the Compute service, you can perform a number of tasks with your virtual machines (VM), including creating and deleting VMs, starting and stopping a VM, and attaching the VM to a storage volume.

#### Launching a virtual machine ####

Use the Compute service to create a new virtual machine.

1. Launch the HP Helion OpenStack interface.
2. On the Project dashboard, click **Compute** > **Instance**.

#### Launching a virtual machine that boots from a Volume ####

Use the Compute service to create a bootable virtual machine associated with a bootable volume. 

### Rebooting a virtual machine ####

Use the Compute service to reboot a virtual machine, as needed

### Rebuilding a virtual machine ####

Use the Compute service to rebuild a virtual machine as needed.

### Starting and stopping a virtual machine ####

Use the Compute service to start and stop a virtual machine.

### Creating and deleting a snapshot of a virtual machine ####

Use the Compute service to create a snapshot of a virtual machine that you can use to create other VMs

### Rescuing and un-rescuing a virtual machine ####

Use the Compute service to resuce a VM.

### Deleting a virtual machine ####

Use the Compute service to delete a virtual machine that is no longer needed.

### Attaching and detaching volumes ####

Use the Compute service to attach a storage volume to a virtual machine and detach the volume, when no longer needed.

### Viewing a virtual machine console log ####

Use the Compute service to display a log of virtual machine activity.

### Viewing a VNC console connection to a virtual machine ####

Use the Compute service to remotely connect to a virtual machine using a VNC (Virtual Network Computing) console. 

### Associating and disassociating a floating IP address

Use the Compute service to allocate and associate floating IP addresses for a virtual machine. 

### Working with security groups ###

Use the Compute service to create, modify, and delete the security groups in your project.

### Working with key pairs ###

Use the Compute service to create and delete the key pairs that control access to the virtual machines in your environment.

### Creating and deleting key pairs ####

Use the Compute service to create a key pair, generate a new key pair using an existing pubkic key, and delete a key pair.

## Tasks performed by an Administrator ##

The following Compute service tasks are usually performed by someone with the *user* role.

### Creating, modifying and deleting flavors ####

Use the Compute service to create, delete, and modify the virtual machine *flavors* in a project. A flavor defines the hardware configuration (disk space and memory capacity).

### Modifying project quotas ####

Use the Compute service to change the maximum limits on the number of objects (VMs, networks, and so on).

### Creating, modifying, and deleting availability zones ####

Use the Compute service to manage availability zones (AZ) by creating and deleting AZs and modifying existing AZs.

### Enabling and disabling services ####

Use the Compute service to enable or disable services available in a project.

### Locking and unlocking a virtual machines ####

Use the Compute service to lock or unlock a virtual machine, as needed.

### Pausing and un-pausing virtual machines ####

Use the Compute service to pause and un-pause a virtual machine. 

The `pause` command stores the state of the VM in RAM. A paused instance continues to run in a frozen state.

### Suspending and resuming virtual machines 

Use the Compute service to suspend and un-suspend a virtual machine. 

When you suspend an instance, its VM state is stored on disk, all memory is written to disk, and the virtual machine is stopped. Suspending an instance is similar to placing a device in hibernation; memory and vCPUs become available.

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack Community edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/cloudos/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/cloudos/manage/administration-dashboard/) -->

 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
