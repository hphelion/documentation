---
layout: default
title: "HP Helion OpenStack&#174; Flexible Control Plane"
permalink: /helion/openstack/flexiblecontrol/install
product: commercial.ga

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Flexible Control Plane Installation
The HP Helion OpenStack Flexible Control Plane introduces the capacity to deploy the control plane in a virtual environment in addition to the current bare-metal physical deployment.  This new configuration reduces the control plane footprint to just three servers from the current seven to ten servers.

Make sure you have satisfied the [prerequisites](/helion/openstack/flexiblecontrol/overview) before you begin these installation steps.

This topic contains:

- [Step-by-step Installation Instructions](#instruct)
- [Post-Installation Steps](#postinstall)
- [Adding the Overcloud Nodes](#addnodes)
- [Known Issues and Resolutions](#knownissues)

##Before You Begin
Make sure you have satisfied the [prerequisites](/helion/openstack/flexiblecontrol/overview) before you begin these installation steps.

Before you can install the Flexible Control Plane, you will need to:

- [Review prerequisites and configure the infrastructure](/helion/openstack/flexiblecontrol/overview/#prereq) accordingly
- [Create configuration files](/helion/openstack/flexiblecontrol/overview/#configfiles)
- [Set up KMV hosts](/helion/openstack/flexiblecontrol/overview/#kvmsetup)
- Deploy an HP Helion cloud

##Step-by-step Installation Instructions {#instruct}
1. On each of the three [KVM hosts](/helion/openstack/flexiblecontrol/overview/#kvmsetup) prepared earlier, create a *brbm* bridge and add the physical NIC which connects to the Management and other networks.
2. For example, on KVM Host (A), the NIC is **eth1**:

		ovs-vsctl add-br brbm
		ovs-vsctl add-port brbm eth1
		export BRIDGE_INTERFACE=brbm
		ifconfig brbm 192.168.124.2

1. Similarly, for KVM Hosts B and C

		ovs-vsctl add-br brbm
		ovs-vsctl add-port brbm eth0
		export BRIDGE_INTERFACE=brbm
		ifconfig brbm 192.168.124.3
		ovs-vsctl add-br brbm
		ovs-vsctl add-port brbm eth0
		export BRIDGE_INTERFACE=brbm
		ifconfig brbm 192.168.124.4
1. Log in to KVM Host A.
2. Create an SSH key by executing:
 
		ssh-keygen -t rsa -N


1. Copy the private and public key to KVM Hosts B and C.
2. Test and ensure that you can connect to Hosts B and C from A without having to provide a password.
 
		ssh-copy-id -i /root/.ssh/id_rsa.pub root@192.168.124.3
		scp /root/.ssh/id_rsa 192.168.124.3:/root/.ssh/
5. Download and extract the installer to the */root* folder on KVM Host A.
 
		cd /root
		tar zxvf ee_installer.tgz
8. Enable the Flexible Control Plane feature.

		bash /root/tripleo/tripleo-incubator/scripts/hp_ced_enable_hybrid.sh

1. Create a kvms.csv file with the details of the three KVM hosts:
 
		cat > /root/kvms.csv <<EOF
		192.168.124.2,root
		192.168.124.3,root
		192.168.124.4,root
		EOF



1. Set the required environment variables. Note that by default, 8 VMs are created with the configuration: 8GB RAM, 1 CPU and 512GB HDD. We recommend increasing the CPU and RAM for this feature to a minimum of 12 CPU cores and 16384MB RAM.

		export NODE_CPU=12
		export NODE_MEM=16384
		export HP_VM_MODE=HYBRID
		export HP_VM_MODE_MULTIKVM=3


1. Initiate the seed VM installation.

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed |& tee install.log

1. Wait for the message

		-completed setup seed

2. Once the seed VM installation completes, you will observe that the process has created shell VMs on the 3 KVM hosts provided in the kvms.csv file.
3. This process also creates a virtual power public key on the KVM Host A. Copy this file to remaining KVM hosts B and C.
 
		ssh-copy-id -i/root/.ssh/id_rsa_virt_power.pub root@192.168.124.3
		ssh-copy-id -i/root/.ssh/id_rsa_virt_power.pub root@192.168.124.4
 
7. Log in to the seed VM and switch to the */root* directory.
8. Modify the *baremetal.csv* file so that all records in the file now map to undercloud or overcloud control plane node types.
 
	Before modification, the baremetal.csv file will appear as shown below. Note the last 2 columns.

		00:17:00:3a:7d:25,root,undefined,192.168.124.2,12,16384,512,vm,all
		00:7e:d1:97:ca:b6,root,undefined,192.168.124.3,12,16384,512,vm,all
		00:e8:3f:a9:7e:a2,root,undefined,192.168.124.4,12,16384,512,vm,all
		00:43:e3:33:9e:7f,root,undefined,192.168.124.2,12,16384,512,vm,all
		00:5d:ff:f4:80:a2,root,undefined,192.168.124.3,12,16384,512,vm,all
		00:2b:8a:73:29:82,root,undefined,192.168.124.4,12,16384,512,vm,all
		00:65:cc:54:b1:0f,root,undefined,192.168.124.2,12,16384,512,vm,all
	
	After modification, the baremetal.csv will look like the one given below. Note the last two columns. The modifications are in two parts:

	A: Mapping the original set of VMs with "node_type"

	B: Adding baremetal nodes that will be used as Compute nodes and/or VSA nodes optionally.

		00:17:00:3a:7d:25,root,undefined,192.168.124.2,12,16384,512,vm,all
		00:7e:d1:97:ca:b6,root,undefined,192.168.124.2,12,16384,512,vm,occm
		00:e8:3f:a9:7e:a2,root,undefined,192.168.124.3,12,16384,512,vm,occ1
		00:43:e3:33:9e:7f,root,undefined,192.168.124.4,12,16384,512,vm,occ2
		00:5d:ff:f4:80:a2,root,undefined,192.168.124.3,12,16384,512,vm,all
		00:2b:8a:73:29:82,root,undefined,192.168.124.4,12,16384,512,vm,all
		00:65:cc:54:b1:af,iloAdmin,iloPassword,192.168.1.51,12,12288,1000,bm,vsa
		00:65:cc:54:b1:bf,iloAdmin,iloPassword,192.168.1.52,12,12288,1000,bm,vsa
		00:65:cc:54:b1:ca,iloAdmin,iloPassword,192.168.1.53,12,12288,1000,bm,vsa
		00:65:cc:54:b1:ff,iloAdmin,iloPassword,192.168.1.54,40,98304,2000,bm,ocN
		00:65:cc:54:b1:25,iloAdmin,iloPassword,192.168.1.55,40,98304,2000,bm,ocN
		00:65:cc:54:b2:26,iloAdmin,iloPassword,192.168.1.56,40,98304,2000,bm,ocN
		00:65:cc:54:b2:27,iloAdmin,iloPassword,192.168.1.57,40,98304,2000,bm,ocN



1. Create the user-defined *uc\_custom\_flavors.json* file which specifies the values and contains mapping of the node_type. The format is shown below. Note that while the overcloud controllers have different flavor names, they must all be of the same configuration.

		{
		"flavors": [
		{
		"name": "controllerMgmtFlavor",
		"memory": 16384,
		"disk": 512,
		"cpu": 12,
		"arch": "amd64",
		"hw_type": "vm",
		"node_type": "occm"
		},
		{
		"name": "controller0Flavor",
		"memory": 16384,
		"disk": 512,
		"cpu": 12,
		"arch": "amd64",
		"hw_type": "vm",
		"node_type": "occ1"
		},
		{
		"name": "controller1Flavor",
		"memory": 16384,
		"disk": 512,
		"cpu": 12,
		"arch": "amd64",
		"hw_type": "vm",
		"node_type": "occ2"
		},
		{
		"name": "vsaFlavor",
		"memory": "12288",
		"disk": "1000",
		"cpu": "12",
		"arch": "amd64",
		"hw_type": "bm",
		"node_type": "vsa"
		},
		{
		"name": "computeFlavor",
		"memory": "98304",
		"disk": "2000",
		"cpu": "40",
		"arch": "amd64",
		"hw_type": "bm",
		"node_type": "ocN"
		}
		]
		}


1. Create the *overcloud-config.json* file with the following contents. For definitions of the variables used and suggested values refer to the list of available [environment variables](http://docs.hpcloud.com/helion/openstack/install/envars). 
 
		{
		"cloud_type": "KVM",
		"vsa_scale": 3,
		"vsa_ao_scale": 0,
		"so_swift_storage_scale": 0,
		"so_swift_proxy_scale": 0,
		"compute_scale": 3,
		"bridge_interface": "brbm",
		"virtual_interface": "eth0",
		"fixed_range_cidr": "172.0.100.0/24",
		"control_virtual_router_id": "202",
		"baremetal": {
		"network_seed_ip": "192.168.124.10",
		"network_cidr": "192.168.124.0/24",
		"network_gateway": "192.168.124.5",
		"network_seed_range_start": "192.168.124.14",
		"network_seed_range_end": "192.168.124.22",
		"network_undercloud_range_start": "192.168.124.23",
		"network_undercloud_range_end": "192.168.124.126"
		},
		"neutron": {
		"public_interface_raw_device": "eth0",
		"overcloud_public_interface": "vlan331",
		"undercloud_public_interface": "eth0"
		},
		"ntp": {
		"overcloud_server": "16.110.135.123",
		"undercloud_server": "16.110.135.123"
		},
		"floating_ip": {
		"start": "172.32.100.15",
		"end": "172.32.100.245",
		"cidr": "172.32.100.0/24"
		},
		"svc": {
		"interface": "vlan332",
		"interface_default_route": "192.168.125.1",
		"allocate_start": "192.168.132.2",
		"allocate_end": "192.168.132.250",
		"allocate_cidr": "192.168.132.0/24",
		"overcloud_bridge_mappings": "svcnet1:br-svc",
		"overcloud_flat_networks": "svcnet1",
		"customer_router_ip": "192.168.124.5"
		},
		"codn": {
		"undercloud_http_proxy": "http://16.85.175.150:8080",
		"undercloud_https_proxy": "http://16.85.175.150:8080",
		"overcloud_http_proxy": "http://16.85.175.150:8080",
		"overcloud_https_proxy": "http://16.85.175.150:8080"
		}
		}



1. Load the configuration file

		source /root/tripleo/triple-incubator/scripts/hp_ced_load_config.json overcloud-config.json



1. Set the following values

		export HP_VM_MODE=HYBRID
		export controller0Flavor=controller0Flavor
		export controller1Flavor=controller1Flavor
		export OvercloudControlFlavor=controllerMgmtFlavor
		export OvercloudComputeFlavor=computeFlavor
		export OvercloudVsaFlavor=vsaFlavor
		export OVERCLOUD_LIBVIRT_TYPE=kvm



1. Start the installation
 
		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh |& tee install.log



1. Wait for the completion of the installer script to display a message similar to the following:
 
		HP - completed - Tue Oct 23 16:20:20 UTC 2014

##Post-Installation Steps {#postinstall}
- [Verify the installation](http://docs.hpcloud.com/helion/openstack/install/kvm/#verifying-your-installation-jumplink-span)
- Configure Block Storage
	- [For VSA](http://docs.hpcloud.com/helion/openstack/install/vsa/overview)
	- [For 3PAR](http://docs.hpcloud.com/helion/openstack/install/3par/)

##Adding the Overcloud Nodes {#addnodes}
This section describes the process of adding baremetal nodes to an existing cloud deployed using the Flexible Control Plane option. This process differs from the process documented for the baremetal install.

1.	SSH to the undercloud VM as the heat-admin user from the seed VM.
	
		ssh heat-admin@<IP Address>
		sudo -i
	
2.	Source the stackrc configuration file created during the installation process.

		source stackrc

3.	Register the new baremetal server in the Ironic database. Replace the CPU, memory, local disk size, IPMI address, and IPMI password values with your baremetal settings.
	
		ironic node-create -d pxe_ipmitool -p cpus=<value> -p memory_mb=<value> -p local_gb=<value> -p cpu_arch=<value> -i ipmi_address=<IP Address> -i ipmi_username=<username> -i ipmi_password=<password> -p capabilities=hw_type:<bm_or_VM>,node_type:<node_type>
	
	Here is an example with sample values set:
	
		ironic node-create -d pxe_ipmitool -p cpus=12 -p memory_mb=98304 -p local_gb=1800 -p cpu_arch=amd64 -i ipmi_address=10.12.22.70 -i ipmi_username=admin -i ipmi_password=password capabilities=hw_type:bm,node_type:Compute
	
4.	Create the Ironic port for the Ironic node created in the previous step.

		ironic port-create --address $MAC_ADDR --node_uuid $NODE_UUID

7.	List the baremetal nodes. This command also lists the newly-added nodes.
	
		ironic node-list
	
6.	Log out from undercloud to go back to the seed VM:
	
		ssh root@<IP Address>
	
10.	Make the respective baremetal entry in */root/baremetal.csv*. Ensure the **hw\_type** and **node\_type** values are correct.
11.	Edit the overcloud-config.json file as follows to define the appropriate scale number:
	
		"compute_scale":<number of compute nodes>,
	
14.	Source the environment variables file that you updated.
	
		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/ overcloud-config.json
	 
18.	 Run the installer script.
	 
	 	bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud 2>&1 | tee update.log
	 


##Known Issues and Resolutions {#knownissues}

###ESX virtual control plane installation fails during undercloud configuration

**System Behavior**

The installer suddenly exits at the following stage:

	Service storage_management created
	+----------+----------------------------------+
	| Property |              Value               |
	+----------+----------------------------------+
	|    id    | b620ae4d0c464968ab4b4263b9843009 |
	|   name   |         heat_stack_user          |
	+----------+----------------------------------+
	+---------------------+-------+
	| Field               | Value |
	+---------------------+-------+
	| floatingip          | -1    |
	| network             | -1    |
	| port                | -1    |
	| router              | -1    |
	| security_group      | -1    |
	| security_group_rule | -1    |
	| subnet              | -1    |
	+---------------------+-------+

**Probable Cause**
The installer can stop abruptly at this point for the following reasons:
- Undercloud ironic service is unable to reach the KVM hosts
- Undercloud ironic service is unable to reach the IPMI network of the Overcloud nodes
- Duplicate MAC addresses seen

**Possible Resolution**
Ensure that you are able to connect to the KVM hosts and IPMI network from the Undercloud node.

<hr>
###Flexible Control Plane Controller nodes fail due to "No bootable device found" during installation

**System Behavior**

In some cases during installation the message: <pre>No bootable device found</pre> is displayed on the console of the VM that is getting deployed and the node deployment results in a failure.

**Probable Cause**

The values exported for Neutron Public interface are incorrect.

**Possible Resolution**

Define the **UNDERCLOUD\_NeutronPublicInterface** and **OVERCLOUD\_NeutronPublicInterface** values as ` eth0`
	
<hr>
###During Flexible Control Plane deployment in KVM the tripleo/config/ folder in the seed node is missing.

**System Behavior**

On the deployed seed node the **tripleo/config/** folder is not available.

**Probable Cause**

The folder was not automatically copied onto the seed node from the KVM host.

**Possible Resolution**

Manually copy the contents of the **tripleo/config** folder from the KVM host onto the seed node.
<hr>
###In Flexible Control Plane, one of the swift nodes (BM) goes into error state during first deployment.
**System Behavior**

Sometimes while installing the controllers on the virtual and starter swift nodes on the Baremetal, the PXE deployment of Swift nodes fails and the node status shows as **ERROR**.

**Probable Cause**

Apparently a bug in ironic.

**Possible Resolution**

Delete the overcloud stack and re-create it.
<hr>
###After the reboot of the compute node, new FIPs associated to the instance are not accessible

**System Behavior**

After updating the cloud, any new FIP being allocated to and associated with an existing or new VM is not accessible.

**Possible Resolution**	

Currently, the issue can be resolved by deleting the link being added where it is giving an error. 
<hr>
###After the  reboot of compute nodes, the instance goes into error state
**System Behavior**

After the reboot of compute nodes which have instances running, two issues are noticed:

Issue 1

	error: Failed to start domain instance-0000020d
	error: unsupported configuration: Domain requires KVM, but it is not available. 

Check that virtualization is enabled in the host BIOS and that host configuration is set up to load the KVM modules.
 
Issue 2

	error: failed to connect to the hypervisor
	error: no valid connection
	error: Failed to connect socket to '/var/run/libvirt/libvirt-sock': No such file or directory.

**Possible Resolution**

Issue 1: Manual Steps to recover

	lsmod | grep kvm
   If there is no output, issue the following commands:

	modprobe -v kvm 
	modprobe -v kvm_intel
	service libvirt-bin restart

Issue 2: Manual Steps to recover

	pkill -ulibvirt-qemu
	reboot
<hr>
###Few VMs with two interfaces (pvt and svc) lost its network plumbing on its compute node (post update)
**System Behavior**

After the update compute node, the VM guest is not accessible on its SVC interface.

**Possible Resolution**

No Resolution 
<hr>
###Environment may be unstable on rebooting of overcloud controllers
**System Behavior**

Environment may be unstable for some time when overcloud controllers are rebooted

**Probable Cause**

On the  overcloud controller reboot scenario the cloud takes some time to stabilize.

**Possible Resolution**

If overcloud controllers are rebooted the user must wait for some time for the cloud to become stable. Verify basic cloud functionality before proceeding further.
<hr>
###If the KVM environment is rebooted, the  instances in the  spawned state are not pingable
**System Behavior**

In case of the entire KVM environment being rebooted, previously spawned instances may not be pingable.

**Possible Resolution**

Hard reboot the spawned instance from the Horizon dashboard to make it reachable.


<hr>
Return to the [architectural and configuration files overview](/helion/openstack/flexiblecontrol/overview) information.