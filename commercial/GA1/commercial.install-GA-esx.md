---
layout: default
title: "HP Helion OpenStack: Installation and Configuration"
permalink: /helion/openstack/ga/install/esx/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/vsa/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/ovsvapp/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg;: Installing and Configuring the ESX Hypervisor

HP Helion OpenStack can be installed on a VMware ESX bare-metal or virtual hypervisor. This document provides installation instructions for HP Helion OpenStack Edition preview on a suitably specified and prepared system.

HP Helion OpenStack on an ESX hypervisor allows you to manage the VMware vCenter and provision virtual machines.


## Installing HP Helion OpenStack ## {#install}

The installation and configuration process for ESX consists of the following general steps: 

* [Verify Prerequisites](#pre)
* [Review the ESX deployment architecture](#deploy-arch)
* [Perform additional network requirements](#networkreq)
* [Downloading the installation packages](#getinstall)
* [Starting the installation](#install)
   * [Configuring proxy information](#proxy)
   * [Unpacking installation file](#unpackinstall)
   * [Installing the seed VM and building your cloud](#startseed)
* [Verifying your installation](#verifying-your-installation)
   * [Connecting to Horizon console](#connectconsole)
   * [Connecting to to Monitoring UI](#monitoring)
* [Deploying Open vSwitch vApp](#ovsvapp)
* [Installing DNS as a service](#configure)
* [Next steps](#next-steps)
 


## Verify Prerequisites ## {#pre}

To ensure successful installation, please read through the topics before you start.

* Review the [support matrix](/helion/openstack/ga/support-matrix/) for information on the supported hardware and software.
* Make sure your environment meets the [hardware and network configuration requirements](/helion/openstack/ga/install/prereqs/). 
* [Perform required pre-installation tasks](/helion/openstack/ga/install/prereqs/)

## Review the ESX deployment architecture ## {#deploy-arch}

***QUESTION: Is this simplified diagram OK? Accurate? Useful? I linked to the new, more detailed diagram in the prereqs.***

The following diagram depicts a simplified deployment scenario.

<a href="javascript:window.open('/content/documentation/media/commercial_esx_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack architecture diagram for ESX (opens in a new window)</a>

For a more detailed network diagram, see [HP Helion OpenStack&#174; Installation: Before you begin](/helion/openstack/ga/install/prereqs/#network_prepare).

## Perform additional network requirements ## {#networkreq}

***QUESTION: Is this information OK? Accurate? Useful?***

These additional network components are required for an ESX installation:
 
* VLAN trunking and native VLAN should be enabled on the private network. This is to cater to untagged PXE traffic with the tenant.<!--- Private network that caters to the PXE traffic needs to be a VLAN trunk line with a default VLAN (native) tag at the switch port side for all systems that are part of the environment.-->
 
* VMware vCenter management must be a part of the private network (192.0.2.x)

## Download the installation packages {#getinstall}
Before you begin, you must download the required HP Helion OpenStack installation packages:

***QUESTION: New files names?***
<table style="text-align: left; vertical-align: top; width:650px;">
	
<tr style="background-color: lightgrey; color: black;">
	
<td><b> Installation package </b></td><td><b>File name</b></td>
<tr style="background-color: white; color: black;">
 <td>HP Helion OpenStack</td><td>HPHelionOpenStack_June30.tgz</td></tr>

<tr style="background-color: white; color: black;">
<td>HP Helion OpenStrack DNSaaS (Optional) </td><td>HP_dnsaas-installer_0.0.4b11.tar.gz</td></tr>
</td></tr>
</table>

1. Log in to your install system as root:

        sudo su -

2. Register and then log in to download the required installation packages from this site:

    [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show)

### Next Step ###

Jump to the section regarding the type of installation we are performing:

- [Installing HP Helion Openstack on a virtual hypervisor](#virtual)
- [Installing HP Helion Openstack on a baremetal hypervisor](#baremetal)

---------------------
## Install HP Helion Openstack on a virtual hypervisor ## {#virtual}

Make sure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through:

* [Configuring proxy information](#proxy)
* [Unpacking installation file](#unpackinstall)
* [Installing the seed VM and building your cloud](#startseed)

**IMPORTANT:** During the installation process, **DO NOT RESTART** the system running the installer and seed VM. Restarting this system disrupts the bridge networking configuration and disables both the undercloud and overcloud. If the system is inadvertently restarted, you must initiate the installation process again.

### Unpack the installation file ### {#unpackinstall}

1. Ensure you are logged into your install system as root; otherwise, log in as root:

		sudo su -

2. Create a directory named `work`:

		mkdir /root/work
		cd /root/work

3.  Extract the kit to the `work` directory:

		tar zxvf /root/<kit name>.tgz

	This creates and populates a `tripleo/` directory within `work' directory.

### Install the seed VM and build your cloud ### {#startseed}

1. Start the seed installation

		OVERCLOUD_CLOUD_TYPE="ESX" bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed

	When seed VM install is successful, you will see a message similar the following:

		"Wed Sep 23 11:25:10 IST 2014 --- completed setup seed"

2. Login to the seed VM using the following command:

		ssh root@192.0.2.1

3 Use the following command to set the CLOUD_TYPE environment variable for ESX:

		export CLOUD_TYPE=esx

4. Use the following commands to set environment variables

		export OVERCLOUD_NTP_SERVER="16.110.135.123"
		export UNDERCLOUD_NTP_SERVER="16.110.135.123"
		export OVERCLOUD_CLOUD_TYPE="ESX"
		export PROVIDER_NETWORK="192.168.10.0/24"
		export CUSTOMER_ROUTER_IP="192.168.10.1"
		export OVERCLOUD_VIRTUAL_INTERFACE=eth0
		export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID="101"
		export VLAN_RANGE="200:300"

	**Where:**
	
	- `UNDERCLOUD_NTP_SERVER` variable is the IP address of **ntp.hp.net** for the undercloud and is **REQUIRED**.
	- `OVERCLOUD_NTP_SERVER` vatiable is the IP address of **ntp.hp.net** for the overcloud and is **REQUIRED**.
	- `OVERCLOUD_CLOUD_TYPE` is always ESX for an ESX hypervisor installation
	- `PROVIDER_NETWORK` is the 
	- `CUSTOMER_ROUTER_IP` is the 
	- `OVERCLOUD_VIRTUAL_INTERFACE` in the 
	- `OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID` is the 
	- `VLAN_RANGE` is the 

5. Install and configure the undercloud and overcloud, run the following command from /root. 

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh

    If your installation is successful, a message similar to the following is displayed:
 
		"HP - completed - Tue Sep 22 16:20:20 UTC 2014"

### Next Step ###

After you receive the *completed* message, you should verify the installation by connecting to the overcloud and undercloud dashboards.

Jump down to [Verifying your installation](#verify).

---------------------------------------

## Install HP Helion Openstack on a baremetal hypervisor## {#install}

Make sure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through:

* [Configuring proxy information](#proxy)
* [Unpacking installation file](#unpackinstall)
* [Installing the seed VM and building your cloud](#startseed)

**IMPORTANT:** During the installation process, **DO NOT RESTART** the system running the installer and seed VM. Restarting this system disrupts the bridge networking configuration and disables both the undercloud and overcloud. If the system is inadvertently restarted, you must initiate the installation process again.

### Unpack the installation file ### {#unpackinstall}

1. Ensure you are logged into your install system as root; otherwise, log in as root:

		sudo su -

2. Create a directory named `work`:

		mkdir /root/work
		cd /root/work

3.  Extract the kit to the `work` directory:

		tar zxvf /root/<kit name>.tgz

	This creates and populates a `tripleo/` directory within `work' directory.

### Install the seed VM and build your cloud ### {#startseed}

1. Start the seed installation

		OVERCLOUD_CLOUD_TYPE="ESX" bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed

	When seed VM install is successful, you will see a message similar the following:

		"Wed Sept 23 11:25:10 IST 2014 --- completed setup seed"

2 Login to the seed VM using the following command:

		ssh root@192.0.2.1

3. Ensure the information in the [`baremetal.csv` configuration file](/helion/openstack/install-beta/prereqs/#req-info) file is correct and in the following format and upload THE FILE to `/root`.
		<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GB>

	***QUESTION: Must use IPMI user vs ILO user in beta?***

	**Important**: There must be one entry in this file for each baremetal system you intend to install. The file must contain exactly five lines for the ESX installation. For example, your file should look similar to the following:

		78:e7:d1:22:5d:10,administrator,password,192.168.11.5,12,32768,2048
		78:e7:d1:22:5d:58,administrator,password,192.168.11.1,8,16384,2048
		78:e7:d1:22:52:90,administrator,password,192.168.11.3,12,32768,2048
		78:e7:d1:22:5d:c0,administrator,password,192.168.11.2,12,32768,2048
		78:e7:d1:22:5d:a8,administrator,password,192.168.11.4,12,32768,2048
		78:e7:d1:22:52:9b,administrator,password,192.168.11.6,12,32768,2048
    
	**Note:** For more information on creating this file, refer to [Creating the baremetal.csv file](/helion/openstack/ga/install/prereqs/#req-info) on the *Before you begin* page.

4. [Optional] If you have installed the IPMItool, use it to verify that network connectivity from the seed VM to the baremetal servers in your baremetal.csv is working.

	***QUESTION: Still optional? Not in https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/ee_ga_ironic_quick_start.***

6. Edit `configure_installer.sh` to provide your VMware vCenter connection details. 

	***QUESTION: Still optional? Not in https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/ee_ga_ironic_quick_start.***

		/root/tripleo/tripleo-incubator/scripts/configure_installer.sh

	For example:

		export ENABLE_VCENTER="True"
		export VCENTER_IP="<15.14.19.17>"
		export VCENTER_USERNAME="<Administrator>"
		export VCENTER_PASSWORD="<Password>"
		export VCENTER_CLUSTERS="<Cluster1>","<Cluster2>","<Cluster3>","<Cluster 4>"
		export ENABLE_VSA="False"

5. Manually power off each baremetal system specified in /root/baremetal.csv before proceeding with the installation. 
    
    **IMPORTANT:** Ensure that each system is configured in the BIOS to stay powered off in the event of being shutdown rather than automatically restarting.

9. Release floating IP addresses for networking.

	***QUESTION: More info needed on how to determine the IP range. How does this help. DOes shrinking the floating IP range free up IPs for the private IPs needed for OVSvApp??***

	By default, the installation creates a pool of floating IP addresses that you can assign to virtual machines. However, the HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) required by the ESX environment requires a block of IP addresses. You create more IP addresses for OVSvApp by restricting the number of floating IP addresses created.

	By default, the floating IP range is between 192.0.2.129 - 192.0.2.254. You can shrink the range by exporting the following variables:

		# export FLOATING_START=<Start IP Address>
		# export FLOATING_END=<End IP Address>

    **For example**:

		# export FLOATING_START=192.0.2.129
		# export FLOATING_END=192.0.2.200

	**Note:** If the above settings are changed, set the 'NeutronPublicInterfaceDefaultRoute' variable to the actual gateway for the customized IP range.

10. Use the following commands to set environment variables

		export OVERCLOUD_NTP_SERVER="16.110.135.123"
		export UNDERCLOUD_NTP_SERVER="16.110.135.123"
		export OVERCLOUD_CLOUD_TYPE="ESX"
		export PROVIDER_NETWORK="192.168.10.0/24"
		export CUSTOMER_ROUTER_IP="192.168.10.1"
		export OVERCLOUD_VIRTUAL_INTERFACE=eth0
		export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID="101"
		export VLAN_RANGE="200:300"

	**Where:**
	
	- `UNDERCLOUD_NTP_SERVER` variable is the IP address of **ntp.hp.net** for the undercloud and is **REQUIRED**.
	- `OVERCLOUD_NTP_SERVER` vatiable is the IP address of **ntp.hp.net** for the overcloud and is **REQUIRED**.
	- `OVERCLOUD_CLOUD_TYPE` is always ESX for an ESX hypervisor installation
	- `PROVIDER_NETWORK` is the 
	- `CUSTOMER_ROUTER_IP` is the 
	- `OVERCLOUD_VIRTUAL_INTERFACE` in the 
	- `OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID` is the 
	- `VLAN_RANGE` is the 

12. Install and configure the undercloud and overcloud, run the following command from /root. 

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh

	If your installation is successful, a message similar to the following is displayed:
 
		"HP - completed - Tue Apr 22 16:20:20 UTC 2014"

        "HP - completed - Tue Apr 22 16:20:20 UTC 2014"

### Next Step ###

After you receive the *completed* message, you should verify the installation by connecting to the overcloud and undercloud dashboards.

Jump down to [Verifying your installation](#verify).

---------------------------------------

## Verify your installation {#verify}

To verify that the installation is successful, connect to the HP Helion Openstack dashboard and the undercloud dashboard as follows.

### Connect to the Horizon console ### {#connectconsole}

Ensure you can access the overcloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, export the undercloud passwords:

		. /root/tripleo/tripleo-overcloud-passwords

2. Export the undercloud users:

		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc-user

3. Assign the overcloud IP address to a variable:

		DEMO_IP=$(nova list | awk '/\| demo \|/{print $13}')

4. Determine the overcloud controller IP from the output of step 3 using the following command. It is in the last line returned.
  
        ssh root@${DEMO_IP}

    If the optional second network was configured, the overcloud controller IP is the value set for NeutronPublicInterfaceIP.

5. From your install system, open a web browser and point to:

        http://<overcloud_IP>/

6. Log in to the overcloud Horizon dashboard as user `admin` with the password you obtained from the `/root/tripleo/tripleo-overcloud-passwords` file in step 4.


**Note:** If you are unable to connect to the Horizon console, check your proxy settings to ensure that access to the controller VM is successfully redirected through a proxy.

### Connect to the undercloud Horizon console ### {#monitoring}

1. From the seed, run the following command:

		. /root/stackrc

2. Assign the undercloud IP address to a variable:

		`UNDERCLOUD_IP=$(nova list | awk '/\| undercloud/{print $12}' | sed 's/ctlplane=//'); echo $UNDERCLOUD_IP`

3. Determine the undercloud IP from the output of step 2 using the following command. It is in the last line returned.
  
        echo ${UNDERCLOUD_IP}

4. Obtain the undercloud admin password using the following command:

	`UNDERCLOUD_ADMIN_PASSWORD=$(grep UNDERCLOUD_ADMIN_PASSWORD /root/tripleo/tripleo-undercloud-passwords | sed 's/UNDERCLOUD_ADMIN_PASSWORD=//'); echo $UNDERCLOUD_ADMIN_PASSWORD`

5. From your install system, open a web browser and point to:

        http://<undercloud_IP>/icinga/

6. Log in as user 'admin' with the admin password.


## Next Steps

- Deploy vCenter ESX Compute proxy manually **(REQUIRED)**

	To deploy vCenter Nova-Compute proxy into a cloud deployment an set of automated step is available through the scripts. But there are few manual steps still needed to bring up Nova-Compute proxy VM.

	See [HP Helion OpenStack&#174; Deploy vCenter ESX compute proxy](/helion/openstack/ga/install/esx/proxy/).

- Deploy the Open vSwitch vApp **(REQUIRED)**. 

	HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) must be installed for HP Helion OpenStack environment to provision VMs in your VMware vCenter environment. Once deployed, OVSvApp appliance enables networking between the tenant Virtual Machines (VMs).

	For installation intructions, see the [Deploying and configuring OVSvApp for HP Virtual Cloud Networking (VCN) on ESX hosts](/helion/openstack/install/ovsvapp/) document for complete instructions. 

	See [Deploying and configuring OVSvApp for HP Virtual Cloud Networking (VCN) on ESX hosts](/helion/openstack/ga/install/ovsvapp/).

- Install DNS as a service (DNSaaS) (Optional).

	Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

	For installation intructions, see [DNSaaS Beta Installation and Configuration](/helion/openstack/install/dnsaas/).

	See [HP Helion OpenStack: DNSaaS Installation and Configuration](/helion/openstack/ga/install/dnsaas/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*










<!---
Perform the following steps to install OVSvAPP VM :

1. Location <where the zip file will be available>.TBD

2. Unzip `ovsvapp_deployment.rar`. It contains a template file `CloudOSOVSvAppVM` and an executable file `ovsvm`. The executable file is located in ` ovsvm/sec/ovsvm`. TBD

3. Import the template using vSphere client.

3. Verify the configuration of OVSvAPP VM from the template file and make sure you have adequate resource available on ESXi hosts.HP recommends to use the sample template without any modification.

4.	Upload the template file in any one of the ESXi hosts or servers.

5.	Copy the executable file `ovsvm` to the server which has connectivity to vCenter. The inputs for executable file are stored in `ovs_vapp.ini` file. Update the file as per your environment, for example: 

		[vmware]
		vcenter_ip=15.146.194.180
		vcenter_username=Administrator
		vcenter_password=12iso*help
		datacenters=TestDataCenter
		clusters=ComputeCluster1,ComputeCluster2
		#Keep it empty if you don’t want to skip installation on particular host
		skip_hosts=15.146.194.181, 15.146.194.182
		[network]
		domain=asiapacific.cpqcorp.net
		#Carefully maintain the dictionary structure
		nic_map={'nic1':{'vmxnet3':'dvPortGroupVM1'}, 'nic2':{'vmxnet3':'dvDataPortGroup1'}, 'nic3':{'vmxnet3':'dvMgmtPortGroup1'}}
		
		[template]
		#Carefully provide the name of the template that you have just created
		template_name=CloudOSOVSvAppVM
		ovs_vm_name=ovsvapp
		
		[logger]
		log_level=DEBUG
		#Make sure the directory exists
		log_file=/var/logs/ovsvapp_vm.log


7. Execute the following command:

    	paython invoke_ovs_vapp.py 


8.	Once the VMs are deployed, they need to be updated to have required OVS bridges and connections created. 

	a. Login to the OVSvAPP VM with the username **root** and password **hpvapp**.
 
    b. Edit `/etc/neutron/plugins/hp/hpvcn_neutron_agent.ini`:

		 [DEFAULT]
		vmwareapi_host_ip = <vCenter_host_ip>
		vmwareapi_host_username = <vCenter_username>
		vmwareapi_host_password = <vCenter_password>
		vmwareapi_retry_count = 2
		vmwareapi_wsdl_loc = https://<vCenter_host_ip>/sdk/vimService.wsdl
		cluster_dvs_mapping =  DatacenterName/host/ClusterName:VdsName
		esx_hostname= <esx host_name or ip_address>
		
		#OVS settings
		security_bridge=br-sec
		integration_bridge=br-int
		bridge_mappings=physnet1:<bridge_interface>
		
		# example
		# Inventory path of cluster : vDS name
		# cluster_dvs_mapping = DatacenterName/host/ClusterName:Vds-Name
		
		[SECURITYGROUP]
		firewall_driver=neutron.agent.linux.ovs_firewall.OVSFirewallDriver

    c.	 Execute the following command as root to create the required bridges: 

      i. For creating integration bridge (br-int):

    	ovs-vsctl add-br br-int

     ii. Create the data interface bridge on **eth2**. Data interface is the Ethernet device of this VM which connects to **Data Port Group**. Usually, **eth2** is the data interface in OVSvAPP VM. Verify the data interface for your environment. 

	    ovs-vsctl add-br br-eth2
	    ovs-vsctl add-port br-eth2 eth2

	iii. Create the security bridge on **eth3** assuming **eth3** interface is connected to **Trunk Port Group**.

	    ovs-vsctl add-br br-sec
	    ovs-vsctl add-port br-sec eth3

	iv.	Assign an IP address to the interface connecting to **Management Port Group**. This IP address must be from the management VLAN subnet of overcloud. Administrator needs to keep a separate pool of IP address from Management VLAN subnet for this purpose.

**Note**

* OVSvAPP VMs are created one-by-one on each ESXi host. 
* The IP Address assignment to OVSvAPP VM is manual. The Administrator needs to keep a separate pool of IP addresses from management VLAN to be assigned to these VMs. These IP addresses must be assigned to the Ethernet interfaces connecting to **Management Port Group**.
* Provide the DV ports in the `ovs.ini`. Make sure the dv ports are attached with the proper hosts


--->