---
layout: default-devplatform
permalink: /helion/devplatform/1.2/als/user/reference/client-ref/domains/
product: devplatform2.0
title: "HP Helion 1.2 Development Platform: ALS Command Reference: Domains"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: ALS Command Reference: Domains

- [helion create-domain](#command-create-domain): Create a new domain.
- [helion delete-domain](#command-delete-domain): Delete the named domain.
- [helion domains](#command-domains): List the available domains in the specified space or all domains.

##Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help** or **helion help [*command*]** commands.

<hr />

## helion create-domain <*name*> {#command-create-domain}
Create a new domain.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation.</td>
</tr>    
<tr><td>--shared</td><td>Mark the new domain as shared by all organizations. If not present, the new domain will be owned by and private to the current or specified organization.</td></tr>
<tr><tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>


## helion delete-domain <*name*> {#command-delete-domain}
Delete the named domain.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>


## helion domains {#command-domains}
List the available domains in the specified space or all domains.
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><td>--all</td>
<td>Query information about all domains. Cannot be used together with a space.</td>
</tr> <tr><td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr><tr><tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation.</td>
</tr>    <tr><td>--space</td>
<td>The once-off space to use for the current operation, specified by
name.  Cannot be used together with <i>--space-guid</i>.</td>
</tr><tr><td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr>
</table>
