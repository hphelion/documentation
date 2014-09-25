---
layout: default
title: "HP Helion OpenStack&#174;: Installation and Configuration"
permalink: /helion/openstack/ga/install/ovsvapp/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/esx/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/dnsaas/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg;: Deploying and Configuring OVSvApp on ESX hosts 
HP Virtual Cloud Networking (VCN) is an enhanced networking (Neutron) module of HP Helion OpenStack that delivers network virtualization to orchestrate your data center infrastructure.

HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) must be installed on each ESX hypervisor in the HP Helion OpenStack environment to provision VMs in your VMware vCenter environment. Once deployed, the OVSvApp enables networking between the tenant Virtual Machines (VMs).

The deployment process includes the following basic steps:

1. Uploading the OVSvApp file to one of the ESX hosts in your data center.The ESX host is the system where ESX is installed.
2. Adding your settings to the configuration file so that the OVSvApp deployment script can clone the file on each host being managed by the overcloud controller.
3. Running the deployment script.

The following topics in this section explain how to deploy and verify deployment of OVSvApp for VCN on ESX hosts.

* [Prerequisites](#prereqs)
* [Deploying the OVSvApp](#deploytemplate)
* [Verifying your deployment](#deploymentverification)
* [Managing the HP VCN networking service](#managevcnnetworkservice)
* [Uninstalling VCN on ESX hosts](#uninstallvcn)
* [Next Steps](#next)

## Prerequisites ## {#prereqs}

Before you install the OVSvApp, ensure the following:

* The HP Helion OpenStack must be installed and configured.

* The VMware vSphere&reg; platform must be installed and configured.

* Please make sure that vCenter server is reachable from the server where OVSvApp VM installation is triggered. Also, make sure that ESX hosts are reachable from the server where OVSvApp VM installation is triggered. The IP address of the ESX hosts should be the same IP address with which the vCenter server manages it. For more information see [Preparing the network for an ESX installation](/helion/openstack/ga/install/prereqs/#network_prepare) in *Before you begin*. 

* Per Datacenter, we have 2 Virtual Distributed Switches (vDS) and they are configured as follows: 

    **vDS1**: This switch has no uplink ports configured on it and has a portgroup of type **VLAN** with **Trunking enabled**. It should contain the list of VLAN tags that are used by OverCloud Neutron service. The **Promiscuous Mode** and **Forged Transmits** options should be set to **Accept** under the **Security** tab for the **Portgroup**.	

      <!---***DVS1***: It should be created without any uplinks. Create a trunk portgroup with VLAN type as **VLAN Trunking** and specify the VLAN trunk range pertaining to the environment. Enable **Promiscuous Mode** and **Forged Transmits** in the portgroup security settings.-->

    **Note**: The name of VLAN trunk portgroup must be associated with `trunk_interface` parameter in the `ovs_vapp.ini` . 
    
    **vDS2**: This switch should have an uplink port/ports connecting to the OverCloud Baremetal Network. Two portgroups should be available for this switch. One of the portgroups (management) handles the management traffic and may or may not be not configured for VLAN. The other portgroup (data) should be of type VLAN with `Trunking enabled`. It should contain the list of VLAN tags that are used by OverCloud Neutron service. The **Promiscuous Mode** and **Forged Transmits** options should be set to **Accept** under the **Security** tab for the data portgroup.

    <!---***DVS2***: It should be created with uplink to the management interface and/or data interface. The following two portgroups must be created in DVS2:
  
    * Create first portgroup with VLAN type as **None**. This is used for management traffic.

    *  Create second portgroup with VLAN type as **VLAN Trunking** and specify the VLAN trunk range pertaining to the environment. This is used for data traffic. Enable **Promiscuous Mode** and **Forged Transmits** in the portgroup security settings.-->

    **Note**: The name of the first portgroup must be associated with `mgmt_interface` parameter and name of the second portgroup must be associated with `data_interface` parameter in the `ovs_vapp.ini`. 

Example:

	DVS1  - trunk portgroup name - vlan_trunk
	DVS2 
		a. Portgroup1  name- mgmt
		b. Portgroup2 name- data

	Changes in ovs_vapp.ini for the above values
	
	[network]

	data_interface={'vmxnet3':'data'}
	mgmt_interface={'vmxnet3':'mgmt'}
	trunk_interface={'vmxnet3':'vlan_trunk'}

<img src="media/ESXi_hypervisor_networking.png"/>


##Deploying the OVSvApp {#deploytemplate}

You must upload the OVSvApp to one of the ESX hosts that is hosting VMs provisioned from HP Helion OpenStack environment. You must then configure the settings in the configuration file that will be used to clone and deploy OVSvApp on each host being managed by the controller.

The deploy process installs the OVSvApp as a virtual machine, which is referred to as *OVSvApp VM* in this document.

**Note**

* The OVSvApp VMs must be installed on each ESX hypervisor. 
* IP address are assigned to the OVSvApp VMs manually. The Administrator must keep a separate pool of IP addresses from the management VLAN to be assigned to the OVSvApp VMs. These IP addresses must be assigned to the Ethernet interfaces connecting to **Management Port Group**.
* Specify distributed virtual switch (DVS) ports in the `ovs_vapp.ini`. Make sure the DVS ports are attached with the proper hosts.

### Create a VM template in vCenter

The first step in deploying the OVSvApp is to create a VM template that will make it easier to deploy the OVSvApp on each ESX hypervisor.

To deploy the OVSvApp:

1. Create a directory `/ovsvapp` on any server in the Helion environment and upload `ovsvapp.tgz`. Extract the `ovsvapp.tgz` and locate the `hp-ovsvapp` directory. In the directory, locate  `overcloud_esx_ovsvapp.ova`. This is the OVSvApp appliance.

2. Use the vSphere client to upload the `overcloud_esx_ovsvapp.ova` file to one of the ESX hosts in your data center: 

	a. In the vSphere Client, click **File > Deploy OVF Template**.

	b. Follow the instructions in the wizard that displays to specify the data center, cluster, and node to install onto. Refer to the VMWare vSphere documentation, as needed.

	The installer creates the OVSvApp appliance (VM) on the specified node. The appliance is listed in the left column of vCenter, by default named overcloud-esx-ovsvapp-<build No>.

3. Add a **CD-ROM** device to the OVSvApp appliance using the vCenter. 

	a. In the vSphere Client, right-click the OVSvApp appliance.

	b. Click **Edit Settings**.	

	c. Select the **Hardware** tab and click **Add**.

	d. Select **DVD/CD-ROM Drive**.

	e. Follow the instructions in the wizard that displays.

	Refer to the VMWare vSphere documentation, as needed.

4. Enable the Virtual Machine Communication Interface (VMCI), a high-speed communication channel between a virtual machine and the ESX hypervisor.

	a. On the **Hardware** tab, select **Enable VMCI Between VMs**. The **Hardware** tab should be open from the previous step.

	b. Click **OK**.

5. Power on the OVSvApp appliance using vCenter. The default credentials to login to the OVSvApp appliance are `stack/stack`. 

6. Install the VMWare tools in the OVSvApp appliance: 
	
	a.In the vSphere Client, right-click the OVSvApp appliance.

	b. Select **Guest > Install/Upgrade VMware Tools**. 

7. Launch the OVSvApp appliance console to install the VMware Tools from command line terminal: 

	a. Right-click the OVSvApp appliance and select **Open Console**.

	b. Enter the following commands:

		sudo su
		mkdir /mnt/vmware-tools
		mount /dev/cdrom/ /mnt/vmware-tools
		cp -f /mnt/vmware-tools/VMwareTools-*.tar.gz /tmp/
		cd /tmp
		tar -zxpf VMwareTools-*.tar.gz
		cd /vmware-tools-distrib
		./vmware-tools-install.pl  --default

	Verify that Vmware Tools is running. Do not proceed with the installation if Vmware Tools is not running.

	Follow the instructions to continue the installation.

8. When the installation completes, shutdown the OVSvApp appliance.

9. Disable the VMCI: 

	a. Right-click the OVSvApp appliance. 

	b.  Click **Edit Settings**.	

	c. Remove the CD/DVD drive

	d. Clear the **Enable VMCI between VMs** option.

### Install the prerequisite python libraries

On the server where you extractd the `ovsvapp.tgz` file, install the prerequisite python libraries:

1.	Install [pyvmomi](https://pypi.python.org/pypi/pyvmomi).

2.	Install [netaddr](https://pypi.python.org/pypi/netaddr).

### Modify and execute the installer

On the server where you extracted the `ovsvapp.tgz` file, locate the `ovs_vapp.ini` file.

1. Modify the `ovs_vapp.ini` file by adding settings for cloning and configuring OVSvApp VMs: 

	a. Locate the `ovs_vapp.ini` file in the `/ovsvapp/hp-ovsvapp/src/ovsvm` directory.
	
	b. Add VMware settings.
	
		[vmware]
		#VCenter IP
		vcenter_ip=vcenter_ipv4_address
		#Vcenter FQDN(Provide FQDN, only if your vcenter certificate is generated with FQDN)(*OPTIONAL)
		vcenter_fqdn=vcenter_server.yourcompany.com
		#Vcenter username
		vcenter_username=vcenter_admin_user
		#Vcenter password
		vcenter_password=vcenter_admin_strong_password
		#Datacenter name
		datacenter=vcenter_datacenter_name
		#Clusters on which OVSvApp will be hosted
		clusters=tenant_cluster1,tenant_cluster2
		#SSL Communication Settings between OVSvApp and Vcenter(*OPTIONAL)
		cert_check=true_or_false
		#Certificate Path. Must required if cert_check=True(*OPTIONAL)
		cert_path=/path/to/vcenter/certificate
		
		[new-host-addition]
		#Keep this field False for Fresh Installation
		installing_new_hosts=true_or_false
		#If you want to add new esxi hosts at later point of time. Provide esxi host name separated by comma.(*Not required if is_new_hosts=False)
		new_hosts=new_esx_host1, new_esx_host2
		#Are this hosts already added to DVS ? True if already part of DVS. False If you want to add. (*Not required if is_new_hosts=False)
		#If host_in_dvs=False then Except *OPTIONAL each and every other fields are mandatory.
		host_in_dvs=true_or_false

	c. Add network port settings.
	
		[network]
		#Tenant network type(vlan/vxlan)
		tenant_network_type=vlan
		#Do you want to use PCI Pass through.
		is_pci_passthrough=true_or_false
		#If you want to use existing DVS and don't want to create DVS automatically then make it False
		is_auto_dvs=true_or_false
		#Unused Physical NIC (same nic across all hosts) to be used for uplink DVS. Make sure no VSS or VDS is using this NIC(*Not required if is_auto_dvs=False).
		nic_name=physical_nic_name
		#Trunk and Uplink DVS name. For vxlan trunk DVS name will be changed automatically to <DVS_Name>_<ClusterName> (*Not required if is_auto_dvs=False)
		trunk_dvs_name=trunk_dvs_name
		#*Not required if is_pci_passthrough=True
		uplink_dvs_name=uplink_dvs_name
		#Portgroup Names. For vxlan trunk port group will be automatically changed to <Port_Group_Name>_<ClusterName>. For vxlan if is_auto_dvs is false then
		#manually all the trunk port group name has to be <Trunk_Portgroup_Name>_<Cluster_Name>. And user has to input
		#only <Trunk_Portgroup_Name>. Because for several clusters we can not take all name as input.
		#Eg. {'<adapter_type>':'<port_group_name>'}
		trunk_interface={'vmxnet3':'trunk_port_group_name'}
		#Data and Mgmt Portgroups Name (*Not required if is_pci_passthrough=True)
		data_interface={'vmxnet3':'uplink_port_group_name'}
		mgmt_interface={'vmxnet3':'mgmt_port_group_name'}
		#VLAN ID for Management Port group(*OPTIONAL)
		mgmt_vlan=mgmt_vlan_id
		#Start and End IP range for OVSvAPP
		start_ip_address=ovsvapp_ipv4_start_address
		end_ip_address=ovsvapp_ipv4_end_address
		#Netmask and gateway for OVSvAPP
		netmask=ovsvapp_ipv4_netmask
		gateway_ip=ovsvapp_ipv4_gateway

	**Notes**: 
	- The start IP address and the end IP address is the block of IPs that was reserved from the Management Network for OVSvApp deployment.
	- The `trunk_interface` must be the VLAN trunk portgroup, as described in the [prerequisites](#prereqs). 
	- The `data_interface` must be the second portgroup, as described in the [prerequisites](#prereqs).

	d. Specify the name for cloning the OVSvApp.
	
		[template]
		#Provide the template/appliance name that will be used for cloning
		template_name=overcloud-esx-ovsvapp

	e. Specify a name, the number of CPUs, and the amount of RAM  for the deployed OVSvApp.

    **Note**: During deployment, the `ovs_vm_name` setting is appended with each VM host name and IP address to appear as `<ovs_vm_name>_<IP>`
	
		[vmconfig]
		#The deployed ovsvapp name. It will be appended with esxi hostname. And will look like <ovs_vm_name>_<vm_ip>
		ovs_vm_name=ovsvapp_prefix_name
		
		#Number of CPUs for the OVSvApp VM
		num_cpu=number_of_cpu_for_ovsvapp
		#Amount of RAM for the OVSvApp VM(In MB)
		memory_mb=ram_in_mb_for_ovsvapp
		#SSH key file path for OVSvAPP password less login
		ssh_key_path=/path/to/ssh/key

	f. Specify RabbitMQ settings.

		[rabbitmq]
		#RabbitMQ host(Mulitple hosts can be given by comma separated value)
		rabbitmq_host=rabbitmq_host_ipv4_address
		#RabbitMQ user
		rabbitmq_user=rabbitmq_user_name
		#RabbitMQ password
		rabbitmq_pass=rabbitmq_password

	Where:
	- controller0 is overcloud controller0
	- controller1 is overcloud controller1
	- controllermgmt is overcloud controller management

	g. Specify the IP address of your NTP server.

		[ntp]
		ntp_server=ntp_server_ipv4_address


	h. Specify disaster recovery information.

		[disaster-recovery]
		#If set to True(If you have a DRS enabled cluster), then on OVSvApp crash/kernel panic the host will be put to maintenance mode.
		#Maintenance mode will trigger DRS to migrate the tenant VMS. If set to false, then esx host will be shut down along with all tenant VMs. (*OPTIONAL)
		esx_maintenance_mode=true_or_false

	**Note:** If set to true in a [DRS cluster](http://www.vmware.com/products/vsphere/features/drs-dpm),if the OVSvApp crashes or enters kernel panic, the ESX host is put in Maintenance Mode. Maintenance mode will trigger DRS to migrate the tenant VMs. 
	If set to false, the ESX host will be shut down along with all tenant VMs.

	i. Specify the level for logging errors, and a log file location. Default file location is:`/var/log/ovsvapp_log`

		[logger]
		#Log level. Such as DEBUG, INFO
		log_level=DEBUG_or_INFO


	**EXAMPLE**
	
		[vmware]
		#VCenter IP
		vcenter_ip=15.22.10.12
		#Vcenter username
		vcenter_username=Administrator
		#Vcenter password
		vcenter_password=Password@123
		#Datacenter name
		datacenter=Datacenter
		#Clusters on which OVSvApp will be hosted
		clusters=Cluster1, Cluster2, Cluster3
		#SSL Communication Settings between OVSvApp and Vcenter
		#Do you want to use Certificate Check
		cert_check=True
		#Certificate Path. Not required if cert_check=False
		cert_path=/home/user/rui.cert
		
		[network]
		#Tenant network type(vlan/vxlan)
		tenant_network_type=vlan
		#If you want to use existing DVS and don't want to create DVS automatically then make it False
		is_auto_dvs=True
		#Trunk and Uplink DVS name. For vxlan trunk DVS name will be changed automatically to <DVS_Name>_<ClusterName> (Not required if is_auto_dvs=False)
		trunk_dvs_name=vappTrunk
		uplink_dvs_name=vappUplink
		#Portgroup Names. For vxlan trunk port group will be automatically changed to <Port_Group_Name>_<ClusterName>. For vxlan if is_auto_dvs is false then
		#manually all the trunk port group name has to be <Trunk_Portgroup_Name>_<Cluster_Name>. And user has to input
		#only <Trunk_Portgroup_Name>. Because for several clusters we can’t take all name as input.
		#Eg. {'<adapter_type>':'<port_group_name>'}
		trunk_interface={'vmxnet3':'vappTrunkPG'}
		data_interface={'vmxnet3':'vappDataPG'}
		mgmt_interface={'vmxnet3':'vappMgmtPG'}
		#Start and End IP range for OVSvApp
		start_ip_address=192.168.1.10
		end_ip_address=192.168.1.20
		#Netmask and gateway for OVSvApp
		netmask=255.255.255.0
		gateway_ip=192.168.1.1
	
		[template]
		#Provide the template/appliance name that will be used for cloning
		template_name=overcloud-esx-ovsvapp
	
		[vmconfig]
		#The deployed ovsvapp name. It will be appended with esxi hostname. And will look like <ovs_vm_name>_<esxi_host_name>
		ovs_vm_name=vapp
		#Number of CPUs for the OVSvApp VM
		num_cpu=2
		#Amount of RAM for the OVSvApp VM
		memory_mb=2048
	
		[rabbitmq]
		#RabbitMQ host
		rabbitmq_host=100.191.30.21
		#RabbitMQ user
		rabbitmq_user=guest
		#RabbitMQ password
		rabbitmq_pass=guest
	
		[ntp]
		ntp_server=100.191.30.1
		[disaster-recovery]
		#If set to True (If you have a DRS enabled cluster), then on OVSvApp crash/kernel panic the host will be put to maintenance mode.
		#Maintenance mode will trigger DRS to migrate the tenant VMS. If set to false, then esx host will be shut down along with all tenant VMs.
		esx_maintenance_mode=True
	
		[logger]
		#Log level. Such as DEBUG, INFO
		log_level=DEBUG

2. Invoke the installer using the following commands:

	cd /hp-ovsvapp/src/ovsvm/
	Invoke the installer using the following commands:

		sudo su
		cd /hp-ovsvapp/src/ovsvm/
		python  invoke_vapp_installer.py

	The installation log file will be located at `/hp-ovsvapp/log/ovs_vapp.log`

## Verifying your deployment {#deploymentverification}

After the OVSvApp deployment script is run successfully, you can see the OVSvApp deployed on all the specified ESX hosts. 

1. Login to the overcloud controller from the Seed:  

		ssh heat-admin@<ip overcloud controller>

2. Switch to root.
 
3. Enter the following command.

		source /root/stackrc
	
4. Enter the following command.
 
		neutron agent-list 
	
5. For all the HP VCN L2 agents check whether agent alive status is **:-)**. If  the status is **xxx** for an agent then login to that OVSvApp using SSH Key provided in ovs_vapp.ini file, restart the `hpvcn-neutron-agent` using the following command:

		sudo service hpvcn-neutron-agent restart 

6. Re-verify the agent reporting in the overcloud controller by running the following command.

		neutron agent-list

    All agents should indicate alive status that is denoted by**:-)**.


## Managing HP VCN networking {#managevcnnetworkservice}

Enter the following commands to stop and restart the HP VCN networking service (`hpvcn-neutron-agent`):

* `sudo service hpvcn-neutron-agent stop`

* `sudo service hpvcn-neutron-agent start`

## Uninstalling OVSvApp VM on ESX hosts {#uninstallvcn}

To uninstall VCN on ESX hosts, access the ESX hosts from vSphere Client, and delete each OVSvApp VM.


## Next Steps {#next}

- Deploy vCenter ESX Compute proxy manually **(REQUIRED)**

	If you have not deployed the vCenter ESX compute proxy, see [HP Helion OpenStack&#174; Deploy vCenter ESX compute proxy](/helion/openstack/ga/install/esx/proxy/).

- Install DNS as a service (DNSaaS) (Optional).

	If you have not installed DNSaaS, see [DNSaaS Beta Installation and Configuration](/helion/openstack/install/dnsaas/).

	DNSaaS is our managed DNS service, based on the OpenStack Designate project, is engineered to help you create, publish, and manage your DNS zones and records securely and efficiently to either a public or private DNS server network.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

