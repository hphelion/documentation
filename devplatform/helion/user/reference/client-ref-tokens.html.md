---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/tokens/
title: "Application Lifecycle Service Command Line Client Reference: Authentication Tokens"
product: devplatform
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Authentication Tokens

- [helion create-service-auth-token](#command-create-service-auth-token): Create a new service authentication token.
- [helion delete-service-auth-token](#command-delete-service-auth-token): Delete the specified service authentication token
- [helion service-auth-tokens](#command-service-auth-tokens):Show all service authentication tokens knowns to the target. 
- [helion update-service-auth-token](#command-update-service-auth-token): Update the specified service authentication token.

## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*command*]**, or **helion options** commands.

<hr>

## helion create-service-auth-token <*label*> <*provider*> {#command-create-service-auth-token}
Create a new service authentication token. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--auth-token</td>
<td>Value of the new token.</td>
</tr<tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation.</td>
</tr>    <tr><td>--space</td>
<td>The once-off space to use for the current operation, specified by
name. Cannot be used together with <i>--space-guid</i>.</td>
</tr>    <tr><td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by
guid.  Cannot be used together with <i>--space</i>.</td>
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

## helion delete-service-auth-token <*label*> {#command-delete-service-auth-token}
Delete the specified service authentication token.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation..</td>
</tr>    <tr><td>--space</td>
<td>The once-off space to use for the current operation, specified by
name.  Cannot be used together with <i>--space-guid</i>.</td>
</tr>    <tr><td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by
guid.  Cannot be used together with <i>--space</i>.</td>
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

## helion service-auth-tokens {#command-service-auth-tokens}
Show all service authentication tokens known to the target.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr><td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr><tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation.</td>
</tr>    <tr><td>--space</td>
<td>The once-off space to use for the current operation, specified by
name.  Cannot be used together with <i>--space-guid</i>.</td>
</tr>    <tr><td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by
guid.  Cannot be used together with <i>--space</i>.</td>
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

## helion update-service-auth-token <*label*> {#command-update-service-auth-token}
Update the specified service authentication token. 
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--auth-token</td>
<td>New value of the specified token.</td>
</tr><tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation.</td>
</tr>    <tr><td>--space</td>
<td>The once-off space to use for the current operation, specified by
name.  Cannot be used together with <i>--space-guid</i>.</td>
</tr>    <tr><td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by
guid.  Cannot be used together with <i>--space</i>.</td>
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