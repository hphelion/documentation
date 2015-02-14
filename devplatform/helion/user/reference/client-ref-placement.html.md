---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/placement/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Placement Zones"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Placement Zones

- [helion placement-zone](#command-placement-zone): Show the list of DEAs associated with the specified placement zone.
- [helion placement-zones](#command-placement-zones): Show the available placement zones.
- [helion set-placement-zone](#command-set-placement-zone): Associate the application with a specific placement zone.
- [helion unset-placement-zone](#command-unset-placement-zone): Remove the association between an application and its current placement zone.

##Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*command*]**, or **helion options** commands.

<hr>
      
## helion placement-zone <*zone*> {#command-placement-zone}     
Show the list of DEAs associated with the specified placement zone. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr>
<td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr>
<tr>
<td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td></tr>
</table>le containing
	    the targets and authorization tokens.
	
## helion placement-zones {#command-placement-zones}      
Show the available placement zones. 
	
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr>
<td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr>
<tr>
<td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td></tr>
</table>

## helion set-placement-zone <*application*> <*zone*> {#command-set-placement-zone}      
Associate the application with a specific placement zone.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--manifest</td>
<td>Path of the manifest file to use. If not specified, a search is performed.</td>
</tr>
<tr><td>--no-tail</td><td>Complementary alias of --tail.</td></tr> 
<tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation..</td>
</tr><tr>
<td>--path</td>
<td>Path of the directory holding the application files to push. Defaults to the current working directory.</td>
</tr><tr>
<td>--space, -s</td>
<td>The once-off space to use for the current operation, specified by name. Cannot be used together with <i>--space-guid</i>.</td>
</tr><tr>
<td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by GUID. Cannot be used together with <i>--space</i>.</td>
</tr>
<tr><td>--tail</td><td>Request target to stream the log.</td></tr>
<tr>
<td>--target</td>
<td>The once-off target to use for the current operation only.</td>
</tr>
<tr><td>--timeout</td><td>The time the client waits for an application to start before giving up and returning, in seconds. Note that this is measured from the last entry seen in the log stream. While there is activity in the log the timeout is reset. The default is 2 minutes. Use the suffixes 'm', 'h', and 'd' for the convenient specification of minutes, hours, and days. The optional suffix 's' stands for seconds.</td></tr>
<tr>
<td>--token</td>
<td>The once-off authentication token to use for the current operation only.</td>
</tr><tr>
<td>--token-file</td>
<td>Path to an existing and readable file containing the targets and authorization tokens.</td>
</tr>
</table>

## helion unset-placement-zone  <*application*> <*zone*> {#command-unset-placement-zone}     
Remove the association between application and its current placement zone. 


<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--manifest</td>
<td>Path of the manifest file to use. If not specified, a search is performed.</td>
</tr>
<tr><td>--no-tail</td><td>Complementary alias of --tail.</td></tr> 
<tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation..</td>
</tr><tr>
<td>--path</td>
<td>Path of the directory holding the application files to push. Defaults to the current working directory.</td>
</tr><tr>
<td>--space, -s</td>
<td>The once-off space to use for the current operation, specified by name. Cannot be used together with <i>--space-guid</i>.</td>
</tr><tr>
<td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by GUID. Cannot be used together with <i>--space</i>.</td>
</tr>
<tr><td>--tail</td><td>Request target to stream the log.</td></tr>
<tr>
<td>--target</td>
<td>The once-off target to use for the current operation only.</td>
</tr>
<tr><td>--timeout</td><td>The time the client waits for an application to start before giving up and returning, in seconds. Note that this is measured from the last entry seen in the log stream. While there is activity in the log the timeout is reset. The default is 2 minutes. Use the suffixes 'm', 'h', and 'd' for the convenient specification of minutes, hours, and days. The optional suffix 's' stands for seconds.</td></tr>
<tr>
<td>--token</td>
<td>The once-off authentication token to use for the current operation only.</td>
</tr><tr>
<td>--token-file</td>
<td>Path to an existing and readable file containing the targets and authorization tokens.</td>
</tr>
</table>