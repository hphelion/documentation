---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/applications/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Applications"

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Applications

- [helion app](/als/v1/user/reference/client-ref/applications/#command-app)
- [helion apps](/als/v1/user/reference/client-ref/applications/#command-apps)
- [helion list](/als/v1/user/reference/client-ref/applications/#command-list)

## Applications  {#applications}

###helion apps {#command-apps}
Lists the applications deployed to the target.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--all</td>
<td>Show all applications instead of just those associated with the current space.</td>
</tr>
<tr>
<td>--group</td>
<td>Deprecated. Do not use.</td>
</tr>
<tr>
<td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr>
<tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation.</td>
</tr><tr>
<td>--space, -s</td>
<td>The once-off space to use for the current operation, specified by name. Cannot be used together with `--space-guid`.</td>
</tr><tr>
<td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by GUID. Cannot be used together with `--space`.</td>
</tr><tr>
<td>--target</td>
<td>The once-off target to use for the current operation only.</td>
</tr><tr>
<td>--token</td>
<td>The once-off authentication token to use for the current operation only.</td>
</tr><tr>
<td>--token-file</td>
<td>Path to an existing and readable file containing the targets and authorization tokens.</td>
</tr>
</table>

###helion app *\<application\>* {#command-app}
Shows the information of the specified application.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--group</td>
<td>The once-off group to use for the current operation. Deprecated. Do not use.</td>
</tr>
<tr>
<td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr>
<tr>
<td>--manifest</td>
<td>Path of the manifest file to use. If not specified, a search is performed.</td>
</tr>
<tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation..</td>
</tr><tr>
<td>--path</td>
<td>Path of the directory holding the application files to push. Defaults to the current working directory.</td>
</tr><tr>
<td>--space, -s</td>
<td>The once-off space to use for the current operation, specified by name. Cannot be used together with `--space-guid`.</td>
</tr><tr>
<td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by GUID. Cannot be used together with `--space`.</td>
</tr><tr>
<td>--target</td>
<td>The once-off target to use for the current operation only.</td>
</tr><tr>
<td>--token</td>
<td>The once-off authentication token to use for the current operation only.</td>
</tr><tr>
<td>--token-file</td>
<td>Path to an existing and readable file containing the targets and authorization tokens.</td>
</tr>
</table>

### helion list {#command-list}

List the applications deployed to the target.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--all</td>
<td>Show all applications instead of just those associated with the current space.</td>
</tr>
<tr>
<td>--group</td>
<td>The once-off group to use for the current operation. Deprecated. Do not use.</td>
</tr>
<tr>
<td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr>
<tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation.</td>
</tr><tr>
<td>--space, -s</td>
<td>The once-off space to use for the current operation, specified by name. Cannot be used together with `--space-guid`.</td>
</tr><tr>
<td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by GUID. Cannot be used together with `--space`.</td>
</tr><tr>
<td>--target</td>
<td>The once-off target to use for the current operation only.</td>
</tr><tr>
<td>--token</td>
<td>The once-off authentication token to use for the current operation only.</td>
</tr><tr>
<td>--token-file</td>
<td>Path to an existing and readable file containing the targets and authorization tokens.</td>
</tr>
</table>

### helion releases {#command-releases}

Show the list of versions for the specified application. <br />
This command was added in Helion OpenStack&reg; Development Platform 1.1.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--group</td>
<td>The once-off group to use for the current operation. Deprecated. Do not use.</td>
</tr>
<tr>
<td>--json</td>
<td>Print raw json as output, not human-formatted data.</td>
</tr>
<tr>
<td>--manifest</td>
<td>Path of the manifest file to use. If not specified, a search is performed.</td>
</tr>
<tr>
<td>--organization, -o</td>
<td>The once-off organization to use for the current operation.</td>
</tr><tr>
<td>--path</td>
<td>Path of the directory holding the application files to push. Defaults to the current working directory.</td>
</tr><tr>
<td>--space, -s</td>
<td>The once-off space to use for the current operation, specified by name. Cannot be used together with `--space-guid`.</td>
</tr><tr>
<td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by GUID. Cannot be used together with `--space`.</td>
</tr><tr>
<td>--target</td>
<td>The once-off target to use for the current operation only.</td>
</tr><tr>
<td>--token</td>
<td>The once-off authentication token to use for the current operation only.</td>
</tr><tr>
<td>--token-file</td>
<td>Path to an existing and readable file containing the targets and authorization tokens.</td>
</tr>
</table>