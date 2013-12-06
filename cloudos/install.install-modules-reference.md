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

## Couchdb 120

<table style="text-align: left; vertical-align: top; border: 1px black;">

<tr>
<td style="background-color: #C8C8C8; font-weight:bold;"> Install Module </td> 
<td colspan="2" style="background-color: white;"> Couchdb 120 </td>
</tr>

<tr>
<td style="background-color: #C8C8C8; font-weight:bold;"> Description </td> 
<td colspan="2" style="background-color: white;"> Configures a CouchDB server. </td>
</tr>

<tr>
<td style="background-color: #C8C8C8; font-weight:bold;"> Node Deployment </td> 
<td colspan="2" style="background-color: white;"> Cloud Controller Node </td>
</tr>

<tr>
<td style="background-color: #C8C8C8;"> Role </td> 
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

<table style="text-align: left; vertical-align: top; border: 1px black;">

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

<table style="text-align: left; vertical-align: top; border: 1px black;">

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
<td> Lots more... </td> 
<td> &lt; lots more ... > </td>
<td> Lots more... </td>
</tr>

</table>

<p style="color: red; font-weight: bold; padding: 4px 4px 4px 4px; border: 1px dotted;"> Internal note: 12 more tables coming soon ... working on this 12/5. </p>

<a href="#_top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

