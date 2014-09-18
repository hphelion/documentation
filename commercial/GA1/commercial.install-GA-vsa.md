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

This page provides detailed information on HP StoreVirtual for realizing cloud storage. It primarily covers the following topics:

* [HP StoreVirtual VSA overview](#StoreVirtual-overview) 
* [Cinder architecture](#cinder-architecture)
   * [Cinder API](#cinder-api)
   * [Scheduler](#scheduler)
   * [Cinder volume and Lefthand driver](#cinder-volume)  
   * [Differentiated storage offerings](#differentiated-storage-offerings)
* [Deploying VSA storage sytems](#deploy-vsa)
   * [Prerequisites](#prerequisites-vsa)
   * [Deployment Process](#deploy-process)
        * [During Overcloud creation](#during-oc-creation)
        * [Post Overcloud creation](#post-oc)
* [Installing HP StoreVirtual Centralized Management Console (CMC) on Linux](#install-hp-storevirtual-cmc)
   * [Prerequisites](#prerequisites)
   * [Installation](#install)
* [Creating  and adding a StoreVirtual Cluster to a new Management Group](#create-cluster) 
* [Adding a VSA node to an existing Management Group](#adding-a-node)


## HP StoreVirtual overview {#storevirtual-overview}

HP StoreVirtual VSA provides complete array functionality without an external array hardware, which:

* eliminates the need for external shared storage required to implement block storage feature
* uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management at a reduced cost


HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without an external array hardware. It eliminates the need for external shared storage required to implement block storage features. It uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management. 

Multiple StoreVirtual VSAs running on multiple servers create a clustered pool of storage with the ability to make data highly available by protecting volumes with network RAID. A logical grouping of clusters is done to form a unit and is termed as management group. Each cluster can be treated as storage node by hypervisor and is accessed using VIP (virtual IP). 

As of now, adding more StoreVirtual VSAs to the cluster grows the storage pool. With Network RAID, blocks of data are striped and mirrored across multiple StoreVirtual VSAs, allowing volumes and applications to stay online in the event of disk, storage subsystem or server failure. iSCSI connectivity on HP StoreVirtual VSA, support the use of the storage pools by cloud instances.
A single management group can contain up to 32 VSA nodes &#45; grouped into one or more clusters. A single cluster comprises 1 to 16 VSA nodes. Each management group can optimally manage a maximum of 1500 volumes. 

HP Helion OpenStack supports multiple clusters. For minimal deployment, you can create a management group with one cluster and with a single VSA node on it.

HP StoreVirtual VSA enables the following features in HP Helion OpenStack: 

* **Storage clustering**: It allows you to consolidate multiple storage nodes into pools of storage. The available capacity and performance is aggregated and made available to every volume in the cluster. As storage needs increase, StoreVirtual can scale performance and capacity online.

* **Data availability**: Network RAID stripes and mirrors multiple copies of data across a cluster of storage nodes, eliminating any single point of failure in the StoreVirtual SAN. Applications have continuous data availability in the event of a power, network, disk, controller, or entire storage node failure.

* **Thin provisioning**: It allocates space only as data is actually written without requiring pre-allocation of storage. This raises the overall utilization and efficiency and thus increases the ROI.

* **Simplified data protection**: Snapshots create thinly provisioned, instant point-in-time copies of data on a per-volume basis. As and administrator, you can access snapshots to recover individual files/folders from the volume, or rollback an entire volume to a prior state.



##Cinder architecture {#cinder-architecture}

Cinder is the block-based storage component of the HP OpenStack Helion platform for cloud computing. It provides the software to create and centrally manage a service that provisions storage in the form of block devices known as Cinder volumes. In the most common scenario, the Cinder volumes provide persistent storage to guest virtual machines (known as instances) that are managed by OpenStack Compute software. Cinder can also be used independent of other OpenStack services. Cinder is based on the distributed architecture which has inherent tenets to scale horizontally and serve concurrent volume management requests. 

Cinder consists of three basic services:

* **Cinder API**

* **Cinder scheduler**

* **Cinder volume** *along with an underlying dedicated database*

<img src="media/cinder-services.png"/>


### Cinder API {#cinder-api}

Cinder API is a REST based interface to perform volume operations. As an end-user, you can accomplish volume operations without having to worry about the storage backend used to provide the actual storage. The following volume operations are supported:

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
12.	Volume migration(backend assisted).



### Scheduler {#scheduler}

The Cinder Scheduler tracks various backend capabilities and chooses the backend to place a new volume on. There are various configurable plugins for the scheduler. Filter scheduler has filters and weighers which help in deciding the backend to be used for a new volume request. The selection criteria includes the filters like- volume type, available free space, QoS specs, Extra specs etc. Scheduler ensures that the volumes are uniformly spread across all available backend StoreVirtual Management Groups.

### Cinder volume and LeftHand driver {#cinder-volume}

Once the Scheduler determines the backend to be used, the Cinder volume performs the actual operations against the backend.

The Cinder volume service hosts the LeftHand Driver to communicate with the backend, representing the StoreVirtual Management Group using the LeftHand REST API. 

**Note:** The Lefthand driver is the [HP LeftHand/StoreVirtual driver](http://docs.openstack.org/trunk/config-reference/content/HP-LeftHand-StoreVirtual-driver.html). The HPLeftHandISCSIDriver is based on the Block Storage service (Cinder) plug-in architecture. Volume operations are run by communicating with the HP LeftHand/StoreVirtual system over HTTPS, or SSH connections. 

Multiple Cinder volume processes can be run to achieve high availability of the Cinder components. Each backend instance maps to an instance of a StoreVirtual Management Group. Each Management Group listens at a Management API address that is configured in the Cinder backend entry in cinder.conf. A single Cinder volume can manage multiple backends.


### Differentiated storage offerings {#differentiated-storage-offerings}
HP Helion Openstack edition uses StoreVirtual as a backend to Cinder to realize horizontally scalable block storage. StoreVirtual is unique in the sense that storage controller runs as a virtual appliance and helps realize Software Defined Block Storage.

Cinder provides the concept of volume types to represent differentiated storage offerings based on various performance outputs, quality of service and backend devices that are used to realize cloud storage. Essentially, a volume type is mapped to one or more backends of similar capabilities as illustrated in figure below:


<a href="javascript:window.open('/content/documentation/media/reference-architecture-StoreVirtual-volume-type-mapping.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Volume type mapping (opens in a new window)</a>

The cloud administrator, you create volume types to specify the storage offerings of the cloud and  configure Cinder with backends which have the ability to serve storage characteristics represented by the volume types. For example, as a cloud admin, you have the following storage capabilities:  


**1. Low Cost, Low Performance, High Capacity Storage** (Bronze)

**2. Medium Cost, Medium Performance, Medium Capacity Storage** (Silver) 

**3. High Cost, High Performance, Low Capacity Storage** (Gold)

Then, as the cloud administrator, you need to create three volume types &ndash; bronze, silver and gold &ndash; and configure Cinder with three different backends. Each backend needs to be mapped to bronze, silver and gold, respectively.

Differentiated storage offerings based on performance and quality can be realized in HP Helion OpenStack by creating clusters of different capabilites, configuring clusters as backends and mapping theses backends to different volume types as suggested above.


##Deploying VSA Storage Systems {#deployment-vsa}
<a href="javascript:window.open('/content/documentation/media/commercial_kvm_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for KVM (opens in a new window)</a>

###Prerequisites {#prerequisite-vsa}
Ensure the following prerequisites are fulfilled before VSA Storage systems are deployed.

* Dedicated hardware identified for StoreVirtual VSA storage systems

* Seed Cloud is installed and running

### Deployment Process {#deploy-process}

You can deploy VSA:

* [During Overcloud creation](#during-oc-creation)

* [Post Overcloud creation (Scale out VSA storage)](#post-oc)

	
#### Deploy VSA during Overcloud creation {#during-oc-creation}

You can deploy VSA during Overcloud creation or installation. To deploy, update the Helion Config file and create the Overcloud using the following commands:
 

1. SSH to seed as root

	    ssh root@<IP Address>

2. If `/root/overcloud-config.json` is not present, copy Overcloud template config file to `/root/overcloud-config.json`

		cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

3. Edit the `/root/overcloud-config.json` and update the value for **vsa_scale** or **vsa&#095;ao&#095;scale** appropriately.

        vsa_scale: <no of VSA systems>

	**NOTE**:  For HP StoreVirtual VSA, a management group with two storage systems and a FailOver Manager is the minimum configuration for automated fault tolerant operations. Configurations greater than two systems can be redundant, and do not require a FailOver Manager. The FailOver Manager is a specialized version of the LeftHand OS(HP StoreVirtual) software designed to operate as a manager and provide automated failover capability. It runs as a virtual appliance and must be installed on a separate system/Virtual Machine other than the VSA storage systems in the SAN.
 
4. Check `/root/baremetal.csv` and ensure that the Baremetal servers identified for VSA storage system(s) are enrolled for the cloud.

5. Apply the configuration

        source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

6. Run the install script. During the installation, the number of VSA storage systems that you specified, are installed.

         /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh
     

<!---<img src="media/storevirtual-cluster-network-diagram1.png"/>-->


### Deploy VSA post Overcloud creation {#post-oc}

You can add VSA storage systems to an existing Overcloud also. You can add VSA in any of the following scenarios:

* Baremetal Server, to be used as VSA, is already enrolled (during the initial installation or creation of cloud)

* Enroll the Baremetal server and scale out VSA Storage 


#### Baremetal server is already enrolled ####

To deploy, update the Helion Config file and the Overcloud using the following commands:

1. SSH to seed as root

        ssh root@ <IP Address>

2. If `/root/overcloud-config.json` is not present, copy Overcloud template config file to `/root/overcloud-config.json`
 
       	cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

3. Edit the `/root/overcloud-config.json` and update the value for vsa&#095;scale or vsa&#095;ao_scale appropriately.

       	vsa_scale: <no of VSA systems>

	**NOTE**: For HP StoreVirtual VSA, a management group with two storage systems and a Failover Manager is the minimum configuration for automated fault tolerant operations. Configurations greater than two systems can be redundant and do not require a Failover Manager. The Failover Manager is a specialized version of the LeftHand OS software designed to operate as a manager and provide automated failover capability. It runs as a virtual appliance and must be installed on a separate system/Virtual Machine(VM)  other than the storage systems in the SAN.


4. Apply the configuration

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

5. Comment out the following line in  `/root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh` in the overcloud section

			if [ "$SKIP_INSTALL_OVERCLOUD" != "1" ] ; then
   			 echo "HP - configuring overcloud - $(date)"
			#    hp_ced_validate_ip ping -s $FLOATING_START -e $FLOATING_END

6. Run the installer script to update the overcloud. During the installation, the number of VSA storage systems that you specified, are installed.

    	 bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log


#### Enroll the Baremetal server

To deploy VSA, you need to first enroll the Baremetal server and then, update the Helion Config file and the Overcloud. Perform the following commands:


1. SSH to Undercloud as heat-admin

         ssh heat-admin@<IP Address>
         sudo -i
         source stackrc

2. Register the new Baremetal in the Ironic database. Replace the cpus, memory&#095;mb,local&#095;gb,ipmi&#095;address, ipmi&#095;password variable values with your Baremetal settings. 

		ironic node-create -d pxe_ipmitool -p cpus=<value> -p memory_mb=<value> -p local_gb=<value> -p cpu_arch=<value> -i ipmi_address=<IP Address> -i ipmi_username=<username> -i ipmi_password=<password>

	Following is the example for reference:

		ironic node-create -d pxe_ipmitool -p cpus=12 -p memory_mb=98304 -p local_gb=1800 -p cpu_arch=amd64 -i ipmi_address=10.12.22.70 -i ipmi_username=admin -i ipmi_password=password

3. Create the ironic port for the ironic node that you created in the  previous step
 
        ironic port-create --address $MAC_ADDR --node_uuid $NODE_UUID

4. SSH to seed as root

        ssh root@<IP Address>

5. Edit `/root/baremetal.json` and add the required details of the Baremetal server (MAC address, user id/password, IP address etc.). Add a snippet, like  the following example with VSA node details, to the "nodes" list.
 
		{
		     "mac": [
		       "00:19:0b:ec:76:4a"
		     ],
		     "cpu": "1",
		     "memory": "8192",
		     "disk": "512",
		     "arch": "amd64",
		     "pm_user": "root",
		     "pm_addr": "192.168.122.1",
		     "pm_password": "password",
		     "pm_type": "pxe_ssh"
		},


6. If `/root/overcloud-config.json` is not present, copy Overcloud template config file to `/root/overcloud-config.json`
 
       	cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

3. Edit the /root/overcloud-config.json and update the value for **vsa&#095;scale** or **vsa&#095;ao_scale** appropriately. 

       	vsa_scale: <no of VSA systems>

	**NOTE**: For HP StoreVirtual VSA, a management group with two storage systems and a Failover Manager is the minimum configuration for automated fault tolerant operations. Configurations greater than two systems can be redundant and do not require a Failover Manager. The Failover Manager is a specialized version of the LeftHand OS software designed to operate as a manager and provide automated failover capability. It runs as a virtual appliance and must be installed on a separate system/Virtual Machine(VM)  other than the storage systems in the SAN.


4. Apply the configuration

		source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

5. Comment out the following line in  /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh in the Overcloud section

			if [ "$SKIP_INSTALL_OVERCLOUD" != "1" ] ; then
   			 echo "HP - configuring overcloud - $(date)"
			#    hp_ced_validate_ip ping -s $FLOATING_START -e $FLOATING_END

6. Run the installer script to update the Overcloud. During the installation, the number of VSA storage systems that you specified, are installed. 

     	bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-install-seed --skip-install-undercloud 2>&1 | tee update.log


##Installing HP StoreVirtual Centralized Management Console (CMC) on Linux {#install-hp-storevirtual-cmc}


You must install the CMC to perform the administrative tasks on HP StoreVirtual VSA storage. You can manage the entire network of VSAs from this CMC. 


### Prerequisites {#prerequisites} 

* You must be running the X Windows System to install the CMC.

* We recommend that you install CMC on the same KVM host that is used to run the Seed VM. This host has direct network connectivity to servers running HP StoreVirtual VSA.

**Note**: These changes are required for 64-bit operating system only.

* Execute the following commands:

		apt-get update
		dpkg --add-architecture i386
		apt-cache search ia32-libs
		apt-get install openjdk-7-jdk:i386

### Installation ###{#installation}

1. Verify if the CMC installer file (packaged along with the installer) has the executable permission otherwise execute the following command:

		chmod +x CMC_11.5.01.0023.0_Installer_Linux.bin


3. Click the CMC installer.

2. Follow the steps in the installation wizard to complete the installation.

3. To start the CMC:<br>
 From the directory in which the files are installed, click the **HP Store Virtual Centralized Management Console** to launch CMC.  
</br>  

<!---<img src="media/storevirtual-cluster-network-diagram2.png"/>-->

## Creating a StoreVirtual Cluster and adding it to a new Management Group ##{#create-cluster}

**Prerequisites**

* CMC is already installed 

* VSA (one or more) is deployed in the same management network where CMC is installed.


To create a cluster, do the following:

1. Open CMC.

    By default, the CMC is configured to discover the VSA nodes in the subnet on which it is installed. You can manually add the nodes also.

2. In the CMC page, click **Find Systems** from the left panel.<br> Find Systems dialogue box is displayed with an Enter IP pop-up box.

3. In the **Enter IP** pop-up box, enter the IP of the VSA node.

4. Click **OK** to proceed or click **Cancel** to cancel the process.<br>The node is discovered and the details are displayed in a table in the Find Systems dialogue box.

5. (Optional) Click **Add** in the Find Systems dialogue box to add more nodes. 

6. (Optional) Click **Edit** in the Find Systems dialogue box to modify the detials of the selected node.
7. (Optional) Click **Remove** in the Find Systems box to delete a node.

8. Click **Close** to return to the Home page.<br> The discovered nodes are displayed under **Available Systems** option in the left panel.

9.  To add the node to a management group, right-click the node to display a menu and select **Add to a New Management Group**.<br> Create Management page is displayed.

10.  In the **Management Group Name** box, enter a name for the management group and click **Next** to display the Add Administrative User page.

11.  Enter the required information for the Administrative user and click **Next** to display the Management Group Time page.

12.  Synchronize the time using NTP server or manually and click **Next** to display the Domain Name Server Configuration page.

13. (Optional) Define  DNS details and click **Next** to display the Email Notification Setup page.

    **Note**: Although the above step is optional, it is recommended to enter the details.

14. (Optional) Enter the SMTP details and click **Next** to display a Wizard in the Create a Cluster page. 

13.  Select the cluster type from the displayed options and click **Next**.

14. In the **Cluster Name** box, enter the name of the cluster and click **Next**.

15. In the Add VIP and Subnet Mask pop-up box, enter the virtual IP and Subnet Mask of the cluster in the respective boxes and click **OK**.<br> The details are displayed in a table in the page.

16. Click **Next** to go to the next page.

17. (Optional) Click the check box displayed against **Skip Volume Creation**.

18. Click **Next**.<br>The Management Group and Cluster is created and displays in the Home page of CMC.


## Adding a VSA node to an existing Management Group ##{#adding-a-node}

To add a VSA node to any existing Management Group, do the following:

1. Open CMC.

    By default, the CMC is configured to discover the VSA nodes in the subnet on which it is installed. You can manually add the nodes also.

2. In the CMC page, click **Find Systems** from the left panel.<br> Find Systems dialogue box is displayed with an Enter IP pop-up box.

3. In the Enter IP pop-up box, enter the IP of the VSA node.

4. Click **OK** to proceed or click **Cancel** to cancel the process.<br>The node is discovered and the details are displayed in a table in the Find Systems dialogue box.

5. (Optional) Click **Add** in the Find Systems dialogue box to add more nodes. 

6. (Optional) Click **Edit** in the Find Systems dialogue box to modify the details of the selected node.

7. (Optional) Click **Remove** in the Find Systems box to delete a node.

8. Click **Close** to return to the Home page.<br> The discovered nodes are displayed under **Available Systems** option in the left panel.

9.  Right-click the node to display a menu and select **Add to an Existing Management Group**.<br> A page is displayed.

10. Enter the name of the management group.

11. Click **Add** to add the node to the group that you specified.<br> The node is added to the Management Group.

## Next Steps

- Configure HP StoreVirtual VSA **(REQUIRED)**. 

	HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without an external array hardware. It eliminates the need for external shared storage required to implement block storage features. It uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management.

	For intructions, see the [Configuring HP StoreVirtual VSA for Block Storage](/helion/openstack/ga/install/vsa/) document. 

- Install DNS as a service (DNSaaS) (Optional).

	Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

	For installation intructions, see [DNSaaS Beta Installation and Configuration](/helion/openstack/ga/install/dnsaas/).


<!---## Next step

Configure HP 3PAR StoreServ, see [HP Helion OpenStack Commercial: HP StoreServ (3PAR) Support](/helion/openstack/install/3par/).-->


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
