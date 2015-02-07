---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/quotas/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Quotas"
---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Quotas

- [helion quota configure](#command-quota-configure)
- [helion quota create](#command-quota-create)
- [helion quota delete](#command-quota-delete)
- [helion quota list](#command-quota-list)
- [helion quota rename](#command-quota-rename)
- [helion quota show](#command-quota-show)
- [helion quotas](#command-quotas)

## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*command*]**, or **helion options** commands.

<hr>

## helion quota configure <*name*> {#quota-configure}
Reconfigure the named quota definition. 

<table>
<tr><td><b>Option</b></td><td><b>Description</b></td></tr>
<tr><td>--allow-sudo</td>
<td>Applications can use sudo in their container.</td>
</tr>    <tr><td>--mem</td>
<td>Amount of memory applications can use.</td>
</tr>    <tr><td>--no-allow-sudo</td>
<td>Complementary alias of --allow-sudo.</td>
</tr>    <tr><td>--no-paid-services-allowed</td>
<td>Complementary alias of --paid-services-allowed.</td>
</tr>    <tr><td>--no-prompt</td>
<td>Disable interactive queries.</td>
</tr>    <tr><td>--no-trace</td>
<td>Complementary alias of --trace.</td>
</tr>    <tr><td>--no-trial-db-allowed</td>
<td>Complementary alias of --trial-db-allowed.</td>
</tr>    <tr><td>--non-interactive</td>
<td>Alias of --no-prompt.</td>
</tr><tr>
<td>--noprompt</td>
<td>Alias of --no-prompt.</td>
</tr><tr>
<td>--paid-services-allowed</td>
<td>Applications can use non-free services.</td>
</tr>    <tr><td>--services</td>
<td>Limit for the number of services in the quota.</td>
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
</tr>    <tr><td>--trial-db-allowed</td>
<td>Applications can use trial databases.</td> </tr><tr>
<td>-n</td>
<td>Alias of --no-prompt.</td>
</tr><tr>
<td>-t</td>
<td>Alias of --trace.</td>
</tr>
</table>

## helion quota create <*name*> {#quota-create}
Create a new quota definition. 

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--allow-sudo</td>
    <td>Applications can use sudo in their container.</td>
    </tr>    <tr><td>--mem</td>
    <td>Amount of memory applications can use.</td>
    </tr>    <tr><td>--no-allow-sudo</td>
    <td>Complementary alias of --allow-sudo.</td>
    </tr>    <tr><td>--no-paid-services-allowed</td>
    <td>Complementary alias of --paid-services-allowed.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--no-trial-db-allowed</td>
    <td>Complementary alias of --trial-db-allowed.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--paid-services-allowed</td>
    <td>Applications can use non-free services.</td>
    </tr>    <tr><td>--services</td>
    <td>Limit for the number of services in the quota.</td>
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
    </tr>    <tr><td>--trial-db-allowed</td>
    <td>Applications can use trial databases.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion quota delete *\<name\*###
Delete the named quota definition. This is an Application Lifecycle Service 3 specific
command.

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
    <td>--target</td>
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
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion quota list###
List the available quota definitions. This is an Application Lifecycle Service 3
specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--json</td>
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
    <td>--target</td>
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
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion quota rename *\<name\* *\<newname\*###
Rename the named quota definition. This is an Application Lifecycle Service 3 specific
command.

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
    <td>--target</td>
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
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion quota show *\<name\*###
Show the details of the named quota definition. If not specified it will be asked for interactively (menu). This is an Application Lifecycle Service 3 specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--json</td>
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
    <td>--target</td>
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
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion quotas###
List the available quota definitions. This is an Application Lifecycle Service 3
specific command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--json</td>
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
    <td>--target</td>
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
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>