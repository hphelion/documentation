---
layout: default
title: "Operational Dashboard: Cloud Tab"
permalink: /cloudos/moonshot/manage/operational-dashboard/cloud-tab/
product: moonshot

---



<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab/">&#9664; PREV</a> | <a href="/cloudos/moonshot/manage/operational-dashboard/">&#9650; UP</a> | <a href="/cloudos/moonshot/manage/operational-dashboard/settings-tab/">NEXT &#9654;</a> </p>

# Operational Dashboard: Cloud tab

The Cloud tab contains the following panels on which you complete the installation process to create a cloud, and 
download install modules and plugins. For the installation process, you must complete the Manage Nodes and Manage Clouds panels in the order 
they are displayed. 

* [Manage Nodes](#manage-nodes)
  
* [Manage Clouds](#manage-clouds)
    
* [Updates and extensions](#updates-and-extensions) 

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:600px; border: 1px dotted #000000;"> <b>Note:</b> The Cloud tab does not appear until you have 
completed all the installation steps on the <a href="/cloudos/moonshot/manage/operational-dashboard/environment-tab">Environment tab</a>.</p>

For procedural instructions, see [Install and configure your cloud](/cloudos/moonshot/install/).

## Manage Nodes

The following information provides details about the Manage Nodes panel.

**Concepts:**

* [Manage Nodes overview](#manage-nodes-overview)

**UI descriptions:**

* [Manage Nodes page](#manage-nodes-page)

* [Edit Node dialog](#edit-node-dialog)

* [Manage Nodes Details page](#manage-nodes-details-page) 


### Manage Nodes overview

The Manage Nodes panel lists all of the nodes that have been discovered through the PXE-boot process. Nodes that are Allocated can be 
subsequently used as part of a Cloud installation. Nodes can be edited so that they have meaningful names or descriptions. Clicking on a node's 
ID gives more information about that node, including its role in a cloud deployment.

Before you begin, ensure that all HP Cloud OS for Moonshot prerequisites are fulfilled.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px; border: 1px dotted #000000;"> <b>Note:</b> Ensure that the boot order on all nodes is configured to 
boot from the network first (this only occurs once as the PXE service will not try to network boot a node again if it has already done so).</p>

For procedural instructions on setting up and configuring your nodes, see [Install and configure your cloud](/cloudos/moonshot/install).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### Manage Nodes page

**To access**: Select the **Cloud** tab > **Manage Nodes**.

The following table describes the Manage Nodes page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Alias</b> column </td>
<td> Renamed MAC address (in the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#edit-node-dialog">Edit Node dialog</a>) to a more 
meaningful name such as controllercompute, cloudcontroller, compute1, compute2.
<br /> <br />
Once the Cloud Controller and Compute nodes have finished booting up, each node displays in the table and indicates the Alias Name set to the node's MAC address (of the NIC associated with the Administration Network). Each node will be in the Not Allocated state.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Node ID</b> column </td>
<td> The node's unique identifier, which is the MAC address of the node's NIC that is associated with the Administration network. It is read only. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Status</b> column </td>
<td> As the Cloud Controller and Compute nodes are being allocated, they progress through these different states: 
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
<td> Entering a text string into the field will display only those entries in the list of managed nodes that contain the string in any column on the row. </td>
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
<td> Select to complete the node allocation process, which sets up and configures the node so that OpenStack services can be deployed on it.
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

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



### Edit Node dialog

**To access**: Select the **Cloud** tab > **Manage Nodes** > **Edit Node** for the node you want to edit.

The following table describes the Edit Nodes dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Alias</b> </td>
<td> Type a meaningful name,  such as controllercompute, cloudcontroller, compute1, compute2, for the MAC address for the Controller and Baremetal host.
<br /> <br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> The node name can only be letters (capitalization is allowed) 
and numbers with no spaces or special characters. </p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Description</b>   </td>
<td> Optional &mdash; Type a description for each node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <nobr> <b>Update Node</b> </nobr> </td>
<td> Click to save the settings and return to the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#manage-nodes-page">Manage Nodes page</a>.  </td>
</tr>

</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>




### Manage Nodes Details page

**To access**: Select the **Cloud** tab > **Manage Nodes** and click the node name link.

This page displays all the values used for the selected node. The following table describes the Manage Nodes Details page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
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
<td> User-defined name for the MAC address of the selected node. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Description</b> </td>
<td> Optional description that was entered for the corresponding node. None is the default, if no description was entered.  </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Domain</b> </td>
<td> The Cloud OS for Moonshot Administration node acts as a Domain Name Server (DNS server) for all the managed nodes. This domain name is used in the Fully Qualified Domain Name (FQDN) for the managed nodes.  </td>
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
<td style="min-width:120px;"> <b>Role(s)</b> </td>
<td> Type of role(s) for which the selected node has been specified: 
Cloud Controller, Network Controller, and Storage Controller respective services, and Baremetal host.   </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Region</b> </td>
<td> Name of the compute region in which the selected node belongs. </td>
</tr>

</table> 
  




<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Manage Clouds

The following information provides details about the Manage Clouds panel.

**Concepts:**

* [Manage Clouds overview](#manage-clouds-overview)

**UI descriptions:**

* [Manage Clouds page](#manage-clouds-page)
    
* [Create Cloud dialog](#create-cloud-dialog)

* [Create Region dialog](#create-region-dialog)
	
* [Manage Clouds Details page](#manage-clouds-details-page)



### Manage Clouds overview

The Manage Clouds panel lists all the clouds and compute regions available in the current environment and lets you manage clouds and their associated services. The simplest cloud has one Compute Region with one Compute Controller that manages the Baremetal host. 

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px; border: 1px dotted #000000;"> <b>Note:</b> Each region must use unique 
nodes &mdash; managed nodes cannot be shared between regions.</p> 


### Manage Clouds page {#manage-clouds-page}

**To access**: Select the **Cloud** tab > **Manage Clouds** and click the cloud name link.

The following table describes the Manage Clouds page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
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
<td> The status of the cloud being created or removed. The status goes through a series of steps showing the % completed. When the cloud and compute region are created, the status displays Active.   </td>
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
You can login with the Admin account and password you specified on the Create Cloud > Attributes dialog. The default login/password are: <b>Admin</b> and <b>secretword</b>.
<li><b>Extend Compute Region</b> &mdash; Opens the Extend Compute Region dialog.
<li><b>Reduce Compute Region</b> &mdash; Opens the Reduce Compute Region dialog; displays only if the compute region is extended.

<li><b>Remove Cloud</b> &mdash; Opens the Remove Cloud dialog.
</ul>
<br />
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> Some of the above actions might not always be available, 
depending upon the context of the cloud and the compute regions.</p>
</td>
</tr>

</table> 
  
### Create Cloud dialog {#create-cloud-dialog}

**To access**: Select the **Cloud** tab > **Manage Clouds** and click **Create Cloud**.

The following table describes the Create Cloud dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Cloud Name</b>  </td>
<td> Type the name of the cloud. This is the name that is used to initialize Keystone and will be displayed in the Administration Dashboard.
<br /> <br/>
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> A cloud name must contain only letters and numbers. 
It cannot contain spaces or special characters.</p>
</td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Controllers Tab</b> 
</td>
</tr>

<tr style="background-color: white; color: black;">
<td colspan="2"> Specify which node will have the Cloud Controller, Network Controller, and Storage Controller respective services. 
You can install all these core controller services on a single node, or on a dedicated node for each service.
<br /> <br/>
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Important:</b> You must have Powered On and Allocated the nodes 
on the Manage Nodes panel to be able to select which nodes to use here.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Cloud Controller</b> </td>
<td> Select which allocated node will have the Cloud Controller service. The Cloud Controller contains those services that are considered single services for a cloud environment, such as Keystone, Glance, Eden, Eve, and Focus, and define the boundaries of the cloud environment from an identity standpoint.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Network Controller</b> </td>
<td> Select which allocated node will have the Network Controller service. The Network Controller contains Neutron's server, l3 agent 
and DHCP services. It is a single service in a cloud and can co-exist with the cloud controller services.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Storage Controller</b> </td>
<td> Select which allocated node will have the Storage Controller service.
</td>
</tr>

<tr style="background-color: #f8f8f8; color: black;">
<td colspan="2"> <b>Attributes Tab</b> </td>
</tr>

</tr>

<tr style="background-color: white; color: black;">
<td> <b>Cloud Type</b> </td>
<td>By default, Physical is displayed. </td>
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
<td> <b>DHCP enabled on Baremetal IPMI Network</b> </td>
<td>By default, is True. You can change this to False if you do not have DHCP running on your IPMI network. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Networking Mode</b> </td>
<td> Only Flat is supported. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Provider Network Name</b> </td>
<td> Specifiy a network name; by default flat_network1 is displayed. </td>
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
<td> Trash user's password for a granted trash user's role on a trash project(s) in the Administration Dashboard.
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
  

### Create Region dialog {#create-region-dialog}

**To access**: Select the **Cloud** tab > **Manage Clouds** and click **Create Compute Region** for the corresponding cloud.

<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; min-width:700px; border: 1px dotted #000000;"> <b>Note:</b> Successfully creating a region automatically creates a default resource pool for that region, which is configured and visible 
in the Administration Dashboard. For details, see the <a href="/cloudos/moonshot/manage/administration-dashboard/">HP Cloud OS for Moonshot Administration Dashboard Help</a>. </p>

The following table describes the Create Region dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Region Name</b>  </td>
<td> This will be the region name that is used to initialize Keystone and to be displayed in the Administration Dashboard.
<br /> <br/>
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Note:</b> A region name must contain only letters and numbers; it cannot contain spaces or special characters.</p>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Controller</b>  </td>
<td> Select the node that will have the Compute Controller services.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Nodes</b> service  </td>
<td> Specify which nodes will have the Compute Nodes service in one of the following ways:
<ul>
<li>Choose a number from the drop-down list to auto-select check boxes of the node(s) for you.</li>
<li>Individually select the check boxes of the node(s) you want.</li>
</ul>
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Attributes</b> tab </td>
<td> 
Use to specify property values required to create a Compute Region. From the Compute Host Type, select Moonshot Servers.
</td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Create Compute Region</b> </td>
<td> Click to begin creating the Compute Region.
<br /> <br />
On the Manage Clouds page, the compute region will go through a series of steps to create an active compute region, 
showing the % completed until the Cloud's Status is Active. This indicates that the cloud and compute region have been successfully created.
<br /> <br />
You can now add additional compute regions. The added compute regions appear on the Manage Clouds page as a comma-separated list. </td>
</tr>

</table>  

### Manage Clouds Details page

**To access**: Select the **Cloud** tab > **Manage Clouds** and click the cloud name link.

This page displays the values you used to create the cloud and compute regions.

The following table describes the Manage Clouds Details page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
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
<td> Timestamp of the date and time the cloud creation completed. </td>
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
<li><b>Cloud Type</b> &mdash; Physical</li>
<li> <b>Networking Mode</b> &mdash; Specified networking mode: <code>flat</code> (default). </li>
<li><b>Local Volume File Name</b> &mdash; /var/lib/cinder/volume.raw</li>
<li><b>DHCP enabled on Baremeta IPMI-enabled network</b> &mdash; True by default.</li>
<li> <b>Maximum Volume File Size (GB)</b> &mdash; Number specified for the maximum volume allowed in gigabytes. </li>
<li><b>Provider Network Name</b> &mdash; flat_network1 by default.</li>
<li><b>NIC Connected to Provider Network</b> &mdash; eth1</li>
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
<td>  	Node designated to be the Compute Controller for the selected region. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Nodes</b> </td>
<td> List of the allocated compute nodes for the selected region. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Compute Region Attributes</b> </td>
<td> <b>Hypervisor</b> &mdash; designated hypervisor for the selected region; Baremetal by default.
<p>Type of Barmetal Node &mdash; Moonshot Server</p>
<p>CPU Architecture &mdash; x86_64</p>  </td>
</tr>

</table> 
  

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Updates and Extensions

The following information provides details about the Updates and Extensions panel.

**Concepts:**

* [Updates and Extensions overview](#updates-and-extensions-overview) 

**UI Descriptions:**

* [Updates and Extensions page](#updates-and-extensions-page) 

* [Configure dialog](#configure-dialog) 

* [Import dialog](#import-dialog) 


### Updates and Extensions overview

The updates and extensions feature allows you to connect to, list, and retrieve hot fixes and updates from the HP Cloud OS Distribution Network (CODN) and apply them to your HP Cloud OS for Moonshot environment. You can also import hot fixes and updates from a file system to the HP Cloud OS for Moonshot environment and install them. In this topic, such hot fixes and updates are referred to as *content packages*. After a package is installed, you can view product and package details.

The Update and Extensions page will be blank for the first-time user. You need to configure your credentials for the CODN to view the updates.

### Updates and Extensions page

**To access**: Select the **Cloud** tab > **Updates and Extensions**.

The following table describes the Updates and Extensions page UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
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
<td> The size of the content package file in bytes. </td>
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
<td> Enter a character string into the field to display only those content packages in the list that contain the string in any column. The filter function is not case-sensitive. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Configure</b> button</td>
<td> Click to open the <a href="/cloudos/moonshot/manage/operational-dashboard/cloud-tab/#configure-dialog">Configure dialog</a>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Download</b> button </td>
<td> Click, and then click the <b>Download</b> button in the confirmation box that appears to download a copy of the content package from the catalog to your local system where you can use it. </td>
</tr>


<tr style="background-color: white; color: black;">
<td> <b>More > View Progress</b> </td>
<td> Select to view the progress of the operation. The View Progress dialog box that opens shows the progress of the operation at the time it is opened.</td>
</tr>


<tr style="background-color: white; color: black;">
<td> <b>More > Install</b> </td>
<td> Select to start the content package installation process. If install is not supported for a particular item, the install option will not be shown. </td>
</tr>

</table> 


### Configure dialog

**To access**: Select the **Cloud** tab > **Updates and Extensions**, and then the **Configure** button on the Updates and Extensions page.

The following table describes the Configure dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
<th>Description</th>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>User Name</b>  </td>
<td> Enter the email address that you entered when you set up your account to access the CODN. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> <b>Password</b>  </td>
<td> Enter the password that you entered when you set up your account to access the CODN. </td>
</tr>

<tr style="background-color: white; color: black;">
<td style="min-width:150px;"> <b>Sign up now</b> link  </td>
<td> If you do not have an account with CODN, click <b>Sign up now</b>. You will be redirected to the "Create Account" page of the CODN web site where you can sign up for an account to access the network. </td>
</tr>

</table> 

### Import Package dialog

**To access**: Select the **Cloud** tab, > **Updates and Extensions**, and then click the **Import** button on the Updates and Extensions page.

The following table describes the Import Package dialog UI elements:

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<th>UI element</th>
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
HP Cloud OS for Moonshot Administration node. If no file has been chosen, "No file chosen" will appear next to the <b>Choose File</b> button.  </td>
</tr>

</table> 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

