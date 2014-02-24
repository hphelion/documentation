---
layout: default
title: "Launch Administration Dashboard for Post-Deployment Tasks"
permalink: /cloudos/moonshot/install/launch-admin-dashboard/
product: moonshot

---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/updates-and-extensions/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | NEXT &#9654; </p>

# Launch Administration Dashboard for Post-Deployment Tasks

After a cloud environment has been created in the Operational Dashboard, you manage the cloud through the Administration Dashboard, which provides a simplified means of creating and managing Cloud resources and topology design documents.  

The Administration Dashboard enables you to provision a composite topology described by topology design documents. Importantly for HP Moonshot environments, the Administration Dashboard also lets you <b>manage the Moonshot chassis</b> that are assigned to run specific workloads in your cloud.

This topic describes a set of baseline post-deployment tasks that you should perform on your cloud. Here we are highlighting just the minimal steps you should follow to get started with the Administration Dashboard, and verify that your deployed cloud is operating properly.  

* [How to Access the Administration Dashboard](#how-to-access-the-administration-dashboard)

* [Create a Keypair](#create-a-keypair)

* [Upload Cloud Images](#upload-cloud-images)

* [View the Provided Flavor](#view-the-provided-flavor)

* [Manage your Moonshot Chassis](#manage-your-moonshot-chassis)

* [Launch an Instance from an Image](#launch-an-instance-from-an-image)

* [Next Steps](#next-steps)


## How to Access the Administration Dashboard

You can access the Administration Dashboard in one of two ways:

* Open a Google Chrome or Firefox browser. Enter the URL of your Cloud Controller node's public IP address. Login with the Admin account's username and password that you specified previously in the Operational Dashboard on the <b>Create Cloud</b> > <b>Attributes</b> dialog. 

* Or, from within the Operational Dashboard, click <b>Manage Clouds</b> > <b>More</b> > <b>Launch Dashboard</b> for the cloud you created.


## Create a Keypair

Keypairs serve as a means of accessing the instance. One immediate advantage that this method has over traditional password authentication 
is you can be authenticated by the server without ever having to send your password over the network. Users need to create keypair(s) for 
their individual projects.

To create a keypair, do the following:

1. In the Administration Dashboard, select the <b>Project</b> tab.  The tab displays with options in the left panel.

2. Select the <b>Access and Security</b> option from the left panel to display more options.

3. Click <b>Access and Security</b> to display a page with three tabs: Keypairs, API Access and Authentication Token. By default, Keypairs is the active tab.

4. Click <b>Create Keypair</b> to display the Create Keypair dialog box.

5. In the Keypair Name box, enter a Keypair name. For example, <code>testonlykeypair</code>, or any custom name, with no spaces.

6. Click <b>Create Keypair</b>.  The keypair is downloaded to the browser session. If it does not download automatically, a message is displayed to download the keypair from a link.
 * The key is downloaded in the form of a PEM file.
 * The key can only be downloaded once.
 * It is very important to store the key in a safe location.

7. From the left panel, select the <b>Access and Security</b> option again. The keypair is displayed on the page.


## Upload Cloud Images

An image is required to install an Operating System in an instance. To upload cloud images in the Administration Dashboard:

<ol>

<li> Click any of the tabs: <b>Cloud</b>, <b>Region</b>, or <b>Project</b>.  The selected tab displays options in the left panel. </li>

<li> If you selected the <b>Project</b> tab, select <b>Infrastructure</b> > <b>Images</b>.  If you started on the <b>Cloud</b> or <b>Region</b> tab, click <b>Images</b>.
<br /> <br />
<b>Note</b>: You must create image types such as QCOW2 and AMI with the associated Amazon Kernel Image (AKI) and Amazon RAMdisk Image (ARI). 
Recommendation: create the images in the following sequence: Amazon Kernel Image (AKI), Amazon RAMdisk Image (ARI) and QCOW2. 
The Administration Dashboard displays the <b>Kernel Image</b> drop-down list and <b>RAM Disk Image</b> drop-down list when the selected format is QCOW2 or AMI.

</li>

</ol>

Next, perform the steps in the following AKI, ARI, and QCOW2-QEMU sections.

### To create an Amazon Kernel Image (AKI)

<ol>

<li> Click <b>Create Image</b> to open the Create An Image dialog box.
<li> In the <b>Name</b> box, enter a name for the image.
<li> (Optional) In the <b>Description</b> box, enter a description for the image.
<li> From the <b>Format</b> drop-down list, select <b>AKI</b>.
<li> From the <b>Image Source</b> drop-down list, do one of the following:

<ul>
<li>Select <b>Image Location</b> from the drop-down list. The Image Location box is displayed.
<li>In the <b>Image Location</b> box, enter the HTTP URL from which to load the AKI image.
</ul>

<p> <b>Or:</b> </p>

<ul>
<li>Select <b>Image File</b> from the drop-down-list.  
<li>Click <b>Choose File</b> to browse to the AKI image.
<li>Select the AKI Image to upload.
</ul>

</li>

<li> The <b>CPU Architecture</b> drop-down list displays <b>x86_64</b> by default. The HP Moonshot hardware supports the above specification.

<li>In the <b>Minimum Disk</b> box,  specify a minimum size required to boot the image. If no input is entered, the minimum value defaults to 0.

<li>In the <b>Minimum Ram</b> box, specify a minimum size required to boot the image. If no input is entered, the minimum value defaults to 0.

<li> Click the checkbox next to <b>Public</b>. This will make the image visible to all users.

<li> Click the checkbox next to <b>Protected</b>.  This makes the image read-only.

<li> Click <b>Create Image</b>.  A message is displayed on successful creation. 

</ol>



### To create an Amazon RAMdisk Image (ARI)

<ol>

<li> Click <b>Create Image</b> to open the Create An Image dialog box.
<li> In the <b>Name</b> box, enter a name for the image.
<li> (Optional) In the <b>Description</b> box, enter a description for the image.
<li> From the <b>Format</b> drop-down list, select <b>ARI</b>.
<li> From the <b>Image Source</b> drop-down list, do one of the following:

<ul>
<li>Select <b>Image Location</b> from the drop-down list.  
<li>In the <b>Image Location</b> box, enter the HTTP URL from which to load the ARI image.
</ul>

<p> <b>Or:</b> </p>

<ul>
<li>Select <b>Image File</b> from the drop-down-list.  
<li>Click <b>Choose File</b> to browse to the ARI image.
<li>Select the ARI Image to upload.
</ul>

</li>

<li> The <b>CPU Architecture</b> drop-down list displays <b>x86_64</b> by default. The HP Moonshot hardware supports the above specification.

<li>In the <b>Minimum Disk</b> box,  specify a minimum size required to boot the image. If no input is entered, the minimum value defaults to 0.

<li>In the <b>Minimum Ram</b> box, specify a minimum size required to boot the image. If no input is entered, the minimum value defaults to 0.

<li> Click the checkbox next to <b>Public</b>. This will make the image visible to all users.

<li> Click the checkbox next to <b>Protected</b>.  This makes the image read-only.

<li> Click <b>Create Image</b>.  A message is displayed on successful creation. 

</ol>



### To create a QCOW2-QEMU Image

<ol>

<li> Click <b>Create Image</b> to open the Create An Image dialog box.
<li> In the <b>Name</b> box, enter a name for the image.
<li> (Optional) In the <b>Description</b> box, enter a description for the image.
<li> From the <b>Format</b> drop-down list, select <b>QCOW2-QEMU Emulator</b>.
<li> From the <b>Image Source</b> drop-down list, do one of the following:

<ul>
<li>Select <b>Image Location</b> from the drop-down list.  
<li>In the <b>Image Location</b> box, enter the HTTP URL from which to load the QCOW2-QEMU image.
</ul>

<p> <b>Or:</b> </p>

<ul>
<li>Select <b>Image File</b> from the drop-down-list.  
<li>Click <b>Choose File</b> to browse to the QCOW2-QEMU image.
<li>Select the QCOW2-QEMU Image to upload.
</ul>

</li>

<li> The <b>CPU Architecture</b> drop-down list displays <b>x86_64</b> by default. The HP Moonshot hardware supports the above specification.

<li>In the <b>Minimum Disk</b> box,  specify a minimum size required to boot the image. If no input is entered, the minimum value defaults to 0.

<li>In the <b>Minimum Ram</b> box, specify a minimum size required to boot the image. If no input is entered, the minimum value defaults to 0.

<li> Click the checkbox next to <b>Public</b>. This will make the image visible to all users.

<li> Click the checkbox next to <b>Protected</b>.  This makes the image read-only.

<li> From the <b>Kernel Image</b> drop-down list, select the corresponding kernel image.

<li> From the <b>RAM Disk Image</b> drop-down list, select the corresponding RAM disk image.

<li> Click <b>Create Image</b>.  A message is displayed on successful creation. The image displays in the <b>Images</b> page of the Cloud Tab.

</ol>


## View the Provided Flavor

Flavors are machine configurations that describe the amount of memory, number of CPUs, and ephemeral disk space available. When you register a chassis, a flavor is created by default. 

The Administration Dashboard presents the following pre-defined flavors for HP Moonshot environments, depending on the server cartridge type.

<table style="text-align: left; vertical-align: top; min-width:700px;">

<tr style="background-color: #C8C8C8;">
<tr>
<th>Flavor name</th>
<th>Server Cartridge Type</th>
<th>Configuration</th>
<tr>

<tr style="background-color: white; color: black;">
<td> hp_moonshot_server </td>
<td> HP ProLiant Moonshot Server Cartridge </td>
<td> CPUs: 2. <br /> CPU Architecture: x86_64. <br /> RAM MBs: 8192. <br /> Root Disk GBs: 450. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> hp_moonshot_m300 </td>
<td> HP ProLiant m300 Server Cartridge </td>
<td> CPUs: 8. <br /> CPU Architecture: x86_64. <br /> RAM MBs: 32768. <br /> Root Disk GBs:  <b>TBS</b> </td>
</tr>

</table>

As part of your initial post-deployment steps, you do not need to create new flavors to verify that your cloud is operating properly.

If you're curious, to see how the flavors are defined already:

1. On the <b>Region</b> tab, select a <b>Current Compute Region</b>.

2. Click <b>Flavors</b> to open the Flavors window.

3. Find the flavor you want to view (in this case, hp_moonshot_server or hp_moonshot_m300, depending on your cartridge server type), and click 
<b>Edit Flavor</b> to open the Edit Flavor dialog box.

4. Recommendation: For now, keep the pre-defined values.

5. Click <b>Cancel</b>.

Later, when you want to create new flavors, or edit existing ones, start in this topic of the Administration Dashboard 
Help: [How to Access Flavors and Flavor Extra Specs](/cloudos/moonshot/manage/administration-dashboard/tasks-by-tab/#how-to-access-flavors-and-flavor-extra-specs).

## Manage your Moonshot Chassis

This section defines the process to add HP Moonshot servers to your cloud. 

Note: This function can be performed by the Cloud Administrator or any member who is part of the Cloud group.

1. In the Administration Dashboard, select the <b>Cloud</b> tab.  The tab displays options in the left panel.

2. From the left panel, select <b>Moonshot Management</b> to display the <b>Datacenter View</b>. This option enables two views: 
 * Datacenter View  
 * Single Chassis View. 
 
By default, Datacenter View is the active view.

### Datacenter View

The Datacenter View displays the Add, Edit, and Delete options at the top, and the Events Log panel on the right.

The Datacenter View also displays a search option to allow you to search for a specific cartridge.

To view the chassis details, toggle between two views in the Datacenter:

* Grid view: <img src="media/moonshot-datacenter-grid-view.png" title="Moonshot Datacenter grid view" />

* Table view: <img src="media/moonshot-datacenter-table-view.png" title="Moonshot Datacenter table view" />

Double click the Chassis graphic to display the <b>Single Chassis View</b>.

<b>Note</b>: Different chassis views can only be seen if the chassis displays in the Datacenter.

#### Table View

( Integrating the rest of the content from 2/21 to 2/23. )

#### Add a Chassis

( Integrating the rest of the content from 2/21 to 2/23. )

### Single Chassis View

The Single Chassis View displays the detailed information about the selected Chassis in two sections:

* Chassis Snapshot

* Table

The Single Chassis View also displays the Events log panel on the right. 

Example:
 
<img src="media/moonshot-single-chassis-view-example.png" height="95%" title="Moonshot Single Chassis View example" />

( Integrating the rest of the content from 2/21 to 2/23. )


## Launch an Instance from an Image

The next post-install step is to launch an instance from an image.  This task is important to verify that network connectivity is present and working, and that your 
cloud is operational. 

Here are the steps:

1. In the Administration Dashboard, select the <b>Project</b> tab.  

2. The tab displays options in the left panel. From the left panel, click <b>Infrastructure</b> and then select <b>Images</b>.  The Images page is displayed.

3. Click <b>Launch</b> next to the image (<b>TBS: which one or which type?  example?</b>) listed in the table.

4. A Launch Instance dialog box displays with four tabs: Details, Access & Security, Networking, and Post-Creation. By default, Details is the active tab.

5. On the <b>Details</b> tab:
 * From the <b>Image</b> drop-down list, select the image.
 * From the <b>Availability Zone</b>, select the zone.
 * In the <b>Instance Name</b> box, enter a name for the instance.
 * From the <b>Flavor</b> drop-down list, select the flavor.  In this case, it should be hp_moonshot_server or hp_moonshot_m300, depending on your cartridge server type.
 * In the <b>Instance Count</b> box, enter 1, or more than 1 if you intend to launch multiple instances.  Recommendation: for this initial post-install process, enter 1.
 
6. On the Access & Security tab, from the Keypair drop-down list, select a value from the list.

7. On the Networking tab, no networks will be listed in the Selected Networks section. You should select the <b>private network</b> from the <b>Available networks</b> section.

8. Click <b>Launch</b>.

The view changes to <b>Project</b> > <b>Infrastructure</b> > <b>Instances</b>.

## Next Step

At this point, you're done with the installation & configuration steps (including post-install).  You can now proceed to the [Manage](/cloudos/moonshot/manage/) section of this documentation site. It includes information about utilities, troubleshooting, Disk Image Builder, and the backup process. Also included from the Manage page is the [HP Cloud OS for Moonshot Administration Dashboard Help](/cloudos/moonshot/manage/administration-dashboard/), where you can get more 
information about the dashboard's features, roles, and tasks.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



