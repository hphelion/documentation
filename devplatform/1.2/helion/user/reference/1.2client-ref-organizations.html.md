---
layout: default-devplatform
permalink: /helion/devplatform/1.2/als/user/reference/client-ref/organizations/
title: "HP Helion 1.2 Development Platform: ALS Command Reference: Organizations"
product: devplatform2.0
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: ALS Command Reference: Organizations

- [helion create-org](#command-create-org): Create a new organization.
- [helion command-delete-org](#delete-org): Delete the named organization
- [helion link-user-org](#command-link-user-org): Add the specified user to the named organization in various roles.
- [helion org](#command-org): Show the named organization's information.
- [helion orgs](#command-orgs): List the available organizations.
- [helion org-users](#command-org-users): Show the users for the organization by role. 
- [helion quota-org](#command-quota-org): Set the quotas for the current or named organization.
- [helion rename-org](#command-rename-org): Rename the named organization.
- [helion switch-org](#command-switch-org): Switch the current organization to the named organization.
- [helion unlink-user-org](#command-unlink-user-org): Remove the specified user from the named organization, in various roles.
- [helion update-org](#command-update-org): Change one or more attributes of an organization in a single call.

## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help** or **helion help [*command*]** commands.

<hr />
## helion create-org <*name*> {#command-create-org}
Create a new organization. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><td>--activate</td>
<td>Switch the current organization to the newly created one. Done by
default.</td>
</tr>    <tr><td>--add-self</td>
<td>Add yourself to the new organization, as developer. Done by
default.</td>
</tr> <tr><td>--default</td><td>Make the organization the default for users without explicit organization. The previous default organization is automatically reset.</td></tr>   <tr>   <tr><td>--no-activate</td>
<td>Complementary alias of --activate.</td>
</tr> 
<td>--no-add-self</td>
<td>Complementary alias of --add-self.</td>
</tr>   <tr>
<td>--quota</td>
<td>The named quota of the new organization. Default is the target's
choice.</td>
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

## helion delete-org <*name*> {#delete-org}
Delete the named organization. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--recursive, -r</td>
<td>Remove all subordinate parts and relations.</td>
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

## helion link-user-org <*user*> <*organization*> {#command-link-user-org}
Add the specified user to the named organization in various roles. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><td>--auditor</td>
    <td>Affect the auditor role</td>
    </tr>    <tr><td>--billing</td>
    <td>Affect the billing manager role</td>
    </tr>    <tr><td>--manager</td>
    <td>Affect the manager role</td>
    </tr> <tr>
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

## helion org <*name*> {#command-org}
Show the named organization's information.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr><td>--full</td>
<td>Show more details.</td>
</tr>    <tr><td>--json</td>
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


## helion orgs {#command-orgs}
List the available organizations.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr><td>--full</td>
<td>Show more details.</td>
</tr>    <tr><td>--json</td>
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

## helion org-users {#command-org-users}
Show the users for the organization by role.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr><td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
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

## helion quota-org <*name*> <*quota*> {#command-quota-org}
Set the quotas for the current or named organization. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
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

##helion rename-org <*name*> <*NewName*> {#command-rename-org}
Rename the named organization.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
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

## helion switch-org <*name*> {command-switch-org}
Switch the current organization to the named organization. This invalidates the current space. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
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

## helion unlink-user-org <*user*> <*organization*> {#command-unlink-user-org}
Remove the specified user from the named organization in various roles. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><td>--auditor</td>
<td>Affect the auditor role</td>
</tr>    <tr><td>--billing</td>
<td>Affect the billing manager role</td>
</tr>    <tr><td>--manager</td>
<td>Affect the manager role</td>
</tr><tr>
<td>--target</td>
<td>The once-off target to use for the current operation.</td>
</tr>    <tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td>
</tr>    <tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td>
</tr></table>

## helion update-org {#command-update-org}
Change one or more attributes of an organization in a single call.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><td>--default</td>
<td>Make the space the default for users without explicit space. The previous default space is automatically reset. The spaces' organization is implicitly made the default as well.</td>
</tr>    <tr><td>--newname</td>
<td>A new name to give to the space.</td>
</tr>    <tr><td>--no-default</td>
<td>Make the current space no longer the default for users without explicit spaces.</td>
</tr><tr>
<td>--organization</td>
<td>The name of the parent organization to use as context.
Defaults to the current organization.
A current organization is automatically set if there is none,
either by taking the one organization the user belongs to, or
asking the user to choose among the possibilities.</td>
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
