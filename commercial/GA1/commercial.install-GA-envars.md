---
layout: default
title: "HP Helion OpenStack: Creating an Environment Variables File for Installation"
permalink: /helion/openstack/ga/install/envars/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/install-beta/prereqs/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/vsa/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&reg;:  Creating an Environment Variables File for Installation #

To make the HP Helion OpenStack installation process easier, you can enter all of the environment variables required by the installer into a file that will be executed automatically.

- [Environment variables file for a KVM install](#kvm)
- [Environment variables file for a ESX install](#kvm)

This file can be used to conduct operations such as adding or removing a node and integrating block storage. Make sure this file is preserved.

## Environment variables file for a KVM install ## {#kvm}

Identify the environment variables required for the installation based on the deployment scenario.

- [Deployment Scenario 1: HP Helion OpenStack Deployment with custom IP addresses](#one)
- [Deployment Scenario 2: HP Helion OpenStack Deployment with default configuration](#two)
- [Deployment Scenario 3: HP Helion OpenStack Deployment with custom IP addresses and a VLAN provider Network for external access](#three)


### Deployment Scenario 1: HP Helion OpenStack Deployment with custom IP addresses ### {#one}

If you intend to use custom IP addresses in your HP Helion OpenStack deployment, create a file named `env_vars` and add the environment variables listed below. Save the file on the seed VM . You will copy the file to the appropriate location during the installation.

All VLAN ID's & IP addresses given in the next column are example of customized IP addresses and VLAN identifiers for External and Service network access.

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
	export NODE_MIN_DISK=512
	export NODE_MIN_MEMORY=32768
	CUSTOMER_ROUTER_IP=
	export UNDERCLOUD_NeutronPublicInterface=eth1
	export BRIDGE_INTERFACE=em2
	export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=202
	export OVERCLOUD_NTP_SERVER=16.110.135.123
	export UNDERCLOUD_NTP_SERVER=16.110.135.123
	export OVERCLOUD_VSA_STORAGESCALE=2
	export OVERCLOUD_COMPUTESCALE=4
	export OVERCLOUD_NEUTRON_DVR=True
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

[Return to HP Helion OpenStack&reg;: Installation and Configuration for KVM Hypervisor](/helion/openstack/ga/install/kvm/).

### Deployment Scenario 2: HP Helion OpenStack Deployment with default configuration ### {#two}

If you intend to use the default IP addresses and default VLAN IDs configured by the installation process in your HP Helion OpenStack deployment, create a file named `env_vars` and add the environment variable listed below. Save the file on the seed VM .

	export BRIDGE_INTERFACE=em2</td>

[Return to HP Helion OpenStack&reg;: Installation and Configuration for KVM Hypervisor](/helion/openstack/ga/install/kvm/).

### Deployment Scenario 3: HP Helion OpenStack Deployment with custom IP addresses and a VLAN provider Network for external access ### {#three}

If you intend to use custom IP addresses and a VLAN provider network for external access in your HP Helion OpenStack deployment:

1. Create a file named `env_vars` and add the environment variable listed below. Save the file on the seed VM. 

	All VLAN ID's & IP addresses given in the next column are examples of customized IP addresses and VLAN identifiers for External network access.

		export BRIDGE_INTERFACE=em2
		export BM_NETWORK_SEED_IP=192.168.200.2
		export BM_NETWORK_CIDR=192.168.200.0/24
		export BM_NETWORK_GATEWAY=192.168.200.1
		export BM_NETWORK_SEED_RANGE_START=192.168.200.3
		export BM_NETWORK_SEED_RANGE_END=192.168.200.20
		export BM_NETWORK_UNDERCLOUD_RANGE_START=192.168.200.31
		export BM_NETWORK_UNDERCLOUD_RANGE_END=192.168.200.50
		export OVERCLOUD_NeutronPublicInterface=eth1
		export UNDERCLOUD_NeutronPublicInterface=eth1
		export OVERCLOUD_NTP_SERVER=16.110.135.123
		export UNDERCLOUD_NTP_SERVER=16.110.135.123
		export FLOATING_START=192.168.200.101
		export FLOATING_END=192.168.200.254
		export FLOATING_CIDR=192.168.200.0/24
		export OVERCLOUD_HYPERVISOR_PUBLIC_INTERFACE=eth1
		export OVERCLOUD_HYPERVISOR_PHYSICAL_BRIDGE=br-ex
		export OVERCLOUD_BRIDGE_MAPPINGS=physnet1:br-ex
		export NeutronNetworkType=vlan
		export NeutronNetworkVLANRanges=physnet1:300:398
		export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=37
		export OVERCLOUD_VIRTUAL_INTERFACE=eth1
		export OVERCLOUD_NEUTRON_DVR=False
		export OVERCLOUD_COMPUTESCALE=5

2. Edit `overcloud_neutron_dhcp_agent.json` located at 
`/tripleo/hp_passthrough` and add the following lines under `dhcp_delete_namespaces`:

		{""option"":""enable_isolated_metadata"",""value"":""True""},
		{""option"":""dnsmasq_dns_servers"", ""value"":""10.1.0.20""}

	After the changes, the file will look like as shown below, where 10.1.0.20 is the local DNS server.

		---------------------------------------------------------
		{""dhcp_agent"":
			{""config"":
			[
				{""section"":""DEFAULT"",
				""values"":
					[
						{""option"":""dhcp_delete_namespaces"",""value"":""True""},
						{""option"":""enable_isolated_metadata"",""value"":""True""},
						{""option"":""dnsmasq_dns_servers"", ""value"":""10.1.0.20""}
					]
				}
			]
		}
		---------------------------------------------------------

3. Edit `overcloud_neutron_ml2_conf.json` located at `/tripleo/hp_passthrough` and modify the following lines where `300:398` is the VLAN range for the environment.

	Line no. 13
	Default - ""value"": ""vxlan,vlan""
	After modification - ""value"": ""vlan""

	Line no. 32
	Default - ""value"": ""physnet1""
	After modification - ""value"": ""physnet1:300:398""


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

[Return to HP Helion OpenStack&reg;: Installation and Configuration for KVM Hypervisor](/helion/openstack/ga/install/kvm/).

## Environment variables file for a ESX install ## {#kvm}

Identify the environment variables required for the installation based on the deployment scenario.

- [Deployment Scenario 1: HP Helion OpenStack Deployment with custom IP addresses](#esxone)
- [Deployment Scenario 2: HP Helion OpenStack Deployment with default configuration](#esxtwo)
- [Deployment Scenario 3: HP Helion OpenStack Deployment with custom IP addresses and a VLAN provider Network for external access](#esxthree)


### Deployment Scenario 1: HP Helion OpenStack Deployment with custom IP addresses ### {#esxone}

If you intend to use custom IP addresses in your HP Helion OpenStack deployment, create a file named `env_vars` and add the environment variables listed below. Save the file on the seed VM . You will copy the file to the appropriate location during the installation.

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

[Return to HP Helion OpenStack&reg;: Installation and Configuration for ESX Hypervisor](/helion/openstack/ga/install/esx/).

### Deployment Scenario 2: HP Helion OpenStack Deployment with default configuration ### {#two}

If you intend to use the default IP addresses and default VLAN IDs configured by the installation process in your HP Helion OpenStack deployment, create a file named `env_vars` and add the environment variables listed below. Save the file on the seed VM . You will copy the file to the appropriate location during the installation.

All VLAN ID's & IP addresses given in the next column are example of customized IP addresses and VLAN identifiers for External and Service network access.

		export OVERCLOUD_NTP_SERVER="16.110.135.123"
		export UNDERCLOUD_NTP_SERVER="16.110.135.123"
		export OVERCLOUD_CLOUD_TYPE="ESX"
		export PROVIDER_NETWORK="192.168.10.0/24"
		export CUSTOMER_ROUTER_IP="192.0.2.1"
		export OVERCLOUD_VIRTUAL_INTERFACE=eth0
		export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID="101"
		export VLAN_RANGE="500:1000"

[Return to HP Helion OpenStack&reg;: Installation and Configuration for ESX Hypervisor](/helion/openstack/ga/install/esx/).

### Deployment Scenario 3: HP Helion OpenStack Deployment with custom IP addresses and a VLAN provider Network for external access ### {#three}

If you intend to use custom IP addresses and a VLAN provider network for external access in your HP Helion OpenStack deployment:

1. Create a file named `env_vars` and add the environment variable listed below. Save the file on the seed VM. 

	All VLAN ID's & IP addresses given in the next column are examples of customized IP addresses and VLAN identifiers for External network access.

		export BM_NETWORK_SEED_RANGE_START=10.23.69.136
		export BM_NETWORK_SEED_RANGE_END=10.23.69.141
		export BM_NETWORK_UNDERCLOUD_RANGE_START=10.23.69.142
		export BM_NETWORK_UNDERCLOUD_RANGE_END=10.23.69.150
		export OVERCLOUD_NeutronPublicInterface=eth2
		export NeutronPublicInterface=eth2
		#export NeutronPublicInterfaceDefaultRoute=15.126.52.1
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
		#export NeutronPublicInterfaceRawDevice=eth2

2. Edit `overcloud_neutron_dhcp_agent.json` located at 
`/tripleo/hp_passthrough` and add the following lines under `dhcp_delete_namespaces`:

		{""option"":""enable_isolated_metadata"",""value"":""True""},
		{""option"":""dnsmasq_dns_servers"", ""value"":""10.1.0.20""}

	After the changes, the file will look like as shown below, where 10.1.0.20 is the local DNS server.

		---------------------------------------------------------
		{""dhcp_agent"":
			{""config"":
			[
				{""section"":""DEFAULT"",
				""values"":
					[
						{""option"":""dhcp_delete_namespaces"",""value"":""True""},
						{""option"":""enable_isolated_metadata"",""value"":""True""},
						{""option"":""dnsmasq_dns_servers"", ""value"":""10.1.0.20""}
					]
				}
			]
		}
		---------------------------------------------------------

3. Edit `overcloud_neutron_ml2_conf.json` located at `/tripleo/hp_passthrough` and modify the following lines where `300:398` is the VLAN range for the environment.

	Line no. 13
	Default - ""value"": ""vxlan,vlan""
	After modification - ""value"": ""vlan""

	Line no. 32
	Default - ""value"": ""physnet1""
	After modification - ""value"": ""physnet1:300:398""

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

[Return to HP Helion OpenStack&reg;: Installation and Configuration for ESX Hypervisor](/helion/openstack/ga/install/esx/).

 

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
