---
layout: default
title: "HP Helion OpenStack&#174; Configuring your Helion network securely"
permalink: /helion/openstack/ga/install/security/
product: commercial.ga

---
<!--UNDER REVISION--> 


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/esx/">NEXT &#9654;</a> </p>

# HP Helion OpenStack&#174; Configuring your Helion network securely
Guidance on configuring your Helion network securely

The Helion OpenStack Commercial release has many built-in security controls, but the customer must take responsibility for configuring the network devices that integrate Helion services into an existing data center environment.  This includes defining firewall rules at the edge of the Helion deployment (to protect against external abuse) as well as defining router rules within the Helion deployment (to protect against insider abuse or administrator mistakes).

Helion is deployed on three physical networks: IPMI, Fiber Channel, and the Cloud LAN which is subdivided into VLANs to produce the External, Management, and Service LANs as depicted in the following diagram.  


**Network Toplogy**
<img src = "/content/documentation/mediaHelion_Security1.png">

In the diagram above, the customer’s devices that perform routing are depicted as a small cloud icon.  The following sections provide guidance on how to configure these network devices for improved security.  Note that the Helion OpenStack Commercial release includes IPtables rules on each node to close network ports that are not needed, but applying additional rules to your network devices (as indicated in the sections that follow) will provide increased security.
Securing the Perimeter

To protect against external attack on Helion services, your firewall should be configured with a rule to block any request originating from outside the network attempting to reach the Seed, the Undercloud Controller, the Swift Object nodes, and any 3PAR StoreServ or StoreVirtual VSA appliances dedicated to the Helion installation, as indicated in this table:

<table style="text-align: left; vertical-align: top; width:650px;">
	<tr style="background-color: lightgrey; color: black;">
	<th>Description</th><th>Initiating node (from)</th><th>Receiving node (to)</th><th>Port</th>
	</tr>
	<tr>
	<td>User requests to API endpoints and Horizon console</td><td>External network(from)</td><td>Cloud Controller Nodes</td><td>80, 443</td>
	</tr>

</table>
			Port
User requests to API endpoints and Horizon console	External network	Cloud Controller Nodes	80, 443
Access to user applications running as Nova VMs	External network	Compute Nodes	Only ports required by your enterprise applications
Administrator access via SSH	Your enterprise intranet / VPN	All Helion nodes	22

Securing the Swift back-end network connections

Swift requests travel from the external network, to a HAproxy on an Overcloud controller, which then forwards the request to a Swift node over the Management network.  By default, this traffic travels over a flat network, as follows:
 
You may choose to configure rules in your network devices to apply additional security controls to protect against attacks, insider abuse or mistakes.  For example, your router could block any requests directly to the Swift Object nodes from compute nodes.  (Valid user requests from the compute nodes will be passed via the HAproxy on the Controller nodes).  You could block requests from the external network to Swift Object nodes (as already mentioned for the firewall configuration). When adding rules to your router, take care not to introduce rules that will prevent authorized network traffic between nodes.
The following table describes the data flow between Helion nodes for Swift back-end traffic:
Interface 	Description	Initiating node (from)	Receiving node (to)	Port
1	Admin access via SSH	Undercloud controller	Proxy-Account-Container (PAC)	22
2	Admin access via SSH	Undercloud controller	Swift all in one (PACO)	22
3	Pyringos copy of ring files via SCP	Undercloud controller	Object Storage	22
4	Swift proxy to object server over HTTP	Proxy-Account-Container (PAC)	Object Storage	80
5	Swift proxy to object server over HTTP	Swift all in one (PACO)	Object Storage	80
6	Swift proxy to proxy sync over HTTP	Proxy-Account-Container (PAC)	Swift all in one (PACO)	80
7	HA Proxy forwards API requests via HTTP 	Cloud Controller	Proxy-Account-Container (PAC)	80
8	HA Proxy forwards API requests via HTTP	Cloud Controller	Swift all in one (PACO)	80

Applying access control lists (ACLs) for flows in the table above produces this logical deployment:
 
Securing block storage network connections in Helion

A customer deploying Helion is responsible for securing the block storage networks. Network data flows for block storage should be restricted using access control lists or other mechanisms in the customer’s network devices which may include routers, switches, or firewalls. Block storage data flows interacting with Helion are described here to assist with defining those controls. References are given to documentation on data flows within the storage cluster itself, but not necessarily interacting with Helion nodes.
Helion supports StoreVirtual or 3Par StoreServ storage arrays which will be describe separately.

StoreVirtual

Helion supports both StoreVirtual VSA (Virtual Storage Appliance) and P4000 hardware arrays. Three types of traffic flows into a StoreVirtual node:
1.	iSCSI traffic
2.	Management traffic for REST API and management command line interface (CLIQ or SSH)
3.	StoreVirtual inter-cluster traffic between all nodes in the cluster
VSA only supports one virtual network interface. As a result, the above three types of traffic must flow on the same network. For Helion, this is the management VLAN. P4000 hardware arrays support multiple network interfaces. For P4000, iSCSI and management traffic must flow through the management VLAN. However, inter-cluster traffic can be configure for a separate VLAN. This provides an additional level of network data isolation. For StoreVirtual network design best practices, see “HP StoreVirtual 4000 Storage – Network design considerations and best practices”, located here: http://h20195.www2.hp.com/v2/GetDocument.aspx?docname=4AA2-5615ENW&doctype=white%20paper&doclang=EN_US&searchquery=keywords=(AND)%20storevirtual%20&cc=us&lc=en,en-us
Deployed as a flat network:
 

The following table describes the data flow between Helion nodes and StoreVirtual systems:
Interface 	Description	Initiating node (from)	Receiving node (to)	Port
1	Compute node iSCSI 	Compute node	VIP for StoreVirtual cluster	3260
2	Cinder Volume Backup iSCSI	Cinder host	VIP for StoreVirtual cluster	3260
3	StoreVirtual REST API (mgmt. interface)	Cinder host	VIP for StoreVirtual cluster	22
4	StoreVirtual CLiQ interface via SSH (mgmt. interface)	UnderCloud Controller	VIP for StoreVirtual cluster	16022
5	StoreVirtual inter-cluster traffic	StoreVirtual	StoreVirtual	See Ref 2
6	CMC to StoreVirtual	CMC	StoreVirtual	See Ref 2

Logical Deployment after applying ACLs for flows in table:
 

Note there are additional traffic flows necessary for StoreVirtual operation in addition to the interaction with Helion nodes described above. This includes CMC management console access, StoreVirtual inter-cluster communication and access to network services such as NTP. StoreVirtual port usage is described in “HP4000 SAN – SANiQ TCP and UDP Port Usage”, located here:  http://h10032.www1.hp.com/ctg/Manual/c01750064.pdf

3Par StoreServ

Helion supports iSCSI or Fiberchannel connectivity with 3PAR StoreServ. If using Fiberchannel, then Compute nodes and OverCloud controller hosting Cinder will require Fiberchannel connectivity with the 3PAR array. For iSCSI, connectivity will be via the management VLAN. The StoreServ REST API and SSH command line interfaces must be accessible from the management VLAN as well.
Deployed as a flat network:
 

The following table describes the data flow between Helion nodes and StoreServ systems:
Interface	Description	Initiating node (from)	Receiving node (to)	Port
1	Compute node iSCSI 	Compute node	StoreServ	3260
2	Cinder Volume Backup iSCSI	Cinder host	StoreServ	3260
3	StoreServ REST API (mgmt. interface) via HTTPS	Cinder host	StoreServ	8080
4	StoreServ command line interface (SSH)	Cinder host	StoreServ	22
5	StoreServ REST API (mgmt. interface) via HTTPS	UnderCloud Controller	StoreServ 	8080
6	SSMC to StoreServ	SSMC	StoreServ 	See Ref 6
7	Service Processor	Service Processor	StoreServ	See Ref 6

When deploying StoreServ with Fiberchannel, interfaces 1 and 2 run over Fiberchannel network instead of iSCSI.
Logical Deployment after applying ACLs for flows in table:


Note there are additional traffic flows necessary for StoreServ operation in addition to the interaction with Helion nodes described above. This includes SSMC console access and Service Processor communication. StoreServ port usage is describe on page 65 of “HP 3PAR StoreServ 10000 Storage Physical Planning Manual” located here: http://h20628.www2.hp.com/km-ext/kmcsdirect/emr_na-c03101890-9.pdf

Additional Block Storage Resources

1.	HP StoreVirtual 4000 Storage – Network design considerations and best practices 
http://h20195.www2.hp.com/v2/GetDocument.aspx?docname=4AA2-5615ENW&doctype=white%20paper&doclang=EN_US&searchquery=keywords=(AND)%20storevirtual%20&cc=us&lc=en,en-us
2.	HP4000 SAN – SANiQ TCP and UDP Port Usage 
http://h10032.www1.hp.com/ctg/Manual/c01750064.pdf

3.	StoreVirtual information
http://hp.com/go/storevirtual

4.	StoreServ information
http://hp.com/go/storeserv

5.	HP 3PAR StoreServ Storage Concepts Guide located on this page:
http://h20566.www2.hp.com/portal/site/hpsc/template.PAGE/public/psi/manualsResults/?sp4ts.oid=5157544&spf_p.tpst=psiContentResults&spf_p.prp_psiContentResults=wsrp-navigationalState%3Daction%253Dmanualslist%257Ccontentid%253DGeneral-Reference%257Clang%253Den&javax.portlet.begCacheTok=com.vignette.cachetoken&javax.portlet.endCacheTok=com.vignette.cachetoken

6.	HP 3PAR StoreServ 10000 Storage Physical Planning Manual
Port assignments on page 65
http://h20628.www2.hp.com/km-ext/kmcsdirect/emr_na-c03101890-9.pdf

7.	RFC3723 – Securing Block Storage
http://tools.ietf.org/html/rfc3723#page-28

8.	RFC7143 – Internet Small Computer System Interface (iSCSI) Protocol
http://tools.ietf.org/html/rfc7143

Securing ESX network connections in Helion

If your deployment of Helion includes the ESX Integration, you can improve network security by configuring access control lists for the ESX network.  The ESX Tenant network (also shown below) is managed by Neutron.  The ESX network is not installed or managed by Helion. The customer installs and manages this network and makes sure there is a route to the Management network.  
The ESX network is used for:
•	Traffic between OVSvApp VMs running on every ESX Host to communicate with the Neutron message queue on the Cloud Controller
•	The vCenter Proxy to communicate with the message queue for Cinder and Nova
•	EON to communicate with the vCenter server
 Logical deployment of the ESX Integration in Helion:
 

The following table describes the data flow between Helion nodes and ESX nodes:
Description	Initiating node (from)	Receiving node (to)	Port
OVSvApp VM communication with Neutron message queue	OVSvApp VMs	Cloud Controller	5672
vCenter Proxy communication with Nova and Cinder message queues	vCenter Proxy	Cloud Controller	5672
vCenter Proxy communication with MySQL	vCenter Proxy	Cloud Controller	3306
EON conductor reads vCenter resource information	Undercloud Controller	vCenter Proxy	443

The Service network

The Service Network (SVC) is created by Neutron.  It provides a path from Development Platform services (such as Database as a Service) running in Nova VMs to the Centralized Logging Service running in the Undercloud.   A route needs to exist from service subnet in Over Cloud to the RabbitMQ on the Under Cloud controller.
Description	Initiating node (from)	Receiving node (to)	Port
Dev Platform services connect to Logging Service over Rabbit MQ	Cloud Controller	Undercloud Controller	5672

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
