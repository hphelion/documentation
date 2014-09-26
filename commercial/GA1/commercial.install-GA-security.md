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

# HP Helion OpenStack&#174;: Configuring your Helion network securely

The Helion OpenStack Commercial release has many built-in security controls, but the customer must take responsibility for configuring the network devices which integrate Helion services into an existing data center environment.  

Secure configuration includes defining firewall rules at the edge of the Helion deployment to protect against external abuse as well as defining router rules within the Helion deployment to protect against insider abuse or error.

Helion is deployed on three physical networks: IPMI, Fiber Channel, and the Cloud LAN which is subdivided into VLANs to produce the External, Management, and Service LANs as depicted in the following Network Topology diagram.  

<img src = "/content/documentation/media/Helion_Security1.png">

In the diagram above, the customer’s devices that perform routing are depicted as a small cloud icon.  The following sections provide guidance on how to configure these network devices for improved security.  Note that the Helion OpenStack Commercial release includes IPtables rules on each node to close network ports that are not needed, but applying additional rules to your network devices, as indicated in the sections that follow, will provide increased security.

## Securing the Perimeter<a name="perimeter"></a>

The perimeter is indicated by the *customer firewall* icon in the previous diagram.

To protect against external attack on Helion services, your firewall should be configured with a rule to block any request originating from outside the network attempting to reach any of the HP Helion OpenStack nodes or any 3PAR StoreServ  or StoreVirtual VSA appliances dedicated to the Helion installation, as indicated in this table:

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
<th>Description</th><th>Initiating node (from)</th><th>Receiving node (to)</th><th>Port</th>
</tr>
<tr>
<td>User requests to API endpoints and Horizon console</td><td>External network</td><td>Cloud Controller Nodes</td><td>80, 443</td>
</tr>
<td>Administrator access via SSH</td><td>Your enterprise intranet / VPN</td><td>All Helion nodes</td><td>22</td>
</tr>
</table>

You need to allow traffic to flow to and from the External network (indicated in green in the previous diagram) from outside the cloud, as needed by the applications running in your Virtual Machines.  

## Securing the Swift back-end network connections<a name="back-end"></a>

Swift requests travel from the external network, to a HAproxy on an Overcloud controller, which then forwards the request to a Swift node over the Management network.  By default, this traffic travels over a flat network, as follows:

<img src = "/content/documentation/media/ ">
 
You may choose to configure rules in your network devices to apply additional security controls to protect against attacks, insider abuse or mistakes.  For example, your router could block any requests directly to the Swift Object nodes from compute nodes.  (Valid user requests from the compute nodes will be passed via the HAproxy on the Controller nodes).  You could block requests from the external network to Swift Object nodes (as already mentioned for the firewall configuration). When adding rules to your router, take care not to introduce rules that will prevent authorized network traffic between nodes.

The following table describes the data flow between Helion nodes for Swift back-end traffic:

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
<th>Interface</th><th>Description</th><th>Initiating node (from)</th><th>Receiving node (to)</th><th>Port</th>
</tr>
<tr>
<td>1</td><td>Admin access via SSH</td><td>Undercloud controller</td><td>Proxy-Account-Container (PAC)</td><td>22</td>
</tr>
<tr>
<td>2</td><td>Admin access via SSH</td><td>Undercloud controller</td><td>Swift all in one (PACO)</td><td>22</td>
</tr>
<tr>
<td>3</td><td>Pyringos copy of ring files via SCP</td><td>Undercloud controller</td><td>Object Storage</td><td>22</td>
</tr>
<tr>
<td>4</td><td>Swift proxy to object server over HTTP</td><td>Proxy-Account-Container (PAC)</td><td>Object Storage</td><td>80</td>
</tr>
<tr>
<td>5</td><td>Swift proxy to object server over HTTP</td><td>Swift all in one (PACO)</td><td>Object Storage</td><td>80</td>
</tr>
<td>6</td><td>Swift proxy to proxy sync over HTTP</td><td>Proxy-Account-Container (PAC)</td><td>Swift all in one (PACO)</td><td>80</td>
</tr>
<tr>
<td>7</td><td>HA Proxy forwards API requests via HTTP</td><td>Cloud Controller</td><td>Proxy-Account-Container (PAC)</td><td>80</td>
</tr>
<tr>
<td>8</td><td>HA Proxy forwards API requests via HTTP</td><td>Cloud Controller</td><td>Swift all in one (PACO)</td><td>80</td>
</tr>
</table>

Applying access control lists (ACLs) for flows in the table above produces this logical deployment:

<img src = "/content/documentation/media/Helion_Security3.png">

## Securing block storage network connections in Helion<a name="network"></a>

A customer deploying Helion is responsible for securing the block storage networks. Network data flows for block storage should be restricted using access control lists or other mechanisms in the customer’s network devices which may include routers, switches, or firewalls. Block storage data flows interacting with Helion are described here to assist with defining those controls. References are given to documentation on data flows within the storage cluster itself, but not necessarily interacting with Helion nodes.

Helion supports StoreVirtual or 3Par StoreServ storage arrays which will be described separately.

### StoreVirtual<a name="storevirt"></a>

Helion supports both StoreVirtual VSA (Virtual Storage Appliance) and P4000 hardware arrays. Three types of traffic flows into a StoreVirtual node:

- iSCSI traffic
- Management traffic for REST API and management command line interface (CLIQ or SSH)
- StoreVirtual inter-cluster traffic between all nodes in the cluster

VSA only supports one virtual network interface. As a result, the above three types of traffic must flow on the same network. For Helion, this is the management VLAN. P4000 hardware arrays support multiple network interfaces. For P4000, iSCSI and management traffic must flow through the management VLAN. However, inter-cluster traffic can be configure for a separate VLAN. This provides an additional level of network data isolation. 

For StoreVirtual network design best practices, see <a href="http://h20195.www2.hp.com/v2/GetDocument.aspx?docname=4AA2-5615ENW&doctype=white%20paper&doclang=EN_US&searchquery=keywords=(AND)%20storevirtual%20&cc=us&lc=en,en-us">StoreVirtual 4000 Storage Network design considerations and best practices</a>. <!-- note that this hyperlink is deliberately in html due to the nested parentheses which screws up the native MDP formatting and thus breaks the link -->

The following diagram depicts a StoreVirtual network deployed as a flat network:

<img src = "/content/documentation/media/Helion_Security4.png">

The following table describes the data flow between Helion nodes and StoreVirtual systems:

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
<tr>
<th>Interface</th><th>Description</th><th>Initiating node (from)</th><th>Receiving node (to)</th><th>Port</th>
</tr>
<tr>
<td>1</td><td>Compute node iSCSI</td><td>Compute node</td><td>VIP for StoreVirtual cluster</td><td>3260</td>
</tr>
<tr>
<td>2</td><td>Cinder Volume Backup iSCSI</td><td>Cinder host</td><td>VIP for StoreVirtual cluster</td><td>3260</td>
</tr>
<tr>
<td>3</td><td>StoreVirtual REST API (mgmt. interface)</td><td>Cinder host</td><td>VIP for StoreVirtual cluster</td><td>22</td>
</tr>
<tr>
<td>4</td><td>StoreVirtual CLiQ interface via SSH (mgmt. interface)</td><td>UnderCloud Controller</td><td>VIP for StoreVirtual cluster</td><td>16022</td>
</tr>
<tr>
<td>5</td><td>StoreVirtual inter-cluster traffic</td><td>StoreVirtual</td><td>StoreVirtual</td><td>See Ref 2</td>
</tr>
<tr>
<td>6</td><td>CMC to StoreVirtual</td><td>CMC</td><td>StoreVirtual</td><td>See Ref 2
</table>

The following diagram depicts a logical deployment after applying ACLs for flows in table:

<img src = "/content/documentation/media/Helion_Security5.png">

Note that there are additional traffic flows necessary for StoreVirtual operation in addition to the interaction with Helion nodes described above. This includes CMC management console access, StoreVirtual inter-cluster communication and access to network services such as NTP. 

StoreVirtual port usage is described in [HP4000 SAN – SANiQ TCP and UDP Port Usage](http://h10032.www1.hp.com/ctg/Manual/c01750064.pdf).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### 3Par StoreServ<a name="storeserv"></a>

Helion supports iSCSI or Fiberchannel connectivity with 3PAR StoreServ. If using Fiberchannel, then Compute nodes and OverCloud controller hosting Cinder will require Fiberchannel connectivity with the 3PAR array. For iSCSI, connectivity will be via the management VLAN. The StoreServ REST API and SSH command line interfaces must be accessible from the management VLAN as well.

The following diagram depicts a StoreServ network deployed as a flat network:

<img src = "/content/documentation/media/Helion_Security6.png">

The following table describes the data flow between Helion nodes and StoreServ systems:

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
<tr>
<th>Interface</th><th>Description</th><th>Initiating node (from)</th><th>Receiving node (to)</th><th>Port</th>
</tr>
<tr>
<td>1</td><td>Compute node iSCSI</td><td>Compute node</td><td>StoreServ</td><td>3260</td>
</tr>
<tr>
<td>2</td><td>Cinder Volume Backup iSCSI</td><td>Cinder host</td><td>StoreServ</td><td>3260</td>
</tr>
<tr>
<td>3</td><td>StoreServ REST API (mgmt. interface) via HTTPS</td><td>Cinder host</td><td>StoreServ</td><td>8080</td>
</tr>
<tr>
<td>4</td><td>StoreServ command line interface (SSH)</td><td>Cinder host</td><td>StoreServ</td><td>22</td>
</tr>
<tr>
<td>5</td><td>StoreServ REST API (mgmt. interface) via HTTPS</td><td>UnderCloud Controller</td><td>StoreServ</td><td>8080</td>
</tr>
<tr>
<td>6</td><td>SSMC to StoreServ	SSMC</td><td>StoreServ</td><td>See Ref 6</td>
</tr>
<tr>
<td>7</td><td>Service Processor</td><td>Service Processor</td><td>StoreServ</td><td>See Ref 6</td>
</tr>
</table>

When deploying StoreServ with Fiberchannel, interfaces 1 and 2 run over Fiberchannel network instead of iSCSI.

The following diagram depicts a logical deployment after applying ACLs for flows in table:

<img src = "/content/documentation/media/Helion_Security7.png">


Note that there are additional traffic flows necessary for StoreServ operation in addition to the interaction with Helion nodes described above. This includes SSMC console access and Service Processor communication. 

StoreServ port usage is described on page 65 of the [HP 3PAR StoreServ 10000 Storage Physical Planning Manual](http://h20628.www2.hp.com/km-ext/kmcsdirect/emr_na-c03101890-9.pdf).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Additional Block Storage Resources<a name="additional"></a>

- <a href="http://h20195.www2.hp.com/v2/GetDocument.aspx?docname=4AA2-5615ENW&doctype=white%20paper&doclang=EN_US&searchquery=keywords=(AND)%20storevirtual%20&cc=us&lc=en,en-us)">HP StoreVirtual 4000 Storage – Network design considerations and best practices</a> <!-- note this link is deliberately in html formatting to prevent the nested parens from breaking the MDP formatting and thus the link -->
- [HP4000 SAN – SANiQ TCP and UDP Port Usage](http://h10032.www1.hp.com/ctg/Manual/c01750064.pdf)
- [StoreVirtual information](http://hp.com/go/storevirtual)
- [StoreServ information](http://hp.com/go/storeserv)
- [HP 3PAR StoreServ Storage Concepts Guide](http://h20566.www2.hp.com/portal/site/hpsc/template.PAGE/public/psi/manualsResults/?sp4ts.oid=5157544&spf_p.tpst=psiContentResults&spf_p.prp_psiContentResults=wsrp-navigationalState%3Daction%253Dmanualslist%257Ccontentid%253DGeneral-Reference%257Clang%253Den&javax.portlet.begCacheTok=com.vignette.cachetoken&javax.portlet.endCacheTok=com.vignette.cachetoken)
- [HP 3PAR StoreServ 10000 Storage Physical Planning Manual Port assignments on page 65](http://h20628.www2.hp.com/km-ext/kmcsdirect/emr_na-c03101890-9.pdf)
- [RFC3723 – Securing Block Storage](http://tools.ietf.org/html/rfc3723#page-28)
- [RFC7143 – Internet Small Computer System Interface (iSCSI) Protocol](http://tools.ietf.org/html/rfc7143)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Securing ESX network connections in Helion<a name="esx"></a>

If your deployment of Helion includes the ESX Integration, you can improve network security by configuring access control lists for the ESX network.  The ESX Tenant network (also shown below) is managed by Neutron.  The ESX network is not installed or managed by Helion. The customer installs and manages this network and makes sure there is a route to the Management network.  

The ESX network is used for:

- Traffic between OVSvApp VMs running on every ESX Host to communicate with the Neutron message queue on the Cloud Controller
- The vCenter Proxy to communicate with the message queue for Cinder and Nova
- EON to communicate with the vCenter server

The following diagram depicts the following Logical deployment of the ESX Integration in Helion::

<img src = "/content/documentation/media/Helion_Security8.png">
 

The following table describes the data flow between Helion nodes and ESX nodes:

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
<tr>
<th>Description</th><th>Initiating node (from)</th><th>Receiving node (to)</th><th>Port</th>
</tr>
<tr>
<td>OVSvApp VM communication with Neutron message queue</td><td>OVSvApp VMs</td><td>Cloud Controller</td><td>5672</td>
</tr>
<tr>
<td>vCenter Proxy communication with Nova and Cinder message queues</td><td>vCenter Proxy</td><td>Cloud Controller</td><td>5672</td>
</tr>
<tr>
<td>vCenter Proxy communication with MySQL</td><td>vCenter Proxy</td><td>Cloud Controller</td><td>3306</td>
</tr>
<tr>
<td>EON conductor reads vCenter resource information</td><td>Undercloud Controller</td><td>vCenter Proxy</td><td>443</td>
</tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## The Service network<a name="service"></a>

The Service Network (SVC) is created by Neutron.  It provides a path from Development Platform services (such as Database as a Service) running in Nova VMs to the Centralized Logging Service running in the Undercloud.   A route needs to exist from service subnet in Over Cloud to the RabbitMQ on the Under Cloud controller.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: lightgrey; color: black;">
<tr>
<th>Description</th><th>Initiating node (from)</th><th>Receiving node (to)</th><th>Port</th>
</tr>
<tr>
<td>Dev Platform services connect to Logging Service over Rabbit MQ</td><td>Cloud Controller</td><td>Undercloud Controller</td><td>5672</td>
</tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
