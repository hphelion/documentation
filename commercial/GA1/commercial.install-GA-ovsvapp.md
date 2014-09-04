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

# HP Helion OpenStack&reg;: Deploying and configuring OVSvApp on ESXi hosts 

HP Virtual Cloud Networking (VCN) is an enhanced networking (Neutron) module of HP Helion OpenStack that delivers network virtualization to orchestrate your data center infrastructure.

HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) must be installed for HP Helion OpenStack environment to provision VMs in your VMware vCenter environment. Once deployed, OVSvApp appliance enables networking between the tenant Virtual Machines (VMs).

The deployment process includes the following basic steps:

1. Uploading the OVSvApp appliance file to one of the ESXi hosts in your data center.The ESXi host is the system where ESX is installed.
2. Adding your settings to the configuration file so that the OVSvAPP deployment script can clone the file on each host being managed by the overcloud controller.
3. Running the deployment script.

The following topics in this section explain how to deploy and verify deployment of OVSvApp for VCN on ESXi hosts.

* [Prerequisites](#prereqs)
* [Deploying the OVSvAPP appliance](#deploytemplate)
* [Verifying your deployment](#deploymentverification)
* [Managing the HP VCN networking service](#managevcnnetworkservice)
* [Uninstalling VCN on ESXi hosts](#uninstallvcn)

## Prerequisites ## {#prereqs}

Before you install the OVSvApp appliance, ensure the following:

* The HP Helion Openstack must be installed and configured.

* The VMware vSphere&reg; platform must be installed and configured.

* Two specific networks must be installed and configured for the VMware vCenter environment. The network is used for communication between specific aspects of vCenterL - the OVSvApp communicates with the Neutron message queue. For more information see [Preparing the network for an ESX installation](/helion/openstack/ga/install/prereqs/#network_prepare) in *Before you begin*. 

* The VMware cluster has two Virtual Distributed Switches (vDS) and they  are configured as follows: 

    **vDS1**: This switch has no uplink ports configured on it and has a portgroup of type **VLAN** with **Trunking enabled**. It should contain the list of VLAN tags that are used by OverCloud Neutron service. The **Promiscuous Mode** and **Forged Transmits** options should be set to **Accept** under the **Security** Tab of the **Portgroup**.	


      <!---***DVS1***: It should be created without any uplinks. Create a trunk portgroup with VLAN type as **VLAN Trunking** and specify the VLAN trunk range pertaining to the environment. Enable **Promiscuous Mode** and **Forged Transmits** in the portgroup security settings.-->

    **Note**: The name of VLAN trunk portgroup must be associated with `trunk_interface` parameter in the `ovs_vapp.ini` . 
    
    **vDS2**: This switch should have an uplink port/ports connecting to the OverCloud Baremetal Network. Two portgroups should be available for this switch. One of the portgroups (management) handles the management traffic and is not configured for VLAN.The other portgroup (data) should be of type VLAN with `Trunking enabled`. It should contain the list of VLAN tags that are used by OverCloud Neutron service. The **Promiscuous Mode** and **Forged Transmits** options should be set to **Accept** under the **Security** Tab of the **Portgroup**.

    <!---***DVS2***: It should be created with uplink to the management interface and/or data interface. The following two portgroups must be created in DVS2:
  
    * Create first portgroup with VLAN type as **None**. This is used for management traffic.

    *  Create second portgroup with VLAN type as **VLAN Trunking** and specify the VLAN trunk range pertaining to the environment. This is used for data traffic. Enable **Promiscuous Mode** and **Forged Transmits** in the portgroup security settings.-->

    **Note**: The name of the first portgroup must be associated with `mgmt_interface` parameter and name of the second portgroup must be associated with `data_interface` parameter in the `ovs_vapp.ini`. 

Example:

	DVS1  - trunk portgroup name - vlan_trunk
	DVS2- Portgroup1  name- mgmt
	Portgroup2 name- data

	Changes in ovs_vapp.ini for the above values
	
	[network]

	data_interface={'vmxnet3':'data'}
	mgmt_interface={'vmxnet3':'mgmt'}
	trunk_interface={'vmxnet3':'vlan_trunk'}

<img src="media/ESXi_hypervisor_networking.png"/>


##Deploying the OVSvApp appliance {#deploytemplate}

You must upload the OVSvApp appliance to one of the ESXi hosts that is hosting VMs provisioned from HP Helion OpenStack environment. You must then configure the settings in the configuration file that will be used to clone and deploy OVSvApp appliance on each host being managed by the controller.

1. Create a directory `/ovsvapp` in the seed VM and upload `ovsvapp.tgz`. Extract the `ovsvapp.tgz` and locate the `hp-ovsvapp` directory. In the directory, locate  `overcloud_esx_ovsvapp.ova`. This is the OVSvAPP appliance.

2. Use the the vSphere client to upload the `overcloud_esx_ovsvapp.ova` file to one of the ESXi hosts in your data center: 

	a. 	In the vSphere Client, click **File > Deploy OVF Template**.

	b. Follow the instructions in the wizard that displays.

	Refer to the VMWare vSphere documentation, as needed.

3. Add a **CD-ROM** device In the vCenter, edit the VM settings to add . 

	a. In the vSphere Client, right-click the appliance.

	b. Click **Edit Settings**.	

	c. Select the **Hardware** tab and click **Add**.

	d. Select **DVD/CD-ROM Drive**.

	b. Follow the instructions in the wizard that displays.

	Refer to the VMWare vSphere documentation, as needed.

4. Enable the Virtual Machine Communication Interface (VMCI), a high-speed communication channel between a virtual machine and the ESXi host

	a. In the vSphere Client, right-click the appliance.

	b. Click **Edit Settings**.	
	
	c. In the **Edit Settings** window, select the **Hardware** tab.

	d. Select **Enable VMCI Between VMs**.

	e. Click **OK**.

5. Power on the appliance to which you have uploaded and installed VMware tools using the default credentials: `stack/stack`. For more information, refer to the following URL:

    [https://www.vmware.com/support/ws5/doc/ws_newguest_tools_linux.html](https://www.vmware.com/support/ws5/doc/ws_newguest_tools_linux.html)

6. In the vCenter, right-click the appliance and select **Guest > Install/Upgrade VMware Tools** to install VMware tools.

7. Login to the appliance and install the VMware Tools from command line terminal: # mkdir /mnt/vmware-tools:

		mount /dev/cdrom/ /mnt/vmware-tools
		cp –rf /mnt/vmware-tools/VMwareTools-*.tar.gz /tmp/
		cd /tmp
		tar zxpf VMwareTools-*.tar.gz
		cd /vmware-tools-distrib
		./vmware-tools-install.pl

	Follow the instructions to continue the installation.

8. When the installation completes, shutdown the appliance.

9. Disable the VMCI: 

	a. Right-click on the appliance 

	b. Edit settings

	c. Remove the CD/DVD drive

	d. Clear the **Enable VMCI between VMs** option.

10. Install the prerequisite python libraries:

	- [pyvmomi](https://pypi.python.org/pypi/pyvmomi)
	- [netaddr](https://pypi.python.org/pypi/netaddr)

11. In the seed VM, modify the `ovs_vapp.ini` file by adding settings for cloning and configuring OVSvApp VMs: 

	a. Locate the `ovs_vapp.ini` file in the `/ovsvapp/hp-ovsvapp/src/ovsvm` directory, locate the `ovs_vapp.ini` file.
	
	b. Add VMware settings.
	
		[vmware]
		vcenter_ip=<ip_address>
		vcenter_username=<vcenter_username>
		vcenter_password=<vcenter_password>
		datacenter=<datacenter_name>
		clusters=Cluster1, Cluster2, Cluster3
		cert_check=True
		cert_path=/home/user/rui.cert
	
	c. Add network port settings.
	
		[network]
		tenant_network_type=vlan
		is_auto_dvs=True
		trunk_dvs_name=vappTrunk
		uplink_dvs_name=vappUplink
		data_interface={'<nic_type>':{'<port_group_name>'}
		mgmt_interface={'<nic_type>':{'<port_group_name>'}
		trunk_interface={'<nic_type>':{'<port_group_name>'
		start_ip_address=<start_ip_address>
		end_ip_address=<end_ip_address>
		netmask=<netmask>
		gateway_ip=<gateway>
	
	**Notes**: 
	- The start IP address and the end IP address is the block of IPs that was reserved from the Management Network for OVSvApp deployment.
	- The `trunk_interface` must be the VLAN trunk portgroup, as described in the [prerequisites](#prereqs). 
	- The `data_interface` must be the second portgroup, as described in the [prerequisites](#prereqs).

	d. Specify the name for cloning the appliance.
	
		[template]
		template_name=overcloud-esx-ovsvapp

	e. Specify a name, the number of CPUs, and the amount of RAM  for the deployed OVSvApp appliance.

    **Note**: During deployment, the `ovs_vm_name` setting is appended with each VM host name and IP address to appear as `<ovs_vm_name>_<IP>`
	
		[vmconfig]
		ovs_vm_name=<ovs_vm_name>
		num_cpu=<number_of_CPUs>
		memory_mb=<amount_of_memory>

	f. Specify RabbitMQ settings.

		[rabbitmq]
		rabbitmq_host=<ip_address>
		rabbitmq_user=guest
		rabbitmq_pass=guest

	g. Specify the IP address of your NTP server.

		[ntp]
		ntp_server=<ip_address>

	h. Specify disaster recovery information.

		[disaster-recovery]
		esx_maintenance_mode=True

	**Note:** If set to true in a [DRS cluster](http://www.vmware.com/products/vsphere/features/drs-dpm),if the OVSvApp crashes or enters kernel panic, the ESXi host is put in Maintenance Mode. Maintenance mode will trigger DRS to migrate the tenant VMs. 
	If set to false, the ESXi host will be shut down along with all tenant VMs.

	i. Specify the level for logging errors, and a log file location. Default file location is:`/var/log/ovsvapp_log`

	**EXAMPLE**

		[logger]
		#Log level. Such as DEBUG, INFO
		log_level=DEBUG
	
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
		#Start and End IP range for OVSvAPP
		start_ip_address=192.168.1.10
		end_ip_address=192.168.1.20
		#Netmask and gateway for OVSvAPP
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

11. Invoke the installer using the following commands:

	cd /hp-ovsvapp/src/ovsvm/
	python invoke_vapp_installer.py

	The installation log file will be located at `/hp-ovsvapp/log/ovs_vapp.log`

##Verifying your deployment {#deploymentverification}

After the OVSvApp deployment script is run successfully, you can see the OVSvApp appliance deployed on all the specified ESXi hosts. 

1. Login to the overcloud controller from the Seed:  

         ssh heat-admin@<ip overcloud controller>

2. Switch to root.
 
3. Enter the following command.

        source /root/stackrc
	
4. Enter the following command.
 
         neutron agent-list 
	
5. For all the HP VCN L2 agents check whether agent alive status is **:-)**. If  the status is **xxx** for an agent then login to that OVSvApp appliance using credentials stack/stack, restart the hpvcn agent using the following command

        sudo service hpvcn-neutron-agent restart 

6. Re-verify the agent reporting in the overcloud controller by running the following command.

        neutron agent-list

    All agents should indicate alive status that is denoted by**:-)**.

	<!---After the OVSvApp deployment script is run successfully, you can see the OVSvApp VMs deployed on all the specified ESXi hosts. Perform the following steps to verify the deployment:

1. On one of the ESXi hosts, log on to the deployed OVSvApp VM using the credentials `stack/stack`.

2. Run the following command:

		`sudo service hpvcn-neutron-agent status'

	A message similar to the following confirms that the OVSvApp deployment is successful.

	`hpvcn-neutron-agent start/running, process 4835`

3. Repeat steps 1 and 2 to verify the deployment of the OVSvApp VMs on the other ESXi hosts you specified in the `ovs_vapp.ini` file. 

4. (Optional) To verify that configuration on each OVSvApp VM is successful, review the following files on each VM.

	*  `/etc/neutron/neutron.conf`
	*  `/etc/neutron/plugins/hp/hpvcn_neutron_agent.ini`-->


##Managing the HP VCN networking service {#managevcnnetworkservice}

You must stop and restart the HP VCN networking service to reload the changes you made during
your OVSvApp deployment. 

Enter the following commands to stop and restart the HP VCN networking service:

* `sudo service hpvcn-neutron-agent stop`

* `sudo service hpvcn-neutron-agent start`


##Uninstalling VCN on ESXi hosts {#uninstallvcn}

To uninstall VCN on ESXi hosts, access the ESXi hosts from vSphere Client, and delete each OVSvApp VM.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


<!--- Removed from after step 8, In the Seed VM's folder /ovsvapp/hp-ovsvapp/src/ovsvm....
5. Install `pyvmomi` and `netaddr python` modules on the machine from where you  run the installer script, using the following command.

    `pip install pyvmomi`

    `pip install netaddr`

6. In the `hp-ovsvapp\src\ovsvm` folder, locate the `ovs_vapp.ini` file, and add your settings for cloning and configuring OVSvApp VMs.

**Note**: It is important that you carefully enter and verify the settings you add to the file because the configuration in the `ovs_vapp.ini` file is deployed to multiple OVSvApp VMs. -->
