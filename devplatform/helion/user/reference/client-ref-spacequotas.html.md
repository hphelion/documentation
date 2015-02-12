---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/spacequotas/
title: "Application Lifecycle Service Command Line Client Reference: Space Quotas"
product: devplatform
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
writer: Jayme P

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Space Quotas

These commands are new in in HP Helion OpenStack&reg; Development Platform 1.1.

- [helion create-space-quota](#command-create-space-quota): Create a new space quota. 
- [helion delete-space-quota](#command-delete-space-quota): Delete the named space quota. 
- [helion rename-space-quota](#command-rename-space-quota): Rename the named space quota.
- [helion set-space-quota](#command-set-space-quota): Assign the specified space quota to the current or specified space
- [helion space-quota](#command-space-quota): Show the details of the named space quota. 
- [helion space-quotas](#command-space-quotas): List the space quotas owned by the current, specified, or all organizations.
- [helion unset-space-quota](#command-unset-space-quota): Drop the space quota from the current or specified space.
- [helion update-space-quota](#command-update-space-quota): Modify the named space quota.

## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*command*]**, or **helion options** commands.

<hr>
      
## helion create-space-quota  *<name>* {#command-create-space-quota}  
Create a new space quota. It will be owned by the current or specified organization. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
   <tr><td>--instance-mem, -i</td>
<td>Amount of memory application instances can use. Use the suffices 'M' and 'G' for the convenient specification of mega- and gigabytes. Without a unit-suffix mega-bytes are assumed. As the base-unit megabytes must specified as integers. Gigabytes can be specified as fractions.
Also accepts -1 and "unlimited" for unlimited memory.
</td>
   <tr><td>--mem, -m</td>
<td>Amount of memory applications can use. Use the suffices 'M' and 'G' for the convenient specification of mega- and gigabytes. Without a unit-suffix mega-bytes are assumed. As the base-unit megabytes must specified as integers. Gigabytes can be specified as fractions.</td>
</tr><tr><td>--no-paid-services-allowed</td><td>Complementary alias of --paid-services-allowed.</td></tr><tr><td>--organization, -o</td><td>The name of the parent organization to use as context.
Defaults to the current organization.
A current organization is automatically set if there is none, either by taking the one organization the user belongs to, or asking the user to choose among the possibilities.
</td></tr>
<td>--paid-services-allowed</td>
<td>Applications can use non-free services.</td>
</tr>    <tr><td>--routes, -r</td><td>Limit for the number of routes in the quota.</td></tr><tr><td>--services, -s</td>
<td>Limit for the number of services in the quota.</td>
</tr>    <tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>

##helion delete-space-quota  *<name>* {#command-delete-space-quota} 
Delete the named space quota.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>

## helion rename-space-quota  *<name>*  *<newname>* {#command-rename-space-quota}      
Rename the named space quota. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>
	


## helion set-space-quota  *<name>* {#command-set-space-quota}    
Assign the specified space quota to the current or specified space. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--organization, -o</td><td>The name of the parent organization to use as context.
Defaults to the current organization.
A current organization is automatically set if there is none, either by taking the one organization the user belongs to, or asking the user to choose among the possibilities.
</td></tr><tr><td>--space</td>
<td>The name of the space to use as context.
Defaults to the current space.
A current space is automatically set if there is none, either by taking the one space the user has, or asking the user to choose among the possibilities.
</td>
</tr>    <tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>

## helion space-quota  *<name>* {#command-space-quota}
Show the details of the named space quota. If not specified it will be asked for interactively (menu). 
        
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--json</td><td>Print raw json as output, not human-formatted data.</td></tr> 
<tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>

## helion space-quotas {#command-space-quotas}      
List the space quotas owned by the current, specified, or all organizations.   

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--all</td><td>Show all space quotas instead.</td></tr>
<tr><td>--full</td><td>Show all information about the space-quota.</td></tr>
<td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr> <tr><td>--organization, -o</td><td>The name of the parent organization to use as context.
Defaults to the current organization.
A current organization is automatically set if there is none, either by taking the one organization the user belongs to, or asking the user to choose among the possibilities.
</td></tr>
<tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>
 
## helion unset-space-quota {#command-unset-space-quota}    
Drop the space quota from the current or specified space.  

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--organization, -o</td><td>The name of the parent organization to use as context.
Defaults to the current organization.
A current organization is automatically set if there is none, either by taking the one organization the user belongs to, or asking the user to choose among the possibilities.
</td></tr>
<tr><td>--space</td>
<td>The name of the space to use as context.
Defaults to the current space.
A current space is automatically set if there is none, either by taking the one space the user has, or asking the user to choose among the possibilities.
</td>
</tr>  
<tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>

## helion update-space-quota  *<name>* {#command-update-space-quota}     
Modify the named space quota. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
   <tr><td>--instance-mem, -i</td>
<td>Amount of memory application instances can use. Use the suffices 'M' and 'G' for the convenient specification of mega- and gigabytes. Without a unit-suffix mega-bytes are assumed. As the base-unit megabytes must specified as integers. Gigabytes can be specified as fractions.
Also accepts -1 and "unlimited" for unlimited memory.
</td>
   <tr><td>--mem, -m</td>
<td>Amount of memory applications can use. Use the suffices 'M' and 'G' for the convenient specification of mega- and gigabytes. Without a unit-suffix mega-bytes are assumed. As the base-unit megabytes must specified as integers. Gigabytes can be specified as fractions.</td>
</tr><tr><td>--no-paid-services-allowed</td><td>Complementary alias of --paid-services-allowed.</td></tr>
<td>--paid-services-allowed</td>
<td>Applications can use non-free services.</td>
</tr>    <tr><td>--routes, -r</td><td>Limit for the number of routes in the quota.</td></tr><tr><td>--services, -s</td>
<td>Limit for the number of services in the quota.</td>
</tr>    <tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>