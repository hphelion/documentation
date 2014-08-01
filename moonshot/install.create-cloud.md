---
layout: default
title: "Manage Nodes and Create a Cloud"
permalink: /cloudos/moonshot/install/create-cloud/
product: moonshot

---
<!--PUBLISHED-->


<script> 

function PageRefresh { 
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/cloudos/moonshot/install/complete-admin-node-installation/">&#9664; PREV</a> | <a href="/cloudos/moonshot/install/">&#9650; UP</a> | <a href="/cloudos/moonshot/install/create-compute-regions/">NEXT &#9654;</a> </p>

# Manage Nodes and Create a Cloud

Now that the Admin Node is installed, it's time to manage the nodes, and then create a cloud. 

<!-- Optional: This topic also explains how to setup a Swift Controller node (Ring-compute, Proxy,  and Dispersion) and the separate Swift Storage Node(s). -->

* [Manage Cloud Controller and Baremetal Host](#manage-cloud-controller-and-baremetal-host)
<!-- * [Complete Storage Configuration](#complete-storage-configuration) --> 

* [Create a Cloud](#create-a-cloud)

## Manage Cloud Controller and Baremetal Host

Before you starting managing the Cloud Controller and Baremetal Host, ensure that the boot order on all nodes (virtual machines) is configured to boot from the network first.

>**Note:** When creating virtual machines on a hypervisor, you have to set the first boot option to PXE boot since there is no operating system installed on  the VMs. After the OS is installed these VMs will not search for a PXE boot even if they fail to boot from hard disk.

1. Power ON the Controller and Baremetal Host.

2. In the Operational Dashboard, select the <b>Cloud</b> tab > <b>Manage Nodes</b>. 

3. Once the Cloud Controller and the Baremetal Host finish booting up, the nodes display in the table with their alias names set to their MAC address 
(address of the NIC associated with the Admin network). Each node will be in a <b>Not Allocated</b> state.

4. Select <b>Edit Node</b> for each node to rename the MAC address in the Alias column to a more meaningful name such as cloudcontroller, compute1, compute2. **Note:** The node name can only be letters (capitalization is allowed) and numbers with no spaces. The node table then displays with the new alias names.

5.	Click <b>More</b> against each node to display a drop-down list.

6.	Select <b>Allocate Node</b>.  This installs the OS and completes the setup and configuration of nodes so that services can be deployed. The nodes go through different states like Not Allocated, Hardware, Installing, Installed, Readying and Finalizing, before displaying the Allocated state. **Note: It may take around 12+ minutes for each node to get allocated.

7. (Optional) Click <b>Alias</b> to view the details of the nodes.

<!--
<p style="background-color:#f8f8f8; padding:4px 4px 4px 4px; border: 1px dotted #000000;"> <b>Tips:</b> Access the baremetal node's remote console to monitor the operating system installation. Some of your hardware may require non-free firmware files to operate. The firmware can be loaded from removable media, such as a USB stick or CD/DVD. If a dialog box displays prompting you to load missing firmware, provide the appropriate drive. In the case where a node results in a status = Off, select the <b>More</b> > <b>Reboot Node</b> action for the node.  If you want to set the node to the Not Allocated state, select <b>More</b> > <b>Reset Node</b> action for the node. </p>
-->
To search for a particular node:

* In the Nodes page, in the Filter textbox, enter the search criteria.

* The search results are displayed in the table.


## Create a Cloud

To create a cloud:

1. In the Operational Dashboard, select the <b>Cloud</b> tab > <b>Manage Clouds</b>.

2. Click <b>Create Cloud</b> to open the Create Cloud dialog.

3. Specify a <b>Cloud Name</b>. This will be the name that is used to initialize Keystone and will be displayed in the Administration Dashboard. 
**Note:** A cloud name must contain only letters and numbers. It cannot contain spaces or special characters.

4. Select the <b>Controllers</b> tab and specify which node will have the Cloud Controller, Network Controller, and Storage Controller respective services. You install all these core controller services on different nodes or on the same Cloud Controller.

5. Select the Attributes tab to specify property values required to create a Cloud.  The following attributes are displayed. Retain the default values.
 * Cloud Type &mdash; By default Physical is displayed. **Note:** Physical implies that Baremetal provisioning is supported.
 * Keystone Signing &mdash; Set the Keystone Signing method based upon the authentication scheme: UUID or PKI.  PKI (the default setting) is a large token that contains token information such as the user ID and user roles. UUID is the alternative 32-character token choice.
 * DHCP &mdash; By default it is True. If you do not want to use DHCP, change the DHCP Boolean to False.
 * Networking mode &mdash; Only Flat is supported.
 * Provider Network Name &mdash; Specify a network name; by default flat_network1 is displayed.
 * NIC Connected to provider network &mdash; Set it to the NIC of your nova_flat network. For example: eth1.
 * Local Volume File Name &mdash; This is the name of the file to be created on the target node's file system and used with losetup when creating the logical volume group. No need to change the default value.
 * Maximum Volume File Size (GB) &mdash; Specify the maximum size of the file created on the target node's file system to represent the size of the cinder volume. If the file size is too big for the file system, the size of the file will be capped at 90% of the free space in that file system (at the time of creation). Best practice is to adjust the size to a value appropriate for the file-system associated with the Local Volume File. No need to change the default value.
 * Admin User Password &mdash; Admin user's password for a granted administrator role on an Admin project in the Administration Dashboard.
 * Arch User Password &mdash; Architect user's password for a granted architect role on an Admin project in the Administration Dashboard.
 * Trash User Password &mdash; Trash user's password for a granted user's role on a trash project in the Administration Dashboard.
  
**Remember the passwords** &mdash; You will use them to log into the HP Cloud OS for Moonshot Administration Dashboard.

When you're ready, click **Create Cloud**. The cloud will go through a series of steps to create an active cloud, showing the percent (%) completed. When creating a cloud or a compute region, all of the nodes involved are first checked to ensure they can be resolved on the network. This verification process can take (up to) approximately five minutes.  During this time, the progress percentage will remain at 1%. If any of the nodes fail to resolve during the verification process, the cloud or region creation will fail. 

The overall process from the time you click <b>Create Cloud</b> takes around twenty minutes to complete.

## Next Step

Proceed to the next topic, [Create Compute Regions](/cloudos/moonshot/install/create-compute-regions).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

