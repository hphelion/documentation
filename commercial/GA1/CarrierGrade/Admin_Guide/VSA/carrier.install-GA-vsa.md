---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Installation: Deploy and Configure HP StoreVirtual VSA"
permalink: /helion/openstack/carrier/install/vsa/
product: carrier-grade
product-version1: HP Helion OpenStack Carrier Grade
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, Paul F

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/carrier/install/vsa/overview/">&#9664; Cinder Block Storage Using HP StoreVirtual VSA </a> | <a href="/helion/openstack/carrier/install/post-kvm/">&#9650; Post-Installation for KVM Hypervisor</a> | <a href="/helion/openstack/carrier/undercloud/oc/config/storevirtual/">Working With StoreVirtual Backends &#9654;</a>
</p> 


# HP Helion OpenStack&#174; Carrier Grade (Alpha): Installation: Deploy and Configure HP StoreVirtual VSA  

This page provides detailed instructions on deployment of HP StoreVirtual VSA Storage Nodes, and their configuration as Cinder backend. It covers the following topics:

* [Deployment and Configuration Procedure Overview](#high-level-view)
* [Installing HP StoreVirtual VSA Centralized Management Console (CMC) on Linux](#install-hp-storevirtual-cmc)
   * [Prerequisites](#prerequisites)
   * [Installation](#installation)
* [Deploying HP StoreVirtual VSA storage sytems](#deploy-vsa)
   * [Prerequisites](#prerequisites-vsa)
   * [Enrolling the new Baremetal server](#enroll-new-baremetal-server)
* [Verifying the StoreVirtual installation status](#verify-install)
* [Creating  and adding a StoreVirtual Cluster to a new Management Group](#create-cluster) 
* [Adding a StoreVirtual node to an existing Management Group](#adding-a-node)
* [Next Steps](#next-steps)

## Installing HP StoreVirtual VSA

Use the following steps to install HP StoreVirtual VSA in your HP Helion OpenStack Carrier Grade cloud.

1. On the KVM host, change to the directory where your cloud is installed. 

    Go to the folder where cloud is created
    Change Directory to services/cinder/blocks/
    This folder will have a cinder_conf_default.sample file. Copy that file to cinder_conf_default and update with your customized values. The parameters in file are as follows. If required more parameters can be added to this file.

hplefthand_username = <username>
hplefthand_password = <password>
hplefthand_clustername = <Cluster Name>
hplefthand_api_url = https://<Iscsi Virtual IP address>/lhos

    Run hcfgproc. This will copy the parameters in cinder_conf_default to the cinder.conf file in the CND-SVC role.
    Next time when the CND-SVC role is implemented it will have the StoreVirtual Information.



##Verifying StoreVirtual installation status {#verify-install}

To verify that the StoreVirtual storage system is deployed successfully, perform the following checks:

1. Log in to the undercloud from seed.




		# ssh heat-admin@<undercloud IP address>

 		 
2. Source stackrc file and list the deployed StoreVirtual nodes.

		# source stackrc 
		# heat stack-list
		# nova list|grep vsa

3. Log in to the StoreVirtual system from the seed using the IP address retrieved 
from the above steps.

		# ssh heat-admin@<StoreVirtual system IP Address>

4. Check the log files.

		# tail-f /installer.log

	The message "*Started VM vsa-hostname*" indicates the successful installation of StoreVirtual on the machine.The IP Address of the StoreVirtual storage system can be retrieved from this log file.

5. To display the status of all the StoreVirtual VMs.

		# virsh list --all 

	To get more details on the installer logs, check the `/var/log/storevirtual-installer.log` file.

6. On successful installation of StoreVirtual VM on Baremetal, go to the Centralized Management Console (CMC) and discover the storage systems. 



## Creating a StoreVirtual Cluster and adding it to a new Management Group {#create-cluster}

**Prerequisites**

* CMC is already installed.
* HP StoreVirtual VSA (one or more) is deployed in the same management network where CMC is installed.


To create a cluster, do the following:

1. Open CMC.

    By default, the CMC is configured to discover the StoreVirtual nodes in the subnet in which it is installed. You can manually add the nodes also.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">CMC Main Page (opens in a new window)</a>

2. In the CMC UI, click **Find** and then click **Find Systems** from the left panel.<br /> Find Systems dialogue box is displayed.<br />

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc2.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Find Systems option (opens in a new window)</a>

3. You can choose **Add** or **Find** option to search the system. <br />Find option  starts searching for the nodes in the same subnet as that of CMC. Add option displays an **Enter IP** pop-up box to enter the IP of the StoreVirtual system.

	**Note:**To get the details of the HP StoreVirtual VSA IP, log in to StoreVirtual system and check `/mnt/state/vsa/vsa_network_config.json` file and select the second option, which is listed under "vsa network".


	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc3.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Add option (opens in a new window)</a>

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc4.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Find option (opens in a new window)</a>


4. Click **OK** to proceed, or click **Cancel** to cancel the process.<br />The node is discovered and the details are displayed in a tabular format in the Find Systems dialogue box.

5. (Optional) Click **Add** in the Find Systems dialogue box to add more nodes. 

6. (Optional) Click **Edit** in the Find Systems dialogue box to modify the details of the selected node.

7. (Optional) Click **Remove** in the Find Systems box to delete a node.

8. Click **Close** to return to the Home page.<br /> The discovered nodes are displayed under **Available Systems** option in the left panel.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc5.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Discovered Nodes Under Available Systems (opens in a new window)</a>

9.  To add the node to a management group, right-click the node to display a menu and select **Add to a New Management Group**.<br /> Management Groups, Clusters, And Volumes wizard is displayed.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc6.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Create Management Page (opens in a new window)</a>

10.  In the **Management Group Name** box, enter a name for the management group and click **Next** to display the Add Administrative User page.

11.  Enter the required information for the Administrative user and click **Next** to display the Management Group Time page.

12.  Synchronize the time manually or using an NTP server and click **Next** to display the Domain Name Server Configuration page.

13. Define  DNS details and click **Next** to display the Email Notification Setup page and define SMTP details.

    **Note**: It is optional to enter the details in the above step.

14. Click **Next** to display a Wizard in the Create a Cluster page. 

15. Select the cluster type as *Standard Cluster* from the displayed options and click **Next**.

16. In the **Cluster Name** box, enter the name of the cluster and click **Next**.

17. In the Add VIP and Subnet Mask pop-up box, enter the virtual IP and Subnet Mask of the cluster in the respective boxes and click **OK**.<br /> The details are displayed in a tabular format in the page.


	**Note**: Ensure that the Virtual IP (VIP) is unique and is in the same subnet as the HP StoreVirtual VSA system. 


18. Click **Next** to go to the next page.

17. (Optional) Click the checkbox displayed against **Skip Volume Creation**.

18. Click **Next**.<br />The Management Group and Cluster is created and displays in the Home page of CMC.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc7.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">CMC Main Page with the Cluster (opens in a new window)</a>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Adding HP StoreVirtual VSA System to an existing Management Group {#adding-a-node}

To add a StoreVirtual system to any existing Management Group, do the following:

1. Open CMC.

	By default, the CMC is configured to discover the HP StoreVirtual VSA systems in the subnet on which it is installed. You can manually add the nodes also.

2. In the CMC page, click **Find Systems** from the left panel.<br /> Find Systems dialogue box is displayed with an Enter IP pop-up box.

3. You can choose **Add** or **Find** option to search the system. <br />Find option  starts searching for the nodes in the subnet. Add option displays an **Enter IP** pop-up box to enter the IP of the StoreVirtual node.<br />

4. Click **OK** to proceed or click **Cancel** to cancel the process.<br />The node is discovered and the details are displayed in a tabular format in the Find Systems dialogue box.

5. (Optional) Click **Add** in the Find Systems dialogue box to add more nodes. 

6. (Optional) Click **Edit** in the Find Systems dialogue box to modify the details of the selected node.

7. (Optional) Click **Remove** in the Find Systems box to delete a node.

8. Click **Close** to return to the Home page.<br /> The discovered nodes are displayed under **Available Systems** option in the left panel.

9.  Right-click the node to display a menu and select **Add to an Existing Management Group**.

10. Enter the name of the management group.

11. Click **Add** to add the node to the group that you specified.<br /> The node is added to the management group.

## Next Step {#next-steps}

[Working with HP StoreVirtual VSA](/helion/openstack/carrier/undercloud/storage/storevirtual/) REQUIRED


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

