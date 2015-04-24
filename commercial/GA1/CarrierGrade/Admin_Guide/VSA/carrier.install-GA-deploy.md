---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Alpha): Installing HP StoreVirtual VSA Centralized Management Console (CMC) and Deploying VSA"
permalink: /helion/openstack/carrier/install/vsa/deploy/
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

<!--
<p style="font-size: small;"> <a href="/helion/openstack/1.1/install/vsa/">&#9664; Deploying HP StoreVirtual VSA </a>| <a href="/helion/openstack/carrier/install/vsa/cluster/">Creating a StoreVirtual Cluster and adding it to a new Management Group &#9654;</a>
</p> 
-->

# HP Helion OpenStack&#174; Carrier Grade (Alpha): Installing HP StoreVirtual VSA Centralized Management Console (CMC) and Deploying VSA

In order to configure the HP StoreVirtual VSA nodes, you must first install the CMC. You can manage all connected StoreVirtual VSA instances from single CMC connected to HP Helion OpenStack management network.


### Prerequisites {#prerequisites}

* You must be running the X Windows System to install the CMC.

* We recommend that you install CMC on the same KVM host that is used to run the seed VM. This host has direct network connectivity to servers running HP StoreVirtual VSA. However, you may select an alternate host as long as it is accessible from the HP Helion OpenStack management network.


**Note**: These changes are required for 64-bit operating system only.

* Execute the following commands:

		# apt-get update
		# dpkg --add-architecture i386
		# apt-get install openjdk-7-jdk:i386

### Installation {#installation}

1. Verify if the CMC installer file inside `tripleo` directory (packaged with the HP Helion OpenStack&#174; installer) has executable permission. If not, execute the following command:

		# chmod +x CMC_11.5.01.0079.0_Installer_Linux.bin

2. Launch the installer:

		# ./CMC_11.5.01.0079.0_Installer_Linux.bin

3. Follow the steps in the console-based installation wizard to complete the installation.

4. To start the CMC, if you have direct GUI access:<br />
 From the directory in which the files are installed, click the **HP Store Virtual Centralized Management Console** to launch CMC.  

	**Note**: To launch the CMC from command line (CLI), navigate to the location where it is installed and enter: 
			
     	# ./"HP Store Virtual Centralized Management Console".

	Alternatively, if you use a remote server, you can connect to the head node using XRDP and configure the storage using CMC through an RDP session:

	To do this, on the head node enter:
		
		apt-get install xrdp
		
		service xrdp start
		
	From a Windows laptop (for example), use RDP (mstsc.exe), enter the IP address of the head node, and click **Connect**.
		
	At the login prompt enter you credentials and click **OK**. When the remote desktop connection screen opens, click on the RDP terminal session and enter:
		
		cd /opt/hp/storevirtual/ui
		
		java -jar UI.jar
		
	to start the CMC GUI.

	**Note:** In the event that you cannot see what you are typing in the RDP terminal session, enter:

		xterm -fg black -bg white &

	A second RDP terminal session will open in the RDP session and you can then proceed as above - that is:

		cd /opt/hp/storevirtual/ui
		
		java -jar UI.jar

	to start the CMC GUI.





<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Deploying HP StoreVirtual VSA {#deploy-vsa}


###Prerequisites {#prerequisites-vsa}

Ensure the following prerequisites are fulfilled before HP StoreVirtual Storage systems are deployed:

* Before enrolling the new Baremetal server for StoreVirtual deployment, ensure that `#ironic node-list` in the undercloud server does not have any free nodes.This is required to register a new node which matches the disk requirements for StoreVirtual and is picked by the installer for StoreVirtual deployment.

 
* Ensure that you have created a minimum of two(2) RAID groups. You can create a maximum of eight(8) groups. The first RAID group where the OS image is deployed is not considered for StoreVirtual storage.

* Each physical disk should be RAID protected and should not be RAID 0. You can use RAID 5 and above. <!--For more details, refer - [**Storevirtual documentation LINK**]-->

* For deploying StoreVirtual systems without Adaptive Optimization (AO) the setup must have a minimum two(2) disks(/dev/sda, /dev/sdb).

* For deploying StoreVirtual systems with Adaptive Optimization (AO) the setup must have at least three(3) disks(/dev/sda, /dev/sdb,/dev/sdc). The disk /dev/sdb should be a Solid State Drive(SSD).


* Ensure that you create the RAID group for SSD drives immediately after creating the RAID group for boot volume. For example: If three RAID groups are to be created. The following is recommended :

      **Step 1**: Create the first RAID group for HDD drives and mark this as boot volume(/dev/sda)
        
	   **Step 2**: Create the second RAID group for SSD drives which should be used as Tier 0 for AO (/dev/sdb)
         
	   **Step 3**: Create the third RAID group for HDD drives which will be used as Tier 1(/dev/sdc)

* Seed Cloud is installed and is running.
 
The license for the StoreVirtual VSA license is bundled with HP Helion OpenStack&#174; and has a maximum limit of 50 TB per node. Hence the total amount of the configured storage on an individual StoreVirtual node should not exceed 50 TB. To extend the 50 TB per node limit, you can add nodes. A VSA cluster can support up to 16 nodes, which means configured storage on a VSA cluster can be as much as 800 TB.

**Note**: Use of StoreVirtual VSA is included with your Helion OpenStack license.  When installing StoreVirtual VSA under the Helion OpenStack license, the CMC may display a message that some features are not licensed. This message displays in error and can be ignored if you have licensed the physical server with a Helion OpenStack license. 

<!--<img src="media/storevirtual-cluster-network-diagram1.png"/>-->



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----

