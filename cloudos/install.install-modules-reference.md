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

<p style="font-size: x-small;"> <a href="/cloudos/install/advanced-cloud-setup">&#9664; PREV</a> | <a href="/cloudos/install/">&#9650; UP</a> | NEXT &#9654; </p>


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
* [Hp Cos Focus 100](#hp-cos-focus-100)
* [Hp Cos Glance 100](#hp-cos-glance-100)
* [Hp Cos Graffiti 100](#hp-cos-graffiti-100)
* [Hp Cos Keystone 100](#hp-cos-keystone-100)
* [Hp Cos Nova 100](#hp-cos-nova-100)
* [Hp Cos Postgresql 915](#hp-cos-postgresql-915)
* [Hp Cos Quantum 100](#hp-cos-quantum-100)
* [Hp Cos RabbitMQ 271](#hp-cos-rabbitmq-271)
* [Hp Cos Skyline 100](#hp-cos-skyline-100)
* [Hp Cos Swift 100](#hp-cos-swift-100)

<p style="color: red; font-weight: bold; padding: 4px 4px 4px 4px; border: 1px dotted;"> Internal note for <b>G3</b> release: <br/>
Okay to not include an Eden install module table or any Eden attributes in other install module tables?<br/>
Okay to use Graffiti instead of Peer? <br/>
Okay to add the Swift table? <br/>
Okay to keep the Cinder table? <br/>
Okay to use "Quantum" instead of "Neutron"? </p>

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


## Hp Cos Focus 100

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Focus 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures the document repository service. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> Hp cos focus 100-server  </td>
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
<td> Log Level </td> 
<td> Global </td>
<td> The log level to use: Global, Info, Debug. </td>
</tr>

</table>





## Hp Cos Glance 100

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Glance 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures the image repository service. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> Hp cos glance 100-server </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Working Directory </td> 
<td> /var/lib/glance </td>
<td> The Glance working directory. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> PID Directory </td> 
<td> /var/run/glance </td>
<td> Location of Glance's PID files. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Notification Strategy </td> 
<td> Noop </td>
<td> The only option is Noop (No Operation). </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Image Store Directory </td> 
<td> /var/lib/glance/images </td>
<td>  Location of images. </td>
</tr>

<tr>
<td colspan=3> <b> Scrubber: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Log File </td> 
<td> /var/log/glance/scrubber.log </td>
<td> The location of the scrubber log file. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Config File </td> 
<td> /etc/glance/glance-scrubber.conf </td>
<td> The configuration file for the scrubber. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Debug </td> 
<td> FALSE </td>
<td> Boolean indicating whether the scrubber will run in debug mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Verbose File </td> 
<td> TRUE </td>
<td> Boolean indicating whether the scrubber will run in verbose mode. </td>
</tr>

<tr>
<td colspan=3> <b> Reaper: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Log File </td> 
<td> /var/log/glance/reaper.log </td>
<td> The location of the scrubber log file. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Config File </td> 
<td> /etc/glance/glance-reaper.conf </td>
<td> The configuration file for the reaper. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Debug </td> 
<td> FALSE </td>
<td> Boolean indicating whether the reaper will run in debug mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Verbose File </td> 
<td> TRUE </td>
<td> Boolean indicating whether the reaper will run in verbose mode. </td>
</tr>

<tr>
<td colspan=3> <b> Pruner: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Log File </td> 
<td> /var/log/glance/pruner.log </td>
<td> The location of the pruner log file. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Config File </td> 
<td> /etc/glance/glance-pruner.conf </td>
<td> The configuration file for the pruner. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Debug </td> 
<td> FALSE </td>
<td> Boolean indicating whether the pruner will run in debug mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Verbose File </td> 
<td> TRUE </td>
<td> Boolean indicating whether the pruner will run in verbose mode. </td>
</tr>

<tr>
<td colspan=3> <b> Prefetcher: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Log File </td> 
<td> /var/log/glance/prefetcher.log </td>
<td> The location of the prefetcher log file. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Config File </td> 
<td> /etc/glance/glance-prefetcher.conf </td>
<td> The configuration file for the prefetcher. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Debug </td> 
<td> FALSE </td>
<td> Boolean indicating whether the prefetcher will run in debug mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Verbose File </td> 
<td> TRUE </td>
<td> Boolean indicating whether the prefetcher will run in verbose mode. </td>
</tr>

<tr>
<td colspan=3> <b> API: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Log File </td> 
<td> /var/log/glance/api.log </td>
<td> The location of the API log file. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Config File </td> 
<td> /etc/glance/glance-api.conf </td>
<td> The configuration file for the API. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Paste INI File </td> 
<td> /etc/glance/glance-api-paste.ini </td>
<td> Paste Deploy configuration file for the API. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Debug </td> 
<td> FALSE </td>
<td> Boolean indicating whether the API will run in debug mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Verbose File </td> 
<td> TRUE </td>
<td> Boolean indicating whether the API will run in verbose mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Bind to All Addresses </td> 
<td> TRUE </td>
<td> Controls if the API will bind to all addresses or the public address only. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Access Port </td> 
<td> 9292 </td>
<td> The port on which the API service will run. </td>
</tr>

<tr>
<td colspan=3> <b> Registry: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Log File </td> 
<td> /var/log/glance/registry.log </td>
<td> The location of the registry log file. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Config File </td> 
<td> /etc/glance/glance-registry.conf </td>
<td> The configuration file for the registry. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Paste INI File </td> 
<td> /etc/glance/glance-registry-paste.ini </td>
<td> Paste Deploy configuration file for the registry. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Debug </td> 
<td> FALSE </td>
<td> Boolean indicating whether the registry will run in debug mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Verbose File </td> 
<td> TRUE </td>
<td> Boolean indicating whether the registry will run in verbose mode. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Bind to All Addresses </td> 
<td> TRUE </td>
<td> Controls if the registry will bind to all addresses or the public address only. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Access Port </td> 
<td> 9191 </td>
<td> The port on which the registry service will run. </td>
</tr>

<tr>
<td colspan=3> <b> Caching: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Enable Caching </td> 
<td> FALSE </td>
<td> Boolean indicating whether caching is on. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Turn On Cache Management </td> 
<td> FALSE </td>
<td> Boolean indicating whether to enable the use of the <b> glance-cache-manage </b> CLI and the corresponding API. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Directory </td> 
<td> /var/lib/glance/image-cache </td>
<td> The location where images are cached. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Grace Period </td> 
<td> 3600 </td>
<td>  The timeout <b> (in seconds???) </b> for accessing the image. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Stall Timeout </td> 
<td> 86400 </td>
<td>  The timeout <b> (in seconds???) </b> to wait for a stalled GET request. </td>
</tr>

<tr>
<td colspan=3> <b> Database: </b> </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> SQL Idle Timeout </td> 
<td> 3600 </td>
<td> PostgreSQL idle time check <b>(in seconds???)</b>. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> PostgreSQL Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The PostgreSQL proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Use Keystone </td> 
<td> TRUE </td>
<td> Boolean indicating whether Keystone is to be used for authentication. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone Instance </td> 
<td> &lt;first-proposal-instance> </td>
<td> The Keystone proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Service User </td> 
<td> glance </td>
<td> The user that Glance uses when authenticating with Keystone. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Service Password </td> 
<td> ( generated ) </td>
<td> The password for the Glance Keystone authentication user. </td> 
</tr>

<tr style="background-color: white; color: black;">
<td> Use Syslog </td> 
<td> FALSE </td>
<td> Boolean indicating whether Glance should log to syslog. </td> 
</tr>

</table>


## Hp Cos Graffiti 100

Table coming today 12/6...


## Hp Cos Keystone 100

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Keystone 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures the identity management service. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> Hp cos keystone 100-server  </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> PostgreSQL Instance </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The name of the PostgreSQL proposal. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Domain Name </td> 
<td> Cloud name (copied from the cloud installation pages) </td>
<td> A user-editable name for the Domain field on the HP Cloud OS Administration Dashboard login screen. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Domain Admin Password </td> 
<td> &lt;password> <b> Internal note: should we show the value here? </b> </td>
<td> The Admin user's password; Granted domain admin role on the AdminProject. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Domain Arch Password </td> 
<td> &lt;password> <b> Internal note: should we show the value here? </b> </td>
<td> Architect user's password; Granted domain architect role on the AdminProject project. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Domain Trash Password </td> 
<td> &lt;password> <b> Internal note: should we show the value here? </b> </td>
<td> Trash user's password; the granted user role on the trash project. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Signing </td> 
<td> PKI </b> </td>
<td> PKI is a large token that contains token information such as the user ID and user roles. UUID is the alternative 32-character token choice. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Create new Admin Token on Apply </td> 
<td> FALSE </b> </td>
<td> Boolean indicating whether the token is only generated the first time the proposal is created and applied. TRUE means that the token is generated each time the proposal is
applied. </td>
</tr>

</table>


## Hp Cos Nova 100

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Nova 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures the Nova-controller and Nova-compute services. <br/><br/>
Note: The Nova install module has two roles: the <b>hp_cos_nova_100-multi-controller</b> role is applied to the controller node. The 
<b>hp_cos_nova_100-multi-compute</b> role is applied to the compute node. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node and Compute Node</td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> hp_cos_nova_100-multi-controller, hp_cos_nova_100-multi-compute </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Compute Region Name </td> 
<td> <nobr> &lt;compute-region-name> </nobr> </td>
<td> The name of the compute region. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> RabbitMQ </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The RabbitMQ proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> PostgreSQL </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The PostgreSQL proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The Keystone proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone Service User </td> 
<td> nova </td>
<td> The user that Nova uses when authenticating with Keystone. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone Service Password </td> 
<td> ( generated ) </td>
<td> The password for the Nova Keystone authentication user. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Glance </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The Glance proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Verbose </td> 
<td> TRUE </td>
<td> Boolean indicating whether Nova will log INFO messages. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Use NoVNC (otherwise VPN-VNC) </td> 
<td> TRUE </td>
<td> Boolean indicating whether the nova-novncproxy service is used. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Hypervisor </td> 
<td> qemu </td>
<td> Indicates the hypervisor Nova should use when launching virtual machines. May be either qemu or kvm. Select qemu if nova-compute nodes are on
virtual machines. Select kvm if nova-compute nodes are bare-metal. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Quantum </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The Quantum proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Cinder </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The Cinder proposal to use. </td>
</tr>

</table>

## Hp Cos Postgresql 915

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Postgresql 915 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures a PostgreSQL server. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Roles </th> 
<td colspan="2" style="background-color: white;"> Postgresql 915-server, Postgresql 915-client (Optional) </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attribute </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Datadir </td> 
<td> <nobr> /var/lib/postgresql </nobr> </td>
<td> The location where the database files will reside. </td>
</tr>

</table>


## Hp Cos Quantum 100

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Quantum 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures the network connectivity service. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> Hp cos quantum 100-server </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The Keystone proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> RabbitMQ </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The RabbitMQ proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone Service User </td> 
<td> nova </td>
<td> The user that Nova uses when authenticating with Keystone. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone Service Password </td> 
<td> ( generated ) </td>
<td> The password for the Nova Keystone authentication user. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> SQL Engine </td> 
<td> PostgreSQL </td>
<td> The SQL engine to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Mode </td> 
<td> gre </td>
<td> The Quantum mode to use: gre, flat or vlan. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> PostgreSQL Instance </td> 
<td> <nobr> &lt;first-proposal-instance> </nobr> </td>
<td> The PostgreSQL proposal to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Regular User Username </td> 
<td> crowbar </td>
<td> Default regular user name to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Regular User Password </td> 
<td> &lt;password></td>
<td> Default regular password to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Administrator Username </td> 
<td> admin </td>
<td> The Admin Quantum user defined in Keystone. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Administrator Password </td> 
<td> &lt;password></td>
<td> The Admin Quantum user password. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Administrator Token </td> 
<td> ( generated ) </td>
<td> The Admin Quantum Keystone token. </td>
</tr>

</table>


## Hp Cos RabbitMQ 271

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos RabbitMQ 271 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures a RabbitMQ server. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Role </th> 
<td colspan="2" style="background-color: white;"> Rabbitmsgq 271-server </td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> LogPath </td> 
<td> <nobr> /var/log/rabbitmq </nobr> </td>
<td> The location of the rabbitmq log file. </td>
</tr>

</table>



## Hp Cos Skyline 100

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Skyline 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Installs the self-service HP Cloud OS Administration Dashboard. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Roles </th> 
<td colspan="2" style="background-color: white;"> Hp cos skyline 100-server, Hp cos skyline 100-designer </td>
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
<td> Proxy Host (Optional) </td> 
<td> <nobr> &lt;IS-address> </nobr> </td>
<td> Web proxy server's IP address to access the Internet. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Proxy Port </td> 
<td> <nobr> &lt;port-number> </nobr> </td>
<td> The port used by web proxy server. If your environment does not require specifying Proxy Host, do not clear the default value, such as 8080. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Non Proxy Host(s) (Optional) </td> 
<td> <nobr> 10.*|192.*|localhost|127.0 </nobr> </td>
<td> Use this field to specify addresses that should not use proxy servers. Each network needs to be separated by a bar "|". For example:<nobr> 10.*|192.*|localhost </nobr> </td>
</tr>

</table>


## Hp Cos Swift 100

In most cases, you can use the default values. 

<table style="text-align: left; vertical-align: top;">

<tr>
<th style="background-color: #C8C8C8;"> Install Module </th> 
<td colspan="2" style="background-color: white;"> Hp Cos Swift 100 </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Description </th> 
<td colspan="2" style="background-color: white;"> Configures the object/blob storage service. </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Node Deployment </th> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<th style="background-color: #C8C8C8;"> Roles </th> 
<td colspan="2" style="background-color: white;"> Hp cos swift 100-storage, Hp cos swift 100-ring-compute, Hp cos swift 100-proxy, Hp cos swift 100-dispersion</td>
</tr>

<tr style="background-color: #C8C8C8;">
<th> Attributes </th> 
<th> Default Value </th>
<th> Description </th>
</tr>

<tr style="background-color: white; color: black;">
<td> Keystone instance   </td> 
<td> </td>
<td> From the pull-down menu, select the name of the Keystone instance to use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Allow Public Containers   </td> 
<td> false </td>
<td> Boolean indicating whether Swift should be able to use public containers. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Zones  </td> 
<td> 2 </td>
<td> The number of zones Swift should use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Partitions </td> 
<td> 18 </td>
<td> The number of partitions Swift should use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Minimum Partitions per Hour  </td> 
<td> 1 </td>
<td> The minimum number of partitions Swift should use each hour. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Replicas </td> 
<td> 1 </td>
<td> The number of replicas Swift should use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Cluster Hash </td> 
<td> &lt;random-string> </td>
<td> A random string you can enter to seed the hash calculations done by Swift. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Cluster Admin Password </td> 
<td> &lt;password> </td>
<td> The password for the cluster's Admin account. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> User </td> 
<td> swift </td>
<td> The user account Swift should use. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Group </td> 
<td> swift </td>
<td> The group to which the user account belongs. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Debug </td> 
<td> false </td>
<td> Boolean indicating whether Swift should run in debug mode. </td>
</tr>

<tr>
<td colspan="3" style="background-color: #C8C8C8;"> Additional middleware:</td>
</tr>

<tr>
<td colspan="3" style="background-color: #C8C8C8;"> S3: </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Enabled </td> 
<td> false </td>
<td> Boolean indicating whether S3 is enabled for Swift. Swift3 Middleware for OpenStack allows access to OpenStack Swift via the Amazon S3 API.</td>
</tr>

<tr style="background-color: white; color: black;">
<td> Git repo url </td> 
<td> http://github.com/fujita/swift3 </td>
<td> The URL of the git repo for Swift. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Git ref_spec  </td> 
<td> ( generated ) </td>
<td> The refspec of the git repo for Swift. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Use PFS for S3 </td> 
<td> true </td>
<td> Boolean indicating whether Swift should use a parallel file system. </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Use barclamp-git to checkout </td> 
<td> true </td>
<td> Boolean indicating whether Swift should ...?  </td>
</tr>

<tr>
<td colspan="3" style="background-color: #C8C8C8;"> StaticWeb </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Enabled </td> 
<td> false </td>
<td> Boolean indicating whether StaticWeb middleware is enabled for Swift. This middleware serves container data as a static website
with an index file and error file resolution, and optional file listings. See https://github.com/openstack/swift/blob/master/swift/common/middleware/staticweb.py. </td>
</tr>

<tr>
<td colspan="3" style="background-color: #C8C8C8;"> TempURL </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Enabled </td> 
<td> false </td>
<td> Boolean indicating whether TempURL middleware is enabled for Swift. Allows the creation of URLs to provide temporary access to objects. See 
https://github.com/openstack/swift/blob/master/swift/common/middleware/tempurl.py. </td>
</tr>

<tr>
<td colspan="3" style="background-color: #C8C8C8;"> FormPOST </td>
</tr>

<tr style="background-color: white; color: black;">
<td> Enabled </td> 
<td> false </td>
<td> Boolean indicating whether FormPOST is enabled for Swift. FormPOST translates a browser form post into a regular Swift object PUT. See https://github.com/openstack/swift/blob/master/swift/common/middleware/formpost.py. </td>
</tr>

</table>


<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

