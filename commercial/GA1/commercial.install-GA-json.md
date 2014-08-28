---
layout: default
title: "HP Helion OpenStack&#174; Installation and Configuration"
permalink: /helion/openstack/ga/install/json/
product: commercial

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


We will be capturing all (most) of the customer-facing configuration in a single JSON configuration file.  A front end to hp_ced_installer.sh will accept the JSON as an input and either 1) set environment variables or 2) write passthrough JSON blobs based on the content of the JSON file.

All JSON blobs are written to the ~/tripleo/hp_passthrough directory

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
	<td>Either `KVM` or `ESX`. 
	<p>If set to ESX then compute_scale is ignored, DVR is not deployed. </td>
</tr>
<tr style="background-color: white; color: black;">
	<td>compute_scale</td>
	<td>OVERCLOUD_COMPUTESCALE</td>
	<td>n/a</td>
	<td>The number of compute nodes to deploy</td>
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
	<td>The number of VSA nodes to deploy</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>vsa_ao_scale<td>
	<td>OVERCLOUD_VSA_AO_STORAGESCALE</td>
	<td>n/a</td>
	<td>The number of VSA AO nodes to deploy</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>so_swift_storage_scale</td>
	<td>OVERCLOUD_SOSWIFT_STORAGESCALE</td>
	<td>n/a</td>
	<td>The number of scale out swift storage nodes to deploy. Note this is a different scale factor from the "swift storage scale" factor.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>so_swift_proxy_scale</td>
	<td>OVERCLOUD_SOSWIFT_PROXYSCALE</td>
	<td>n/a</td>
	<td>The number of scale out swift proxy nodes to deploy. Note this is a different scale factor from the "swift storage scale" factor.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>controller_scale</td>
	<td>OVERCLOUD_CONTROLSCALE</td>
	<td>n/a	(optional) Override the number of overcloud controllers</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>bridge_interface</td>
	<td>BRIDGE_INTERFACE </td>
	<td>n/a</td>
	<td> </td>
</tr>
<tr style="background-color: white; color: black;">
	<td>floating_ip/start</td>
	<td>FLOATING_START</td>
	<td>n/a </td>
	<td>(optional) </td>
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

svc/customer_router_ip	CUSTOMER_ROUTER_IP	n/a	 
hypervisor/public_interface	OVERCLOUD_HYPERVISOR_PUBLIC_INTERFACE	n/a	

(optional)
hypervisor/physical_bridge	OVERCLOUD_HYPERVISOR_PHYSICAL_BRIDGE	n/a	(optional)
bridge_mappings	OVERCLOUD_BRIDGE_MAPPINGS	n/a	(optional)
node_min_disk	NODE_MIN_DISK	n/a	(optional)
vcenter/vlan_range	VLAN_RANGE 	n/a 	(optional) 
vcenter/provider_network 	PROVIDER_NETWORK (?) 	n/a 	

(What is the correct destination for this?) 

(required if cloud_type is ESX, optional otherwise)

e.g. 192.168.101.0/24
vcenter/customer_router_ip	CUSTOMER_ROUTER_IP	n/a	e.g. 192.168.101.44
ssl/ca_certs 	OVERCLOUD_SSL_CA_CERT 	n/a 	

Contains string-encoded certificate data

(The ssl parameters are optional, but must all be specified if any are specified)
ssl/cluster_backend/certificate	OVERCLOUD_CLUSTER_CERT	n/a 	

Contains string-encoded certificate data

(The ssl parameters are optional, but must all be specified if any are specified)
ssl/cluster_backend/key 	OVERCLOUD_CLUSTER_KEY 	n/a 	

Contains string-encoded certificate data 

(The ssl parameters are optional, but must all be specified if any are specified)
ssl/public_vip/key 	OVERCLOUD_SSL_KEY 	n/a 	

Contains string-encoded certificate data

(The ssl parameters are optional, but must all be specified if any are specified)
ssl/public_vip/certificate	OVERCLOUD_SSL_CERT 	n/a 	

Contains string-encoded certificate data 

(The ssl parameters are optional, but must all be specified if any are specified)

</table>
 