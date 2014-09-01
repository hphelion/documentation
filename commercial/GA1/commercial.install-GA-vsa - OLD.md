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

<p style="font-size: small;"> <a href="/helion/openstack/install/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/esx/">NEXT &#9654;</a> </p>


# HP Helion OpenStack&#174; Installation: HP StoreVirtual VSA Support

This page provides detailed information on HP StoreVirtual for realizing cloud storage. It primarily covers the following topics:

* [HP StoreVirtual VSA overview](#StoreVirtual-overview) 
* [Cinder architecture](#cinder-architecture)
   * [Cinder API](#cinder-api)
   * [Scheduler](#scheduler)
   * [Cinder volume and Lefthand driver](#cinder-volume)  
   * [Differentiated storage offerings](#differentiated-storage-offerings)
* [Installing and configuring HP StoreVirtual VSA](#installation-of-storevirtual-vsa)
   * [Prerequisites](#prerequisites)
   * [Installing Linux on baremetal](#install-linux-on-baremetal)
   * [Deploying VSA](#deployment-vsa) 
   * [Installing HP StoreVirtual Centralized Management Console (CMC) on Linux](#install-hp-storevirtual-vsa)
   * [Creating a cluster](#create-cluster)
   * [Enabling HP StoreVirtual configuration in overcloud](#enable-hp-storevirtual-configuration)


## HP StoreVirtual overview {#storevirtual-overview}

HP StoreVirtual VSA Software is a Virtual Storage Appliance that provides the complete array functionality on top of Linux KVM environment without an external array hardware. It eliminates the need for external shared storage required to implement block storage features. It uses scale-out, distributed clustering to provide a pool of storage with enterprise storage features and simple management. 

Multiple StoreVirtual VSAs running on multiple servers create a clustered pool of storage with the ability to make data highly available by protecting volumes with network RAID. A logical grouping of clusters is done to form a unit and is termed as management group. Each cluster can be treated as storage node by hypervisor and is accessed using VIP (virtual IP). 

As of now, adding more StoreVirtual VSAs to the cluster grows the storage pool. With Network RAID, blocks of data are striped and mirrored across multiple StoreVirtual VSAs, allowing volumes and applications to stay online in the event of disk, storage subsystem or server failure. iSCSI connectivity on HP StoreVirtual VSA, support the use of the storage pools by cloud instances.
A single management group can contain up to 32 VSA nodes &#45; grouped into one or more clusters. A single cluster comprises 1 to 16 VSA nodes. Each management group can optimally manage a maximum of 1500 volumes. 

Currently, HP Helion OpenStack edition uses a single management group mapped to a single Cluster. For minimal deployment, you can create a management group with one cluster and with a single VSA node on it.

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

1. Create volume
2. Delete volume
3. Attach volume to host
4. Detach volume from host
5. Create snapshot of a given volume
6. Create clone of a given volume
7. Delete a snapshot
8. Delete a clone
9. Provision volume based on the volume type (which implicitly maps to Quality of Service(QoS)) OpenStack Cinder API manages the block storage. 


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



##Installing and configuring HP StoreVirtual VSA {#installation-of-storevirtual-vsa}


### Prerequisites ###

1. Ensure that you download the `HPStoreVirtual_VSA_11.5.tgz` package, which contains all the files that are required for installation, as shown in the table below. For details on how to download, refer to the [Before you begin](/helion/openstack/ga/install-overview/#install-pkg) page. 

	<table style="text-align: left; vertical-align: top; width:650px;">
	
	<tr style="background-color: lightgrey; color: black;">
	
	 <td><b> Components </b></td><td><b>File name</b></td>
	<tr style="background-color: white; color: black;">
	 <td>HP StoreVirtual VSA installer</td><td>HPStoreVirtual_VSA_11.5.tgz </td></tr>
	<tr style="background-color: white; color: black;">
	<td>Linux</td><td>hlinux-vsa-blaster-20140619.iso</td></tr>
	
	
	<tr style="background-color: white; color: black;">
	<td>VSA automation package</td><td>pyVins.tgz</td></tr>
	<tr style="background-color: white; color: black;">
	 <td>CMC installer</td><td>CMC_11.5.01.0023.0_Installer_Linux.bin</td></tr></table>

2. Prepare a storage server with the following RAID logical drives:

   * RAID drive for operating system
   
   * RAID drive for storage, to be consumed by VSA

    RAID drive can be created using RAID management utility. Please refer your server specification to create RAID groups. We recommend that you create RAID 5 or RAID 6 logical drive comprising 10-12 drives.


###Installing Linux on baremetal{#install-linux-on-baremetal}

Linux operating system is installed on baremetal servers identified to run HP  StoreVirtual VSA.


**Prerequisites**

The target system must fulfill the following prerequisites: 

  * One primary hard drive of at least 80 GB
	
  * At least 8 GB of RAM 
	
  * The VSA server must be connected to the same network as the cloud nodes.

    <a href="javascript:window.open('/content/documentation/media/commercial_kvm_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for KVM (opens in a new window)</a>
   

  * (Optional) It can have a second network which provides external/public access. 
  
  * Download and extract files from the `HPStoreVirtual_VSA_11.5.tgz` package.


**Installation**

1. Mount the Linux ISO on the target server and boot the server.

2. During the boot process, you are prompted to **Enter block device to use for reimaging**, enter the block device that you want to use for example:***/dev/sda***.

3. Click **Enter**.

4. Once the installation completes, manually reset the system. 

5. Login to the system using the credentials provided in the `Readme.txt` included in the package.

6.	Switch to root user.

7.	From the location where the contents of `HPStoreVirtual_VSA_11.5.tgz` package are extracted, copy the  following files  to `/home/root` folder on the Linux server.

  * HP&#95;StoreVirtual&#95;VSA&#95;Installer&#95;for_KVM.tgz
   
  * pyVins.tgz
   

###Deploying VSA {#deployment-vsa}
<a href="javascript:window.open('/content/documentation/media/commercial_kvm_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for KVM (opens in a new window)</a>

#### Contents of HP&#95;StoreVirtual&#95;VSA&#95;Installer&#95;for_KVM.tgz ###
  
HP&#95;StoreVirtual&#95;VSA&#95;Installer&#95;for _KVM.tgz contains the following files:


 * **KVM-VSA-11.5.01.0023.img.gz** - This file contains the VSA image for KVM.

 * **HP&#95;StoreVirtual&#95;VSA&#95;for&#95;KVM_Installer-11.5.01.0023** - This is a dependent binary for VSA installation.

 *	**README.txt**


#### Contents of pyVins package

The pyVins package contains the following files:

* **network_template.xml**: This is XML template file for virtual network creation.

* **storagepool_template.xml**:This is XML template file for virtual storage pool creation.

* **vsa_automation.py**: This is the script to automate the installation of VSA.

* **vsa_export.sh**: This is a configuration file and should be modified based on your setup. 

     Example configuration of the vsa_export.sh file is shown below:

    
	    export VSA_INSTALL_DIR=/home/kvm-admin/kvm-install/
	    
	    export VSA_PACKAGE_PATH=/home/kvm-admin/kvm-install/
	    
	    export VSA_IMAGE_PATH=$VSA_PACKAGE_PATH/KVM-VSA-11.5.01.0023.img.gz
	    
	    export VSA_INSTALLER=$VSA_PACKAGE_PATH/HP_StoreVirtual_VSA_for_KVM_Installer-11.5.01.0023
	    
	    export VSA_CONFIG_FILE=/home/kvm-admin/kvm-install/etc/vsa/vsa_config.json

    where:

    * **VSA&#95;INSTALL_DIR**: refers to the path of the location where the **pyVins** package is downloaded.

    * **VSA&#95;PACKAGE&#95;PATH**: refers to the path of the location where HP StoreVirtual VSA package and installer binary is available. The location should contain KVM-VSA-11.5.01.0023.img.gz & HP&#95;StoreVirtual&#95;VSA&#95;for&#95;KVM&#95;Installer-11.5.01.0023 files.

    * **VSA&#95;IMAGE_PATH**: refers to the package name along with VSA&#95;PACKAGE&#95;PATH.

    * **VSA&#95;INSTALLER**: refers to the installer binary name along with VSA&#95;PACKAGE&#95;PATH.

    * **VSA&#95;CONFIG_FILE**: refers to the location where the  vsa&#95;config.json file is available.


* **vsa_config.json**: This is the configuration file with details for VSA installation.You need to modify this file as per the required VSA configuration 


**Perform the following instructions to configure vsa&#95;config_json file:**

1. Edit the `vsa_config.json` file available at 
`<location of pyVins package>/etc/vsa/vsa_config.json.` <br> An example  `vsa_config.json` file is shown below. You must change the values based on the environment.</br>

		{
		    "network_name": "vsa-network",
		    "virtual_bridge":{
		        "name":"vsa-bridge",
		        "static_ip_address":"192.0.2.249",
		        "netmask":"255.255.255.0",
		        "interface":"eth1"
		    },
		
		    "vsa_config":{
		        "hostname":"vsa-hostname",
		        "os_image_storagepool":"vsa-storage-pool",
		        "os_image_dir":"/home/kvm-admin/vsa-installers",
		        "ip_address":"192.0.2.250",
		        "subnet":"255.255.255.0",
		        "gateway":"192.0.2.1"
		    },
		    "disks":[
		        {
		            "location":"vsa-storage-pool",
		            "size":"15G"
		        }
		        ]
		}

	  
     where:
 
  - **network_name** refers to the name of the VSA network for example:*vsa-network*
  
  - **virtual_bridge** refers to the detail of the virtual bridge- 
  
     -  name (name of the virtual bridge) for example: *vsa-bridge*
     
     -  static&#95;ip_address (the IP address of the bridge) for example: *192.0.2.249*   

	    **NOTE**: The IP address used here should be the part of the same subnet of the overcloud controller. By default, the cloud network is configured for 192.0.2.0/24 network. Use the IP from the end range to avoid conflict with  the Compute nodes.
     
     -  netmask (subnet mask of the bridge) for example: *255.255.255.0*
     
     -  interface (interface of the bridge) for example: *eth1*

	    **NOTE**: The interface of the bridge should be the same interface connected to the private untagged network common to all controller and Compute nodes. 

        <a href="javascript:window.open('/content/documentation/media/commercial_kvm_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Refere to HP Helion OpenStack architecture diagram for KVM (opens in a new window)</a>

  - **hostname** refers to the name of the VSA that is getting installed for example: *vsa-hostname*
        
  - **os&#95;image_storagepool** refers to the VSA where the image will be extracted for example:*vsa-storage-pool*
       
  - **os&#95;image_dir** refers to the directory in which the VSA is created for example:*/home/kvm-admin/vsa-installers*
  
  - **ip&#95;address** refers to the IP address of the VSA for example: *192.0.2.251*
  
  - **subnet** refers to the subnet of the VSA for example: *255.255.255.0*
        
  - **gateway** refers to the router of the VSA for example: *192.0.2.1*

	**NOTE**: The IP address used here should be part of the same subnet of the overcloud controller. By default, the cloud network is configured for 192.0.2.0/24 network. Use the IP from the end range to avoid conflict with the Compute nodes.

  - **location** refers to the name of the storage pool for example: *vsa-storage-pool*
  
  - **size** refers to the size of the disks for example:*15G*


2.Go to the command prompt.

3.Change directory to `<downloaded_script_package>/pyvins/vsa_automation.py` and execute the following command:

   `python vsa_automation.py`
        

Once the installation completes, VSA is deployed.  

**Note**: We recommend deployment of a minimum of three VSAs.


<img src="media/storevirtual-cluster-network-diagram1.png"/>


###Installing HP StoreVirtual Centralized Management Console (CMC) on Linux {#install-hp-storevirtual-vsa}


You must install the CMC to perform the administrative tasks on HP StoreVirtual VSA storage. You can manage the entire network of VSAs from this CMC. 

<!---Section - Installing HP StoreVirtual Centralized Management Console (CMC) on Linux{install-hp-storevirtual-vsa}

Pre-requisites, add following line:-->



**Prerequisites**

* You must be running the X Windows System to install the CMC.

* We recommend that you install CMC on the same KVM host that is used to run the Seed VM. This host has direct network connectivity to servers running HP StoreVirtual VSA.

**Note**: These changes are required for 64-bit operating system only.  

* Execute the following commands:

		apt-get update
		dpkg --add-architecture i386
		apt-cache search ia32-libs
		apt-get install openjdk-7-jdk:i386

**Installation**

Verify if the CMC installer file has executable permission otherwise execute the following command:

		chmod +x CMC_11.5.01.0023.0_Installer_Linux.bin


1. Click the CMC installer.

2. Follow the steps in the installation wizard to complete the installation.

3. To start the CMC:<br>
 From the directory in which the files are installed, click the **HP Store Virtual Centralized Management Console** to launch CMC.  
</br>  

###Creating a cluster{#create-cluster}

We recommend creation of a RAID 10 cluster which comprises three deployed VSAs.  For deploying VSA, refer to section on [Deployment of VSA](#deployment-vsa). Use the following three step process:

**Note: For detailed instructions, refer to CMC Online Help.**

1. Use the **Find Systems** opion of the CMC to discover VSAs.

2. Create a Management Group with three systems.

3. Create a cluster

Your CMC displays the cluster like the figure below:

<img src="media/storevirtual-cluster-network-diagram2.png"/>



###Enabling HP StoreVirtual configuration in the overcloud{#enable-hp-storevirtual-configuration}

To enable HP Storevirtual configuration in the Overcloud, modify the `tripleo/tripleo-incubator/scripts/configure_installer.sh` file in
the seed cloud to update the VSA cluster information. A sample of the configuration file is given below. You need to change the configuration based on your specifications:

		export ENABLE_VSA="True"
		export VSA_API_URL="https://XXX.XXX.XXX.XXX:8081/lhos"
		export VSA_USERNAME="<user name>"
		export VSA_PASSWORD="<password>"
		export VSA_NAME="<cluster name>"
		export VSA_ISCSI_CHAP_ENABLED="<False>"
		export VSA_DEBUG="False"

where:

* **ENABLE_VSA**: Mark this field as *True* to enable HP StoreVirtual VSA configuration. By default the value is False.

* **VSA_API_URL**: This is the URL to access your VSA cluster. Please enter your IP address in this field.

* **VSA_USERNAME**: Enter the cluster user name.

* **VSA_PASSWORD**: Enter the cluster password.

* **VSA_NAME**: Enter the name of the cluster.

* **VSA_ISCSI_CHAP_ENABLED**: Mark this field as *True* if you want to enable CHAP authentication.

* **VSA_DEBUG**: By default the value is *False*, to enable debugging, change it to *True*.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
