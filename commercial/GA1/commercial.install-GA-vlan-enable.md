--
layout: default
title: "HP Helion OpenStack&#174;: Enabling the VLAN Provider Network"
permalink: /helion/openstack/install/enable/vlan/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install/ovsvapp/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/related-links/">NEXT &#9654;</a> </p>
-->
# HP Helion OpenStack&#174;: Enabling the VLAN Provider Network

OpenStack is like a complex LEGO™ kit. Using an installer to speed up construction, it can be deployed in multiple ways to fulfill certain requirements. 

One very important requirement is tenant network isolation.  Installers depend on Virtual Extensible Local Area Network (VxLAN) or Generic Routing Encapsulation (GRE) to isolate tenants.  

These two newer networking technologies have become de-facto standards for installers because they ease infrastructure readiness requirements while providing tenant isolation independent of any hardware (Switch/Router) configuration. 

Accordingly, HP’s Helion OpenStack (Helion Cloud) defaults to VxLan to support tenant network isolation. However, we need to deploy Helion Cloud to customers desiring to migrate gradually from legacy VLAN to VxLan, a non-default install feature. 

This whitepaper walks through a way to configure Helion OpenStack tenant networks to use VLAN Provider Network. Such deployments enable a tenant’s virtual machines hosted in a legacy infrastructure and/or based on VMWare ESX to communicate to a virtual machine running in HP Helion OpenStack. 

Typically, a Hybrid Application Deployment across two or more Infrastructure Providers (one being Helion OpenStack).
	
This deployment assumes the network infrastructure is carved out in such a way that it allows a range of tagged VLANs through the switches and their subnets are routed to the right destination. 

 
Figure 1: Deployment diagram depicting VLAN Provider Network w/ VSA nodes as Block storage backend. 
<img src="/media/vlan.provider.network.logical.png">


Figure 2. Network Layout. 
<img src="/media/vlan.network.layout.png">



The solution is to set up Overcloud Neutron Network to provide tenant network isolation by means of VLAN, instead of the default VxLAN. Setting up the Overcloud Neutron in VLAN requires two things:
1.	Passing the right configuration parameters to the installer and templates for setting up neutron configuration files: 
/etc/neutron/plugins/ml2/ml2_conf.ini  sets up tenant network type, provides VLAN ranges and maps to the physical bridge
/etc/neutron/dhcp-agent.ini   enables Metadata Server access through DHCP Namespace
2.	Passing the right export variables pertinent to VLAN Provider Network 

Detailed installation steps:

Assumption:

•	Port 2 of all the baremetal nodes are wired and used as bm_network – referred here as em2 or eth1
•	1 Untagged network for Mangemenet – subnet range 192.168.200.0/24 w/ gateway 192.168.200.1
•	90 tagged networks used for tenant VLANs as provider network
•	For test purpose VLAN 300 (192.168.1

Instructions:

1. Login to SeedHost
2. Create file with following export variables (say envfile, change the IPs accordingly). 
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
export OVERCLOUD_COMPUTESCALE=1
export NODE_MIN_DISK=90
#######################################
export UNDERCLOUD_CODN_HTTP_PROXY=http://16.85.88.10:8080
export UNDERCLOUD_CODN_HTTPS_PROXY=http://16.85.88.10:8080
export OVERCLOUD_CODN_HTTP_PROXY=http://16.85.88.10:8080
export OVERCLOUD_CODN_HTTPS_PROXY=http://16.85.88.10:8080
export OVERCLOUD_FIXED_RANGE_CIDR=172.0.100.0/24
3. Create the baremetal.csv with the required number of nodes
<mac_address>,<ipmi_user>,<ipmi_password>,<ipmi_address>,<no_of_cpus>,<memory_MB>,<diskspace_GB> 
    78:e7:d1:22:5d:58,administrator,password,192.168.11.1,12,32768,2048
    78:e7:d1:22:52:9b,administrator,password,192.168.11.6,12,16384,900

4. Modify the dhcp_agent.ini configuration 
4.a Overcloud - Edit the tripleo/hp_passthrough/overcloud_neutron_dhcp_agent.json file to add the parameter setting as below and change the dns servers specific to the environment.  
 {"dhcp_agent":
  {"config":
    [
      {"section":"DEFAULT",
        "values":
          [
            {"option":"dhcp_delete_namespaces","value":"True"},
            {"option":"enable_isolated_metadata","value":"True"},
            {"option":"dnsmasq_dns_servers", "value":"10.1.0.10,10.1.0.20"}
          ]
      }
    ]
  }
}

4.b Undercloud - Edit the tripleo/hp_passthrough/undercloud_neutron_dhcp_agent.json file to add the parameter setting as below and change the dns servers specific to the environment.  
{"dhcp_agent":
  {"config":
    [
      {"section":"DEFAULT",
        "values":
          [
            {"option":"dhcp_delete_namespaces","value":"True"},
            {"option":"dnsmasq_dns_servers", "value":"10.1.0.10,10.1.0.20"}
          ]
      }
    ]
  }
}

5. To update ml2.conf edit - tripleo/hp_passthrough/overcloud_neutron_ml2_conf.json and add tenant_network_type and network_vlan_ranges
    {
       "ml2": {
            "config": [
                {
                    "section": "ovs",
                    "values": [
                        {
                            "option": "enable_tunneling",
                            "value": "True"
                        }
                    ]
    			    "section": "ml2",
                    "values": [
                        {
                            "option": "tenant_network_types",
                            "value": "vlan"
                        }
    				]
    				"section": "ml2_type_vlan",
                    "values": [	
                        {
                            "option": "network_vlan_ranges",
                            "value": "physnet1:300:398"
                        }
                    ]
                },
				
6. To create seed do the following 
source envfile
bash -x tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed | tee  create-seed.log

7. Copy envfile (created in step 2)  file inside seed and do the following from within seed

ssh into the seed vm ( 192.168.200.2)
source envfile
bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-demo | tee installer.log
           

Testing:

1. Using Horizon, create two projects (Tenant A and Tenant B) and users. 

2. SSH into the controller node. (get the ip from above url hints and ssh heat-admin@controller.ip)
2.a.1 Create a VLAN provider network(s) and subnets for tenant A. 
neutron net-create --provider:physical_network=physnet1 --provider:network_type=vlan --provider:segmentation_id=300 vlan300

2.a.2. Using Horizon UI, create a Subnet for 2.a.1 network: 192.168.100.0/24 gw 192.168.100.1
     
2.b.1 Create a VLAN provider network(s) and subnets for tenant B.
neutron net-create --provider:physical_network=physnet1 --provider:network_type=vlan --provider:segmentation_id=301 vlan301

2.b.2. Using Horizon UI, create a Subnet for 2.a.1 network: Subnet: 192.168.101.0/24 gw 192.168.101.1
 
3. Launch 2 instances in vlan300 network and 2 in vlan301 network. 
 
4. Validate if you can ping the VMs from KVM Host
 
5. Validate if the VMs can ping each other in the same network and can't ping other instances in the other network

