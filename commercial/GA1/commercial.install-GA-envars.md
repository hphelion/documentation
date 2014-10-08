---
layout: default
title: "HP Helion OpenStack: Creating an Environment Variables File for Installation"
permalink: /helion/openstack/install/envars/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p>
-->
# HP Helion OpenStack&reg;:  Creating an Environment Variables File for Installation #

The HP Helion OpenStack Installation process requires various configuration parameters to be specified. This is achieved through environment variables. As a user who is installing HP Helion OpenStack, you should create a file containing the environment variables based on the applicable scenario from the list below.

- [Definition of Environment variables used during install](#env)
- [Environment variables file for a KVM install](#kvm)
- [Environment variables file for a ESX install](#esx)

This file will be used to conduct operations such as adding or removing a node and integrating block storage. Make sure this file is preserved for future use.

## Definition of Environment variables used during install ## {#env}

The following section describes the environmental variables that affect your installation.


`BRIDGE_INTERFACE` - Use this variable to specify the interface on the seed cloud host as the bridge interface, for example `em2` or `eth2`. This interface connects to the untagged management network and will be used to PXE boot undercloud and overcloud servers:

	export BRIDGE_INTERFACE=em2

`BM_NETWORK_SEED_IP`, `BM_NETWORK_CIDR` - Use these variables to specify a particular IP address for the seed VM, for example 192.168.130.0/24.

	export BM_NETWORK_SEED_IP=192.168.130.3
	export BM_NETWORK_CIDR=192.168.130.0/24

`BM_NETWORK_GATEWAY` - Use this variable to specify a host other than the seed cloud host as the gateway, for example 192.168.130.1. Typically this IP will be the physical gateway of the network.

	export BM_NETWORK_GATEWAY=192.168.130.1

`BM_NETWORK_SEED_RANGE_START`, `BM_NETWORK_SEED_RANGE_END` - Use these variables to specify an IP address range for the seed cloud host to administrate/manage the undercloud node(s), for example 192.168.130.4-192.168.130.22.

	export BM_NETWORK_SEED_RANGE_START=192.168.130.4
	export BM_NETWORK_SEED_RANGE_END=192.168.130.22

**Note:** You must choose the `BM_NETWORK_SEED_RANGE_xxx` and to be consistent with any values already chosen for `BM_NETWORK_SEED_IP` and `BM_NETWORK_CIDR`. All addresses must be on a common subnet.

`BM_NETWORK_UNDERCLOUD_RANGE_START`, `BM_NETWORK_UNDERCLOUD_RANGE_END` - Use the variables to specify an IP address range for the undercloud to administrate/manage the overcloud node(s), for example 192.168.130.23-192.168.130.126.

	export BM_NETWORK_UNDERCLOUD_RANGE_START=192.168.130.23
	export BM_NETWORK_UNDERCLOUD_RANGE_END=192.168.130.126

**Note:** You must choose the `BM_NETWORK_UNDERCLOUD_RANGE_xxx` to be consistent with any values already chosen for `BM_NETWORK_SEED_IP` and `BM_NETWORK_CIDR`. All addresses must be on a common subnet.

`OVERCLOUD_NeutronPublicInterface` - Use this variable to set the value of the name of the interface that carries the Networking Operations service (Neutron) external traffic on your overcloud. The default value is `eth2`. If this is correct you do not need to set this variable.

	export OVERCLOUD_NeutronPublicInterface=eth2

`FLOATING_START`, `FLOATING_END`, `FLOATING_CIDR` - Use these variables to control the range of IP addresses available for user VMs in the overcloud.  The defaults are currently set as below but can be changed, if needed.

	export FLOATING_START=192.0.2.45
	export FLOATING_END=192.0.2.254
	export FLOATING_CIDR=192.0.2.0/24

**Note:** The range defined by the variables `FLOATING_START`, `FLOATING_END` and `FLOATING_CIDR` to be in conflict with the address range of the default private network. By default the range of the default private network is between 10.0.0.1 and 10.255.255.254 (CIDR 10.0.0.0/8). 

Then the FLOATING_START, FLOATING_END, and FLOATING_CIDR cannot be anything in the form of 10.x.y.z.  The address range of the default private network is defined by the variable OVERCLOUD_FIXED_RANGE_CIDR.

`OVERCLOUD_VIRTUAL_INTERFACE` - Use this variable to set the interface that the overcloud virtual IP (used for accessing API services) will be assigned to. This is required and the interface must exist on the two overcloud controller nodes and the overcloud management controller node.

	$ export OVERCLOUD_VIRTUAL_INTERFACE=eth0

**Configure a second network** 

A second network can be configured for the floating ip pool by setting `OVERCLOUD_NeutronPublicInterface` to a physically configured VLAN. The vlan name used as the `OVERCLOUD_NeutronPublicInterface` is expected to be of the form "vlan" followed by the vlan id ( ex. vlan101 ).

For example:

	export OVERCLOUD_NeutronPublicInterface=vlan101
	export NeutronPublicInterfaceRawDevice=eth0
	export FLOATING_START=192.0.8.20
	export FLOATING_END=192.0.15.254
	export FLOATING_CIDR=192.0.8.0/21
	export OVERCLOUD_VIRTUAL_INTERFACE=eth0

**Note:** The overcloud neutron external network (ext-net) assumes the gateway IP is the lowest non-zero host IP address in the `FLOATING_CIDR` range.

`OVERCLOUD_FIXED_RANGE_CIDR` - Use this variable to set the address range of the default private network.

For example:

	export OVERCLOUD_FIXED_RANGE_CIDR=172.0.100.0/24

`UNDERCLOUD_NeutronPublicInterface` - Use this variable to set the value of the name of the interface that carries the Networking Operations service (Neutron) external traffic on your undercloud. The default value is `eth2`. If this is correct you do not need to set this variable.

	export UNDERCLOUD_NeutronPublicInterface=eth2

`OVERCLOUD_NTP_SERVER` - Use this variable to set the IP address of an NTP server accessible on the public interface for overcloud hosts. This is required.

	export OVERCLOUD_NTP_SERVER=192.0.1.128

`UNDERCLOUD_NTP_SERVER` - Use this variable to set the IP address of an NTP server accessible on the public interface for undercloud hosts. This is required.

	export UNDERCLOUD_NTP_SERVER=192.0.1.128

`OVERCLOUD_COMPUTESCALE` - Use this variable to set the number of overcloud compute nodes to deploy.

	export OVERCLOUD_COMPUTESCALE=3

`OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID` - Use this variable to set a unique idenitifier for the HP Helion OpenStack installation. 

HP Helion OpenStack uses keepalived to manage virtual IPs. keepalived uses a unique id to synchronise its activities. If you plan to run multiple installations of HP Helion OpenStack on the same network, each installation must be configured with a unique id by setting the environment variable `OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID` to a unique number (from 0 to 255) before running the installation. The default value, if unset, is 51.

	export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=99

**Configure a third network** 

A third network can be configured for the platform service guest instances to connect to undercloud controller by setting `NeutronSVCInterface` to a physically configured VLAN. The VLAN name used as the `NeutronSVCInterface` is expected to be of the form `vlan` followed by the VLAN id ( ex. vlan102 ).

**Note:** These variables are optional for the ESX cloud type. 

For example: 

	export NeutronSVCInterface=vlan102 
	export NeutronSVCInterfaceDefaultRoute=192.168.132.1 
	export SVC_ALLOCATE_START=192.168.132.2 
	export SVC_ALLOCATE_END=192.168.132.250 
	export SVC_ALLOCATE_CIDR=192.168.132.0/24 
	export OVERCLOUD_BRIDGE_MAPPINGS=svcnet1:br-svc 
	export OVERCLOUD_FLAT_NETWORKS=svcnet1 

`VLAN_RANGE` - Use this variable to specify the VLAN ranges that could be used by tenant networks.  

**Inportant** This option is required for the ESX cloud type.

For example: 

	export VLAN_RANGE=10:500

`PROVIDER_NETWORK` - Use this variable to specify the management network of the ESX hypervisors. This is a required option for ESX cloud type.

For example:

	export PROVIDER_NETWORK=192.168.10.0/24


## Environment variables file for a KVM install ## {#kvm}

Identify the environment variables required for the installation based on the deployment scenario.

- [Deployment Scenario 1: HP Helion OpenStack Deployment with custom IP addresses](#one)

### Deployment Scenario 1: HP Helion OpenStack Deployment with custom IP addresses and VxLAN based Tenant Networks ### {#one}

If you plan to use custom IP addresses in your HP Helion OpenStack deployment, create a file named `env_vars` and add the following environment variables. Save the file on the seed cloud host (installation system). The variables are defined in [Definition of Environment variables used during install](#env).

All VLAN ID's and IP addresses given in below are examples of customized IP addresses and VLAN identifiers for External and Service network access.

	export BM_NETWORK_CIDR=192.168.130.0/24
	export BM_NETWORK_GATEWAY=192.168.130.1
	export BM_NETWORK_SEED_IP=192.168.130.3
	export BM_NETWORK_SEED_RANGE_START=192.168.130.4
	export BM_NETWORK_SEED_RANGE_END=192.168.130.22
	export BM_NETWORK_UNDERCLOUD_RANGE_START=192.168.130.23
	export BM_NETWORK_UNDERCLOUD_RANGE_END=192.168.130.126
	export FLOATING_START=192.168.131.2
	export FLOATING_END=192.168.131.245
	export FLOATING_CIDR=192.168.131.0/24
	export UNDERCLOUD_NeutronPublicInterface=eth1
	export BRIDGE_INTERFACE=em2
	export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=202
	export OVERCLOUD_NTP_SERVER=16.110.135.123
	export UNDERCLOUD_NTP_SERVER=16.110.135.123
	export OVERCLOUD_COMPUTESCALE=4
	export UNDERCLOUD_CODN_HTTP_PROXY=http://16.85.175.150:8080
	export UNDERCLOUD_CODN_HTTPS_PROXY=http://16.85.175.150:8080
	export OVERCLOUD_VIRTUAL_INTERFACE=eth1
	export OVERCLOUD_NeutronPublicInterface=vlan331
	export NeutronPublicInterfaceRawDevice=eth1
	export NeutronSVCInterface=vlan332
	export NeutronSVCInterfaceDefaultRoute=192.168.132.1
	export SVC_ALLOCATE_START=192.168.132.2
	export SVC_ALLOCATE_END=192.168.132.250
	export SVC_ALLOCATE_CIDR=192.168.132.0/24
	export OVERCLOUD_BRIDGE_MAPPINGS=svcnet1:br-svc
	export OVERCLOUD_FLAT_NETWORKS=svcnet1
	export OVERCLOUD_CODN_HTTP_PROXY=http://16.85.175.150:8080
	export OVERCLOUD_CODN_HTTPS_PROXY=http://16.85.175.150:8080
	export OVERCLOUD_FIXED_RANGE_CIDR=172.0.100.0/24

[Return to HP Helion OpenStack&reg;: Installation and Configuration for KVM Hypervisor](/helion/openstack/install/kvm/).


## Environment variables file for an ESX cloud type ## {#esx}

Identify the environment variables required for the installation based on the deployment scenario.

- [Deployment Scenario 1: HP Helion OpenStack Deployment with custom IP addresses](#esxone)
- [Deployment Scenario 2: HP Helion OpenStack Deployment with custom IP addresses and a VLAN provider Network for external access](#esxtwo)


### Deployment Scenario 1: HP Helion OpenStack Deployment with custom IP addresses ### {#esxone}

If you plan to use custom IP addresses in your HP Helion OpenStack deployment, create a file named `env_vars` and add the following environment variables. Save the file on the seed cloud host (installation system). The variables are defined in [Definition of Environment variables used during install](#env).

All VLAN ID's & IP addresses given in the next column are example of customized IP addresses and VLAN identifiers for External and Service network access.

		export BM_NETWORK_SEED_RANGE_START=172.30.100.2
		export BM_NETWORK_SEED_RANGE_END=172.30.100.20
		export BM_NETWORK_UNDERCLOUD_RANGE_START=172.30.100.21
		export BM_NETWORK_UNDERCLOUD_RANGE_END=172.30.100.40
		export NeutronPublicInterface=eth0
		export FLOATING_START=172.30.100.41
		export FLOATING_END=172.30.100.200
		export FLOATING_CIDR=172.30.100.0/24
		export UNDERCLOUD_NTP_SERVER=16.110.135.123
		export OVERCLOUD_NTP_SERVER=16.110.135.123
		export OVERCLOUD_CLOUD_TYPE=ESX
		export PROVIDER_NETWORK=192.168.10.0/24
		export CUSTOMER_ROUTER_IP=172.30.100.1
		export VLAN_RANGE="500:1000"
		export OVERCLOUD_VIRTUAL_INTERFACE=br-ex
		export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=91

[Return to HP Helion OpenStack&reg;: Installation and Configuration for ESX Hypervisor](/helion/openstack/install/esx/).


### Deployment Scenario 2: HP Helion OpenStack Deployment with custom IP addresses and a VLAN provider Network for external access ### {#esxtwo}

If you intend to use custom IP addresses and a VLAN provider network for external access in your HP Helion OpenStack deployment, create a file named `env_vars` and add the following environment variables. Save the file on the seed cloud host (installation system). The variables are defined in [Definition of Environment variables used during install](#env).

1. Create a file named `env_vars` and add the environment variable listed below. Save the file on the seed cloud host. 

	All VLAN ID's & IP addresses given in the next column are examples of customized IP addresses and VLAN identifiers for External network access.

		export BM_NETWORK_CIDR=172.30.100.0/24
		export BM_NETWORK_SEED_IP=172.30.100.1
		export BRIDGE_INTERFACE=em1
		export BM_NETWORK_SEED_RANGE_START=10.23.69.136
		export BM_NETWORK_SEED_RANGE_END=10.23.69.141
		export BM_NETWORK_UNDERCLOUD_RANGE_START=10.23.69.142
		export BM_NETWORK_UNDERCLOUD_RANGE_END=10.23.69.150
		export OVERCLOUD_NeutronPublicInterface=eth2
		export NeutronPublicInterface=eth2
		export NeutronPublicInterfaceDefaultRoute=15.126.52.1
		export FLOATING_START=15.126.54.20
		export FLOATING_END=15.126.54.40
		export FLOATING_CIDR=15.126.52.0/22
		export UNDERCLOUD_NeutronPublicInterface=eth2
		export OVERCLOUD_NTP_SERVER=10.23.69.129
		export UNDERCLOUD_NTP_SERVER=10.23.69.129
		export PROVIDER_NETWORK=10.23.70.128/26
		export CUSTOMER_ROUTER_IP=10.23.69.129
		export OVERCLOUD_NEUTRON_DVR=False
		export OVERCLOUD_VIRTUAL_INTERFACE="br-ex"
		export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID="101"
		export VLAN_RANGE=1701:1720   
		export OVERCLOUD_CLOUD_TYPE="ESX"
		export EXTERNAL_VLAN_ID=1634
		export EXTERNAL_NETWORK_GATEWAY=15.126.52.1
		export NeutronPublicInterfaceRawDevice=eth2

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

[Return to HP Helion OpenStack&reg;: Installation and Configuration for ESX Hypervisor](/helion/openstack/install/esx/).

 

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
