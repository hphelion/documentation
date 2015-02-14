---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/control/
product: devplatform
title: "Application Lifecycle Service Command Line Client Reference: Control"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Control

 These commands are new in Helion OpenStack&reg; Development Platform 1.1

- [helion migrate](#command-migrate): Move the application to a different space.
- [helion restage](#command-restage): Restage an application and regenerate its droplet.

## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*command*]**, or **helion options** commands.

<hr>
	
## helion migrate <*application*> <*destination*> {#command-migrate}
 Move the application to a different space.
 
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--destination-organization, --dest-org, -D</td>
<td>The organization of the destination space, if not the current org.</td>
</tr><tr>
<td>--manifest</td>
<td>Path of the manifest file to use. If not specified, a search is performed.</td>
</tr>
<tr>
<td>--organization,  -o</td>
<td>The organization to use. If not specified programmatically, the user is prompted to choose an organization.</td>
</tr><tr>
<td>--path</td>
<td>Path of the directory or file holding the application files to push. Defaults to the current working directory.</td>
</tr><tr>
<td>--space, -s</td>
<td>The once-off space to use for the current operation, specified by name. Cannot be used together with <i>--space-guid</i>.</td>
</tr><tr>
<td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by GUID. Cannot be used together with <i>--space</i>.</td>
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

## helion restage <*application*> {#command-restage}
Restages an application and regenerates its droplet. This command is new in Helion OpenStack&reg; 1.1
       
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
<tr>
<td>--manifest</td>
<td>Path of the manifest file to use. If not specified, a search is performed.</td>
</tr><tr>
<td>--no-tail</td>
<td>Request the target to stop streaming the log.</td>
</tr>
<tr>
<td>--organization,  -o</td>
<td>The organization to use. If not specified programmatically, the user is prompted to choose an organization.</td>
</tr>
<tr>
<td>--path</td>
<td>Path of the directory or file holding the application files to push. Defaults to the current working directory.</td>
</tr><tr>
<tr>
<td>--space, -s</td>
<td>The once-off space to use for the current operation, specified by name. Cannot be used together with <i>--space-guid</i>.</td>
</tr><tr>
<td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by GUID. Cannot be used together with <i>--space</i>.</td>
</tr><tr>
<td>--tail</td><td>Request the target to start streaming the log.</td></tr>
<r><td>--target</td><td>The once-off target to use for the current operation.</td></tr>
<tr>
<td>--timeout</td>
<td>The time the client waits for an application to start before giving up and returning, in seconds. Note that this is measured from the last entry seen in the log stream. While there is activity in the log the timeout is reset. The default is 2 minutes. Use the suffixes 'm', 'h', and 'd' for the specification of minutes, hours, and days. The optional     suffix 's' stands for seconds.
</td></tr>
</tr><tr>
<td>--token</td>
<td>The once-off authentication token to use for the current operation only.</td>
</tr><tr>
<td>--token-file</td>
<td>Path to an existing and readable file containing the targets and authorization tokens.</td>
</tr>
</table>