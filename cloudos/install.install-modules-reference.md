---
layout: default
title: "Install Modules Reference"
permalink: /cloudos/install/install-modules-reference/
product: cloudos

---

<a name="_top"> </a>

<script> 

function PageRefresh { 
onLoad="window.refresh"
}
 
PageRefresh();
 
</script>


# Install Modules Reference

This topic identifies the proposal attributes associated with each install module. The attribute values can be customized as needed to suit your cloud environment.

This topic also indicates the role(s) associated with each install module and to which node(s) the proposal should be deployed.

In the tables below, the install modules are listed alphabetically for reference purposes.  However, when you apply install modules, there is a specific order, as 
noted in the [Advanced Cloud Setup](/cloudos/install/advanced-cloud-setup/) topic.

* [Couchdb 120](#couchdb-120)
* [Hp Cos Admin 100](#hp-cos-admin-100)
* [Hp Cos Cinder 100](#hp-cos-cinder-100)
* [Hp Cos Cloud Utils 100](#hp-cos-cloud-utils-100)
* [Hp Cos Eve 100](#hp-cos-eve-100)
* remaining tables coming today 12/6 ...

<p style="color: red; font-weight: bold; padding: 4px 4px 4px 4px; border: 1px dotted;"> Internal note for <b>G3</b> release: Okay to not list Eden? Okay to use Graffiti instead of Peer? Okay to add Swift table? Okay to keep Cinder table? Okay to use "Quantum" instead of "Neutron"? </p>

## Couchdb 120

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Couchdb 120 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures a CouchDB server. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> Couchdb 120-server </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> log directory </td> 
<td> /var/log/couchdb </td>
<td> Directory of the couchdb log file. </td>
</tr>

</table>


## Hp Cos Admin 100

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Admin 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures an administration service. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node and Compute Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> Hp cos admin 100-server, Hp cos admin 100-client. <br /> <br /> 
<b> Note: </b> The client role is automatically deployed to all allocated nodes. The server role is automatically installed on the Admin Node during setup. </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Log level </td> 
<td> INFO </td>
<td> Sets the level of the log file: INFO or DEBUG. </td>
</tr>

</table>

## Hp Cos Cinder 100

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Cinder 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures volume connectivity service. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> Hp cos cinder 100-server </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> PostgreSQL </td> 
<td> &lt;first-proposal-instance> </td>
<td> The PostgreSQL proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> RabbitMQ </td> 
<td> &lt;first-proposal-instance> </td>
<td> The RabbitMQ proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Keystone proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Glance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Glance proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Service User (for Keystone) </td> 
<td> cinder </td>
<td> The user that Cinder uses when authenticating with Keystone. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Service Password </td> 
<td> ( generated ) </td>
<td> The password for the Cinder Keystone authentication user. </td>
</tr>

<tr>
<td colspan=3> <b> Volume Options: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Name of Volume </td> 
<td> cinder-volumes </td>
<td> The name of the logical volume group. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Type of Volume </td> 
<td> local </td>
<td> The type of the volume: local or raw. </td>
</tr>

<tr>
<td colspan=3> <b> File-based ("local") Parameters: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Volume File Name </td> 
<td> /var/lib/cinder/volume.raw </td>
<td> This field is used when the Type of Volume is local. The name of the local file to use with losetup. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Maximum File Size (GB) </td> 
<td> 2000 </td>
<td> This field is used when the Type of Volume is local. The size of the volume file in Gigabytes. </td>
</tr>

<tr>
<td colspan=3> <b> Disk-based ("raw") Parameters: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Disk selection method </td> 
<td> all </td>
<td> This field is used when the Type of Volume is raw. May be one of first, all or selected. Used to indicate how to determine which of the listed "raw" Disks for
cinder-volume storage will be used to create the volume group. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Disks for cinder-volume storage volume group </td> 
<td> Generated based on the node selected for deployment. </td>
<td> This list is used only when the Type of Volume is raw. A check-box list of extra disks added to the node. The drives that will be used in the
volume group will depend on the value in the Disk selection method. <br />  <br /> 
Note: If Type of Volume is set to <b> raw </b> and no extra disks exist on the node, or they exist but the selection method is <b> selected </b> and none have been checked, then the
File-based parameters (<b> local </b> volume type) will be used to create a volume group. </td>
</tr>

</table>


## Hp Cos Cloud Utils 100

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Cloud Utils 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures the cloud utilities scripts. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> Hp cos cloud utils 100-server </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone Instance </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The Keystone proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Glance Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Glance proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Cinder Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Cinder proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Quantum Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Quantum proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Nova Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Nova proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Graffiti Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Graffiti proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Focus Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Focus proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Eve Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Eve proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Swift Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Swift proposal to use. </td>
</tr>

</table>

## Hp Cos Eve 100

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Eve 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures the topology provisioning service. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> Hp cos eve 100-requestprocessor, <br /> Hp cos eve 100-requestworker </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Proxy Host (Optional) </td> 
<td> &lt;IPAddress> </td>
<td>  Web proxy server's IP address to access the Internet. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Proxy Port </td> 
<td> &lt;port number> </td>
<td> Port used by the web proxy server. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Non Proxy Host(s) <br /> ("|" separated) </td> 
<td> <nobr> 10.*|192.*|localhost|127.0 </nobr> </td>
<td> Use this field to specify addresses that should not use proxy servers. Each network needs to be separated by a bar "|". For example: <nobr> 10.*|192.*|localhost </nobr> </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Proxy User (Optional) </td> 
<td> </td>
<td> User name required for authenticating to the proxy server. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Proxy Password (Optional) </td> 
<td> </td>
<td> Password of the user required for authenticating to the proxy server. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Status poll timeout in seconds </td> 
<td> 18000 </td>
<td> Timeout in seconds that a provision has before it is considered to be failing. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> PostgreSQL Instance </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The PostgreSQL proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> CouchDB Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The CouchDB proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> mongoDB Hosts </td> 
<td> &lt;mongoDB host name> </td>
<td> The host name of a manually installed mongoDB instance. <b> NOTE: </b>  If you manually install mongoDB on a node, the mongoDB settings will be used and the couchDB instance setting
will be ignored. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> mongoDB Port </td> 
<td> 27017 </td>
<td> The port number of the mongoDB database. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> mongoDB User Name </td> 
<td> &lt;username> </td>
<td> The user name for access to the mongoDB database. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> mongoDB Password </td> 
<td> &lt;password> </td>
<td> The password for the user given above. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> rabbitMQ Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The RabbitMQ proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Graffiti Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Graffiti proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Keystone proposal to use. </td>
</tr>

</table>

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

