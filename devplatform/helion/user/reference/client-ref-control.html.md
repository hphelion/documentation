---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/control/
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Control

- [Control](#command-Applications-Control)
	- [helion migrate](#command-migrate)
	- [helion restage](#command-restage)
	
## stackato migrate \<*application*\>  \<*destination*\>
 Move the application to a different space. This command is new in Helion OpenStack&reg; 1.1
 
<table style="text-align: left; vertical-align: top; width: 650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 250px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--destination-organization, --dest-org, -D</td>
<td>The organization of the destination space, if not the current org.</td>
</tr><tr>
<td>--group</td>
<td>Deprecated. Do not use.</td>
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
<td>--space</td>
<td>The space (in the organization) to use. If not specified, the user is prompted to choose among the possible spaces in either the specified organization or all organizations that the user belongs to.</td>
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

## stackato restage \<*application*\> 
Restages an application and regenerates its droplet. This command is new in Helion OpenStack&reg; 1.1
       
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
<tr>
<td>--group</td>
<td>Deprecated. Do not use.</td>
</tr><tr>
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
<td>--space</td>
<td>The space (in the organization) to use. If not specified, the user is prompted to choose among the possible spaces in either the specified organization or all organizations that the user belongs to.</td>
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