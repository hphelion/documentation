---
layout: default
title: "HP Helion OpenStack&#174; Flexible Control Plane Installation"
permalink: /helion/openstack/flexiblecontrol/install/
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
As you read in the [overview](/helion/openstack/flexiblecontrol/overview/), HP Helion OpenStack Flexible Control Plane allows you to deploy the control plane in a virtual environment, reducing the control plane footprint to just three servers for proof of concept, evaluation, and exploration of HP Helion OpenStack features.

The overview covered the [prerequisites](/helion/openstack/flexiblecontrol/overview/). Now we will walk through the installation.

This topic contains:

- [Step-by-step Installation Instructions](#instruct)
- [Post-Installation Steps](#postinstall)
- [Adding the Overcloud Nodes](#addnodes)
- [Known Issues and Resolutions](#knownissues)

##Before You Begin


Before you can install the Flexible Control Plane, you will need to:

- [Review prerequisites and configure the infrastructure](/helion/openstack/flexiblecontrol/overview/#prereq) accordingly
- [Create configuration files](/helion/openstack/flexiblecontrol/overview/#configfiles)
- [Set up KMV hosts](/helion/openstack/flexiblecontrol/overview/#kvmsetup)
- Deploy an HP Helion cloud

##Step-by-step Installation Instructions {#instruct}


1. The system will need to create a baremetal bridge on each host, onto which it will add a port for the external 	device. The system will also move the IP address of the external device to the bridge device.
   This creates a baremetal network through which the virtual machines will communicate with each other and with the real baremetal systems.

  	 If the external device name on the system running the installer and seed VM is NOT called eth0, then determine the device name BEFORE running the next
   step and

   	 	$ export BRIDGE_INTERFACE=<devicename>

   		e.g. $ export BRIDGE_INTERFACE=em1

   		or
   	 
		$ export BRIDGE_INTERFACE=eth5

  	 In the same manner, establish the value of BRIDGE_INTERFACE for each remote host (see below).


2.    Set up the remote hosts. You must set up each remote host identified in your vm-plan file.

	 a. Create a user on *each* remote host to run the virtual machines.

	You can create a new user or use an existing user. The user much have sufficient privileges to launch virtual machines using libvirt, for example being a member of the 'libvirtd' group. This user is denoted <kvmuser> below, and the host is denoted <kvmhost>.

	b. Create a virtual power key on the seed's host. As root, run this command on the seed's host:

   		$ export BRIDGE_INTERFACE=<devicename>

   		$ export HP_VM_MODE=hybrid

    	$ bash /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --local-setup

  	 This command will perform all prerequisite system checks and create an SSH key that can be used for virtual power operations between host, if the key does not previously exist.

	c. Append the key to the <kvmuser>'s authorized_keys file on *each* remote host.
    
	As root:

    	$ scp /root/.ssh/virtual-power-key.pub <kvmuser>@<kvmhost>:

   		$ ssh <kvmuser>@<kvmhost>

   		$ cat virtual-power-key.pub >> ~<kvmuser>/.ssh/authorized_keys

   		$ chmod 600 ~<kvmuser>/.ssh/authorized_keys

	d. Copy hp_ced_host_manager.sh to *each* remote host.

    	e.g. $ scp /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh \
             <kvmuser>@<kvmhost>:hp_ced_host_manager.sh

	e. As root on *each* remote host run:

    	$ export BRIDGE_INTERFACE=<devicename>

    	$ bash -x ~<kvmuser>/hp_ced_host_manager.sh --remote-setup


3. Create the *overcloud-config.json* file with the following contents. For definitions of the variables used and suggested values refer to the list of available [environment variables](http://docs.hpcloud.com/helion/openstack/install/envars). 
 
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



1. Build the cloud (all of the following commands should be run from /root)

	a. Login to the seed

		$ ssh root@192.0.2.1

	b. Update a file called '/root/baremetal.csv' in the following format:

		<mac_address>,<user>,<password>,<ip_address>,<no_of_cpus>,<memory_MB>,<diskspace_GiB>,<role>,<power_managemenment>

	c. For full details of this file format consult README-baremetal.txt

   	The VMs you have pre-provisioned should already be present in this file so you need to add the details of the physical hardware you want to add to the system.

	d. Run the second stage, that is, configure under and overclouds.

   Export all relevant environment variables, 

	e.g. $ export OVERCLOUD_NTP_SERVER=<ip>
   (For full details of applicable settings, consult README-baremetal.txt)

   Important: As these are hybrid systems, some of the defaults for real hardware should not
   be applied to virtual machines:

	   $ export UNDERCLOUD_NeutronPublicInterface=eth0
	
	   $ export OVERCLOUD_NeutronPublicInterface=eth0
	
	   $ export OVERCLOUD_VIRTUAL_INTERFACE=br-ex



Notes:
   OVERCLOUD_NeutronPublicInterface - you should set this to the value of the name
   of the interface that carries the neutron external traffic on your overcloud
   control nodes.
   The default value for hybrid installs is eth0 which is suitable for virtual
   machines, so you should NOT need to set this value.
   The same applies to UNDERCLOUD_NeutronPublicInterface.

   OVERCLOUD_HYPERVISOR_PUBLIC_INTERFACE - you should set this to the value of
   the name of the interface that carries the neutron external traffic on your
   overcloud compute nodes.
   The default value is eth2. If this is correct you do not need to set this variable.
   e.g. $ export OVERCLOUD_HYPERVISOR_PUBLIC_INTERFACE=eth1

    $ bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh





1. Wait for the completion of the installer script to display a message similar to the following:
 
		HP - completed - Tue Oct 23 16:20:20 UTC 2014

##Post-Installation Steps {#postinstall}
- [Verify the installation](/helion/openstack/install/kvm/#verifying-your-installation)
- Configure Block Storage
	- [For VSA](/helion/openstack/install/vsa/overview)
	- [For 3PAR](/helion/openstack/install/3par)

##Adding the Overcloud Nodes {#addnodes}

For more information, see: [Add, remove and replace nodes](/helion/openstack/technical-overview/#add-remove-replace-nodes-jumplink-span).

##Known Issues and Resolutions {#knownissues}


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

Issue 1: Manual steps to recover

	lsmod | grep kvm
   If there is no output, issue the following commands:

	modprobe -v kvm 
	modprobe -v kvm_intel
	service libvirt-bin restart

Issue 2: Manual steps to recover

	pkill -ulibvirt-qemu
	reboot
<hr>
###A few VMs with two interfaces (pvt and svc) lost network plumbing on compute node (post update)
**System Behavior**

After updating, the VM guest is not accessible on its SVC interface.

**Possible Resolution**

No Resolution 
<hr>
###Environment may be unstable upon rebooting of overcloud controllers
**System Behavior**

Environment may be unstable for some time when overcloud controllers are rebooted.

**Probable Cause**

On the overcloud controller reboot scenario the cloud takes some time to stabilize.

**Possible Resolution**

If overcloud controllers are rebooted, you must wait for some time for the cloud to become stable. Verify basic cloud functionality before proceeding further.
<hr>
###If the KVM environment is rebooted, the  instances in the  spawned state cannot be reached via ping
**System Behavior**

In the case of an entire KVM environment reboot, previously spawned instances may not be reachable via the ping command.

**Possible Resolution**

Hard reboot the spawned instance from the Horizon dashboard to make it reachable.


<hr>
Return to the [architectural and configuration files overview](/helion/openstack/flexiblecontrol/overview/) information.