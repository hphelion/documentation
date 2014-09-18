---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/ga/install/json/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install-overview/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/install/kvm/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174; Installation: Creating the JSON configuration file

The HP Helion OpenStack installer uses a JSON configuration file to enter configuration values. JSON (JavaScript Object Notation) is an open-standard format that uses human-readable text to transmit data objects consisting of attribute–value pairs.


The `hp_ced_installer.sh` accepts the JSON as an input and either sets environment variables or writes passthrough JSON blobs based on the content of the JSON file.

All JSON blobs are written to the ~/tripleo/hp_passthrough directory


## Editing the JSON file ##

A JSON file is included in the installer package that can serve as a template. The file contains entries for all of the configuration values used by the installer.

To edit the JSON file:

1. Open the file in an editor

2. Enter the appropriate values as follows:

<table style="text-align: left; vertical-align: top;">
<tr style="background-color: #C8C8C8;">
	<th>Value</th>
	<th><center>Equivalent Enviroment Variable</center></th>
</tr>
</tr>
<tr style="background-color: white; color: black;">
	<td>cloud_type
	<p>Specify the type of hypervisor: either KVM or ESX. 
	<p>If set to ESX then compute_scale is ignored, DVR is not deployed. 
	<td>OVERCLOUD_CLOUD_TYPE</td>	

</tr>
<tr style="background-color: white; color: black;">
	<td>compute_scale
	<p>Specify the number of compute nodes to deploy.</td>
	<td>OVERCLOUD_COMPUTESCALE</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>swift_scale
	<p>(optional) Override the number of swift storage nodes. Note this is a different scale factor from the "scale out swift" factors.</td>
	<td>OVERCLOUD_SWIFTSTORAGESCALE</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>vsa_scale
	<p>Specify the number of VSA nodes to deploy</td>
	<td>OVERCLOUD_VSA_STORAGESCALE</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>vsa_ao_scale
	<p>Specify the number of VSA AO nodes to deploy</td>
	<td>OVERCLOUD_VSA_AO_STORAGESCALE</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>so_swift_storage_scale
	<p>Specify the number of scale out swift storage nodes to deploy. Note this is a different scale factor from the "swift storage scale" factor.</td>
	<td>OVERCLOUD_SOSWIFT_STORAGESCALE</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>so_swift_proxy_scale
	<p>Specify the number of scale out swift proxy nodes to deploy. Note this is a different scale factor from the "swift storage scale" factor.</td>
	<td>OVERCLOUD_SOSWIFT_PROXYSCALE</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>controller_scale
	<p>(optional) Override the number of overcloud controllers</td>
	<td>OVERCLOUD_CONTROLSCALE</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>bridge_interface
	<p>Specify the name of the device connected to the private network that connects all baremetal nodes. This private network is also where these nodes PXE boot. The installation script assumes this device name is eth0. If your device is NOT named eth0, then determine its name and set the environment variable as shown below</td>
	<td>BRIDGE_INTERFACE </td>
</tr>
<tr style="background-color: white; color: black;">
	<td>floating_ip/start
	<p>Use FLOATING_START and FLOATING_END to specify the range of IP addresses available for user VMs.

	<p>* For KVM installations, make sure the VSA IP address is not in the floating IP range. VSA uses 192.0.2.253. Change the FLOATING_END to 192.0.2.200. If necessary, also change the FLOATING_START and FLOATING_CIDR.

	<p>* For ESX installations, the OVSvApp requires a block of IP addresses. Create more IP addresses for OVSvApp by restricting the number of floating IP addresses created.</td>

	<td>FLOATING_START</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>floating_ip/end
	<p>(optional) </td>
	<td>FLOATING_END</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>floating_ip/cidr
	<p>(optional) </td>
	<td>FLOATING_CIDR</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>baremetal/network_seed_ip
	<p>(optional) </td>
	<td>BM_NETWORK_SEED_IP</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_cidr
	<p>(optional) </td>
	<td>BM_NETWORK_CIDR</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_gateway
	<p>(optional) </td>
	<td>BM_NETWORK_GATEWAY</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_seed_range_start
	<p>(optional) </td>
	<td>BM_NETWORK_SEED_RANGE_START</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_seed_range_end
	<p>(optional) </td>
	<td>BM_NETWORK_SEED_RANGE_END</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_undercloud_range_start
	<p>(optional) </td>
	<td>BM_NETWORK_UNDERCLOUD_RANGE_START</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_undercloud_range_end
	<p>(optional) </td>
	<td>BM_NETWORK_UNDERCLOUD_RANGE_END</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td><dvr stuff>
	<p>(optional) </td>
	<td> </td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>vsa/<cluster>/*
	<p>Zero or more VSA clusters.  If the VSA section is present, there must be at least one cluster defined. Values for each cluster are just copied into the passthrough:
	<br>cinder/config/<cluster>/*</td> 
	<td>n/a</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>3par/cluster/*
	<p>Zero or more 3PAR clusters.  If the 3PAR section is present, there must be at least one cluster defined.  Values for each cluster are just copied into the passthrough:
	<br>cinder/config/<cluster>/*</td>
	<td>n/a</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>vsa/DEFAULT/enabled_backends
	<p>3par/DEFAULT/enabled_backends
	<p>Values for each cluster are just copied into the passthrough:
	<br>cinder/config/DEFAULT/enabled_backends </td> 
	<td>n/a</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>dns
	<p>DNS parameters</td>
	<td></td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>ntp/overcloud_server
	<p>The IP address of the NTP server accessible on the public interface for overcloud hosts.
	<td>OVERCLOUD_NTP_SERVER</td>
</tr>
<tr style="background-color: white; color: black;">  
	<td>ntp/undercloud_server
	<p>The IP address of the NTP server accessible on the public interface for undercloud hosts.
	<td>UNDERCLOUD_NTP_SERVER</td>
</tr>
<tr style="background-color: white; color: black;">  
	<td>neutron/overcloud_public_interface
	<p>The name of the interface that carries Networking Operations service external traffic on your overcloud. By default, it is eth2.</td>
	<td>OVERCLOUD_NeutronPublicInterface</td>
</tr>
<tr style="background-color: white; color: black;">  
	<td>neutron/undercloud_public_interface
	<p>The name of the interface that carries Networking Operations service external traffic on your undercloud. By default, it is eth2.</td>
	<td>UNDERCLOUD_NeutronPublicInterface</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>neutron/public_interface_default_route</td>
	<td>NeutronPublicInterfaceDefaultRoute</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>neutron/network_type</td>
	<td>NeutronNetworkType</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>ldap/*
	<p>Values for each cluster are just copied into the passthrough:
	<br>keystone/config/ldap/*</td>
	<td>n/a</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>svc/interface
	<p>NeutronSVCInterface</td>
	<td>(the svc parameters are optional, but if specified, they must all be specified)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>svc/interface_default_route</td>
	<td>NeutronSVCInterfaceDefaultRoute</td>
</tr>
<tr style="background-color: white; color: black;">  
	<td>svc/allocate_start</td>
	<td>SVC_ALLOCATE_START</td>
</tr>
<tr style="background-color: white; color: black;">  
	<td>svc/allocate_end</td>
	<td>SVC_ALLOCATE_END</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>svc/allocate_cidr</td>
	<td>SVC_ALLOCATE_CIDR</td>
</tr>
<tr style="background-color: white; color: black;"> 	 
	<td>svc/overcloud_bridge_mappings</td>
	<td>OVERCLOUD_BRIDGE_MAPPINGS</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>svc/overcloud_flat_networks</td>
	<td>OVERCLOUD_FLAT_NETWORKS</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>svc/customer_router_ip</td>
	<td>CUSTOMER_ROUTER_IP</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>hypervisor/public_interface</td>
	<td>OVERCLOUD_HYPERVISOR_PUBLIC_INTERFACE</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>hypervisor/physical_bridge</td>
	<td>OVERCLOUD_HYPERVISOR_PHYSICAL_BRIDGE</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>node_min_disk</td>
	<td>NODE_MIN_DISK</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>vcenter/vlan_range</td>
	<td>VLAN_RANGE</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>vcenter/provider_network
	<p>Required if cloud_type is ESX, optional for KVM.
	<td>PROVIDER_NETWORK</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>vcenter/customer_router_ip</td>
	<td>CUSTOMER_ROUTER_IP</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>ssl/ca_certs
	<p>Contains string-encoded certificate data
	<p>The ssl parameters are optional, but must all be specified if any are specified.</td>
	<td>OVERCLOUD_SSL_CA_CERT</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>ssl/cluster_backend/certificate
	<p>Contains string-encoded certificate data.
	<p>The ssl parameters are optional, but must all be specified if any are specified.</td>
	<td>OVERCLOUD_CLUSTER_CERT</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>ssl/cluster_backend/key
	<p>Contains string-encoded certificate data 
	<p>The SSL parameters are optional, but must all be specified if any are specified.</td>
	<td>OVERCLOUD_CLUSTER_KEY</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>ssl/public_vip/key
	<p>Contains string-encoded certificate data
	<p>The SSL parameters are optional, but must all be specified if any are specified.</td>
	<td>OVERCLOUD_SSL_KEY</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>ssl/public_vip/certificate
	<p>The SSL parameters are optional, but must all be specified if any are specified.
	<p>Contains string-encoded certificate data </td>
	<td>OVERCLOUD_SSL_CERT</td>
</table>
 