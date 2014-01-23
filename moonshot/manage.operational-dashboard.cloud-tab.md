---
layout: default
title: "Operational Dashboard: Cloud Tab"
permalink: /cloudos/moonshot/manage/operational-dashboard/cloud-tab/
product: cloudos

---


<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/operational-dashboard/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/operational-dashboard/settings-tab/">NEXT &#9654;</a> </p>

# Operational Dashboard: Cloud Tab

The Cloud tab contains the following panels on which you complete the installation process to create a cloud, and 
download install modules and plugins. For the installation process, you must complete the Manage Nodes and Manage Clouds panels in the order 
they are displayed. 

* [Manage Nodes](#manage-nodes)
  
* [Manage Clouds](#manage-clouds)
    
* [Hot Fixes](#hot-fixes)
    
* [Updates and Extensions](#updates-and-extensions) 

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:600px; border: 1px dotted #000000;"> <b>Note:</b> The Cloud tab does not appear until you have 
completed all the installation steps on the <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab">Environment tab</a>.</p>

For procedural instructions, see [Install and Configure Your Clouds](/cloudos/moonshot/install/).

## Manage Nodes

The following information provides details about the Manage Nodes panel.

**Concepts:**

* [Manage Nodes Overview](#manage-nodes-overview)

**UI Descriptions:**

* [Manage Nodes Page](#manage-nodes-page)

* [Edit Node Dialog](#edit-node-dialog)

* [Manage Nodes Details Page](#manage-nodes-details-page) 


### Manage Nodes Overview

The Manage Nodes panel lists all of the nodes that have been discovered through the PXE-boot process. Nodes that are Allocated can be 
subsequently used as part of a Cloud installation. Nodes can be edited so that they have meaningful names or descriptions. Clicking on a node's 
ID gives more information about that node, including its role in a cloud deployment.

Before you begin:

* You have console access to all the virtual and bare-metal servers. This is required to power on the servers to trigger Network (PXE) boot, monitor 
operating system installation and if need be provide additional firmware drivers when prompted.
    
* Network and storage infrastructures are set up correctly. For the post-install of the operating system, a few steps are required to configure 
and mount the folder on an additional storage.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px; border: 1px dotted #000000;"> <b>Note:</b> Ensure that the boot order on all nodes is configured to 
boot from the network first (this only occurs once as the PXE service will not try to network boot a node again if it has already done so).</p>

For procedural instructions on setting up and configuring your nodes, see [Install and Configure Your Cloud](/cloudos/moonshot/install).

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### Manage Nodes Page

To access: Select the Cloud tab > Manage Nodes.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px; border: 1px dotted #000000;"> <b>Tip:</b> Access the virtual and bare-metal server's consoles 
to monitor operating system installation. Some of your hardware requires non-free firmware files to operate. The firmware can be loaded from removable media, 
such as a USB stick or CD/DVD.</p>

If a dialog displays prompting you to load missing firmware, provide the appropriate drive.

The following table describes the Manage Nodes page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Alias</b> column </td>
<td> Renamed MAC address ( in the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#edit-node-dialog">Edit Node dialog</a> ) to a more 
meaningful name such as controllercompute, cloudcontroller, compute1, compute2.
<br /> <br />
Once the nodes have finished booting up, each node displays in the table, indicating the Alias Name set to the node's MAC 
address (of the NIC associated with the Administration Network). Each node will be in the Not Allocated state.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Node ID</b> column </td>
<td> The node's unique identifier, which is the MAC address of the node's NIC that is associated with the Administration network. It is read only. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Status</b> column </td>
<td> As the nodes are being allocated, they progress through these different states: 
Not Allocated, Hardware Installed, Installing, Installed, Readying, Finalizing, Allocated.
<br /> <br />
Once the nodes are ready for cloud deployment, their status ends with Allocated.
<br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> In the case where a 
node results in status = Off, select the More > Reboot Node action for the node.
</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Description</b> column </td>
<td> Lists any optional descriptions that were entered for the corresponding nodes. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Filter</b> field and button </td>
<td> Entering a text string into the field will display only those entries in the list of managed nodes that 
contain the string in any column on the row. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Edit Node</b> button </td>
<td> Click to open the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#edit-node-dialog">Edit Node dialog</a>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>More > Reboot Node</b> </td>
<td> Select to reboot the node.
<br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> A node can be rebooted 
if it is in the Not Allocated, Allocated, or Deployed state. </p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>More > Allocate Node</b> </td>
<td> Select to complete the node allocation process, to set up and configure the node so that OpenStack services can be deployed on it.
<br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> A node can be allocated if it is in the Not Allocated state. </p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>More > Reset Node</b> </nobr> </td>
<td> Select to reset the node.
<br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> A node can be reset if it is in the Not Allocated or Allocated state. 
A node that is in the Deployed state cannot be reset. When a node is reset, it is returned to the Not Allocated state if it is not in that state. </p>
</td>
</tr>

</table> 

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Edit Node Dialog

To access: Select the Cloud tab > Manage Nodes > Edit Node for the node you want to edit.

The following table describes the Edit Nodes dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Alias</b> </td>
<td> Type a meaningful name for the MAC address such as controllercompute, cloudcontroller, compute1, compute2.
<br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> The node name can only be letters (capitalization is allowed) 
and numbers with no spaces or special characters. </p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Description</b>   </td>
<td> Optional &mdash; Type a description of the node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Update Node</b> </nobr> </td>
<td> Click to save the settings and return to the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#manage-nodes-page">Manage Nodes page</a>.  </td>
</tr>

</table>

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>




### Manage Nodes Details Page

To access: Select the Cloud tab > Manage Nodes and click the node name link.

This page displays all the values used for the selected node.

The following table describes the Manage Nodes Details page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Info</b> section</td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>UUID</b>  </td>
<td> MAC address of the selected node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Alias</b> column  </td>
<td> Renamed MAC address of the selected node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Description</b> </td>
<td> Optional description that was entered for the corresponding node. None is the default, if no description was entered.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Domain</b> </td>
<td> The Cloud OS Administration node acts as a Domain Name Server (DNS server) for all the managed nodes. 
This domain name is used in the Fully Qualified Domain Name (FQDN) for the managed nodes.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>IP Address</b> </td>
<td> IP address of the selected node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Uptime</b> </td>
<td> Number of days, hours, minutes and seconds the node has been powered on.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Total RAM</b> </td>
<td> Total RAM size in kilobytes of the selected node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Free RAM</b> </td>
<td> Size in kilobytes of the amount of RAM that is left on the selected node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>OS</b> </td>
<td> Operating system of the selected node. The default is Ubuntu. </td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Cloud Info</b> section </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Cloud Name</b> </td>
<td> Name of the cloud in which the selected node belongs. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:120px;"> <b>Roles</b> </td>
<td> Type of role(s) for which the selected node has been specified: 
Cloud Controller, Network Controller, and Storage Controller respective services, and Compute Node.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Region</b> </td>
<td> Name of the compute region in which the selected node belongs. </td>
</tr>

</table> 
  




<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Manage Clouds

The following information provides details about the Manage Clouds panel.

**Concepts:**

* [Manage Clouds Overview](#manage-clouds-overview)

**UI Descriptions:**

* [Manage Clouds Page](#manage-clouds-page)
    
* [Create Cloud Dialog](#create-cloud-dialog)

* [Create Compute Region Dialog](#create-compute-region-dialog)
	
* [Extend Compute Region Dialog](#extend-compute-region-dialog)

* [Reduce Compute Region Dialog](#reduce-compute-region-dialog)

* [Remove Compute Region Dialog](#remove-compute-region-dialog)

* [Remove Cloud Dialog](#remove-cloud-dialog)

* [Manage Clouds Details Page](#manage-clouds-details-page)



### Manage Clouds Overview

The Manage Clouds panel lists the cloud that has been deployed in the current environment and the compute region(s). 
There is no limit to the number of compute regions that can be created and deployed, other than resource limitations.

The simplest cloud has one Compute Region with one Compute Controller that manages all the compute nodes. After creating an active cloud, 
you can go back and add more regions as your cloud environment expands. Or, you can plan to include several compute regions in your cloud 
depending on your environment.

There are multiple use cases where you would prefer to have separate compute regions, such as:

* To accommodate a heterogeneous set of hardware configured for different workloads.

* To distribute the workload across regions to get better response times. Each region can contain dedicated endpoints with a full Nova installation 
including its own message queue and database.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px; border: 1px dotted #000000;"> <b>Note:</b> Each region must use unique 
nodes &mdash; managed nodes cannot be shared between regions.</p> 


### Manage Clouds Page

To access: Select the Cloud tab > Manage Clouds and click the cloud name link.

The following table describes the Manage Clouds page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Name</b> </td>
<td> Cloud name specified on the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#create-cloud-dialog">Create Cloud dialog</a>. 
This is the Domain name that is used to initialize Keystone and will be displayed in the Administration Dashboard.
<br /> <br/>
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> A cloud name must contain only letters and numbers. 
It cannot contain spaces or special characters.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Region(s)</b> </td>
<td> List of created compute regions. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Status</b> </td>
<td> The status of the cloud being created or removed, or the status of the region being created. 
The status goes through a series of steps showing the % completed. When the cloud and compute region or regions are created, 
the status displays Active.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Create Cloud</b> </td>
<td> Opens the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#create-cloud-dialog">Create Cloud dialog</a>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Create Compute Region</b> </td>
<td> Opens the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#create-compute-region-dialog">Create Compute Region dialog</a>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>More</b> </td>
<td> Provides the following options:
<ul>
<li><b>Launch Dashboard</b> &mdash; Opens the Administration Dashboard login on a new tab in the browser. 
You can login with the Admin account and password you specified on the Create Cloud > Attributes dialog. 
<li><b>Extend Compute Region</b> &mdash; Opens the Extend Compute Region Dialog.
<li><b>Reduce Compute Region</b> &mdash; Opens the Reduce Compute Region Dialog.
<li><b>Remove Compute Region</b> &mdash; Opens the Remove Compute Region Dialog.
<li><b>Remove Cloud</b> &mdash; Opens the Remove Cloud Dialog.
</ul>
<br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> Some of the above actions might not always available, 
depending upon the context of the cloud and the compute regions.</p>
</td>
</tr>

</table> 
  
### Create Cloud Dialog

To access: Select the Cloud tab > Manage Clouds and click **Create Cloud**.

After you complete allocating the nodes on the Manage Nodes panel, you are ready to create your cloud.

The following table describes the Create Cloud dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Cloud Name</b>  </td>
<td> Type the name of the cloud. This is the Domain name that is used to initialize Keystone and will be displayed in the Administration Dashboard.
<br /> <br/>
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> A cloud name must contain only letters and numbers. 
It cannot contain spaces or special characters.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td colspan="2"> <b>Controllers Tab</b> <br /> <br />
Specify which node will have the Cloud Controller, Network Controller, and Storage Controller respective services. 
You can install all these core controller services on a single node, or on a dedicated node for each service.
<br /> <br/>
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Important:</b> You must have Powered On and Allocated the nodes 
on the Manage Nodes panel to be able to select which nodes to use here.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Cloud Controller</b> </td>
<td> Select which allocated node will have the Cloud Controller service. The Cloud Controller contains those services that are considered 
single services for a cloud environment, such as Keystone, Glance, Graffiti, Eve, and Focus, and define the boundaries of the cloud 
environment from an identity standpoint.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Controller</b> </td>
<td> Select which allocated node will have the Network Controller service. The Network Controller contains Quantum's server, l3 agent 
and DHCP services. It is a single service in a cloud and can co-exist with (or separate from) the cloud controller services.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Storage Controller</b> </td>
<td> Select which allocated node will have the Storage Controller service. The Storage Controller contains Cinder services that 
provide block storage and volume connectivity to launched instances. It is a single service in a cloud and can co-exist with (or separate from) 
the cloud controller services.
</td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Attributes Tab</b> </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Keystone Signing</b> </td>
<td> Set the Keystone Signing method based upon the authentication scheme: <br />
<ul>
<li><b>PKI</b> &mdash; (default setting) Large token that contains token information such as the user ID and user roles.
<li><b>UUID</b> &mdash; alternative 32-character token choice.
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Networking mode</b> </td>
<td> Specify <code>gre</code> (the default setting). Local and Flat are not supported. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Local Volume File Name</b> </td>
<td> Name of the file to be created on the target node's file system and used with <code>losetup</code> when creating the logical volume group.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Maximum Volume File Size (GB)</b> </td>
<td> Specify the maximum size of the file created on the target node's file system to represent the size of the Cinder volume. 
If the file size is too big for the file system, the size of the file will be capped at 90% of the free space in that file 
system (at the time of creation). The <b>best practice</b> is to adjust the size to a value that is appropriate for the 
file system associated with the Local Volume File. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Admin User Password</b> </td>
<td> Admin user's password for a granted administrator role on an Admin project in the Administration Dashboard.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Arch User Password</b> </td>
<td> Architect user's password for a granted architect role on an Admin project in the Administration Dashboard.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Trash User Password</b> </td>
<td> Trash user's password for a granted user's role on a trash project(s) in the Administration Dashboard.
<br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> Remember these passwords. You will be using these as 
appropriate to login to the Administration Dashboard &mdash; see <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#manage-clouds-page">Manage Clouds page</a>. </p> 
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Create Cloud</b> button </td>
<td> Click to begin the process of creating the cloud. The cloud will go through a series of steps to create an active cloud, 
showing the % completed on the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#manage-clouds-page">Manage Clouds page</a>.
</td>
</tr>

</table> 
  

### Create Compute Region Dialog

To access: Select the Cloud tab > Manage Clouds and click **Create Compute Region** for the corresponding cloud.

When the Create Cloud step is complete, the cloud's state displays Active on the Manage Clouds page. 
You can now create one or more compute regions. This is the last step in the installation process of creating a cloud. 
When the compute region is created, you have created an active cloud.

After successfully creating a cloud and compute region, you can manage your cloud environment by launching the 
HP Cloud OS Administration Dashboard.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px; border: 1px dotted #000000;"> <b>Note:</b> Successfully creating a compute region 
automatically creates a default resource pool for that region, which is configured and visible 
in the Administration Dashboard. For details, see the <a href="/cloudos/moonshot/manage/administration-dashboard/">HP Cloud OS Administration Dashboard Help</a>. </p>

The following table describes the Compute Region dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Region Name</b>  </td>
<td> This will be the region name that is used to initialize Keystone and to be displayed in the Administration Dashboard.
<br /> <br/>
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> A region name must contain only letters and numbers. 
It cannot contain spaces or special characters.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Controller</b>  </td>
<td> Select the node that will have the Compute Controller services. The Compute Controller service can reside on the same 
node as the Cloud Controller, but HP recommends that it be on a separate node.
<br /> <br/>
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> You can have a single node act as both the Compute Controller 
and Cloud Controller.  However, HP recommends that they be on separate nodes. If you choose to have them both on the same node, 
make sure the underlying node has enough CPU, Memory and Storage capacity to be able to run all the controller services 
and act as the virtualization host.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Nodes</b> service  </td>
<td> Specify which nodes will have the Compute Nodes service. Select the Compute Node(s) in one of the following ways:
<ul>
<li>Choose a number from the drop-down list to auto-select check boxes of the node(s) for you.</li>
<li>Individually select the check boxes of the node(s) you want.</li>
</ul>
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> HP recommends that the Compute Nodes be separate nodes.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Attributes</b> tab </td>
<td> Use to specify property values required to create a Compute Region. For the Hypervisor attribute:
<ul>
<li>Use <code>kvm</code> (the default) if the compute nodes are bare-metal servers.
<li>Use <code>qemu</code> if the compute nodes are VMs.
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Create Region Name</b> </td>
<td> Click to begin creating the Compute Region.
<br /> <br />
On the Manage Clouds page, the compute region will go through a series of steps to create an active compute region, 
showing the % completed until the Cloud's Status is Active. This indicates that the cloud and compute region have been successfully created.
<br /> <br />
You can now add additional compute regions. The added compute regions appear on the Manage Clouds page as a comma-separated list. </td>
</tr>

</table>  



	
### Extend Compute Region Dialog

To access: Select the Cloud tab > Manage Clouds and then click **More** > **Extend Compute Region** for the corresponding cloud.

The Extend Compute Region dialog is used to add nodes to an existing compute region. 
The following table describes the Extend Compute Region dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Cloud Name</b>  </td>
<td> The name of the cloud containing the compute region to be extended. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Region Name</b>  </td>
<td> Select the name of the compute region to be extended. </td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Compute Nodes</b> tab  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Current Node Count</b>  </td>
<td> The number of compute nodes currently in the compute region. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Nodes</b> checkboxes  </td>
<td> Select the nodes to be added to the compute region.
<br /> <br /> 
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> Nodes available to be added to a region are those nodes 
that are in the Allocated state. </p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Extend Compute Region</b> button </td>
<td> Click to begin extending the compute region.
<br /> <br /> 
On the Manage Nodes page, the Status for the nodes that have successfully been added to the compute region will change to <b>Deployed</b>. 
You can also view the compute nodes that are currently in the compute region on the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#manage-clouds-details-page">Manage Clouds Details page</a>.
</td>
</tr>

</table>  
  

### Reduce Compute Region Dialog

To access: Select the Cloud tab > Manage Clouds and then click **More** > **Reduce Compute Region** for the corresponding cloud.

The Reduce Compute Region dialog is used to remove compute nodes from an existing compute region. 
When a node is successfully removed from a compute region, its previous context is lost, including its alias name and any HP Cloud OS software 
that had been previously installed on it. To use such a node again, re-set its alias and re-allocate it. Once in the Allocated state, 
the node can be associated with a cloud.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px; border: 1px dotted #000000;"> <b>Note:</b> You reset a node's alias in the Edit Node Dialog, 
and you re-allocate it in the Manage Nodes Page.</p>

The following table describes the Reduce Compute Region dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Cloud Name</b>  </td>
<td> The name of the cloud containing the compute region to be reduced. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Region Name</b>  </td>
<td> Select the name of the compute region to be reduced. <br />  <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> Only compute regions that contain more 
than one compute node will display in this list. A compute region must contain at least one compute node. </p> 
</td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Compute Nodes</b> tab  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Nodes</b> checkboxes </td>
<td> Select the compute nodes to be removed from the compute region.
<br />  <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> You cannot remove all nodes from a compute region. 
A compute region must contain at least one compute node. </p> 
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Reduce Compute Region</b> button </td>
<td> Click to begin removing the selected nodes from the compute region.
<br />  <br />
On the Manage Nodes page, the Status for the nodes that have successfully been removed from the compute region will 
change to <b>Not Allocated</b>, and they will be listed by their MAC addresses.
</td>
</tr>

</table> 
  

### Remove Compute Region Dialog

To access: Select the Cloud tab > Manage Clouds and then click **More** > **Remove Compute Region** for the corresponding cloud.

The Remove Compute Region dialog is used to remove an existing compute region. This action sets the compute controller and compute 
nodes that comprise the compute region to the Not Allocated state. In the Not Allocated state, the previous context of such nodes is lost, 
including their alias names and any Cloud OS software that had been previously installed on them. To use such nodes again, reset 
their aliases and reallocate them. Once in the Allocated state, they can be associated with a cloud.

<div style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px; border: 1px dotted #000000;"> 
<b>Notes:</b> 
<ul>
<li>If the compute controller is co-located with the cloud controller, the compute region cannot be removed.</li>
<li>You reset a node's alias in the Edit Node Dialog, and re-allocate it in the Manage Nodes Page.</li>
<li>You can remove the last compute region from the cloud, in which case, it becomes a hybrid-only cloud. This is useful when provisioning 
should be done in a public cloud, such as HP Cloud.</li>
</ul>
</div> <br />

The following table describes the Remove Compute Region dialog UI elements:
  
<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Cloud Name</b>  </td>
<td> The name of the cloud containing the compute region to be removed. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Region Name</b>  </td>
<td> Select the name of the compute region to be removed. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>To confirm removal of the region, type the word: remove </b> </td>
<td> Enter the word "remove" into this field. If that string is not contained in this field when you click the <b>Remove Compute Region</b> button, 
an error message displays and the compute region removal process will not take place. </td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Compute Nodes</b> tab  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Nodes</b> list </td>
<td> A list of the compute nodes that are currently in the compute region. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Remove Compute Region</b> button </td>
<td> Click to begin removing the compute region. 
<br />  <br />
On the Manage Nodes page, the Status for the compute controller and the compute nodes that comprised the compute region that was removed 
will change to <b>Not Allocated</b>, and they will be listed by their MAC addresses.
</td>
</tr>

</table> 


### Remove Cloud Dialog

To access: Select the Cloud tab > Manage Clouds and then click **More** > **Remove Cloud** for the corresponding cloud.

The Remove Cloud dialog is used to remove an existing cloud. This action sets all cloud, network, storage, and compute controller nodes, 
and all compute nodes that comprise the cloud to the Not Allocated state. In the Not Allocated state, the previous context of the nodes is lost, 
including their alias names and any HP Cloud OS software that had been previously installed on them. To use such nodes again, reset their aliases 
and reallocate them. Once in the Allocated state, they can be associated with a cloud. 

Note: You reset a node's alias in the Edit Node Dialog, and re-allocate it in the Manage Nodes Page.

The following table describes the Remove Cloud dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Cloud Name</b> </td>
<td> The name of the cloud to be removed.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>To confirm removal of the cloud, type the word: remove </b> </td>
<td> Enter the word "remove" into this field. If that string is not contained in this field when you click the <b>Remove Cloud</b> button, 
an error message displays and the cloud removal process will not take place.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Remove Cloud</b> button </td>
<td> Click to begin removing the cloud. <br />  <br />
On the Manage Nodes page, the Status for all nodes that comprised the cloud that was removed will change to Not Allocated, 
and they will be listed by their MAC addresses.  </td>
</tr>

</table> 
  


### Manage Clouds Details Page

To access: Select the Cloud tab > Manage Clouds and click the cloud name link.

This page displays the values you used to create the cloud and compute regions.

The following table describes the Manage Clouds Details page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Created Cloud Info</b>  </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Name</b> </td>
<td> Cloud name. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Creation Started</b> </td>
<td> Timestamp of the date and time the cloud creation started. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Creation Ended</b> </td>
<td> Timestamp of the date and time the cloud creation ended. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Cloud Controller</b> </td>
<td> Node selected to be the Cloud Controller. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Controller</b> </td>
<td> Node selected to be the Network Controller. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Storage Controller</b> </td>
<td> Node selected to be the Storage Controller. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Cloud Attributes</b> </td>
<td>
<ul>
<li> <b>Keystone Signing</b> &mdash;Specified <code>keystone.signing</code> method: <code>PKI</code> (default) or <code>UUID</code>. </li>
<li> <b>Networking Mode</b> &mdash; Specified networking mode: <code>gre</code> (default). </li>
<li> <b>Local Volume File Name</b> &mdash; Path of the local volume file name. </li>
<li> <b>Maximum Volume File Size (GB)</b> &mdash; Number specified for the maximum volume allowed in gigabytes. </li>
</ul>
</td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Regions Tabs</b> &mdash; Each region is a separate tab with the following information specific to each region. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Name</b> </td>
<td> The name of the selected region. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Creation Started</b> </td>
<td> Timestamp of the date and time the region creation started. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Creation Ended</b> </td>
<td> Timestamp of the date and time the region creation completed. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Controller</b> </td>
<td>  	Node selected to be the Compute Controller for the selected region. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Nodes</b> </td>
<td> List of the allocated compute nodes for the selected region. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Region Attributes</b> </td>
<td> <b>Hypervisor</b> &mdash; selected hypervisor for the selected region.  </td>
</tr>

</table> 
  

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Hot Fixes

The following information provides details about the Hot Fixes panel.

**Concepts:**

* [Hot Fixes Overview](#hot-fixes-overview) 

**UI Descriptions:**

* [Hot Fixes Page](#hot-fixes-page)
    
* [Package Details Page](#package-details-page)
    
* [Import Package Dialog](#import-package-dialog) 


### Hot Fixes Overview

The hot fixes feature allows you to apply software hot fixes and updates to your HP Cloud OS environment after such hot fix or update files, 
having the .csu extension, have been downloaded to the local file system. In this help, such hot fixes and updates are referred to as content packages.

### Hot Fixes Page

To access: Select the Cloud tab > Hot Fixes.

The following table describes the Hot Fixes page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Product Name</b> column  </td>
<td> The name of the product to which the content package applies. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Product Version</b> column  </td>
<td> The version number of the product to which the content package applies. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Package Name</b> column  </td>
<td> The name of the content package. Click on the package name to open 
the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#package-details-page">Package Details Page</a>.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Package Version</b> column  </td>
<td>  	The content package version number. </td>
</tr>

<!-- BG: This should be updated for US 2516 G3.1, KB to GB --> 
<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Size</b> column  </td>
<td> The size of the content package, in bytes.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Imported</b> column  </td>
<td> The date and time at which the content package was imported to the HP Cloud OS Administration node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Installed</b> column  </td>
<td> The date and time at which the content package was installed, or n/a if the content package has not been installed. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Actions</b> column  </td>
<td> Buttons, menus, or other items that can be used to perform some action with the content package. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Filter</b> button and field  </td>
<td> Enter a character string into the field to display only those content packages in the list that 
contain the string in any column. The filter function is not case sensitive. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Refresh List</b> button  </td>
<td> Click, and then click the <b>Refresh</b> button in the confirmation box that appears to refresh the list of content packages. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Import Package</b> button  </td>
<td> Click to open the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#import-package-dialog">Import Package Dialog</a>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Install</b> button </td>
<td>  Click, and then click the <b>Install</b> button in the confirmation box, to start the content package installation process. 
When the installation process completes, a Success message will appear in the upper right side of the interface.
<br /> <br/>
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> Upon successful completion of the installation process, 
the content package has been properly installed on the HP Cloud OS Administration node, but not yet enabled. Such enabling is performed 
in the HP Cloud OS Installation Dashboard. For information on how to enable and disable content packages, 
refer to the <a href="/cloudos/moonshot/install/updates-and-extensions">Updates and Extensions</a> topic, which is part of 
<a href="/cloudos/moonshot/install/">Install and Configure Your Cloud</a>.</p>
</td>
</tr>

</table> 

### Package Details Page

To access: Select the Cloud tab > Hot Fixes and click a Package Name link.

This page displays detailed information about a particular content package. The following sections describe the content package details page UI elements.

#### Overview Tab

The following table describes the UI elements on the Overview tab on the content package details page.

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Info</b> section  </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Filename</b> </td>
<td> The name of the content package file. </td>
</tr>

<!-- BG: This should be updated for US 2516 G3.1, KB to GB --> 
<tr style="background-color: white; color: black;">
<td> <b>Size</b> </td>
<td> The size of the content package file, in bytes. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Downloaded</b> </td>
<td> The date and time at which the content package file was imported to the Cloud OS Administration node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Executed</b> </td>
<td> The date and time at which the content package was installed. </td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Product Details</b> section  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Name</b> </td>
<td> The name of the content package. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Type</b> </td>
<td> The type of content package. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Version</b> </td>
<td> The content package version number. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Created By</b> </td>
<td> The entity that created the content package. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Publication Date</b> </td>
<td> The date and time that the content package was published. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Priority</b> </td>
<td> The priority of the content package. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Install Requires Admin Permissions</b> </td>
<td> "True" if installation of the content package requires administrator permissions, 
or "false" if installation of the content package does not require administrator permissions. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Install Requires Admin Node Reboot</b> </td>
<td> "True" if the Cloud OS Administration node will require a reboot after the content package is installed, 
or "false" if the Cloud OS Administration node will not require a reboot after the content package is installed.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Notes</b> </td>
<td> Any notes that are included with the content package. </td>
</tr>

</table> 


#### Log Tab

Click the Log tab to select a log to view.


### Import Package Dialog

To access: Select the Cloud tab, > Hot Fixes, and then click the **Import Package** button on the Hot Fixes page.

The following table describes the Import Package dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Choose File</b> button   </td>
<td> Click to open a standard operating system "open file" dialog box, in which you can browse to and select the content 
package to be imported to the Cloud OS Administration node from the client's local file system. 
Note that such package files have a .csu extension.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Import</b> button   </td>
<td> Click after choosing a valid content package (.csu) file using the <b>Choose File</b> button to import the file to the 
HP Cloud OS Administration node. If no file has been chosen, "No file chosen" will appear next to the <b>Choose File</b> button.  </td>
</tr>

</table> 



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Updates and Extensions

The following information provides details about the Updates and Extensions panel.

**Concepts::**

* [Updates and Extensions Overview](#updates-and-extensions-overview) 

**UI Descriptions:**

* [Updates and Extensions Page](#updates-and-extensions-page) 

* [Configure Dialog](#configure-dialog) 


### Updates and Extensions Overview

The updates and extensions feature allows you to connect to, list, and retrieve hot fixes and updates from the HP Cloud OS Distribution Network (CODN) 
and apply them to your HP Cloud OS environment. In this topic, such hot fixes and updates are referred to as *content packages*.

### Updates and Extensions Page

To access: Select the Cloud tab > Updates and Extensions.

The following table describes the Updates and Extensions page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Name</b> column </td>
<td> The name of the content package. Click on the name to open a panel that shows details of the content package. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Version</b> column </td>
<td> The version number of the content package. </td>
</tr>

<!-- BG: This should be updated for US 2516 G3.1, KB to GB --> 
<tr style="background-color: white; color: black;">
<td> <b>Size (Bytes)</b> column </td>
<td> The size of the content package file, in bytes. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Provider</b> column </td>
<td> The entity (such as a company name) that is the provider of the content package. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Type</b> column </td>
<td> The type of content package. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Status</b> </td>
<td> The current status of the content package. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Actions</b> </td>
<td> Buttons, menus, or other items that can be used to perform some action. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Filter</b> button and field </td>
<td> Enter a character string into the field to display only those content packages in the list that 
contain the string in any column. The filter function is not case sensitive. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Configure</b> </td>
<td> Click to open the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#configure-dialog">Configure Dialog</a>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Download</b> button </td>
<td> Click, and then click the <b>Download</b> button in the confirmation box that appears to download a 
copy of the content package from the catalog to your local system where you can use it. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Install</b> button </td>
<td> Click to start the content package installation process. If no install action is supported for a particular item, 
the Install button will not be shown. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>More > View Progress</b> </td>
<td> Select to view the progress of the operation. </td>
</tr>

</table> 



### Configure Dialog

To access: Select the Cloud tab > Updates and Extensions, and then the **Configure** button.

The following table describes the Configure dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI Elements</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>User Name</b>  </td>
<td> Enter the email address that you entered when you set up your account to access the HP Cloud OS Distribution Network (CODN). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Password</b>  </td>
<td> Enter the password that you entered when you set up your account to access the HP Cloud OS Distribution Network. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Sign up now</b> link  </td>
<td> Click to go to the "Create Account" page of the HP Cloud OS Distribution Network web site, where you can sign up for an account to access the network. </td>
</tr>

</table> 



<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

