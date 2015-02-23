---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /helion/devplatform/1.1/als/user/reference/client-ref/quotas/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Quotas"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Quotas

- [helion quota configure](#command-quota-configure): Reconfigure the named quota plan.
- [helion quota create](#command-quota-create): Create a new quota plan.
- [helion quota delete](#command-quota-delete): Delete the named quota plan
- [helion quota list](#command-quota-list): List the available quota plans. 
- [helion quota rename](#command-quota-rename): Rename the named quota plan.
- [helion quota show](#command-quota-show): Show the details of the named quota plan.
- [helion quotas](#command-quotas): List the available quota plans.

## Syntax

	helion [options] command [arguments] [command-options]

For more information, use the **helion help** or **helion help [*command*]** commands.

<hr>

## helion quota configure <*name*> {#quota-configure}
Reconfigure the named quota definition. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--allow-sudo</td>
<td>Applications can use sudo in their container.</td>
</tr>
<tr><td>--droplets</td><td> Limit for the number of droplets per application that are stored (older droplets that exceed this quota are removed and their associated versions can no longer be restored). This option is new in Helion OpenStack&reg; 1.1</td></tr>    <tr><td>--mem</td>
<td>Amount of memory applications can use. Use the suffices 'M' and 'G' for the convenient specification of mega- and gigabytes. Without a unit-suffix mega-bytes are assumed. As the base-unit megabytes must specified as integers. Gigabytes can be specified as fractions.</td>
</tr>    <tr><td>--no-allow-sudo</td>
<td>Complementary alias of --allow-sudo.</td>
</tr>    <tr><td>--no-paid-services-allowed</td>
<td>Complementary alias of --paid-services-allowed.</td>
</tr>    
</tr>    <tr><td>--no-trial-db-allowed</td>
<td>Complementary alias of --trial-db-allowed. Applies to Helion OpenStack&reg; 1.0 only.</td>
</tr><tr>
<td>--paid-services-allowed</td>
<td>Applications can use non-free services.</td>
</tr>    <tr><td>--routes</td><td>Limit for the number of routes in the quota.</td></tr><tr><td>--services</td>
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
 <tr><td>--trial-db-allowed</td>
<td>Applications can use trial databases. Applies to Helion OpenStack&reg; 1.0 only.</td>
</tr> 
</table>

## helion quota create <*name*> {#quota-create}
Create a new quota definition. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--allow-sudo</td>
<td>Applications can use sudo in their container.</td>
</tr>
<tr><td>--droplets</td><td> Limit for the number of droplets per application that are stored (older droplets that exceed this quota are removed and their associated versions can no longer be restored). This option is new in Helion OpenStack&reg; 1.1</td></tr>    <tr><td>--mem</td>
<td>Amount of memory applications can use. Use the suffices 'M' and 'G' for the convenient specification of mega- and gigabytes. Without a unit-suffix mega-bytes are assumed. As the base-unit megabytes must specified as integers. Gigabytes can be specified as fractions.</td>
</tr>    <tr><td>--no-allow-sudo</td>
<td>Complementary alias of --allow-sudo.</td>
</tr>    <tr><td>--no-paid-services-allowed</td>
<td>Complementary alias of --paid-services-allowed.</td>
</tr>   
</tr>    <tr><td>--no-trial-db-allowed</td>
<td>Complementary alias of --trial-db-allowed. Applies to Helion OpenStack&reg; 1.0 only.</td>
</tr>   <tr>
<td>--paid-services-allowed</td>
<td>Applications can use non-free services.</td>
</tr>    <tr><td>--routes</td><td>Limit for the number of routes in the quota.</td></tr><tr><td>--services</td>
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
 <tr><td>--trial-db-allowed</td>
<td>Applications can use trial databases. Applies to Helion OpenStack&reg; 1.0 only.</td>
</tr> 
</table>

## helion quota delete <*name*> {#command-quota-delete}
Delete the named quota definition. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>

## helion quota list {#command-quota-list}
List the available quota definitions.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr><tr>
<td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>

## helion quota rename <*name*> <*NewName*> {#command-quota-rename}
Rename the named quota definition. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>

## helion quota show <*name*> {#command-quota-show}
Show the details of the named quota definition. If not specified it will be asked for interactively (menu). 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr><tr>
<td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>

## helion quotas {#command-quotas}
List the available quota definitions. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr><tr>
<td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>