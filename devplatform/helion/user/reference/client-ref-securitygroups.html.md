---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/securitygroups/
title: "Application Lifecycle Service Command Line Client Reference: Security Groups"
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Security Groups

These commands are new in in HP Helion OpenStack&reg; 1.1.

- [helion bind-security-group](#command-bind-security-group): Bind the named security group to the current space, the specified space, or the running and staging phases. 
- [helion create-security-group](#command-create-security-group): Create a new security group.
- [helion delete-security-group](#command-delete-security-group): Delete the named security group.
- [helion security-group](#command-security-group): Show the details of the named security group.
- [helion security-groups](#command-security-groups): Show all known security groups or just those assigned to the running and staging phases.
- [helion unbind-security-group](#command-unbind-security-group): Drop the named security group from the current space, the specified space, or the running and staging phases.
- [helion update-security-group](#command-update-security-group): Modify the named security group.


## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*command*]**, or **helion options** commands.

<hr>

##  helion bind-security-group <*security_group*> {#command-bind-security-group}
 
Bind the named security group to the current space, the specified space, or the running and staging phases. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--organization, -o</td><td>The name of the parent organization to use as context. Defaults to the current organization. A current organization is automatically set if there is none, either by taking the one organization the user belongs to, or asking the user to choose among the possibilities.</td></tr>
<tr><td>--running</td><td>Switch operation to work on the security groups for running applications.</td></tr>
<tr><td>--space</td><td>The name of the space to use as context. Defaults to the current space. A current space is automatically set if there is none, either by taking the one space the user has, or asking the user to choose among the possibilities.</td></tr>
<tr><td>--staging</td><td>Switch operation to work on the security groups for staging applications.</td></tr>
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
    
## helion create-security-group <*security_group*> <*rules*> {#command-create-security-group}
Create a new security group.

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
authorization tokens.</td></tr>
</table>
	
    
## helion delete-security-group  <*security_group*> {#command-delete-security-group}
Delete the named security group.
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
authorization tokens.</td></tr>
</table>
## helion security-group <*security_group*> {#command-security-group}
Show the details of the named security group.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--json</td><td>Print raw json as output, not human-formatted data.</td></tr>
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

    
## helion security-groups {#command-security-groups}
Show all known security groups or just those assigned to the running and staging phases.
    
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--json</td><td>Print raw json as output, not human-formatted data.</td></tr>
<tr><tr><td>--running</td><td>Switch operation to work on the security groups for running applications.</td></tr>
<tr><td>--staging</td><td>Switch operation to work on the security groups for staging applications.</td></tr>
<td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td></tr>
</table>
	
    
## helion unbind-security-group  <*security_group*> {#command-unbind-security-group}
Drop the named security group from the current space, the specified space, or the running and staging phases.
	    
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--organization, -o</td><td>The name of the parent organization to use as context. Defaults to the current organization. A current organization is automatically set if there is none, either by taking the one organization the user belongs to, or asking the user to choose among the possibilities.</td></tr>
<tr><td>--running</td><td>Switch operation to work on the security groups for running applications.</td></tr>
<tr><td>--space</td><td>The name of the space to use as context. Defaults to the current space. A current space is automatically set if there is none, either by taking the one space the user has, or asking the user to choose among the possibilities.</td></tr>
<tr><td>--staging</td><td>Switch operation to work on the security groups for staging applications.</td></tr>
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
    
## helion update-security-group  <*security_group*> <*rules*> {#command-update-security-group}
Modify the named security group by replacing the old set of rules with a new set.

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
authorization tokens.</td></tr>
</table>