---
layout: default
title: "HP Cloud OS for Moonshot: Backup and Restore"
permalink: /cloudos/moonshot/manage/backup-process/
product: moonshot

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/image-builder">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage">&#9650; UP</a> | NEXT &#9654; </p>

# HP Cloud OS for Moonshot: Backup and Restore # {#moon-image-builder}

HP Cloud OS for Moonshot is an enterprise ready product used to manage a Moonshot Chassis, discover Moonshot Servers from the managed Moonshot Chassis, and provision the given workload based on Moonshot Servers capabilities such as static web, online gaming, and such. It also enables the Cloud Administrator to set up multiple project sharing across the discovered Moonshot Servers.

This document describes how to backup and restore HP Cloud OS for Moonshot, specifically the steps for backing up and recovering the components of HP Cloud OS for Moonshot Management Host:

* Administration Node

    The HP Cloud OS for Moonshot Administration Node (Admin Node) hosts the Operational Dashboard that deploys private Cloud Infrastructure environments by network booting the managed virtual servers, which are typically Controller Node and Baremetal Hosts. 

* Controller Node

    While each service can be individually deployed, HP Cloud OS for Moonshot groups these services into distinct sets for ease of architectural description: 

    - Cloud Controller - contains those services that are considered single services for a cloud environment, such as Keystone, Glance, Eden, Nova, Eve, and Focus. Also defines the boundaries of the cloud environment from an identity standpoint. 
    - Network Controller - is a single service in a cloud and co-exists with cloud controller services. 
    - Compute Region Controller - is a pool of compute resources that can be consumed through a service API by consumers of the cloud, such as Nova. This is responsible for scheduling the launch of instances across Baremetal hosts. The scheduling is based on varied flavors of instances and available resources on the Baremetal hosts.

* Baremetal Host

    The Baremetal Host hosts the cloud instances using the Baremetal driver for OpenStack Nova compute service. Within the OpenStack framework, the Baremetal driver has the same role as the drivers for other hypervisors (libvirt, xen, etc.), and yet it is presently unique because the hardware is not virtualized; there is no hypervisor between the tenants and the physical hardware which includes Moonshot cartridges.

## Backing up and restoring the HP Cloud OS for Moonshot Management Host {#backup-restore-moonshot}

We recommend designing and implementing a virtual machine-based backup policy, which enables IT Administrators or Backup Administrators to design a simple backup policy in comparison to using file-based solutions. 

If you choose to design and implement a file-based solution, you will encounter some technical difficulties:

* Each node has different variable data, such as
    - Configuration files
    - Database
    - Log files

* The Controller node and Baremetal host require a synchronized backup of to maintain their states.
* The Admin node can be occasionally backed up.

* The Controller node and Baremetal host require backups on a regular basis.
* The complexity involved in performing file-based backup for each node.

* Restoring the environment involves additional, manual steps to recover the Management Host.

* The MAC address of the systems must be saved so that the restoration occurs seamlessly during a file-based restore. This is required in case you need to recreate the environment because it was lost due to corruption or other reasons.

**Note:** We recommend you use any enterprise backup/restore solution that supports hot backup. We do not recommend that you implement a cold backup policy because it involves downtime of the private cloud environment.

### Recommended backup schedule {#rec-backup-sched}
The following table shows our backup frequency recommendations for HP Cloud OS for Moonshot Management Host.

<table style="text-align: left; vertical-align: top; min-width: 400px;">
<th style="background-color: #C8C8C8;">Component</th>
<th style="background-color: #C8C8C8;">Backup schedule</th>
<th style="background-color: #C8C8C8;">Notes</th>
<tr style="background-color: white; color: black;">
<td>Admin Node</td>
<td>Monthly</td>
<td>Perform a full backup operation after a successful cloud deployment.</td>
<tr/>
<tr style="background-color: white; color: black;">
<td>Controller Node<br />Baremetal Host</td>
<td>Nightly</td>
<td>Backup of Controller Node and Baremetal Host must occur at the same time to preserve the system state.</td>
<tr/>

</table>


#### Backup strategy {#backup-strategy}
The following are considerations you should understand and discuss before performing a Management Host backup:

1.	Perform a full backup of HP Cloud OS for Moonshot Management host as soon as the cloud and region are active.
2.	Perform a nightly back of the Controller Node and Baremetal Host at the same time.
3.	Trigger a backup before any scheduled maintenance. Ensure you follow a power ON/OFF sequence. See the [Powering on/off the Management Host](#poweroffon).
4.	Trigger a backup before applying hot-fixes and patches through the Cloud OS Delivery Network (CODN).
5.	Perform a backup before you plan an upgrade.

#### Restore strategy {#restore-strategy}
The following are considerations you should take into account before performing a Management Host restore.

1. Before performing any restoration, power off all nodes of HP Cloud OS for Moonshot Management host.
2. Use latest backup files and maintain the existing naming convention (Virtual Machine names).
3. If there is a node failure, remove the datastore files of the corrupt node and then perform a restore.
4. If your services are corrupted and the Admin node fails, restore only the Admin node.
5. If both your Baremetal host or Controller node fail, restore them both.

#### Powering on/off the Management host {#poweroffon}
It is highly recommended you follow the steps for **powering off** the HP Cloud OS for Moonshot Management host after a successful cloud deployment.

1. Power off the Baremetal Host.
2. Once the Baremetal host is off, power off the Controller Node.
3. Once Controller node is off, power off the Admin Node.
4. Then, power off the hypervisor power (if required).

Once you have successfully completed the powering off steps, **power on** the HP Cloud OS for Moonshot Management host in this order:

1. Power on the hypervisor.
2. Power on the Admin node.
3. Open the HP Cloud OS for Moonshot Administration Dashboard in a browser.
4. Navigate to **Cloud -> Manage Nodes**. Notice that the state of the nodes is set to OFF.
5. Power on the Controller node.
6. Wait until the state of the Controller node changes to **Deployed**, then power on the Baremetal host.
7. Wait until the state of the Baremetal host changes to **Deployed**.

Your HP Cloud OS for Moonshot Management host is now up and running.


## Example tools for backup and restore {#example-backup-tools}

There are many enterprise solutions that perform virtual machine based backup and restore operations. You can implement any such solution, but remember our [backup](#backup-strategy) and [restore](#restore-strategy) strategies. 

In this section, we have example backup/restore steps using:

*  XSIBackup, when the guest system was running a VMware ESXi.

* VZdump/VZrestore, when the guest system was running a Ubuntu 12.04 LTS system.

### XSIBackup tool {#xsi-backup}

XSIBackup is an opensource application that uses VMWare's ESXi built-in command line options to create full backup solutions by cloning the system. For detailed information about this tool, see the [XSIBackup documentation](http://33hops.com/xsibackup-vmware-esxi-backup.html)

Use the following basic steps to backup an HP Cloud OS for Moonshot Management Host running on VMware's hypervisor (ESXi):

1. Add another datastore, named **bkup**, to the guest that is hosting HP Cloud OS for Moonshot.
2. Enable an SSH login to the hypervisor.
3. Login to the hypervisor and copy the XSIBackup script file to the newly added datastore.
4. Execute the command:
    <pre>xsibackup --backup-point=/vmfs/volumes/bkup --backup-type=custom --backup-vms=Admin,Ctrl,Bm</pre>

<ul style="margin-left:20px;">
<li>backup-point<br />
Indicates the datastore to backup the files</li>
<li>backup-type<br />
Custom is used here to enable a custom selection of VM</li>
<li>backup-vms<br />
Provides the virtual names that need to be backed up</li>
</ul>

Use the following steps to restore your Management host in the event of node failure:

1. Follow the [recommended power off sequence](#poweroffon).
2. Login to the vSphere client.
3. Delete the virtual machine that is corrupt.
4. Copy the virtual machine from **bkp** datastore to the running datastore.
5. Browse the copied datastore and navigate to the newly copied VM folder.
6. Open the folder, and then right-click on **&lt;vm_name&gt;.vmtx** file and select **Add to Inventory**.
7. Follow the [recommended power on sequence](#poweroffon).

### VZdump tool {#vzdump-backup}

The VZdump utility is a useful tool for performing backup/restore operations on virtual machines hosted on KVM hypervisors.

As a pre-requisite, you need to determine the IDs of the virtual machines of the HP Cloud OS for Moonshot Management host. You can do this with the `virsh list-all` command:

    root@blrcdl11:~# virsh list

    Id Name State
    ----------------------------------
    33 Admin_node running
    34 Controller running
    35 Compute running
    root@blrcdl11:~#

Use the following basic steps to backup an HP Cloud OS for Moonshot Management Host running on a KVM hypervisor.

1. Log in as root to the guest system hosting the KVM hypervisor.
2. Create a mount point **/bkup** which has a mounted partition that is not part of the logical group that hosts the virtual machine images.
3. Identify the IDs of the virtual machines you need to backup.
4. Run the following command

     ` vzdump --compress --dumpdir /bkup/<date> --snapshot <VMID>`

<ul style="margin-left:20px;">
<li>compress<br />
Stores the snapshot in a tar.gz format</li>
<li>dumpdir<br />
The location to store the snapshot file of the virtual machine selection of VM</li>
<li>snapshot<br />
Takes an LVM snapshot when the system is in a running state</li>
<li>&lt;VMID&gt;<br />
Provides the ID of the virtual machine ID that needs to be backed up
</ul>

Use the following steps to restore your Management host in the event of node failure:
<ol>
<li>Follow the <a href="#poweroffon">recommended power off sequence</a>.</li>
<li>Log in to the console of the guest hosting the KVM hypervisor.</li>
<li>Destroy the corrupt/problematic virtual machine with this command:
<pre>virsh destroy &lt;vm_name&gt; </pre></li>
<li>Restore the virtual machine by running the following command:
<pre>vzdump --restore &lt;path_to_archive&gt; &lt;VMID&gt;</pre>

<ul style="margin-left:0px;">
<li>&lt;path_to_archive&gt;<br />
The complete path to the latest .tar.gz file</li>
<li>&lt;VMID&gt;<br />
The virtual machine ID</li>
</ul>
</li>
<li>Follow the <a href="#poweroffon">recommended power on sequence</a>.</li>
</ol>
