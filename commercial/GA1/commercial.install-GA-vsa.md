---
layout: default
title: "HP Helion OpenStack&#174; Edition: VSA Support"
permalink: /helion/openstack/ga/install/vsa/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<!---<p style="font-size: small;"> <a href="/helion/openstack/install/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/esx/">NEXT &#9654;</a> </p>-->


# HP Helion OpenStack&#174; Installation: HP StoreVirtual VSA Support

This page provides detailed information on using HP StoreVirtual VSA for realizing cloud storage. 

* [HP StoreVirtual VSA overview](#StoreVirtual-overview) 
* [Cinder architecture](#cinder-architecture)
   * [Cinder API](#cinder-api)
   * [Scheduler](#scheduler)
   * [Cinder volume and Lefthand driver](#cinder-volume)  
   * [Differentiated storage offerings](#differentiated-storage-offerings)
* [High Level overview of StoreVirtual integration](#high-level-view)
* [Installing HP StoreVirtual VSA Centralized Management Console (CMC) on Linux](#install-hp-storevirtual-cmc)
   * [Prerequisites](#prerequisites)
   * [Installation](#install)
* [Deploying HP StoreVirtual VSA storage sytems](#deploy-vsa)
   * [Prerequisites](#prerequisites-vsa)
   * [Enrolling the new Baremetal server](#deploy-process)
* [Verifying the StoreVirtual installation status](#verify-install)
* [Creating  and adding a StoreVirtual Cluster to a new Management Group](#create-cluster) 
* [Adding a StoreVirtual node to an existing Management Group](#adding-a-node)
* [Next Steps](#next-steps)


##HP StoreVirtual VSA overview<a name="StoreVirtual-overview"></a>

HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without an external 
array hardware. It transforms your server’s internal or direct-attached storage into a fully featured shared storage array—without the cost and complexity 
associated with dedicated storage. HP StoreVirtual VSA uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management.

Multiple StoreVirtual systems running on different servers create a clustered pool of storage with the ability to make data highly available by 
protecting volumes with network RAID.A logical grouping of clusters is done in order to form a unit and is called a management group. Each cluster can be treated as storage node by hypervisor and is accessed using VIP (virtual IP). 

<!---HP StoreVirtual Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without an external array hardware. It uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management. 

Multiple StoreVirtual systems running on multiple servers create a clustered pool of storage with the ability to make data highly available by protecting volumes with network RAID.--> 

With Network RAID, blocks of data are striped and mirrored across multiple StoreVirtual systems, allowing volumes and applications to stay online in the event of disk, storage subsystem or server failure. iSCSI connectivity on HP StoreVirtual VSA, support the use of the storage pools by cloud instances.
A single management group can contain up to 32 StoreVirtual nodes &#45; grouped into clusters. A single cluster comprises 1 to 16 StoreVirtual nodes. Each management group can optimally manage a maximum of 1500 volumes. 

HP Helion OpenStack&#174; supports multiple clusters. For minimal deployment, you can create a management group with one cluster and with a single StoreVirtual node on it.

HP StoreVirtual VSA enables the following features in HP Helion OpenStack&#174;: 

* **Storage clustering**: It allows you to consolidate multiple storage nodes into pools of storage. The available capacity and performance is aggregated and made available to every volume in the cluster. As storage needs increase, StoreVirtual can scale performance and capacity online.

* **Data availability**: Network RAID strips and mirrors multiple copies of data across a cluster of storage nodes, eliminating any single point of failure in the StoreVirtual SAN. Applications have continuous data availability in the event of  power, network, disk, controller, or entire storage node failure.

* **Thin provisioning**: It allocates space only as data is actually written without requiring pre-allocation of storage. This raises the overall utilization and efficiency and thus increases the Return on Investment(ROI).

* **Simplified data protection**: Snapshots create thinly provisioned, instant point-in-time copies of data on a per-volume basis. As an administrator, you can access snapshots to recover individual files/folders from the volume, or rollback an entire volume to a prior state.

##Cinder architecture<a name="cinder-architecture"></a>

Cinder is the block-based storage component of the HP  Helion OpenStack&#174; platform for cloud computing. It facilitates the provisioning of storage in the form of block devices known as Cinder volumes. In the most common scenario, the Cinder volumes provide persistent storage to guest virtual machines (known as instances) that are managed by OpenStack Compute software. Cinder is based on the distributed architecture which can scale horizontally and serve concurrent volume management requests. 

Cinder consists of three basic services:

* **Cinder API**

* **Cinder scheduler**

* **Cinder volume** *along with an underlying dedicated database*

<img src="media/cinder-services.png"/>

### Cinder API <a name="cinder-api"></a>

Cinder API is a REST based interface to perform volume operations. As an end-user, you can accomplish volume operations without worrying about the storage  backend device used to provide the actual storage. The following volume operations are supported:

1.  Create volumes
2.	Delete volumes
3.	Extend volumes
4.	Attach volumes
5.	Detach volumes
6.	Create snapshots
7.	Delete snapshots
8.	Create volumes from snapshots
9.	Create cloned volumes
10.	Copy images to volumes
11.	Copy volumes to images
<!--12.	Volume Backup to Swift
13.	Volume Restore from Swift-->
<!---12.	Volume migration(backend assisted).-->

### Scheduler<a name="scheduler"></a>

The Cinder Scheduler tracks various backend capabilities and chooses the backend to place a new volume on. There are various configurable plugins for the scheduler. Filter scheduler has filters and weighers which help in deciding the backend to be used for a new volume request. The selection criteria includes the filters like- volume type, available free space, QoS specs, Extra specs etc. Scheduler ensures that the volumes are uniformly spread across all available backend devices.

### Cinder Volume and LeftHand driver<a name="cinder-volume"></a>

Once the Scheduler determines the backend to be used, the Cinder volume performs the actual operations against the backend.

The Cinder volume service hosts the LeftHand Driver to communicate with the backend representing the StoreVirtual cluster, using the LeftHand REST API. 

**Note:** The HPLeftHandISCSIDriver is based on the Block Storage service (Cinder) plug-in architecture. Volume operations are run by communicating with the HP LeftHand/StoreVirtual system over HTTPS, or SSH connections. 
For more details on the Lefthand driver, refer to [HP LeftHand/StoreVirtual driver](http://docs.openstack.org/trunk/config-reference/content/HP-LeftHand-StoreVirtual-driver.html). 

When you configure multiple StoreVirtual backends, one cinder-volume is launched for each back-end storage or back-end storage pool. Each backend instance maps to an instance of a StoreVirtual cluster. Each cluster listens at an assigned VIP that is configured in the Cinder backend entry in *cinder.conf*. 


### Differentiated Storage Offerings<a name="differentiated-storage-offerings"></a>
HP Helion OpenStack&#174; uses StoreVirtual as a backend to Cinder to realize horizontally scalable block storage. StoreVirtual is unique in the sense that storage controller runs as a virtual appliance and helps realize Software Defined Block Storage.

Cinder provides the concept of volume types to represent differentiated storage offerings based on various performance outputs, quality of service and backend devices that are used to realize cloud storage. Essentially, a volume type is mapped to one or more backends of similar capabilities as illustrated in figure below:


<a href="javascript:window.open('/content/documentation/media/reference-architecture-StoreVirtual-volume-type-mapping.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Volume type mapping (opens in a new window)</a>

As a cloud administrator, you can create volume types to specify the storage offerings of the cloud and  configure Cinder with backends which have the ability to serve storage characteristics represented by the volume types. For example, as a cloud admin, you have the following storage capabilities:  

**1. Low Cost, Low Performance, High Capacity Storage** (Bronze)

**2. Medium Cost, Medium Performance, Medium Capacity Storage** (Silver) 

**3. High Cost, High Performance, Low Capacity Storage** (Gold)

Then, as the cloud administrator, you need to create three volume types &ndash; bronze, silver and gold &ndash; and configure Cinder with three different backends. Each backend needs to be mapped to bronze, silver and gold, respectively.

Differentiated storage offerings based on performance and quality can be realized in HP Helion OpenStack&#174; by creating clusters of different capabilities, configuring clusters as backends and mapping these backends to different volume types as suggested above.

##High level overview of StoreVirtual integration {#high-level-view}

The following diagram gives an overview of the steps involved in integrating StoreVirtual with your cloud. The subsequent sections provide the detailed instructions on integration workflow.


<a href="javascript:window.open('/content/documentation/media/storevirtual-integration.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP StoreVirtual VSA Integration diagram (opens in a new window)</a>


<!--1 - **Install CMC**
     
   [Install CMC](#install-hp-storevirtual-cmc) on the Seed node where the Seed cloud is running. The CMC binary comes along with the HP Helion OpenStack installer and is present in the `tripleo` directory. 

2 - **Add VSA Baremetal nodes to ironic database**
	
   * Identify the hardware for StoreVirtual deployment and enroll the Baremetal to the ironic database.

   * Log in to the Undercloud and source the environment variables(source stackrc).

   * Execute ironic CLI commands from the Undercloud to enroll the Baremetal into ironic database.
   
   * [Deploy StoreVirtual storage systems](#deployment-vsa).

3a - **Run update cloud script to provision VSA node**

   * After the [enrollment of the new Baremetal server](#deployment-vsa) in the undercloud, log in to the seed cloud.

   * Update overcloud.json file for StoreVirtual deployment and apply the configuration.
	
   * Execute the update cloud script.

3b - **Discover StoreVirtual in CMC**

   * After updating the cloud, StoreVirtual system is deployed in the new Baremetal server that is enrolled.

   * Create StoreVirtual cluster.

   * The IP address of the StoreVirtual storage system can be retrieved from `/etc/vsa/vsa_network_config.json` file in StoreVirtual node.

   * Launch the CMC and discover the StoreVirtual systems that have been deployed.

3c - **Create VSA cluster**

   * After discovering the StoreVirtual storage systems in CMC, [create the StoreVirtual cluster and management group](#create-cluster) from CMC.

4a - **Launch Undercloud Horizon**

4b - **Register VSA cluster**

4c - **Create VSA backend**

4d- **Get Cinder configuration for VSA backend**

   * Launch the Horizon Dashboard to [register and create backend for StoreVirtual](/helion/openstack/ga/undercloud/oc/config/storevirtual/) system.
	
   * After creating the backend, generate the Cinder backend advisory for StoreVirtual.

5a - **Update `overcloud-config.json` file with cinder configuration**

   With the advise generated from the above steps, update the overcloud-config.json file in the Seed cloud.

5b - **Run update cloud script to update cinder.conf**

   * The cinder.conf in the Overcloud should be updated after updating the overcloud-config.json file in the Seed cloud.

   * Execute [update cloud script](/helion/openstack/ga/undercloud/oc/config/storevirtual/) from Seed cloud. -->

##Installing HP StoreVirtual VSA Centralized Management Console (CMC) on Linux<a name="install-hp-storevirtual-cmc"></a>

You must install the CMC to perform the administrative tasks on HP StoreVirtual VSA. You can manage the entire network of StoreVirtual VSAs  from CMC. 


### Prerequisites<a name="prerequisites"></a>

* You must be running the X Windows System to install the CMC.

* We recommend that you install CMC on the same KVM host that is used to run the Seed VM. This host has direct network connectivity to servers running HP StoreVirtual VSA.

**Note**: These changes are required for 64-bit operating system only.

* Execute the following commands:

		apt-get update
		dpkg --add-architecture i386
		apt-get install openjdk-7-jdk:i386

### Installation<a name="installation"></a>

1. Verify if the CMC installer file inside `tripleo` directory (packaged along with the HP Helion OpenStack&#174; installer) has the executable permission otherwise execute the following command:

		chmod +x CMC_11.5.01.0079.0_Installer_Linux.bin

2. Launch the installer

		./CMC_11.5.01.0079.0_Installer_Linux.bin

3. Follow the steps in the console based installation wizard to complete the installation.

4. To start the CMC:<br>
 From the directory in which the files are installed, click the **HP Store Virtual Centralized Management Console** to launch CMC.  
</br>  

**Note**: To launch the CMC from CLI, navigate to the location where it is installed and enter `# ./"HP Store Virtual Centralized Management Console"`.

<!---<img src="media/storevirtual-cluster-network-diagram2.png"/>-->


##Deploying HP StoreVirtual VSA<a name="deploy-vsa"></a>
<!---<a href="javascript:window.open('/content/documentation/media/commercial_kvm_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for KVM (opens in a new window)</a>-->

###Prerequisites<a name="prerequisites-vsa"></a>

Ensure the following prerequisites are fulfilled before HP StoreVirtual Storage systems are deployed:

* Before enrolling the new Baremetal server for StoreVirtual deployment, ensure that `#ironic node-list` in Undercloud server does not have any free nodes.This is required to register a new node which matches the disk requirements for StoreVirtual and is picked by the installer for StoreVirtual deployment.

 
* Ensure that you have created a minimum of two(2) RAID groups. You can create a maximum of eight(8) groups. The first RAID group where the OS image is deployed is not considered for StoreVirtual storage.

* Each physical disk should be RAID protected and should not be RAID 0. You can use RAID 5 and above. <!---For more details, refer – [**Storevirtual documentation LINK**]-->

* For deploying StoreVirtual systems without Adaptive Optimization (AO) the setup must have a minimum two(2) disks(/dev/sda, /dev/sdb).

* For deploying StoreVirtual systems with Adaptive Optimization (AO) the setup must have at least three(3) disks(/dev/sda, /dev/sdb,/dev/sdc). The disk /dev/sdb should be a Solid State Drive(SSD).


* Ensure that you create the RAID group for SSD drives immediately after creating the RAID group for boot volume. For example: If three RAID groups are to be created. The following is recommended :

      **Step 1**: Create the first RAID group for HDD drives and mark this as boot volume(/dev/sda)
        
	   **Step 2**: Create the second RAID group for SSD drives which should be used as Tier 0 for AO (/dev/sdb)
         
	   **Step 3**: Create the third RAID group for HDD drives which will be used as Tier 1(/dev/sdc)

* The total amount of the configured storage on the StoreVirtual system should not exceed 50 TB. 

* Seed Cloud is installed and running

<!---<img src="media/storevirtual-cluster-network-diagram1.png"/>-->


#### Enrolling the New Baremetal Server<a name="enroll-new-baremetal-server"></a>

To deploy HP StoreVirtual VSA, perform the following:

1. SSH to undercloud as heat-admin from Seed

		ssh heat-admin@<IP Address>
		sudo -i
		source stackrc

	**Note:** Before enrolling the new Baremetal server for StoreVirtual deployment, ensure that `ironic node-list` in the Undercloud server does not have any free nodes suitable for StoreVirtual installation. If a suitable node is available, skip the Baremetal registration steps and go to **step 5** below.

2. Register the new Baremetal server in the Ironic database. Replace the cpus, memory&#095;mb,local&#095;gb,ipmi&#095;address, ipmi&#095;password variable values with your Baremetal settings. 

		ironic node-create -d pxe_ipmitool -p cpus=<value> -p memory_mb=<value> -p local_gb=<value> -p cpu_arch=<value> -i ipmi_address=<IP Address> -i ipmi_username=<username> -i ipmi_password=<password>

	Following is the example for reference:

		ironic node-create -d pxe_ipmitool -p cpus=12 -p memory_mb=98304 -p local_gb=1800 -p cpu_arch=amd64 -i ipmi_address=10.12.22.70 -i ipmi_username=admin -i ipmi_password=password

3. Create the ironic port for the ironic node that you created in the  previous step
 
		ironic port-create --address $MAC_ADDR --node_uuid $NODE_UUID

**$MAC_ADDR** refers to the MAC Address of the Baremetal server.

4. List the Baremetal nodes. This command also lists the newly added nodes

		ironic node-list

5. Log out from Undercloud to go back to Seed 

6. Edit the `/root/baremetal.csv file` in Seed cloud with the details of the newly added node.


7. If `/root/overcloud-config.json` is not present, copy Overcloud template config file to `/root/overcloud-config.json`
 
		cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

7. Edit the `/root/overcloud-config.json` and update the value for `vsa_scale` or `vsa_scale` appropriately. 

       	vsa_scale: <no of StoreVirtual systems>

		vsa_ao_scale: <no of StoreVirtual systems with AO enabled>

	**NOTE**: For HP StoreVirtual VSA, a management group with two storage systems and a Failover Manager is the minimum configuration for automated fault tolerant operations. Configurations greater than two systems can be redundant and do not require a Failover Manager. The Failover Manager is a specialized version of the LeftHand OS software designed to operate as a manager and provide automated failover capability. It runs as a virtual appliance and must be installed on a separate system/VM  other than the storage systems in the SAN.

8. Apply the configuration

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

9. Source the environment variables from the Environment Variables file created during initial installation.<!--- based on your configuration and the details of the StoreVirtual scale specified in the `/root/overcloud-config.json`-->


		source /root/env_vars

10. Run the installer script to update the Overcloud. During the installation, the number of StoreVirtual storage systems that you specified in the `overcloud-config.json`, are deployed. 

 	 	bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update.log

##Verifying StoreVirtual installation status<a name="verify-install"></a>

To verify that the StoreVirtual storage system is deployed successfully, perform the following checks:

1. Log in to Undercloud from Seed

		ssh heat-admin@<Undercloud IP Address>
 		 
2. Source stackrc file and list the deployed StoreVirtual nodes

		source stackrc
		heat stack-list
		nova list|grep vsa

3. Log in to the StoreVirtual system from the Seed using the IP address retrieved 
from the above steps

		ssh heat-admin@<StoreVirtual system IP Address>

4. Check the log files

		tailf /installer.log

	The message "*Started VM vsa-hostname*" indicates the successful installation of StoreVirtual on the machine.The IP Address of the StoreVirtual storage system can be retrieved from this log file.

5. To display the status of all the StoreVirtual VMs 

		virsh list --all 

	To get more details on the installer logs, check the `/var/log/storevirtual-installer.log` file.

6. On successful installation of StoreVirtual VM on Baremetal, go to the Centralized Management Console(CMC) and discover the storage systems. 



## Creating a StoreVirtual Cluster and adding it to a new Management Group<a name="create-cluster"></a>

**Prerequisites**

* CMC is already installed 

* HP StoreVirtual VSA (one or more) is deployed in the same management network where CMC is installed.


To create a cluster, do the following:

1. Open CMC.

    By default, the CMC is configured to discover the StoreVirtual nodes in the subnet in which it is installed. You can manually add the nodes also.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">CMC Main Page (opens in a new window)</a>

2. In the CMC UI, click **Find** and then click **Find Systems** from the left panel.<br> Find Systems dialogue box is displayed.</br>

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc2.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Find Systems option (opens in a new window)</a>

3. You can choose **Add** or **Find** option to search the system. <br>Find option  starts searching for the nodes in the same subnet as that of CMC. Add option displays an **Enter IP** pop-up box to enter the IP of the StoreVirtual system.

**Note:**To get the details of the HP StoreVirtual VSA IP, log in to StoreVirual system and check `/etc/vsa/vsa_network_config.json` file.


	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc3.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Add option (opens in a new window)</a>

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc4.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Find option (opens in a new window)</a>


4. Click **OK** to proceed or click **Cancel** to cancel the process.<br>The node is discovered and the details are displayed in a tabular format in the Find Systems dialogue box.

5. (Optional) Click **Add** in the Find Systems dialogue box to add more nodes. 

6. (Optional) Click **Edit** in the Find Systems dialogue box to modify the details of the selected node.

7. (Optional) Click **Remove** in the Find Systems box to delete a node.

8. Click **Close** to return to the Home page.<br> The discovered nodes are displayed under **Available Systems** option in the left panel.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc5.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Discovered Nodes Under Available Systems (opens in a new window)</a>

9.  To add the node to a management group, right-click the node to display a menu and select **Add to a New Management Group**.<br> Management Goups, Clusters, And Volumes wizard is displayed.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc6.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Create Management Page (opens in a new window)</a>

10.  In the **Management Group Name** box, enter a name for the management group and click **Next** to display the Add Administrative User page.

11.  Enter the required information for the Administrative user and click **Next** to display the Management Group Time page.

12.  Synchronize the time using NTP server or manually and click **Next** to display the Domain Name Server Configuration page.

13. Define  DNS details and click **Next** to display the Email Notification Setup page and define SMTP details.

    **Note**: It is optional to enter the details in the above step.

14. Click **Next** to display a Wizard in the Create a Cluster page. 

15. Select the cluster type as *Standard Cluster* from the displayed options and click **Next**.

16. In the **Cluster Name** box, enter the name of the cluster and click **Next**.

17. In the Add VIP and Subnet Mask pop-up box, enter the virtual IP and Subnet Mask of the cluster in the respective boxes and click **OK**.<br> The details are displayed in a tabular format in the page.


	**Note**: Ensure that the Virtual IP (VIP) is unique and is in the same subnet as the HP StoreVirtual VSA system. 


18. Click **Next** to go to the next page.

17. (Optional) Click the checkbox displayed against **Skip Volume Creation**.

18. Click **Next**.<br>The Management Group and Cluster is created and displays in the Home page of CMC.

	<a href="javascript:window.open('/content/documentation/media/storevirtual-cmc7.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">CMC Main Page with the Cluster (opens in a new window)</a>


## Adding HP StoreVirtual VSA System to an existing Management Group<a name="adding-a-node"></a>

To add a StoreVirtual system to any existing Management Group, do the following:

1. Open CMC.

	By default, the CMC is configured to discover the HP StoreVirtual VSA systems in the subnet on which it is installed. You can manually add the nodes also.

2. In the CMC page, click **Find Systems** from the left panel.<br> Find Systems dialogue box is displayed with an Enter IP pop-up box.

3. You can choose **Add** or **Find** option to search the system. <br>Find option  starts searching for the nodes in the subnet. Add option displays an **Enter IP** pop-up box to enter the IP of the StoreVirtual node.</br>

4. Click **OK** to proceed or click **Cancel** to cancel the process.<br>The node is discovered and the details are displayed in a tablular format in the Find Systems dialogue box.

5. (Optional) Click **Add** in the Find Systems dialogue box to add more nodes. 

6. (Optional) Click **Edit** in the Find Systems dialogue box to modify the details of the selected node.

7. (Optional) Click **Remove** in the Find Systems box to delete a node.

8. Click **Close** to return to the Home page.<br> The discovered nodes are displayed under **Available Systems** option in the left panel.

9.  Right-click the node to display a menu and select **Add to an Existing Management Group**.

10. Enter the name of the management group.

11. Click **Add** to add the node to the group that you specified.<br> The node is added to the management group.

## Next Steps<a name="next-steps"></a>

- [Working with HP Helion OpenStack&#174; Undercloud Horizon Dashboard](/helion/openstack/ga/undercloud/manage/resources/overview/)-(Recommended)


<!--- [Working with HP StoreVirtual VSA](/helion/openstack/ga/undercloud/storage/storevirtual/)-  REQUIRED

	<!---  Configure HP StoreVirtual **(REQUIRED)** HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without an external array hardware. It eliminates the need for external shared storage required to implement block storage features. It uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management.

	For detailed intructions, see the  document. 
- [Working With StoreVirtual Backends](/helion/openstack/ga/undercloud/oc/config/storevirtual/)-  REQUIRED

	Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

	For detailed installation intructions, see [DNSaaS Installation and Configuration](/helion/openstack/ga/install/dnsaas/).-->

- [Sirius CLI](/helion/openstack/ga/sirius-cli/)

<!---## Next step

Configure HP 3PAR StoreServ, see [HP Helion OpenStack Commercial: HP StoreServ (3PAR) Support](/helion/openstack/install/3par/).-->


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
