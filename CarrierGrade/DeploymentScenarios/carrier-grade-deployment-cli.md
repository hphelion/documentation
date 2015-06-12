---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Deployment Scenarios using the CLI"
permalink: /helion/openstack/carrier/deploy/cli/
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

# HP Helion OpenStack&#174; Carrier Grade (Beta): Deployment Scenarios using the CLI

As an alternative to the web administration interface, you can work through the scenarios using the command-line interface.

<hr>
**Note:** This feature applies to the Wind River Linux servers only.
<hr>

Users who are comfortable with text-based commands and Linux-based operating systems can use a command-line interface (CLI) to install and manage all aspects of the Wind River Linux server, including setting up the scenario environment and deploying scenarios. In addition to providing a compact and efficient environment, the CLI offers some capabilities not afforded by the web administration interface, such as the ability to save customization scripts (user data) for re-use.

For general information about the scenarios, see [Reference Deployment Scenarios](/helion/openstack/carrier/deploy/)

To use the CLI, log in to the controller console as the admin user, or as `user1` or `user2`, depending on the task to be performed.

## Working with system objects: UUIDs {uuid}

Each system component (see [Components of the Scenario Environment](/helion/openstack/carrier/deploy/setting/components/) is identified by a string of hexadecimal characters known as a universal unique identifier (UUID). In the CLI, UUIDs are sometimes required for working with a component. You can display them using an appropriate command. For example, you can display the UUIDs of currently defined tenants using the following command:

	keystone tenant-list

The command line environment provides methods for working with UUIDs conveniently and efficiently, without typing them manually.

* You can store them in variables, and use the variables in subsequent commands.
* You can filter the output of commands so that the UUID is passed directly to a variable.

	For example, the following command stores the UUID of the admin tenant in the variable `admin_tenant_UUID`.

		export admin_tenant_UUID=`keystone
		tenant-list | grep admin | \
		awk '{print $2}'`

	The command keystone `tenant-list` generates a list of all tenants. This is piped to the grep command, which filters for the line containing the string admin. This in turn is piped to an awk command, which prints the content of the id column to the console. The result, the UUID, is stored in the variable `admin_tenant_UUID`.

	You can supply variables to other commands using the shell syntax ${variable}. For example, to adjust resource quotas for a tenant, you need to supply the UUID of the tenant. With the UUID stored as a variable, you can do this as shown in the following example:

		neutron quota-update --subnet 32 --tenant-id ${admin_tenant_UUID}

	Note the use of `admin_tenant_UUID` to supply the UUID. 

	These techniques are used throughout the CLI-based exercises. If you prefer, you can copy UUIDs from the display and paste them directly to the command line.

## User Login Environment

For the HP Helion OpenStack Carrier Grade server to identify the user who is executing system commands, a shell environment with the proper set of variables must be in place. For the cloud admin account, the shell is set up automatically when you log in as the Linux admin user.

You can create scripts for other users. Later in this presentation, the scripts `/etc/nova/openrc.user1` and `/etc/nova/openrc.user2` are created (for details, see [Creating Login Environment Files for Users]{#loginuser}

To execute commands with the corresponding user identities, use the
source command to invoke the scripts.

For more information on login accounts, see the *HP Helion OpenStack Carrier Grade Installation Guide: About Login Accounts*.

## Creating Tenants and Updating Quotas Using the CLI {#tenantscli}

You can use the CLI to create and configure tenants.

This exercise creates the tenants tenant1 and tenant2, and sets up their resource quotas.

1. Log in to the active controller as the Keystone admin user.

		$ source /etc/nova/openrc

2. Create a project (or, tenant) `tenant1`.

		keystone tenant-create --name tenant1

3. Create a project (or, tenant) `tenant2`.

		keystone tenant-create --name tenant2

4. Set up the UUID variables for the new tenants.

		export tenant1_UUID=`keystone tenant-list | grep tenant1 | \
		awk '{print $2}'`

		export tenant2_UUID=`keystone tenant-list | grep tenant2 | \
		awk '{print $2}'`

5. Adjust networking resource quotas for the projects.

		neutron quota-update --subnet 32 --network 32 --port 128 \
		--tenant-id ${tenant1_UUID}

		neutron quota-update --subnet 32 --network 32 --port 128 \
		--tenant-id ${tenant2_UUID}

6. Adjust VM quotas for the tenants.

		{tenant1_UUID} --instances 20 -- cores 40 \
		--floating_ips 20

		nova quota-update ${tenant2_UUID} --instances 20 -- cores 40 \
		--floating_ips 20

7. Adjust networking resource quotas for the tenant admin.

		neutron quota-update --subnet 32 --tenant-id {admin_tenant_UUID}

	The two additional tenants are available now, with quotas established.

## Creating Users Using the CLI {{userscli}

You can use the CLI to add users.

This exercise creates the users `user1` and `user2`, and associates each one with a tenant.

1. Create user user1.

		keystone user-create --name user1 --pass user1 \

		--email user1@noreply.com --tenant ${tenant1_UUID}

2. Create user user2.

		keystone user-create --name user2 --pass user2 \

		--email user2@noreply.com --tenant ${tenant2_UUID}

	The two new users exist now in the system. No UUID variables are defined because they are not needed in any subsequent commands.

## Establishing Provider Networks Using the CLI {provnetcli}

You can use the CLI to add the provider networks required to support tenant networks.

Provider networks are required before compute nodes can be unlocked. For this reason, they are often set up as part of
system installation.

The scenarios assume that two provider networks, provider-net-a and provider-net-b, have already been set up as part of system installation. For convenience, the instructions to set up these provider networks are repeated here. If you already have two provider networks with different names, you can use them instead, substituting their names in the following exercises.

For more information about setting up provider networks, see the *HP Helion OpenStack Carrier Grade Software Installation Guide: Configuring Provider Networks*.

1. Log in to the active controller as the Keystone admin user.

		source /etc/nova/openrc

2. On the active controller's console, create the two example provider networks.

	neutron providernet-create provider-net-a --type vlan

	neutron providernet-create provider-net-b --type vlan

	Both provider networks are created as type vlan. This means that they can be segmented, or restricted to operate over a range of specific VLAN identifiers.

## Creating Segmentation Ranges Using the CLI {segmentcli}

You can use the CLI to add segmentation ranges to provider networks.

This task assumes that provider networks have already been created in order to unlock the compute nodes and make the system operational. 

The scenarios require two provider networks of the VLAN type.

1. Create segmentation ranges on provider network `provider-net-a`.

		neutron providernet-range-create provider-net-a \
		--name pnet-a-common --description "External network access" --range 10-10

		neutron providernet-range-create provider-net-a \
		--name pnet-a-tenant1 --tenant-id ${tenant1_UUID} --description "Shared internal network" \
		--range 623-642

		neutron providernet-range-create provider-net-a \
		--name pnet-a-tenant2 --tenant-id ${tenant2_UUID} --description "Shared internal network" \
		--range 664-680

2. Create segmentation ranges on `provider-net-b`.

		neutron providernet-range-create provider-net-b \
		--name pnet-b-common --shared --description "External network access" --range 568-599

	The segmentation ranges are set.

## Setting Up Tenant Networks Using the CLI {#tenantcli}

You can use the CLI to set up tenant networks and their associated IP subnets.

This exercise sets up the tenant networks `external-net`, `internal-net`, `tenant1-mgmt-net`, and `tenant2-mgmt-net`. IP subnets are created for the first two networks only. IP subnets for the tenant networks are created by the users `user1` and `user2` in a separate task.

1. Create and configure the tenant network `external-net`.

	a. Create the tenant network.

		neutron net-create --tenant-id ${admin_tenant_UUID} \
		--provider:physical_network=provider-net-a \
		--provider:segmentation_id=10 --router:external external-net

	b. Define the IP subnet.

		neutron subnet-create --tenant-id ${admin_tenant_UUID} \
		--name external-subnet --gateway 192.168.2.1 --disable-dhcp external-net 192.168.2.0/24

	c. Set up the UUID variable for the new tenant network.

		export external_net_UUID=`neutron net-list \
		| grep external-net | awk '{print $2}'`

2. Create and configure the tenant network `internal-net`.

	a. Create the tenant network.

		neutron net-create --tenant-id ${admin_tenant_UUID} \
		--provider:physical_network=provider-net-b \
		--shared internal-net

	b. Define the IP subnet.

		neutron subnet-create --tenant-id ${admin_tenant_UUID} \
		--name internal-subnet \
		--no-gateway --vlan-id 5 internal-net 10.1.1.0/24

	**Note:** The `--vlan-id 5` option indicates that packets sent to this subnet by any virtual machine must be tagged with VLAN ID 5.

	c. Set up the UUID variable for the new tenant network.

		export internal_net_UUID=`neutron net-list \
		| grep internal-net | awk '{print $2}'`

3. Create the tenant network `tenant1-mgmt-net`.

	a. Create the tenant network.

		neutron net-create --tenant-id ${tenant1_UUID} \
		--provider:physical_network=provider-net-a tenant1-mgmt-net

	b. Set up the UUID variable for the new tenant network.

		export tenant1_mgmt_net_UUID=`neutron net-list \
		| grep tenant1-mgmt-net | awk '{print $2}'`

4. Create the tenant network `tenant2-mgmt-net`.

	a. Create the tenant network.

		neutron net-create --tenant-id ${tenant2_UUID} \
		--provider:physical_network=provider-net-a tenant2-mgmt-net

	b. Set up the UUID variable for the new tenant network.

		export tenant2_mgmt_net_UUID=`neutron net-list \
		| grep tenant2-mgmt-net | awk '{print $2}'`

	The external and internal tenant networks are set up and ready to be used. The tenant management networks are available, but their IP subnets have yet to be created.

	The tenant networks are assigned segmentation IDs automatically. You can list the assigned IDs for a provider network as follows:

		neutron net-list-on-providernet provider-net-a

## Setting Up the Example Guest Image Using the CLI {guestcli}

You can use the CLI to import guest images for use with the HP Helion OpenStack Carrier Grade. An example guest disk image is distributed with the Wind River Linux server software. It must be transferred to the active controller using a tool such as scp. This exercise assumes that the image is available as `/usr/share/images/example-guest.img`.

Once it is available in the controller, the image must be uploaded to the Image Operations service (Glance), the OpenStack image deployment service.

Once it is available in Image Operations service, the image must be used to create a bootable Cinder volume. The volume can be used
to launch an instance.

1. List the images available on the system.

	glance image-list

	Since no images have been defined yet, an empty list is displayed.

2. Upload the guest image to the Image Operations service.

	glance image-create --name example-guest \
	--is-public true --container-format bare --disk-format qcow2 \
	--file /usr/share/images/example-guest.img

	The image `example-guest` is listed as active, as illustrated below:

		glance image-list

3. Create a bootable volume using the image.

	a. Set up the UUID variable for the image.

		export image_UUID=`glance image-list | grep exampleguest \
		| awk '{print $2}'`

	b. Create the volume.

	cinder create --image-id ${image_UUID} \
	--display-name=vol-example-guest 1

	The new volume is created.

## Setting Up User Data Using the CLI {#datacli}

Using the CLI, you can save user data as a file for reference when launching an instance.

When launching an instance, you can provide user data containing configuration details. If you use the CLI, you can save the user data to a text file, and then supply the file name as a parameter.

The scenarios require four user data files: one for instances using the Linux kernel bridging facilities, one for instances using the DPDK-accelerated virtual switch, and two for instances using a Linux router. The user data specifies which function to implement, and includes any information required by the function, such as the ports to bridge or the IP subnets to route.

**Caution:** The first line in the user data file is a mandatory comment. Without it, the user data is ignored, and all network interfaces are initialized using DHCP.

1. Create a directory `/usr/share/userdata` for storing user data files.

	The following command creates the directory if does not already exist.

		/usr/share/userdata

2. Create a user data file for use with the Linux kernel bridging facilities.

	Create a file `/usr/share/userdata/linux-bridge.txt` with the following content:

		#wrs-config
		FUNCTIONS="bridge"
		BRIDGE_PORTS="eth1,eth2.5"

	The BRIDGE_PORTS variable specifies the virtual machine ports to bridge: `eth1` (the tenant network)  and `eth2.5` (the internal network on VLAN ID 5).

3. Create a user data file for use with the DPDK-accelerated virtual switch.

	Create a file `/usr/share/userdata/linux-dpdk-vswitch.txt` with the following content:

		#wrs-config
		FUNCTIONS="hugepages,vswitch"
		BRIDGE_PORTS="eth0,eth1.5"

	Note that in this case, the name of the Ethernet interfaces refers to ports in the accelerated virtual switch, and not to ports in the virtual machine.

4. Create a user data file for use with the `tenant1` Linux router.

	Create a file `/usr/share/userdata/tenant1-linux-router.txt` with the following content:

		#wrs-config
		FUNCTIONS="routing"
		ADDRESSES=(
			"172.31.1.1,255.255.255.0,eth1,1500"
			"10.1.1.1,255.255.255.0,eth2.5,1500"
			)
		ROUTES=(
			"10.160.2.0/24,172.31.2.2,eth1"
			"10.170.2.0/24,10.1.1.2,eth2.5"
			)

5. Create a user data file for use with the `tenant2` Linux router.

	Create a file /usr/share/userdata/tenant2-linux-router.txt with the following content:

		#wrs-config
		FUNCTIONS="routing"
		ADDRESSES=(
			"172.31.2.1,255.255.255.0,eth1,1500"
			"10.1.2.1,255.255.255.0,eth2.5,1500"
			)
		ROUTES=(
			"10.170.2.0/24,172.31.2.2,eth1"
			"10.160.2.0/24,10.1.1.1,eth2.5"
			)

	The image user data files are available for use when launching instances.

## Setting Up Flavors Using the CLI {#flavorcli}

You can use the CLI to define virtual hardware resource profiles, or flavors, for use when launching virtual machines.

Available flavors and their IDs can be listed using the following command:

	nova flavor-list

1. Define the flavor `example-guest.tiny`.

		nova flavor-create example-guest.tiny 100 512 0 1 \
		--dedicated-cpus true

	The flavor `example-guest.tiny` is created with ID 100. New virtual machines using this flavor are allocated 512 MB of memory, no disks, and one dedicated virtual CPU.

2. Define the flavor `example-guest.small`.

		nova flavor-create example-guest.small 101 512 0 2 \
		--dedicated-cpus true

	The flavor `example-guest.small` is created with ID 101. New virtual machines using this flavor are allocated 512 MB of memory, no disks, and two dedicated virtual CPUs.

	The two flavors `example-guest.tiny` and `example-guest.small` are now available. You can use them as resource allocation directives when launching new virtual machines.

## Creating Login Environment Files for Users
Using the CLI, you can create scripts to define user login environments.

This exercise creates the scripts `/etc/nova/openrc.user1` and `/etc/nova/openrc.user2`. The new scripts are created by copying the original admin login environment script `/etc/nova/openrc`, and replacing the admin user identifier and its current password with new values.

1. Create the login environment script for user `user1`.

	a. Copy the environment script used by the user admin.

		cp /etc/nova/openrc /etc/nova/openrc.user1

	b. Edit the new file to include the new login credentials.

	The modified file should look similar to the one illustrated below:

		export OS_USERNAME=user1
		export OS_TENANT_NAME=tenant1
		export OS_PASSWORD=`TERM=linux /usr/bin/keyring get 'CGCS' user1`
		export OS_AUTH_URL=http://192.168.204.2:35357/v2.0/
		export CGTS_URL=http://192.168.204.2:6385
		export PS1='[\u@\h \W(keystone_user1)]\$ '

	**Note:** The IP address shown here is an example, based on the default controller node floating address suggested during the controller configuration script. Depending on your system configuration, the actual IP address may be different.

	The login environment script for user `user1`, with password `user1`, is now available.

2. Create the login environment script for user `user2`.

	a. Copy the environment script used by the user admin.

		cp /etc/nova/openrc /etc/nova/openrc.user2

	b. Edit the new file to include the new login credentials.

	The modified file should look similar to the one illustrated below:

		export OS_USERNAME=user2
		export OS_TENANT_NAME=tenant2
		export OS_PASSWORD=`TERM=linux /usr/bin/keyring get 'CGCS' user2`
		export OS_AUTH_URL=http://192.168.204.2:35357/v2.0/
		export CGTS_URL=http://192.168.9.204:6385
		export PS1='[\u@\h \W(keystone_user2)]\$ '

	The login environment script for user `user2`, with password `user2`, is now available.

	The two new user login environments are available. You can source them in order to execute commands with the corresponding user identities.

## Launching Instances Using the CLI {#launchcli}

You can use the CLI to launch virtual machine instances.

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