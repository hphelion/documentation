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

# HP Helion OpenStack&#174; Installation: Before you begin

The HP Helion OpenStack installer uses a JSON configuration file to enter configuration values. JSON (JavaScript Object Notation) is an open-standard format that uses human-readable text to transmit data objects consisting of attribute–value pairs.


The `hp_ced_installer.sh` accepts the JSON as an input and either sets environment variables or writes passthrough JSON blobs based on the content of the JSON file.

All JSON blobs are written to the ~/tripleo/hp_passthrough directory


## Editing the JSON file ##

A JSON file is included in the installer package that can serve as a template. The file contains entries for all of the configuration values used by the installer.

To edit the JSON file:

1. Open the file in an editor

2. Enter the appropriate values as described in the following table.

<table style="text-align: left; vertical-align: top; width:700px;">
<tr style="background-color: #C8C8C8;">
	<th>Value</th>
	<th><center>Enviroment Variable</center></th>
    <th><center>Passthrough</center></th>
	<th><center>Notes</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td>cloud_type</td>	
	<td>OVERCLOUD_CLOUD_TYPE</td>	
	<td>n/a</td>
	<td>Specify the type of hypervisor: either KVM or ESX. 
	<p>If set to ESX then compute_scale is ignored, DVR is not deployed. </td>
</tr>
<tr style="background-color: white; color: black;">
	<td>compute_scale</td>
	<td>OVERCLOUD_COMPUTESCALE</td>
	<td>n/a</td>
	<td>Specify the number of compute nodes to deploy.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>swift_scale</td>
	<td>OVERCLOUD_SWIFTSTORAGESCALE</td>
	<td>n/a</td>
	<td>(optional) Override the number of swift storage nodes. Note this is a different scale factor from the "scale out swift" factors.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>vsa_scale</td>
	<td>OVERCLOUD_VSA_STORAGESCALE</td>
	<td>n/a</td>
	<td>Specify the number of VSA nodes to deploy</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>vsa_ao_scale</td>
	<td>OVERCLOUD_VSA_AO_STORAGESCALE</td>
	<td>n/a</td>
	<td>Specify the number of VSA AO nodes to deploy</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>so_swift_storage_scale</td>
	<td>OVERCLOUD_SOSWIFT_STORAGESCALE</td>
	<td>n/a</td>
	<td>Specify the number of scale out swift storage nodes to deploy. Note this is a different scale factor from the "swift storage scale" factor.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>so_swift_proxy_scale</td>
	<td>OVERCLOUD_SOSWIFT_PROXYSCALE</td>
	<td>n/a</td>
	<td>Specify the number of scale out swift proxy nodes to deploy. Note this is a different scale factor from the "swift storage scale" factor.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>controller_scale</td>
	<td>OVERCLOUD_CONTROLSCALE</td>
	<td>n/a	</td>
	<td>(optional) Override the number of overcloud controllers</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>bridge_interface</td>
	<td>BRIDGE_INTERFACE </td>
	<td>n/a</td>
	<td>Specify the name of the device connected to the private network that connects all baremetal nodes. This private network is also where these nodes PXE boot. The installation script assumes this device name is eth0. If your device is NOT named eth0, then determine its name and set the environment variable as shown below</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>floating_ip/start</td>
	<td>FLOATING_START</td>
	<td>n/a </td>
	<td>Use FLOATING_START and FLOATING_END to specify the range of IP addresses available for user VMs.
	<p>* For KVM installations, make sure the VSA IP address is not in the floating IP range. VSA uses 192.0.2.253. Change the FLOATING_END to 192.0.2.200. If necessary, also change the FLOATING_START and FLOATING_CIDR.
	<p>* For ESX installations, the OVSvApp requires a block of IP addresses. Create more IP addresses for OVSvApp by restricting the number of floating IP addresses created.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>floating_ip/end</td>
	<td>FLOATING_END</td>
	<td>n/a</td>
	<td>(optional) </td>
</tr>
<tr style="background-color: white; color: black;">
	<td>floating_ip/cidr</td>
	<td>FLOATING_CIDR</td>
	<td>n/a</td>
	<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>baremetal/network_seed_ip</td>
	<td>BM_NETWORK_SEED_IP</td>
	<td>n/a</td>
	<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_cidr</td>
	<td>BM_NETWORK_CIDR</td>
	<td>n/a</td>
	<td>(optional)</td> 
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_gateway</td>
	<td>BM_NETWORK_GATEWAY</td>
	<td>n/a</td>
	<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_seed_range_start</td>
	<td>BM_NETWORK_SEED_RANGE_START</td>
	<td>n/a</td>
	<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_seed_range_end</td>
	<td>BM_NETWORK_SEED_RANGE_END</td>
	<td>n/a</td>
	<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_undercloud_range_start</td>
	<td>BM_NETWORK_UNDERCLOUD_RANGE_START</td>
	<td>n/a</td>
	<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>baremetal/network_undercloud_range_end</td>
	<td>BM_NETWORK_UNDERCLOUD_RANGE_END</td>
	<td>n/a</td>
	<td>(optional) 
</tr>
<tr style="background-color: white; color: black;"> 
	<td><dvr stuff></td>
	<td>TBD</td>
	<td>TBD</td>
	<td>TBD</td>
</tr>
<tr style="background-color: white; color: black;"> 
</tr>
<tr style="background-color: white; color: black;"> 
	<td>vsa/<cluster>/*</td>
	<td>n/a</td>
	<td>cinder/config/<cluster>/*</td>
	<td>Zero or more VSA clusters.  If the VSA section is present, there must be at least one cluster defined. Values for each cluster are just copied into the passthrough</td> 
</tr>
<tr style="background-color: white; color: black;"> 
	<td>3par/<cluster>/*</td>
	<td>n/a</td>
	<td>cinder/config/<cluster>/*</td>
	<td>Zero or more 3PAR clusters.  If the 3PAR section is present, there must be at least one cluster defined.  Values for each cluster are just copied into the passthrough </td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>vsa/DEFAULT/enabled_backends
	<p>3par/DEFAULT/enabled_backends</td> 
	<td>n/a</td>
	<td>cinder/config/DEFAULT/enabled_backends</td>
	<td>The enabled_backends values for all of the storage methods are combined into a single value.</td> 
</tr>
<tr style="background-color: white; color: black;"> 
	<td>dns</td>
	<td>?</td>
	<td>?</td>
	<td>DNS parameters</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>ntp/overcloud_server</td>
	<td>OVERCLOUD_NTP_SERVER</td>
	<td>n/a</td>
	<td> </td>
</tr>
<tr style="background-color: white; color: black;">  
	<td>ntp/undercloud_server</td>
	<td>UNDERCLOUD_NTP_SERVER</td>
	<td>n/a</td>
	<td> </td>
</tr>
<tr style="background-color: white; color: black;">  
	<td>neutron/overcloud_public_interface</td>
	<td>OVERCLOUD_NeutronPublicInterface</td>
	<td>n/a</td>
	<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;">  
	<td>neutron/undercloud_public_interface</td>
	<td>UNDERCLOUD_NeutronPublicInterface</td>
	<td>n/a</td>
	<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>neutron/public_interface_default_route</td>
	<td>NeutronPublicInterfaceDefaultRoute</td>
	<td>n/a</td>
	<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>neutron/network_type</td>
	<td>NeutronNetworkType</td>
	<td>n/a</td>
	<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>ldap/*</td>
	<td>n/a</td>
	<td>keystone/config/ldap/*</td>
	<td>(optional – if there's anything in the LDAP section of the JSON, pass it through)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>svc/interface</td>
	<td>NeutronSVCInterface</td>
	<td>n/a</td>
	<td>(the svc parameters are optional, but if specified, they must all be specified)</td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>svc/interface_default_route</td>
	<td>NeutronSVCInterfaceDefaultRoute</td>
	<td>n/a</td>
	<td> </td>
</tr>
<tr style="background-color: white; color: black;">  
	<td>svc/allocate_start</td>
	<td>SVC_ALLOCATE_START</td>
	<td>n/a</td>	
	<td> </td>
</tr>
<tr style="background-color: white; color: black;">  
	<td>svc/allocate_end</td>
	<td>SVC_ALLOCATE_END</td>
	<td>n/a</td>
	<td> </td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>svc/allocate_cidr</td>
	<td>SVC_ALLOCATE_CIDR</td>
	<td>n/a</td>
	<td>  </td>
</tr>
<tr style="background-color: white; color: black;"> 	 
	<td>svc/overcloud_bridge_mappings</td>
	<td>OVERCLOUD_BRIDGE_MAPPINGS</td>
	<td>n/a</td>
	<td> </td>
</tr>
<tr style="background-color: white; color: black;"> 
	<td>svc/overcloud_flat_networks</td>
	<td>OVERCLOUD_FLAT_NETWORKS</td>
	<td>n/a</td>
<td> </td>
</tr>
<tr style="background-color: white; color: black;"> 
<td>svc/customer_router_ip</td>
<td>CUSTOMER_ROUTER_IP</td>
<td>n/a</td>
<td>  </td>
</tr>
<tr style="background-color: white; color: black;"> 
<td>hypervisor/public_interface</td>
<td>OVERCLOUD_HYPERVISOR_PUBLIC_INTERFACE<td>
<td>n/a</td>
<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
<td>hypervisor/physical_bridge</td>
<td>OVERCLOUD_HYPERVISOR_PHYSICAL_BRIDGE</td>
<td>n/a</td>
<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
<td>bridge_mappings</td>
<td>OVERCLOUD_BRIDGE_MAPPINGS</td>
<td>n/a</td>
<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
<td>node_min_disk</td>
<td>NODE_MIN_DISK<td>
<td>n/a</td>
<td>(optional)</td>
</tr>
<tr style="background-color: white; color: black;"> 
<td>vcenter/vlan_range</td>
<td>VLAN_RANGE</td>
<td>n/a</td>
<td>(optional)</td> 
<td>vcenter/provider_network</td>
<td>PROVIDER_NETWORK</td>
<td>(?)</td?>
<td>n/a</td>
<td>(What is the correct destination for this?) 

<p>(required if cloud_type is ESX, optional otherwise)

<p>e.g. 192.168.101.0/24</td>
</tr>
<tr style="background-color: white; color: black;"> 
<td>vcenter/customer_router_ip</td>
<td>CUSTOMER_ROUTER_IP</td>
<td>n/a</td>
<td>e.g. 192.168.101.44</td>
</tr>
<tr style="background-color: white; color: black;"> 
<td>ssl/ca_certs</td>
<td>OVERCLOUD_SSL_CA_CERT</td>
<td>n/a</td>
<td>
Contains string-encoded certificate data

<p>(The ssl parameters are optional, but must all be specified if any are specified)</td?
</tr>
<tr style="background-color: white; color: black;"> 

<td>ssl/cluster_backend/certificate</td>
<td>OVERCLOUD_CLUSTER_CERT</td>
<td>n/a</td>
<td>Contains string-encoded certificate data

<p>(The ssl parameters are optional, but must all be specified if any are specified)

</tr>
<tr style="background-color: white; color: black;"> 
<td>ssl/cluster_backend/key</td>
<td>OVERCLOUD_CLUSTER_KEY</td>
<td>n/a</td>
<td>Contains string-encoded certificate data 

<p>(The ssl parameters are optional, but must all be specified if any are specified)</td>
</tr>
<tr style="background-color: white; color: black;"> 
<td>ssl/public_vip/key</td>
<td>OVERCLOUD_SSL_KEY</td>
<td>n/a</td>
<td>Contains string-encoded certificate data

<p>(The ssl parameters are optional, but must all be specified if any are specified)</td>
</tr>
<tr style="background-color: white; color: black;"> 
<td>ssl/public_vip/certificate</td>
<td>OVERCLOUD_SSL_CERT</td>
<td>n/a</td>
<td>Contains string-encoded certificate data 

<p>(The ssl parameters are optional, but must all be specified if any are specified)</td>

</table>
 