---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade: Helion Lifecycle Management (HLM) Network Topology"
permalink: /helion/openstack/carrier/hlm/network/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion OpenStack&#174; Carrier Grade: Helion Lifecycle Management (HLM) Network Topology

<!-- From https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/Kenobi+Networking -->

Kenobi allows for the flexible configuration of networks for the cloud to fit with the actual configuration of a data center. This helps to accomodate customer preferences and existing installations of equipment. HP will provide a recommendation for how a customer should wire their data center to support clouds.

The networks defined below are traffic groups. Network traffic groups are mapped to physical networking infrastructure as follows:

1 or more network traffic groups are carried over a logical network. 1 or more logical networks are carried over a network interface. A network interface may be bonded or single.
Definitions
Network Traffic Group

Kenobi defines a set of network traffic groups that are used by cloud services to connect to each other. A given service is expected to connect to one or more network traffic group in order to be accessed from outside the node on which it is running. A given deployment of a cloud may map multiple traffic groups to the same logical network (VLAN), or may assign each traffic group to its own network interface depending upon how the customer wants to deploy the cloud. Kenobi specifies which network traffic groups each service will connect to. The mapping of all services running on a node to logical networks and interfaces will result in the total set of interfaces a node needs to have.
Logical Network

VLANs are currently used to divide physical networks so that multiple traffic streams can share the same physical network. Kenobi supports having multiple logical networks running on one network interface. It is the customer's responsibility to configure switches properly to route logical networks to the nodes that need to receive them. The set of logical networks hosted by one physical network connect to nodes with a network interface.
Network Interface

The network interface is the connection to a physical network infrastructure, whether it be a bonded network with replicated switches or a single network. Kenobi can map a logical network interface to either a single device (e.g. eth0) or to a bonded device (e.g. bond0). Kenobi can configure the bonding if that is desired by the customer.
Example Network Configuration

<h3 id="KenobiNetworking-CustomerSupplied">Customer Supplied</h3><div class="table-wrap"><table class="confluenceTable"><tbody><tr><th class="confluenceTh">Network Traffic Groups</th><th class="confluenceTh">Mnemonic</th><th class="confluenceTh">Description</th></tr><tr><td class="confluenceTd">IPMI/ILO</td><td style="text-align: center;" class="confluenceTd">CTL</td><td class="confluenceTd">Required - Used by node provisioning software to start and stop nodes. This network is not used by the cloud after node provisioning.</td></tr><tr><td class="confluenceTd">PXE Boot</td><td style="text-align: center;" class="confluenceTd">PXE</td><td class="confluenceTd">Required - Used for PXE booting images consisting of operating system and local package repository. This network is not used by the cloud after node provisioning.</td></tr><tr><td class="confluenceTd">Data Center Management</td><td style="text-align: center;" class="confluenceTd">DCM</td><td class="confluenceTd"><p>Optional: Existing data center network for monitoring (SNMP), SDN control of switch configuration, etc. Helion will also use this network to connect to vCenter when the vCenter hypervisor is configured.</p><p><span style="color: rgb(255,102,0);">Bryan: CS has combined their DCM with CLM. Should Kenobi go back to naming this the ESX network?</span></p></td></tr><tr><td class="confluenceTd">Fibre Channel SAN</td><td style="text-align: center;" class="confluenceTd">SAN</td><td class="confluenceTd">Optional: Fibre Channel for storage devices (3PAR, etc)</td></tr><tr><td class="confluenceTd">Consumer Access</td><td style="text-align: center;" class="confluenceTd">CAN</td><td class="confluenceTd">Optional: External network to make service APIs available - assumes routing of external tagged network to untagged consumer network. Customer controls the addressing. Kenobi is told the network CIDR and starting address available for use. It is expected that addresses are needed only for the service VIPs on this network.</td></tr><tr><td colspan="1" class="confluenceTd">Admin Access</td><td colspan="1" style="text-align: center;" class="confluenceTd">AAN </td><td colspan="1" class="confluenceTd">Optional: Network within the data center to which admins will connect. The Keystone service catalog will use this network for the 'admin' entry for all services.</td></tr><tr><td class="confluenceTd">External</td><td style="text-align: center;" class="confluenceTd">EXT</td><td class="confluenceTd">Optional: assumes routing of external tagged network to untagged consumer network</td></tr></tbody></table></div><p> </p><h3 id="KenobiNetworking-CloudManaged">Cloud Managed</h3><div class="table-wrap"><table class="confluenceTable"><tbody><tr><th class="confluenceTh">Network Traffic Groups</th><th class="confluenceTh">Mnemonic</th><th class="confluenceTh">Description</th></tr><tr><td class="confluenceTd">Cloud Management</td><td style="text-align: center;" class="confluenceTd">CLM</td><td class="confluenceTd">Main internal cloud network with fixed IP addresses. This network is available to all nodes in the cloud. It is used to access Keystone and Glance. It is also used for request routing (e.g. haproxy to stunnel), HA heartbeats, and other control plane management traffic for the Cloud Control Plane. Other control planes will have their own &quot;control plane&quot; network.</td></tr><tr><td colspan="1" class="confluenceTd">Storage Management</td><td colspan="1" style="text-align: center;" class="confluenceTd">STM</td><td colspan="1" class="confluenceTd">Network used for traffic from the load balancer to the Swift proxy nodes in a Storage Control Plane.</td></tr><tr><td class="confluenceTd">Object Store</td><td style="text-align: center;" class="confluenceTd">OBS</td><td class="confluenceTd">Swift will be configured to use this fixed address network for proxy to object traffic and for replication, rebalancing, and other internal Swift traffic. Ceph will also use this network for internal traffic pending review of Ceph architecture.</td></tr><tr><td class="confluenceTd">Block Store</td><td style="text-align: center;" class="confluenceTd">BLS</td><td class="confluenceTd">Compute nodes use this fixed address network to connect to block storage volumes for VMs. Other block storage traffic (e.g. snapshots) should also use this network.</td></tr><tr><td class="confluenceTd">Tenant Underlay</td><td style="text-align: center;" class="confluenceTd">TUL</td><td class="confluenceTd">Network used for VM data traffic - both VM on one node to VM on another node, and VM to outside world. Neutron manages the IP addresses on this network. It is usually configured to support VxLAN.</td></tr><tr><td colspan="1" class="confluenceTd">Tenant VLAN</td><td colspan="1" style="text-align: center;" class="confluenceTd">TVL</td><td colspan="1" class="confluenceTd">An array of VLANs to support tenant VLAN segmentation. Neutron manages IP addresses on this network. VLANs need to span an L2 network.</td></tr><tr><td class="confluenceTd">Service</td><td style="text-align: center;" class="confluenceTd">SVC</td><td class="confluenceTd">Cloud workload integration to logging, monitoring, and infrastructure service (i.e. LDAP, NTP, etc).</td></tr><tr><td colspan="1" class="confluenceTd">Monitoring</td><td colspan="1" style="text-align: center;" class="confluenceTd">MON</td><td colspan="1" class="confluenceTd">Traffic for the monitoring solution will be carried on this network.</td></tr><tr><td colspan="1" class="confluenceTd">Replication</td><td colspan="1" style="text-align: center;" class="confluenceTd">REP</td><td colspan="1" class="confluenceTd">Replication network. One use will be to support Swift replication.</td></tr></tbody></table></div><p> </p>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----