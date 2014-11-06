---
layout: default
title: "HP Helion OpenStack: Editing the JSON Environment Variables File for Installation"
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
# HP Helion OpenStack&reg;:  Editing the JSON Environment Variables File for Installation #

The HP Helion OpenStack Installation process requires various configuration parameters to be specified. This is achieved through environment variables. 

As a user who is installing HP Helion OpenStack, can enter all required environment variables using a JSON (JavaScript Object Notation) file that comes with the installation package.

The installation package contains a number of JSON files. You need to be concerned with only one of two, depending upon your install environment: `kvm-custom-ips.json` or `esx-custom-ips.json`. The files are located in the `/tripleo/config` directory after the installation package is extracted.

You do not need to be able to create JSON files or need to understand how it functions. JSON is human-readable text-based file to store information that can be used to transfer data between servers.

This file will be used to conduct operations such as adding or removing a node and integrating block storage. Make sure this file is preserved for future use.

Edit the JSON file based on the applicable scenario:

- [Definition of Environment variables used during install](#env)
- [Environment variables file for a KVM install](#kvm)
- [Environment variables file for a ESX install](#esx)


## Definition of Environment variables used during install ## {#env}

The following section describes the environmental variables that affect your installation.


`BRIDGE_INTERFACE` - Use this variable to specify the interface on the seed cloud host to use as the bridge interface, for example `em2` or `eth2`. This interface connects to the untagged management network and will be used to PXE boot undercloud and overcloud servers:

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

`BM_NETWORK_UNDERCLOUD_RANGE_START`, `BM_NETWORK_UNDERCLOUD_RANGE_END` - Use the variables to specify an IP address range for the undercloud to administrate/manage the overcloud node(s). The IPs assigned by this variable are for the undercloud to distribute among the overcloud nodes. Make sure you assign at least one IP address for each baremetal server in your environment and an additional IP used as a virtual IP for HA.

	export BM_NETWORK_UNDERCLOUD_RANGE_START=192.168.130.23
	export BM_NETWORK_UNDERCLOUD_RANGE_END=192.168.130.126

**Note:** You must choose the `BM_NETWORK_UNDERCLOUD_RANGE_xxx` to be consistent with any values already chosen for `BM_NETWORK_SEED_IP` and `BM_NETWORK_CIDR`. All addresses must be on a common subnet.

`CUSTOMER_ROUTER_IP` - Use this value to set the interface IP on the external customer router needed for SVC network to function. The `CUSTOMER_ROUTER_IP` will reside on the `BM_NETWORK`, facing undercloud server. In most of the cases it will be equal to `BM_NETWORK_GATEWAY`

	export CUSTOMER_ROUTER_IP=192.168.130.1

`OVERCLOUD_NeutronPublicInterface` - Use this variable to set the value of the name of the interface that carries the Networking Operations service (Neutron) external traffic on your overcloud. This is the physical interface associated with the BM_NETWORK networks. The default value is `eth2`. If this is correct you do not need to set this variable.

	export OVERCLOUD_NeutronPublicInterface=eth2

`FLOATING_START`, `FLOATING_END`, `FLOATING_CIDR` - Use these variables to control the range of IP addresses available for user VMs in the overcloud.  The defaults are currently set as below but can be changed, if needed.

	export FLOATING_START=192.0.2.45
	export FLOATING_END=192.0.2.254
	export FLOATING_CIDR=192.0.2.0/24

**Note:** The range defined by the variables `FLOATING_START`, `FLOATING_END` and `FLOATING_CIDR` to be in conflict with the address range of the default private network. By default the range of the default private network is between 10.0.0.1 and 10.255.255.254 (CIDR 10.0.0.0/8). 

Then the FLOATING_START, FLOATING_END, and FLOATING_CIDR cannot be anything in the form of 10.x.y.z.  The address range of the default private network is defined by the variable OVERCLOUD_FIXED_RANGE_CIDR.

`OVERCLOUD_VIRTUAL_INTERFACE` - Use this variable to set the interface that the overcloud virtual IP (used for accessing API services) will be assigned to. This is required and the interface must exist on the two overcloud controller nodes and the overcloud management controller node.

	$ export OVERCLOUD_VIRTUAL_INTERFACE=eth0

`UNDERCLOUD_CODN_HTTP_PROXY` and `UNDERCLOUD_CODN_HTTPS_PROXY` - Use these variables to variable to set the IP address for the CODN (Sherpa) service to download images for patches or other software packages available for purchase and download into the undercloud.

	export UNDERCLOUD_CODN_HTTP_PROXY=http://19.65.150.175:8080
	export UNDERCLOUD_CODN_HTTPS_PROXY=http://19.65.150.175:8080


`OVERCLOUD_CODN_HTTP_PROXY` and `OVERCLOUD_CODN_HTTPS_PROXY` - Use these variables to variable to set the IP address for the CODN (Sherpa) service to download images for patches or other software packages available for purchase and download into the overcloud.

	export OVERCLOUD_CODN_HTTP_PROXY=http://19.65.150.175:8080
	export OVERCLOUD_CODN_HTTPS_PROXY=http://19.65.150.175:8080

`OVERCLOUD_FIXED_RANGE_CIDR` - Use this variable to set the address range of the default private network.

For example:

	export OVERCLOUD_FIXED_RANGE_CIDR=172.0.100.0/24

`UNDERCLOUD_NeutronPublicInterface` - Use this variable to set the value of the name of the interface that carries the Networking Operations service (Neutron) external traffic on your undercloud. This is the physical interface associated with the BM_NETWORK* networks. The default value is `eth2`. If this is correct you do not need to set this variable.

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


**Configure the Service network** 

Helion OpenStack requires a 3rd VLAN network called as Service Network which connects trusted VMs in overcloud to communicate with cloud infrastructure components in undercloud. The purpose is to aggregate logs of PaaS components running on the VMs in the overcloud to the undercloud via this network.

This third network can be configured for the platform service guest instances to connect to undercloud controller by setting `NeutronSVCInterface` to a physically configured VLAN. The VLAN name used as the `NeutronSVCInterface` is expected to be of the form `vlan` followed by the VLAN id ( ex. vlan102 ).

**Note:** These variables are optional for the ESX cloud type. 

For example: 

	export NeutronSVCInterface=vlan102 
	export NeutronSVCInterfaceDefaultRoute=192.168.132.1 
	export SVC_ALLOCATE_START=192.168.132.2 
	export SVC_ALLOCATE_END=192.168.132.250 
	export SVC_ALLOCATE_CIDR=192.168.132.0/24 
	export CUSTOMER_ROUTER_IP=10.23.69.129
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

If you plan to use custom IP addresses in your HP Helion OpenStack deployment, open the JSON file in the installation package named `kvm-custom-ips.json` and edit the following environment variables. Save the file on the seed cloud host (installation system). The variables are defined in [Definition of Environment variables used during install](#env).

All VLAN ID's & IP addresses given in the following procedure are examples of customized IP addresses and VLAN identifiers for external network access.

1. Log into your install system as root.

		sudo su -

2. Locate the `kvm-custom-ips.json` in the `/tripleo/config` directory. This directory is created when the installation package is extracted.

3. Optionally, make a backup copy of the JSON file in case it is needed.

	cp kvm-custom-ips.json kvm-custom-ips.json-backup

4. Open the `kvm-custom-ips.json` file and edit the environment variable listed below.  

		{
			"cloud_type": "KVM",
			"vsa_scale": 0,
			"vsa_ao_scale": 0,
			"so_swift_storage_scale": 0,
			"so_swift_proxy_scale": 0,
			"compute_scale": 4,
			"bridge_interface": "em2",
			"virtual_interface": "eth1",
			"fixed_range_cidr": "172.0.100.0/24",
			"control_virtual_router_id": "202",
			"baremetal": {
				"network_seed_ip": "192.168.130.3",
				"network_cidr": "192.168.130.0/24",
				"network_gateway": "192.168.130.1",
				"network_seed_range_start": "192.168.130.4",
				"network_seed_range_end": "192.168.130.22",
				"network_undercloud_range_start": "192.168.130.23",
				"network_undercloud_range_end": "192.168.130.126"
		},
			"neutron": {
				"public_interface_raw_device": "eth1",
				"overcloud_public_interface": "vlan331",
				"undercloud_public_interface": "eth1"
			},
			"ntp": {
				"overcloud_server": "16.110.135.123",
				"undercloud_server": "16.110.135.123"
			},
			"floating_ip": {
				"start": "192.168.131.2",
				"end": "192.168.131.245",
				"cidr": "192.168.131.0/24"
			},
			"svc": {
				"interface": "vlan332",
				"interface_default_route": "192.168.132.1",
				"allocate_start": "192.168.132.2",
				"allocate_end": "192.168.132.250",
				"allocate_cidr": "192.168.132.0/24",
				"overcloud_bridge_mappings": "svcnet1:br-svc",
				"overcloud_flat_networks": "svcnet1",
				"customer_router_ip": "10.23.69.129"
			},
			"codn": {
				"undercloud_http_proxy": "http://16.85.175.150:8080",
				"undercloud_https_proxy": "http://16.85.175.150:8080",
				"overcloud_http_proxy": "http://16.85.175.150:8080",
				"overcloud_https_proxy": "http://16.85.175.150:8080"
			}
		}

5. Save the file on the seed cloud host.

[Return to HP Helion OpenStack&reg;: Installation and Configuration for KVM Hypervisor](/helion/openstack/install/kvm/).


## Environment variables file for an ESX cloud type ## {#esx}

Identify the environment variables required for the installation based on the deployment scenario.

- [Deployment Scenario 1: HP Helion OpenStack Deployment with custom IP addresses](#esxone)
- [Deployment Scenario 2: HP Helion OpenStack Deployment with custom IP addresses and a VLAN provider Network for external access](#esxtwo)


### Deployment Scenario 1: HP Helion OpenStack Deployment with custom IP addresses ### {#esxone}

If you plan to use custom IP addresses in your HP Helion OpenStack deployment, open the JSON file in the installation package named `esx-custom-ips.json` and edit the following environment variables. Save the file on the seed cloud host (installation system). The variables are defined in [Definition of Environment variables used during install](#env).

All VLAN ID's & IP addresses given in the following procedure are examples of customized IP addresses and VLAN identifiers for external network access.

1. Log into your install system as root.

		sudo su -

2. Locate the `esx-custom-ips.json` in the `/tripleo/config` directory. This directory is created when the installation package is extracted.

3. Optionally, make a backup copy of the JSON file in case it is needed.

	cp kvm-custom-ips.json kvm-custom-ips.json-backup

4. Open the `esx-custom-ips.json` file and edit the environment variable listed below.  

		{
			"cloud_type": "ESX",
			"baremetal": {
				"network_seed_range_start": "172.30.100.2",
				"network_seed_range_end": "172.30.100.20",
				"network_undercloud_range_start": "172.30.100.21",
				"network_undercloud_range_end": "72.30.100.40"
			},
			"neutron": {
				"overcloud_public_interface": "eth0",
				"undercloud_public_interface": "eth0"
			},
			"ntp": {
				"overcloud_server": "16.110.135.123",
				"undercloud_server": "16.110.135.123"
			},
			"floating_ip": {
				"start": "172.30.100.41",
				"end": "172.30.100.200",
				"cidr": "172.30.100.0/24"
			},
			"vcenter": {
				"provider_network": "192.168.10.0/24",
				"vlan_range": "500:1000",
				"customer_router_ip": "172.30.100.1"
			},
			"virtual_interface": "br-ex",
			"customer_router_ip": "10.23.69.129"
		}

[Return to HP Helion OpenStack&reg;: Installation and Configuration for ESX Hypervisor](/helion/openstack/install/esx/).


### Deployment Scenario 2: HP Helion OpenStack Deployment with custom IP addresses and a VLAN provider Network for external access ### {#esxtwo}

If you intend to use custom IP addresses and a VLAN provider network for external access in your HP Helion OpenStack deployment, open the JSON file in the installation package named `esx-custom-ips.json` and edit the following environment variables. Save the file on the seed cloud host (installation system). The variables are defined in [Definition of Environment variables used during install](#env).

All VLAN ID's & IP addresses given in the following procedure are examples of customized IP addresses and VLAN identifiers for external network access.

1. Log into your install system as root.

		sudo su -

2. Locate the `esx-custom-ips-vlan.json` in the `/tripleo/config` directory. This directory is created when the installation package is extracted.

3. Optionally, make a backup copy of the JSON file in case it is needed.

	cp kvm-custom-ips.json kvm-custom-ips.json-backup

4. Open the `esx-custom-ips.json` file and edit the environment variable listed below.  

		{
			"cloud_type": "ESX",
			"baremetal": {
				"network_cidr": "172.30.100.0/24",
				"network_seed_ip": "172.30.100.1",
				"network_seed_range_start": "10.23.69.136",
				"network_seed_range_end": "10.23.69.141",
				"network_undercloud_range_start": "10.23.69.142",
				"network_undercloud_range_end": "10.23.69.150"
			},
			"neutron": {
				"overcloud_public_interface": "eth2",
				"undercloud_public_interface": "eth2",
				"public_interface_default_route": "15.126.52.1",
				"public_interface_raw_device": "eth2"
			},
			"ntp": {
				"overcloud_server": "10.23.69.129",
				"undercloud_server": "10.23.69.129"
			},
			"floating_ip": {
				"start": "15.126.54.20",
				"end": "15.126.54.40",
				"cidr": "15.126.52.0/22"
			},
			"vcenter": {
				"provider_network": "10.23.70.128/26",
				"vlan_range": "1701:1720",
				"customer_router_ip": "10.23.69.129",
				"external_vlan_id": 1634,
				"external_network_gateway": "15.126.52.1"
			},
			"virtual_interface": "br-ex",
			"bridge_interface": "em1",
			"customer_router_ip": "10.23.69.129"
		}

[Return to HP Helion OpenStack&reg;: Installation and Configuration for ESX Hypervisor](/helion/openstack/install/esx/).



----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
