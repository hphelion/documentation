---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/spaces/
title: "Application Lifecycle Service Command Line Client Reference: Spaces"
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Spaces

- [helion create-space](#command-create-space)
- [helion delete-space](#command-delete-space)
- [helion link-user-space](#command-link-user-space)
- [helion rename-space](#command-rename-space)
- [helion space-users](#command-space-users)
- [helion space](#command-space)	
- [helion spaces](#command-spaces)
- [helion switch-space](#command-switch-space)
- [helion unlink-user-space](#command-unlink-user-space)
- [helion update-space ](#command-update-space)

## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*option*]**, or **helion options** commands.

<hr>
### helion create-space *\<name\*###
Create a new space. This is an Application Lifecycle Service 3 specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--activate</td>
    <td>Switch the current space to the newly created one. Done by
    default.</td>
    </tr>    <tr><td>--auditor</td>
    <td>Add yourself to the new space, as auditor. By request.</td>
    </tr>    <tr><td>--developer</td>
    <td>Add yourself to the new space, as developer. Done by default.</td>
    </tr>    <tr><td>--manager</td>
    <td>Add yourself to the new space, as manager. Done by default.</td>
    </tr>    <tr><td>--no-activate</td>
    <td>Complementary alias of --activate.</td>
    </tr>    <tr><td>--no-auditor</td>
    <td>Complementary alias of --auditor.</td>
    </tr>    <tr><td>--no-developer</td>
    <td>Complementary alias of --developer.</td>
    </tr>    <tr><td>--no-manager</td>
    <td>Complementary alias of --manager.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
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
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion delete-space *\<name\*###
Delete the named space. This is an Application Lifecycle Service 3 specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--organization</td>
    <td>The name of the parent organization to use as context.
    Defaults to the current organization.
    A current organization is automatically set if there is none,
    either by taking the one organization the user belongs to, or
    asking the user to choose among the possibilities.</td>
    </tr>    <tr><td>--recursive</td>
    <td>Remove all sub-ordinate parts, and relations.</td>
    </tr>    <tr><td>--target</td>
    <td>The once-off target to use for the current operation.</td>
    </tr>    <tr><td>--token</td>
    <td>The once-off authentication token to use for the current
    operation.</td>
    </tr>    <tr><td>--token-file</td>
    <td>Path to an existing and readable file containing the targets and
    authorization tokens.</td>
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-r</td>
    <td>Alias of --recursive.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
###helion link-user-space *\<user\* *\<space\*###
Add the specified user to the named space, in various roles. This is an Application Lifecycle Service 3 specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--auditor</td>
    <td>Affect the auditor role</td>
    </tr>    <tr><td>--developer</td>
    <td>Affect the developer role</td>
    </tr>    <tr><td>--manager</td>
    <td>Affect the manager role</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
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
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion rename-space *\<name\* *\<newname\*###
Rename the named space. This is an Application Lifecycle Service 3 specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
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
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion spaces###
List the available spaces in the specified organization. See --organization for details This is an Application Lifecycle Service 3 specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--full</td>
    <td>Show more details.</td>
    </tr>    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
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
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion space *\<name\*###
Show the named space's information. This is an Application Lifecycle Service 3 specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--full</td>
    <td>Show more details.</td>
    </tr>    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
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
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion switch-space *\<name\*###
Switch from the current space to the named space. This may switch the organization as well. This is an Application Lifecycle Service 3 specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
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
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion unlink-user-space *\<user\* *\<space\*###
Remove the specified user from the named space, in various roles. This is an Application Lifecycle Service 3 specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--auditor</td>
    <td>Affect the auditor role</td>
    </tr>    <tr><td>--developer</td>
    <td>Affect the developer role</td>
    </tr>    <tr><td>--manager</td>
    <td>Affect the manager role</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
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
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
