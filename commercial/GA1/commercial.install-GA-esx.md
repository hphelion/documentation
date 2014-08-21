---
layout: default
title: "HP Helion OpenStack: Beta Installation and Configuration"
permalink: /helion/openstack/ga/install/esx/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install-beta/vsa/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/ovsvapp/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg;: Beta Installation and Configuration for ESX Hypervisor
<!-- not required
Welcome to the HP Helion Openstack beta. HP Helion OpenStack beta is based on  Icehouse version of OpenStack and uses TripleO program. It aims at installing, upgrading, and operating OpenStack clouds using OpenStack as the installation mechanism.  


HP Helion OpenStack beta Edition manages ESX hosts using the VMware vCenter driver available in the community. The VMware vCenter driver makes use of clusters exposed through vcenter to manage ESX hosts. This implies, The clusters in the vCenter needs to be managed by Cloud OS. This document provides installation instructions for HP Helion OpenStack beta Edition preview on a suitably specified and prepared single-node system.
	
The following topics explain the installation and configuration process of HP Helion OpenStack beta Edition in detail. To ensure successful installation, please read through the topics before you start.--->

  

HP Helion Openstack beta allows you to manage the VMWare vCenter and provision virtual machines. <!---ESX integration in HP Helion Openstack beta enables cloud admin to bring up an overcloud and utilize the ESX environment to create virtual machines.-->  

It is important to read through this page before starting your installation. We also recommend that you review the following:

* [hardware and network configuration requirements](/helion/openstack/install-beta-overview/##installation-requirements) 
* [support matrix](/helion/openstack/support-matrix-beta/)
* [installation process and prerequisites](/helion/openstack/install-beta/prereqs/)

<!--**Note:** This release (Beta) provides the option, that this is an early phase demonstration of functionality and is only intended to give an impression of the installation process and of the overall structure of a deployed HP Helion OpenStack Community system. The demonstrated functionality is nearly identical to the virtualized test environments that the engineering team uses in its automated QA pipeline for basic functional testing.--->

The rest of this page explains the beta installation and configuration process for ESX. 



* [ESX deployment architecture](#deploy-arch)
* [Additional network requirements](#networkreq)
* [Downloading the installation packages](#getinstall)
* [Installing HP Helion OpenStack](#install)
   * [Configuring proxy information](#proxy)
   * [Unpacking installation file](#unpackinstall)
   * [Installing the seed VM and building your cloud](#startseed)
* [Verifying your installation](#verifying-your-installation)
   * [Connecting to Horizon console](#connectconsole)
   * [Connecting to to Monitoring UI](#monitoring)
* [Deploying Open vSwitch vApp](#ovsvapp)
* [Installing DNS as a service](#configure)
* [Next steps](#next-steps)
 


##ESX deployment architecture {#deploy-arch}


The following diagram depicts a simplified deployment scenario.

<a href="javascript:window.open('/content/documentation/media/commercial_esx_network_architecture.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP Helion OpenStack beta architecture diagram for ESX (opens in a new window)</a>


##Additional network requirements {#networkreq}

These additional network components are required for an ESX installation:
 
* VLAN trunking and native VLAN should be enabled on the private network. This is to cater to untagged PXE traffic with the tenant.<!--- Private network that caters to the PXE traffic needs to be a VLAN trunk line with a default VLAN (native) tag at the switch port side for all systems that are part of the environment.-->
 
* VMware vCenter management must be a part of the private network (192.0.2.x)


## Downloading the installation packages {#getinstall}
Before you begin, you must download the required HP Helion OpenStack installation packages:

<table style="text-align: left; vertical-align: top; width:650px;">
	
<tr style="background-color: lightgrey; color: black;">
	
<td><b> Installation package </b></td><td><b>File name</b></td>
<tr style="background-color: white; color: black;">
 <td>HP Helion OpenStack beta</td><td>HPHelionOpenStack_BetaJune30.tgz</td></tr>
	
<tr style="background-color: white; color: black;">
<td>HP Virtual Cloud Networking </td><td>HP_OVSvApp.zip</td></tr>
</td></tr>

<tr style="background-color: white; color: black;">
<td>HP Helion OpenStrack DNSaaS (Optional) </td><td>HP_dnsaas-installer_0.0.4b11.tar.gz</td></tr>
</td></tr>
</table>

1. Log in to your install system as root:

        sudo su -

2. Register and then log in to download the required installation packages from this site:

    [HP Helion OpenStack product installation](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221247%22%7D/Show)

For more details, refer to the *Creating the baremetal.csv file* section on the [HP Helion OpenStack Beta Installation: Before you begin](/helion/openstack/install-beta/prereqs/#install-pkg) page.

## Installing HP Helion Openstack ## {#install}

Ensure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through:

* [Configuring proxy information](#proxy)
* [Unpacking installation file](#unpackinstall)
* [Installing the seed VM and building your cloud](#startseed)

**IMPORTANT:** During the installation process, **DO NOT RESTART** the system running the installer and seed VM. Restarting this system disrupts the baremetal bridge networking configuration and disables both the undercloud and overcloud. If the system is inadvertently restarted, you must initiate the installation process again.

### Configuring proxy information {#proxy}
Before you begin your installation, if necessary, configure the proxy information for your environment using the following steps:

1. Ensure you are logged into your install system as root; otherwise, log in as root: 

        sudo su -

2. Add the following lines to `/etc/environment`:

        export http_proxy=http://<web proxy IP/
        export https_proxy=http://web proxy IP/
        export no_proxy=localhost,127.0.0.1,<your 10.x IP address>
 

3. Log out and re-login to your baremetal server to activate the proxy configuration.

### Unpacking installation file ## {#unpackinstall}

1. Ensure you are logged into your install system as root; otherwise, log in as root:

        sudo su -

2. Create a directory named `work`:

         mkdir /root/work
         cd /root/work

3.  Extract the kit to the `work` directory:

         tar zxvf /root/work/<baremetal kit name>.tgz

    This creates and populates a `tripleo/` directory within `work' directory.

4. If the external device name on the host system (the one through which the host, and indirectly the seed, accesses the IPMI network) is **NOT** named `eth0`, then determine the device name before executing the next step:

        $ export BRIDGE_INTERFACE=<devicename>

    Examples:

        $ export BRIDGE_INTERFACE=em1  
        $ export BRIDGE_INTERFACE=eth5

5. Use the following command to set the CLOUD_TYPE environment variable for ESX:
		
	    Export CLOUD_TYPE=esx

### Installing the seed VM and building your cloud ### {#startseed}
1. To start the seed VM installation, enter the following command:

        bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_start_seed.sh
    
    **Note**:The installation process takes approximately 10 minutes to complete.

    If the seed startup is successful, you should see a message similar to the following:

        "Wed Apr 23 11:25:10 IST 2014 --- completed setup seed"

2. To build the cloud, start by logging in to the seed VM. Run the following command from /root:

        ssh root@192.0.2.1 

    **Note**: It might take a few moments for the seed VM to become reachable. 

  
3. When prompted for host authentication, type `yes` to allow the ssh connection to proceed.


4. Ensure the information in the `baremetal.csv` file is correct and in the following format, and then upload to /root.

        <mac_address>,<ilouser>,<ilopassword>,<iloipaddress>,<#cpus>,<memory_MB>,<diskspace_GB>
     
    **Important**: There must be one entry in this file for each baremetal system you intend to install. The file must contain exactly five lines for the ESX installation. For example, your file should look similar to this:

        78:e7:d1:22:5d:58,operator,password,192.168.11.1,12,32768,2048
        78:e7:d1:22:5d:10,operator,password,192.168.11.5,12,32768,2048
        78:e7:d1:22:5d:a8,operator,password,192.168.11.4,12,32768,2048
        78:e7:d1:22:52:9b,operator,password,192.168.11.6,12,32768,2048
        78:e7:d1:22:52:9e,operator,password,192.168.11.7,12,32768,2048

    **Note:** For more information on creating this file, refer to [Creating the baremetal.csv file](/helion/openstack/install-beta/prereqs/#req-info) on the *Before you begin* page.

5. [Optional] If you have installed the IPMItool, use it to verify that network connectivity from the seed VM to the baremetal servers in your baremetal.csv is working.

6. Manually power off each baremetal system specified in /root/baremetal.csv before proceeding with the installation. 
    
    **IMPORTANT:** Ensure that each system is configured in the BIOS to stay powered off in the event of being shutdown rather than automatically restarting.

7. Edit `configure_installer.sh` to provide your VMware vCenter connection details. 

        /root/tripleo/tripleo-incubator/scripts/configure_installer.sh
  
    For example:

	    export ENABLE_VCENTER="True"
	    export VCENTER_IP="<15.14.19.17>"
	    export VCENTER_USERNAME="<Administrator>"
	    export VCENTER_PASSWORD="<Password>"
	    export VCENTER_CLUSTERS="<Cluster1>","<Cluster2>","<Cluster3>","<Cluster 4>"
        export ENABLE_VSA="False"

8. You should set OVERCLOUD_NeutronPublicInterface and UNDERCLOUD&#95;NeutronPublicInterface to the name of the interface that carries Neutron external traffic on your overcloud and undercloud. By default, it is *eth2*. The following example sets the value of the variable to *eth0*.

            $ export OVERCLOUD_NeutronPublicInterface=eth0
            $ export UNDERCLOUD_NeutronPublicInterface=eth0 
	
9. Set OVERCLOUD_COMPUTESCALE to 1, which is the currently supported limit. If you do not specify a value, the value is derived based on the number of lines remaining in `/root/baremetal.csv` once the undercloud, overcloud control, and overcloud swift nodes are removed.

    To set this variable:

        $ export OVERCLOUD_COMPUTESCALE=1

10. HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) must be installed for HP Helion OpenStack environment to provision VMs in your vCenter environment. For each VM host, an OVSvAPP is deployed. Before you deploy the OVSvApp, you must ensure that a block of IP addresses from the Management Network is reserved for the OVSvApp VMs. The block of IPs depends on the number of ESX hosts that you have in your vCenter. You can accomplish this by shrinking the pool of the floating IPs in the Management Network. By default, the floating IP range is between 192.0.2.129 - 192.0.2.254. You can shrink the range by exporting the following variables:

        # export FLOATING_START=<Start IP Address>
        # export FLOATING_END=<End IP Address>

    **For example**:

        # export FLOATING_START=192.0.2.129
        # export FLOATING_END=192.0.2.200

    This block of floating IP addresses is used while deploying OVSvApp.

11. To install and configure the undercloud and overcloud, run the following command from /root. 

        bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh

    If your installation is successful, a message similar to the following is displayed:
 
        "HP - completed - Tue Apr 22 16:20:20 UTC 2014"

**Note:** If `hp_ced_start_seed` fails to start the seed, you simply need to restart it (step 1) and then follow the rest of the steps.

## Verifying your installation

### Connecting to Horizon console ### {#connectconsole}

Ensure you can access the overcloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, export the undercloud passwords:

		. /root/tripleo/tripleo-undercloud-passwords

2. Export the undercloud users:

		TE_DATAFILE=/root/tripleo/testenv.json . /root/tripleo/tripleo-incubator/undercloudrc

3. Assign the overcloud IP address to a variable:

        OVERCLOUD_IP=$(nova list | grep "overcloud-controller" | awk ' { print $12 } ' | sed s/ctlplane=// )

4. Determine the overcloud controller IP from the output of step 3 using the following command. It is in the last line returned.
  
        echo ${OVERCLOUD_IP}

    If the optional second network was configured, the overcloud controller IP is the value set for NeutronPublicInterfaceIP.

5. From your install system, open a web browser and point to:

        http://<overcloud_IP>/

6. Log in to the overcloud Horizon dashboard as user `demo` with the password you obtained from the `/root/tripleo/tripleo-overcloud-passwords` file in step 4.


**Note:** If you are unable to connect to the Horizon console, check your proxy settings to ensure that access to the controller VM is successfully redirected through a proxy.


### Connecting to Monitoring UI ### {#monitoring}

1. From the seed, run the following command:

		. /root/stackrc

2. Assign the undercloud IP address to a variable:

		`UNDERCLOUD_IP=$(nova list | grep "undercloud" | awk ' { print $12 } ' | sed s/ctlplane=// )`

3. Determine the undercloud IP from the output of step 2 using the following command. It is in the last line returned.
  
        echo ${UNDERCLOUD_IP}

4. From your install system, open a web browser and point to:

        http://<undercloud_IP>/icinga/

5. Log in as user 'icingaadmin' with password 'icingaadmin'.

## Deploying Open vSwitch vApp {#ovsvapp}

HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) must be installed for HP Helion OpenStack environment to provision VMs in your VMware vCenter environment. Once deployed, OVSvApp appliance enables networking between the tenant Virtual Machines (VMs).

<!---To complete your HP Helion OpenStack installation and deploy OVSvAPP:

1. Before you deploy the OVSvApp, you must ensure that a block of IP addresses from the Management Network is reserved for the OVSvApp VMs. You can accomplish this by shrinking the pool of the floating IPs in the Management Network.By default, the floating IP range is between 192.0.2.129 - 192.0.2.254. You can shrink the range by exporting the following variables:

        # export FLOATING_START=<Start IP Address>
        # export FLOATING_END=<End IP Address>

    **For example**:

        # export FLOATING_START=192.0.2.129
        # export FLOATING_END=192.0.2.200

This block of floating IP addresses is used while deploying OVSvApp. -->

Deploy OVSvApp for ESX hosts. See [Deploying and configuring OVSvApp for HP Virtual Cloud Networking (VCN) on ESX hosts](/helion/openstack/install-beta/ovsvapp/) for complete instructions. 

## Installing DNS as a service (DNSaaS) {#configure}

Our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.

Installing HP Helion OpenStack DNSaaS is **optional**. Before you attempt the DNSaaS installation, you *must* have already installed HP Helion Openstack beta and verified that it is configured correctly and operational. 

Learn how to [install DNS as a service](/helion/openstack/install-beta/dnsaas/).



## Next steps
* [Logging into the HP Helion OpenStack dashboards](/helion/openstack/dashboard/login/)
* [How to use the HP Helion OpenStack dashboards](/helion/openstack/dashboard/how-works/)
* [HP Helion OpenStack services overview](/helion/openstack/services/overview/)



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

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

