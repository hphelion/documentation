---
layout: default
title: "HP Helion OpenStack: Beta Installation and Configuration"
permalink: /helion/openstack/install-beta/ovsvapp/
product: commercial

---


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install-beta/esx/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/dnsaas/">NEXT &#9654;</a> </p>

#Deploying and configuring OVSvApp for HP Virtual Cloud Networking (VCN) on ESX hosts

HP Virtual Cloud Networking (VCN) is an enhanced networking (Neutron) module of HP Helion
OpenStack that delivers network virtualization to orchestrate your data center infrastructure.

HP VCN enables you to build a robust, multi-tenant networking infrastructure by providing:

* Scalable, secure, and hardened enterprise cloud networking
* Automated delivery of secure isolated networks in minutes


HP Virtual Cloud Networking's Open vSwitch vApp (OVSvApp) must be installed for HP Helion OpenStack environment to provision VMs in your VMware vCenter environment.Once deployed, OVSvApp appliance enables networking between the tenant Virtual Machines (VMs).

The deployment process includes the following basic steps:

1. Uploading the OVSvApp appliance file to one of the ESX hosts in your data center.
2. Adding your settings to the configuration file so that the OVSvAPP deployment script can clone the file on each host being managed by the overcloud controller.
3. Running the deployment script.


The following topics in this section explain how to deploy and verify deployment of OVSvApp for VCN on ESX hosts.

* [Deploying the OVSvAPP appliance](#deploytemplate)
* [Verify your deployment](#deploymentveification)
* [Managing VCN network service](#managevcnnetworkservice)
* [Uninstalling VCN on ESX hosts](#uninstallvcn)


 
##Deploying the OVSvApp appliance {#deploytemplate}

You must upload the OVSvApp appliance to one of the ESX hosts that is hosting tenant network VMs provisioned from HP Helion OpenStack environment. You must then configure the settings in the configuration file that will be used to clone and deploy OVSvApp appliance on each host being managed by the controller.

<!---1. On the host where you have uploaded and extracted the `ce_installer.tgz` and `ovsvapp.tgz` files, locate `overcloud_esx_ovsvapp.ova`. This file is  OVSvAPP VM template file.-->

1. Create a directory `/ovsvapp` in the seed VM and upload `ovsvapp.tgz`. Extract the `ovsvapp.tgz` and locate the `hp-ovsvapp` directory.In the directory, locate  `overcloud_esx_ovsvapp.ova`. This is the OVSvAPP appliance.

2. Upload the `overcloud_esx_ovsvapp.ova` file to one of the ESX hosts in your data center.

3. In the vCenter, edit the VM settings to add the device type as **CD-ROM**. This is required to install the VMware tools.

4. Power on the appliance which you have uploaded and install VMware tools. For more information, refer to the following URL:

    [https://www.vmware.com/support/ws5/doc/ws_newguest_tools_linux.html](https://www.vmware.com/support/ws5/doc/ws_newguest_tools_linux.html)


5. After installing the tools, edit `/etc/rc.local` in the appliance and add the following before the `exit 0` entry: 

     `sleep 100` 
    
     `service hpvcn-neutron-agent restart`

6. Power off the appliance.
  
7. Export the python path in the seed VM

    `export PYTHON_PATH= /ovsvapp/hp-ovsvapp/src/`

8. In the Seed VMs `/ovsvapp/hp-ovsvapp/src/ovsvm`  folder, locate the `ovs_vapp.ini` file and add your settings for cloning and configuring OVSvApp VMs.
   
    Run the script to deploy OVSvApp VMs on the hosts specified in `ovs_vapp.ini` file.
 
     `$ python /ovsvapp/hp-ovsvapp/src/ovsvm/invoke_ovs_vapp.py`

<!---
5. Install `pyvmomi` and `netaddr python` modules on the machine from where you  run the installer script, using the following command.

    `#pip install pyvmomi`

    `#pip install netaddr`

6. In the `hp-ovsvapp\src\ovsvm` folder, locate the `ovs_vapp.ini` file, and add your settings
for cloning and configuring OVSvApp VMs.

**Note**: It is important that you carefully enter and verify the settings you add to the file because the configuration in the `ovs_vapp.ini` file is deployed to multiple OVSvApp VMs. -->

   a. Add VMware settings.

   * For clusters, specify the name of each cluster on which to host OVSvApp, separated by commas.

   * For `skip_hosts`, specify the IP address of each host where you do not want to install OVSvApp, separated by commas.
     
		[vmware]
		version=<vmware_version>
		vcenter_ip=<vcenter_ip>
		vcenter_username=<vcenter_username>
		vcenter_password=<vcenter_password>
		datacenter=<datacenter_name>
		clusters=<ComputeCluster1,ComputeCluster2>
		skip_hosts=<skip_host_IP,skip_host_IP>


b. Add network port settings. <!--Settings for `standard_port` group is optional. not for beta --->

		[network]
		data_interface={'<nic_type>':{'<port_group_name>'}
		mgmt_interface={'<nic_type>':{'<port_group_name>'}
		trunk_interface={'<nic_type>':{'<port_group_name>'}
		start_ip_address=<start IP address> 
		end_ip_address=<end IP address> 
		netmask=<netmask> 
		gateway_ip=<gateway>

**Note**: The start IP address and the end IP address is the block of IPs that was reserved from the Management Network for OVSvApp deployment.

c. Specify the name for cloning the appliance.
			
		[template]
		template_name=overcloud-esx-ovsvapp
		
d. Specify a name, the number of CPUs, and the amount of RAM  for the deployed OVSvApp appliance.

**Note**: During deployment, the ovs&#95;vm&#95;name setting is appended with each VM host name and IP address to appear as <ovs&#95;vm&#95;name>&#95; &#60;IP>
			
		[template]
		ovs_vm_name=<ovs_vm_name>
		num_cpu=<number_of_CPUs>
		memory_mb=<amount_of_memory>

e. Specify RabbitMQ settings.

		[rabbitmq]
		rabbitmq_host=<rabbitmq_host_IP>
		rabbitmq_user=<rabbitmq_username>
		rabbitmq_pass=<rabbitmq_password>

f. Specify the level for logging errors, and a log file location. Default file location is 

`/var/log/ovsvapp_log`.
	
	[logger]
		log_level=<log_level>
		log_file=<log_file_location>

	Example


		#[vmware]
		#version=5.1
		#vcenter_ip=15.21.18.1
		#vcenter_username=Administrator
		#vcenter_password=Password123
		#datacenter=Datacenter
		#clusters=testCluster
		#skip_hosts=15.21.18.3,15.21.18.6
		
		#[network]
		#data_interface={'vmxnet3':'DataPort'}
		#mgmt_interface={'vmxnet3':'MgmtPort'}
		#trunk_interface={'vmxnet3':'TrunkPort'}
		
		#[template]
		#template_name=overcloud-esx-ovsvapp
		
		#[vmconfig]
		#ovs_vm_name=ovsvapp
		#num_cpu=2
		#memory_mb=2048
		
		#[rabbitmq]
		#rabbitmq_host=10.10.11.12
		#rabbitmq_user=root
		#rabbitmq_pass=skyline
		
		#[logger]
		#log_level=DEBUG
		#log_file=/var/logs/ovsvapp_vm.log

9.Run the script to deploy OVSvApp appliance on the hosts specified in `ovs_vapp.ini` file.

   `$ python /hp-ovsvapp/src/ovsvm/invoke_ovs_vapp.py`


##Verifying your deployment {#deploymentverification}

After the OVSvApp deployment script is run successfully, you can see the OVSvApp appliance deployed on all the specified ESX hosts. 

1. Login to the overcloud controller from the Seed  

     `# ssh heat-admin@<ip overcloud controller> `

2. Switch to root.
 
3. Enter the following command.

    `#source /root/stackrc` 
	
4. Enter the following command.
 
    `#neutron agent-list` 
	
5. For all the HP VCN L2 agents check whether agent alive status is **:-)**. If  the status is **xxx** for an agent then login to that OVSvApp appliance using credentials stack/stack, restart the hpvcn agent using the following command

    `$sudo service hpvcn-neutron-agent restart`  

6. Re-verify the agent reporting in the overcloud controller by running the following command.

    `#neutron agent-list`

    All agents should indicate alive status that is denoted by**:-)**.

<!---After the OVSvApp deployment script is run successfully, you can see the OVSvApp VMs deployed on all the specified ESX hosts. Perform the following steps to verify the deployment:

1. On one of the ESX hosts, log on to the deployed OVSvApp VM using the credentials `stack/stack`.

2. Run the following command:

		`$sudo service hpvcn-neutron-agent status'

	A message similar to the following confirms that the OVSvApp deployment is successful.

	`hpvcn-neutron-agent start/running, process 4835`

3. Repeat steps 1 and 2 to verify the deployment of the OVSvApp VMs on the other ESX hosts you specified in the `ovs_vapp.ini` file. 

4. (Optional) To verify that configuration on each OVSvApp VM is successful, review the following files on each VM.

	*  `/etc/neutron/neutron.conf`
	*  `/etc/neutron/plugins/hp/hpvcn_neutron_agent.ini`-->


##Managing the HP VCN networking service {#managevcnnetworkservice}

You must stop and restart the HP VCN networking service to reload the changes you made during
your OVSvApp deployment. 

Enter the following commands to stop and restart the HP VCN networking service:

* `'sudo service hpvcn-neutron-agent stop'`

* `'sudo service hpvcn-neutron-agent start'`


##Uninstalling VCN on ESX hosts {#uninstallvcn}

To uninstall VCN on ESX hosts, access the ESX hosts from vSphere Client, and delete each OVSvApp VM.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>