---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/brokers/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Brokers"

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Brokers

- [helion add-service-broker](#command-add-service-broker): Make the named service broker known to the system.
- [helion create-service-broker](#command-create-service-broker)
- [helion delete-service-broker](#command-delete-service-broker)
- [helion remove-service-broker](#command-remove-service-broker)
- [helion service-brokers](#command-service-brokers)
- [helion update-service-broker](#command-update-service-broker)

##Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*command*]**, or **helion options** commands.

<hr>

## helion add-service-broker *\<name\* {#command-add-service-broker}
Make the named service broker known to the system.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><td>--broker-token</td>
<td>Value of the broker's token.</td>
</tr>    <tr><td>--group</td>
<td>The once-off group to use for the current operation. This is a
Application Lifecycle Service 2 option.</td>
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
<td>The once-off organization to use for the current operation. This
is an Application Lifecycle Service 3 option.</td>
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
### helion delete-service-broker *\<name\*###
Remove the named service broker from the target.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr><td>--no-prompt</td>
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
<td>The once-off organization to use for the current operation. This
is an Application Lifecycle Service 3 option.</td>
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

### helion remove-service-broker *\<name\*###
Remove the named service broker from the target. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr><td>--no-prompt</td>
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
<td>The once-off organization to use for the current operation. This
is an Application Lifecycle Service 3 option.</td>
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

## helion service-broker
Show the list of known service brokers. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr><td>--json</td>
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
<td>The once-off organization to use for the current operation. This
is an Application Lifecycle Service 3 option.</td>
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

## helion update-service-broker *\<name\* *\<newname\*###
Update the target's knowledge of the named service broker. 

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr><td>--broker-token</td>
<td>New value of the broker's token.</td>
</tr>    <tr><td>--group</td>
<td>The once-off group to use for the current operation. This is a
Application Lifecycle Service 2 option.</td>
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
<td>The once-off organization to use for the current operation. This
is an Application Lifecycle Service 3 option.</td>
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