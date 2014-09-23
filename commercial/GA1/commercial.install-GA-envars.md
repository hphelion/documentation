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

This file can be used to conduct operations such as adding or removing a node and integrating block storage. Make sure this file is preserved.

## Environment variables file for a KVM install ## {#kvm}

Identify the environment variables required for the installation based on the deployment scenario.

The following table provides information about the installation scenario and the respective environment variables required for the installation and configuration of HP Helion OpenStack

**Deployment Scenario 1:**
**HP Helion OpenStack Deployment with custom IP addresses.**

All VLAN ID's & IP addresses given in the next column are example of customized IP addresses  and VLAN identifiers for External &  Service network access.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
<td><b>Export variables</b></td><td><b>hp_passthrough</b></td>
<tr style="background-color: white; color: black;">
<tr>
<td>export BM_NETWORK_CIDR=192.168.130.0/24
<br>export BM_NETWORK_GATEWAY=192.168.130.1
<br>export BM_NETWORK_SEED_IP=192.168.130.3
<br>export BM_NETWORK_SEED_RANGE_START=192.168.130.4
<br>export BM_NETWORK_SEED_RANGE_END=192.168.130.22
<br>export BM_NETWORK_UNDERCLOUD_RANGE_START=192.168.130.23
<br>export BM_NETWORK_UNDERCLOUD_RANGE_END=192.168.130.126
<br>export FLOATING_START=192.168.131.2
<br>export FLOATING_END=192.168.131.245
<br>export FLOATING_CIDR=192.168.131.0/24
<br>export NODE_MIN_DISK=512
<br>export NODE_MIN_MEMORY=32768
<br>CUSTOMER_ROUTER_IP=
<br>export UNDERCLOUD_NeutronPublicInterface=eth1
<br>export BRIDGE_INTERFACE=em2
<br>export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=202
<br>export OVERCLOUD_NTP_SERVER=16.110.135.123
<br>export UNDERCLOUD_NTP_SERVER=16.110.135.123
<br>export OVERCLOUD_VSA_STORAGESCALE=2
<br>export OVERCLOUD_COMPUTESCALE=4
<br>export OVERCLOUD_NEUTRON_DVR=True
<br>export UNDERCLOUD_CODN_HTTP_PROXY=http://16.85.175.150:8080
<br>export UNDERCLOUD_CODN_HTTPS_PROXY=http://16.85.175.150:8080
<br>export OVERCLOUD_VIRTUAL_INTERFACE=eth1
<br>export OVERCLOUD_NeutronPublicInterface=vlan331
<br>export NeutronPublicInterfaceRawDevice=eth1
<br>export NeutronSVCInterface=vlan332
<br>export NeutronSVCInterfaceDefaultRoute=192.168.132.1
<br>export SVC_ALLOCATE_START=192.168.132.2
<br>export SVC_ALLOCATE_END=192.168.132.250
<br>export SVC_ALLOCATE_CIDR=192.168.132.0/24
<br>export OVERCLOUD_BRIDGE_MAPPINGS=svcnet1:br-svc
<br>export OVERCLOUD_FLAT_NETWORKS=svcnet1
<br>export OVERCLOUD_CODN_HTTP_PROXY=http://16.85.175.150:8080
<br>export OVERCLOUD_CODN_HTTPS_PROXY=http://16.85.175.150:8080
<br>export OVERCLOUD_FIXED_RANGE_CIDR=172.0.100.0/24
</td>
<td> </td>
</tr>
</table>

**Deployment Scenario 2:**
**HP Helion OpenStack Deployment with default configuration.**

This deployment scenario assumes the default IP addresses can be used along with default VLAN ids to setup the environment"

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
<td><b>Export variables</b></td><td><b>hp_passthrough</b></td>
<tr style="background-color: white; color: black;">
<tr>
<td>export BRIDGE_INTERFACE=em2</td>
<td> </td>
</tr>
</table>

**Deployment Scenario 3:**
**HP Helion OpenStack Deployment with custom IP addresses and a VLAN provider Network  for external access.**

All VLAN ID's & IP addresses given in the next column are example of customized IP addresses  and VLAN identifiers for External network access.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
<td><b>Export variables</b></td><td><b>hp_passthrough</b></td>
<tr style="background-color: white; color: black;">
<tr>

<td>export BRIDGE_INTERFACE=em2
<br>export BM_NETWORK_SEED_IP=192.168.200.2
<br>export BM_NETWORK_CIDR=192.168.200.0/24
<br>export BM_NETWORK_GATEWAY=192.168.200.1
<br>export BM_NETWORK_SEED_RANGE_START=192.168.200.3
<br>export BM_NETWORK_SEED_RANGE_END=192.168.200.20
<br>export BM_NETWORK_UNDERCLOUD_RANGE_START=192.168.200.31
<br>export BM_NETWORK_UNDERCLOUD_RANGE_END=192.168.200.50
<br>export OVERCLOUD_NeutronPublicInterface=eth1
<br>export UNDERCLOUD_NeutronPublicInterface=eth1
<br>export OVERCLOUD_NTP_SERVER=16.110.135.123
<br>export UNDERCLOUD_NTP_SERVER=16.110.135.123
<br>export FLOATING_START=192.168.200.101
<br>export FLOATING_END=192.168.200.254
<br>export FLOATING_CIDR=192.168.200.0/24
<br>export OVERCLOUD_HYPERVISOR_PUBLIC_INTERFACE=eth1
<br>export OVERCLOUD_HYPERVISOR_PHYSICAL_BRIDGE=br-ex
<br>export OVERCLOUD_BRIDGE_MAPPINGS=physnet1:br-ex
<br>export NeutronNetworkType=vlan
<br>export NeutronNetworkVLANRanges=physnet1:300:398
<br>export OVERCLOUD_CONTROL_VIRTUAL_ROUTER_ID=37
<br>export OVERCLOUD_VIRTUAL_INTERFACE=eth1
<br>export OVERCLOUD_NEUTRON_DVR=False
<br>export OVERCLOUD_COMPUTESCALE=5
</td>
<td>"Edit overcloud_neutron_dhcp_agent.json located at 
/tripleo/hp_passthrough and add the following lines under dhcp_delete_namespaces:

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



Edit overcloud_neutron_ml2_conf.json located at 
/tripleo/hp_passthrough and modify the following lines where 300:398 is the VLAN range for the environment.

Line no. 13
Default - ""value"": ""vxlan,vlan""
After modification - ""value"": ""vlan""

Line no. 32
Default - ""value"": ""physnet1""
After modification - ""value"": ""physnet1:300:398""
</td>
</tr>
</table>


2.	Create a file names env_vars and add all the required environment variables and save the file.
	NOTE: This file will be used in future to conduct operations like add\remove node and integrate block storage. Please ensure this file is preserved.  


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 

## Environment variables file for a KVM install ## {#kvm}





<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
 

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
