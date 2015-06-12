---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Launching Instances Using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/launch/
product: carrier-grade
product-version1: HP Helion OpenStack
product-version2: HP Helion OpenStack 1.1
role1: All

authors: Paul F

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!-- <p style="font-size: small;"> <a href="/helion/openstack/1.1/3rd-party-license-agreements/">&#9664; PREV</a> | <a href="/helion/openstack/1.1/">&#9650; UP</a> | NEXT &#9654; </p> -->

# HP Helion OpenStack&#174; Carrier Grade (Beta): Launching Instances Using the CLI

You can use the CLI to launch virtual machine instances.

<hr>
**Note:** This feature applies only to servers in the VNF Region.
<hr>

To launch an instance, the end user must set up some required resources. In this task, `user1` sets up the resources and
then launches an instance on `tenant1`.

**Note:** You must repeat this exercise as `user2`, substituting appropriate names for the tenant networks and other components, to launch a similar instance on `tenant2`.

1. Identify yourself as user user1 to the system.

	source /etc/nova/openrc.user1

2. Register a public key for tenant tenant1.

	nova keypair-add --pub_key ~/.ssh/id_rsa.pub tenant1- `hostname`

	This command injects the existing key-pair of the Linux root account into the Nova database with the name `tenant1-controller-0` (assuming that the name of the host is `controller-0`). This named key-pair can be used to provide SSH access to the virtual machines when they are launched. You can use other available key-pairs or create new ones as required.

3. Create and configure the tenant network `tenant1-net`.

	a. Create the tenant network.

		neutron net-create tenant1-net

	b. Define the IP subnet.

		neutron subnet-create --name tenant1-subnet \
		--no-gateway tenant1-net 172.31.1.0/24

	c. Set up the UUID variable for the new tenant network.

		export tenant1_net_UUID=`neutron net-list | grep tenant1-net | awk '{print $2}'`

4. Configure the tenant network `tenant1-mgmt-net`.

	a. Create the management IP subnet.

		~(keystone_user1)$ neutron subnet-create --name tenant1-mgmt-subnet \
		tenant1-mgmt-net 192.168.102.0/24

	b. Create the virtual router tenant1-router.

		neutron router-create tenant1-router

	c. Set up the UUID variable for the new virtual router.

		export tenant1_router_UUID=`neutron router-list \
		| grep tenant1-router | awk '{print $2}'`

	d. Connect the virtual router to the management IP subnet.

		neutron router-interface-add tenant1-router tenant1-mgmt-subnet

	e. Set up the UUID variable for the new tenant network.

	export external_net_UUID=`neutron net-list \ 
	| grep external-net | awk '{print $2}'`

	f. Add a default gateway interface to the tenant network `external-net`.

		eutron router-gateway-set ${tenant1_router_UUID}
		{external_net_UUID}

5. Select the launch options.

	a. Select the type of virtual switching to use: Linux kernel bridging, DPDK-accelerated virtual switch, or Linux router.

	The type of switching is specified in a user data file supplied as an argument to the --user-data option. For more information, see [Setting Up User Data Using the CLI](#datacli}.

	b. Select the type of virtual interface, virtio or AVP, to connect to the tenant networks.

	This is done by specifying the virtual interface model to be associated with each virtual NIC. Use the options `vif-model=virtio`, and `vif-model=avp`, for the virtio and AVP ports respectively.

	Note: To change the interface type or the allocated NIC order, you must restart the instance with a new port assignment.

	c. Select the virtual machine flavor to use.

	Use the option --flavor to specify the flavor.

6. Create UUID variables for the tenant networks.

	export tenant1_mgmt_net_UUID=`neutron net-list \
	| grep tenant1-mgmt-net | awk '{print $2}'`

	export tenant2_mgmt_net_UUID=`neutron net-list \
	| grep tenant2-mgmt-net | awk '{print $2}'`

7. Create a UUID variable for the Cinder volume.

	export vol_UUID=`cinder list | grep vol-example-guest \
	| awk '{print $2}'`

8. Launch the instances on both tenants.

The following example launches an instance named `tenant1-kernel-bridging`, using a Linux bridge.

	nova boot --poll --key_name=tenant1-controller-0 \
	--block_device_mapping vda=${vol_UUID}:::0 \
	--user-data=/usr/share/userdata/linux-bridge.txt \
	--flavor=100 \
	--nic net-id=${tenant1_mgmt_net_UUID},vif-model=virtio \
	--nic net-id=${tenant1_net_UUID},vif-model=avp \
	--nic net-id=${internal_net_UUID},vif-model=avp \
	tenant1-kernel-bridging

**Caution:** The order in which the network interfaces are selected determines how they are enumerated for the instance. 

This example uses the following order: eth0 (`tenant1-mgmt-net`) of the virtio type, and eth1 (`tenant1-net`) and eth2 (`internal-net`) of the avp type.

The following example launches an instance named tenant1-dpdk bridging, using an AVP virtual network interface, and the DPDK-accelerated virtual switch.

	nova boot --poll --key_name=tenant1-controller-0 \
	--block_device_mapping vda=${vol_UUID}:::0 \
	--user-data=/usr/share/userdata/linux-dpdk-vswitch.txt \
	--flavor=101 \
	--nic net-id=${tenant1_mgmt_net_UUID},vif-model=virtio \
	--nic net-id=${tenant1_net_UUID},vif-model=avp \
	--nic net-id=${internal_net_UUID},vif-model=avp \
	tenant1-dpdk-bridging

The following example launches an instance named tenant1-routing, using AVP virtual network interfaces and a Linux router.

	nova boot --poll --key_name=tenant1-controller-0 \
	--block_device_mapping vda=${vol_UUID}:::0 \
	--user-data=/usr/share/userdata/tenant1-linux-router.txt \
	--flavor=101 \
	--nic net-id=${tenant1_mgmt_net_UUID},vif-model=virtio \
	--nic net-id=${tenant1_net_UUID},vif-model=avp \
	--nic net-id=${internal_net_UUID},vif-model=avp \
	tenant1-routing

The instances are now running. Each one establishes a bridge or router between the last two interfaces in the command line, that is, between the tenant networks tenant1-net and internal-net.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 
----