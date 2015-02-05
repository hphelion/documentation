---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/information
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Information

- [Information](#command-Applications-Information)
	- [helion crashes](#command-crashes)
	- [helion crashlogs](#command-crashlogs)
	- [helion disk](#command-disk)
	- [helion drain list](#command-drain-list)
	- [helion drains](#command-drains)
	- [helion env](#command-env)
	- [helion events](#command-events)
	- [helion file](#command-file)
	- [helion files](#command-files)
	- [helion health](#command-health)
	- [helion instances](#command-instances)
	- [helion logs](#command-logs)
	- [helion mem](#command-mem)
	- [helion stats](#command-stats)
	- [helion tail](#command-tail)

##helion crashes *\<application\>* {#command-crashes}
List recent application crashes.
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr>
<tr>
<td>--group</td>
<td>The once-off group to use for the current operation. This is an ALS 2-specific option.</td>
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
<td>--no-prompt, --non-interactive, --noprompt, -n</td>
<td>Disable all prompts (interactive queries) that would normally be seen by the user.</td>
</tr><tr>
<td>--no-tail</td>
<td>Complementary alias of <i>--tail</i>.</td>
</tr><td>--no-trace</td>
<td>Complementary alias of <i>--trace</i>.</td>
</tr><tr>
<td>--organization, -o</td>
<td>The organization to use. This is an ALS 3-specific option. If not specified programmatically, the user is prompted to choose an organization.</td>
</tr><tr>
<td>--path</td>
<td>Path of the directory holding the application files to push. Defaults to the current working directory.</td>
</tr><tr>
<td>--space, -s</td>
<td>The once-off space to use for the current operation, specified by name. This is an ALS 3-specific option. Cannot be used together with `--space-guid`.</td>
</tr><tr>
<td>--space-guid</td>
<td>The once-off space to use for the current operation, specified by name. This is an ALS 3-specific option. Cannot be used together with `--space-guid`.</td>
</tr><tr>
<td>--tail</td>
<td>Request target to stream the log.</td>
</tr><tr>
<td>--target</td>
<td>The once-off target to use for the current operation only.</td>
</tr><tr>
<td>--token</td>
<td>The once-off authentication token to use for the current operation only.</td>
</tr><tr>
<td>--token-file</td>
<td>Path to an existing and readable file containing the targets and authorization tokens.</td>
</tr><tr>
<td>--trace, -t</td>
<td>The once-off space to use for the current operation, specified by guid. This is an ALS 3-specific option. Cannot be used together with `--space`.</td>
</tr>
</table>

## helion crashlogs *\<application\>* {#command-crashlogs}
Display log information for the application. An alias of 'logs'.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr>
<td>--all</td>
<td>Retrieve the logs from all instances. Before 2.3 only.</td>
</tr><tr>
<td>--filename</td>
<td>Filter the log stream by origin file (glob pattern).</td>
</tr><tr>
<td>--follow</td>
<td>Tail -f the log stream.</td>
</tr><td>--group</td>
<td>The once-off group to use for the current operation. This is an ALS 2-specific option.</td>
</tr>
<td>--instance</td>
<td> The id of the instance to filter the log stream for, or (before 2.3), to retrieve the logs of. </td></tr>
<tr><td>--json</td>
<td>  Print the raw json log stream, not human-formatted data.
</td></tr>
<tr><td> --manifest</td>
<td>Path of the manifest file to use. If not specified a search is
done. </td></tr>
<tr><td> --no-prompt </td>
<td>Disable interactive queries.</td></tr>
<tr><td>  --no-tail</td>
<td> Complementary alias of --tail.</td></tr>
<tr><td> --no-trace</td>
<td> Complementary alias of --trace.</td></tr>
<tr><td> --non-interactive</td>
<td> Alias of --no-prompt.</td></tr>
<tr><td> --noprompt </td>
<td> Alias of --no-prompt. </td></tr>
<tr><td>     --num </td>
<td>  Show the last num entries of the log stream.</td></tr>
<tr><td>--organization</td>
<td> The once-off organization to use for the current operation. This
is an Application Lifecycle Service 3 option.</td></tr>
<tr><td>    --path </td>
<td>    Path of the directory holding the application files to push.
Defaults to the current working directory.</td></tr>
<tr><td>  --prefix </td>
<td> Put instance information before each line of a shown log file.
Before 2.3 only.</td></tr>
<tr><td>   --prefix-logs </td>
<td>    Alias of --prefix.</td></tr>
<tr><td>  --prefixlogs </td>
<td>     Alias of --prefix.</td></tr>
<tr><td>  --source </td>
<td> Filter the log stream by origin stage (glob pattern).</td></tr>
<tr><td>  --space </td>
<td>The once-off space to use for the current operation, specified by
name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td></tr>
<tr><td>--space-guid </td>
<td>The once-off space to use for the current operation, specified by
guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td></tr>
<tr><td>--tail</td>
<td>Request target to stream the log.</td></tr>
<tr><td>--target</td>
<td>The once-off target to use for the current operation.</td></tr>
<tr><td>--text</td>
<td> Filter the log stream by log entry text (glob pattern).</td></tr>
<tr><td>--token</td>
<td>The once-off authentication token to use for the current
operation.</td></tr>
<tr><td>--token-file</td>
<td>Path to an existing and readable file containing the targets and
authorization tokens.</td></tr>
<tr><td>--trace</td>
<td>Activate tracing of the issued REST requests and responses.This
option is a no-op now. Tracing is always active. See the 'trace'
command to print the saved trace to stdout.</td></tr>
<tr><td> -n</td>
<td>  Alias of --no-prompt.</td></tr>
<tr><td>  -o</td>
<td>  Alias of --organization.</td></tr>
<tr><td>-t</td>
<td> Alias of --trace.</td></tr>
</table>

### helion disk *\<application\>*###
Show the disk reservation for a deployed application.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 200px;"><b>Option</b></td><td><b>Description</b></td>
</tr><tr> <td> --group</td>
    <td>  The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td></tr>

    <tr> <td> --manifest </td>
    <td>Path of the manifest file to use. If not specified a search is done.</td>
    </tr>
    <tr><td>  --no-prompt</td>
    <td> Disable interactive queries.</td></tr>
    <tr><td>  --no-tail</td>
    <td> Complementary alias of --tail.</td></tr>
    <tr><td>  --no-trace</td>
    <td>  Complementary alias of --trace.

    <tr><td> --non-interactive</td>
    <td>  Alias of --no-prompt.</td></tr>

    <tr><td>--noprompt</td>
    <td>  Alias of --no-prompt.</td></tr>

    <tr><td> --organization</td>

    <td> The once-off organization to use for the current operation. This
    is an Application Lifecycle Service 3 option.</td></tr>

    <tr><td> --path</td>
    <td> Path of the directory holding the application files to push.
    Defaults to the current working directory.</td></tr>

    <tr><td> --space</td>
    <td>  The once-off space to use for the current operation, specified by name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td></tr>

    <tr><td> --space-guid</td>
    <td> The once-off space to use for the current operation, specified by guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td></tr>

    <tr><td> --tail</td>
    <td>   Request target to stream the log.</td></tr>

    <tr><td> --target</td>
    <td>The once-off target to use for the current operation.</td></tr>
    <tr><td>    --token</td>
    <td>The once-off authentication token to use for the current operation.</td></tr>
    <tr><td> --token-file</td>
    <td>Path to an existing and readable file containing the targets and authorization tokens.</td></tr>
    <tr><td>   --trace</td>
    <td>Activate tracing of the issued REST requests and responses. This option is a no-op now. Tracing is always active. See the 'trace' command to print the saved trace to stdout.</td></tr>
    <tr><td>    -n</td>
    <td> Alias of --no-prompt.</td></tr>
    <tr><td>   -o</td>
    <td> Alias of --organization.</td></tr>
    <tr><td>    -t</td>
    <td> Alias of --trace.</td>
    </tr>
</table>


### helion drain list *\<application\>*###
Show the list of drains attached to the application.
    
<table><tr>
    <td><b>Option</b></td>
    <td><b>Description</b></td>
    </tr><tr> <td> --group
    <td> The once-off group to use for the current operation. This is an Application Lifecycle Service 2 option.
    </td>
    </tr>    <tr><td>
    </td>
    </tr>    <tr><td>--json </td>
    <td>Print raw json as output, not human-formatted data.</td>
    </td>
    </tr>    <tr><td> --manifest</td>
    <td>    Path of the manifest file to use. If not specified a search is done.</td>
    </td>
    </tr>    <tr><td> --no-prompt</td>
    <td> Disable interactive queries.</td>
    </td>
    </tr>    <tr><td>--no-tail</td>
    <td> Complementary alias of --tail.</td>
    </td>
    </tr>    <tr><td> --no-trace</td>
    <td> Complementary alias of --trace.</td>
    </td>
    </tr>    <tr><td>--non-interactive</td>
    <td> Alias of --no-prompt.</td>
    </td>
    </tr>    <tr><td> --noprompt</td>
    <td>Alias of --no-prompt.</td>
    </td>
    </tr>    <tr><td> --organization</td>
    <td> The once-off organization to use for the current operation. This is an Application Lifecycle Service 3 option.</td>
    </td>
    </tr>    <tr><td> --path</td>
    <td> Path of the directory holding the application files to push. Defaults to the current working directory.</td>
    </td>
    </tr>    <tr><td> --space</td>
    <td> The once-off space to use for the current operation, specified by name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </td>
    </tr>    <tr><td> --space-guid</td>
    <td>The once-off space to use for the current operation, specified by guid. This is an Application Lifecycle Service 3 option. Cannot be used together with 
    --space.</td>
    </td>
    </tr>    <tr><td> --tail</td>
    <td>Request target to stream the log.</td>
    </td>
    </tr>    <tr><td>--target</td>
    <td>The once-off target to use for the current operation.</td>
    </td>
    </tr>    <tr><td> --token</td>
    <td> The once-off authentication token to use for the current operation.</td>
    </td>
    </tr>    <tr><td>--token-file</td>
    <td>Path to an existing and readable file containing the targets and authorization tokens.</td>
    </td>
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This option is a no-op now. Tracing is always active. See the 'trace' command to print the saved trace to stdout.</td>
    </td>
    </tr>    <tr><td>     -n</td>
    <td>Alias of --no-prompt.</td>
    </td>
    </tr>    <tr><td>   -o</td>
    <td> Alias of --organization.</td>
    </td>
    </tr>    <tr><td>    -t</td>
    <td> Alias of --trace.</td>
    </tr>
</table>
### helion drains *\<application\*###
Show the list of drains attached to the application.</td>
    
   
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is an
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-tail</td>
    <td>Complementary alias of --tail.</td>
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
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
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
    </tr>    <tr><td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    </tr>    <tr><td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>


### helion env *\<application\* ###
List the application's environment variables.</td>
    
<table>
    <tr>
	<td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-tail</td>
    <td>Complementary alias of --tail.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td><td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--organization</td>
    <td>The once-off organization to use for the current operation. This
    is an Application Lifecycle Service 3 option.</td>
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
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
    </tr><tr> </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr></tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr></table>
### helion events *\<application\*###
Show recorded application events, for application or space.
    Without an application given the current or specified space is
    used, otherwise that application. This is an Application Lifecycle Service 3 specific
    command.</td>
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr>
    <td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-tail</td>
    <td>Complementary alias of --tail.</td>
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
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
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
    </tr><tr></tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr></tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr></table>

### helion files *\<application\* *\<apath\* ###
Display directory listing or file.</td>
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr>
    <td>--all</td>
    <td>When present, access all instances for the file or directory.
    Cannot be used together with --instance.</td>
    </tr>    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--instance</td>
    <td>When present the instance to query. Cannot be used together with
    --all. Defaults to 0 (except when --all is present).</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-tail</td>
    <td>Complementary alias of --tail.</td>
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
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--prefix</td>
    <td>Put instance information before each line of a shown file or
    directory listing. Effective only for --all.</td>
    </tr>    <tr><td>--prefix-logs</td>
    <td>Alias of --prefix.</td>
    </tr>    <tr><td>--prefixlogs</td>
    <td>Alias of --prefix.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with
    --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
    --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
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
    </tr><tr> </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr></tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr></table>
### helion file *\<application\* *\<apath\*  ###
Display directory listing or file.</td>
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--all</td>
    <td>When present, access all instances for the file or directory.
    Cannot be used together with --instance.</td>
    </tr>    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--instance</td>
    <td>When present the instance to query. Cannot be used together with --all. Defaults to 0 (except when --all is present).</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-tail</td>
    <td>Complementary alias of --tail.</td>
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
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--prefix</td>
    <td>Put instance information before each line of a shown file or
    directory listing. Effective only for --all.</td>
    </tr>    <tr><td>--prefix-logs</td>
    <td>Alias of --prefix.</td>
    </tr>    <tr><td>--prefixlogs</td>
    <td>Alias of --prefix.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
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
    </tr><tr> </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr></tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr></table>
### helion health *\<application\* ###
Report the health of the specified application(s).</td>
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--all</td>
    <td>Report on all applications in the current space. Cannot be used
    together with application names.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
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
    <td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr> </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td></tr>
</table>
### helion instances *\<application\*###
List application instances for a deployed application.</td>
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-tail</td>
    <td>Complementary alias of --tail.</td>
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
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
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
    </tr><tr> </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td></tr>
</table>
###helion logs *\<application\*###
Display the application log stream.</td>
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--all</td>
    <td>Retrieve the logs from all instances. Before 2.3 only.</td>
    </tr>    <tr><td>--filename</td>
    <td>Filter the log stream by origin file (glob pattern).</td>
    </tr>    <tr><td>--follow</td>
    <td>Tail -f the log stream.</td>
    </tr>    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--instance</td>
    <td>The id of the instance to filter the log stream for, or (before
            2.3), to retrieve the logs of.</td>
    </tr>    <tr><td>--json</td>
    <td>Print the raw json log stream, not human-formatted data.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-tail</td>
    <td>Complementary alias of --tail.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--num</td>
    <td>Show the last num entries of the log stream.</td>
    </tr>    <tr><td>--organization</td>
    <td>The once-off organization to use for the current operation. This
    is an Application Lifecycle Service 3 option.</td>
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--prefix</td>
    <td>Put instance information before each line of a shown log file.
    Before 2.3 only.</td>
    </tr>    <tr><td>--prefix-logs</td>
    <td>Alias of --prefix.</td>
    </tr>    <tr><td>--prefixlogs</td>
    <td>Alias of --prefix.</td>
    </tr>    <tr><td>--source</td>
    <td>Filter the log stream by origin stage (glob pattern).</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
    </tr>    <tr><td>--target</td>
    <td>The once-off target to use for the current operation.</td>
    </tr>    <tr><td>--text</td>
    <td>Filter the log stream by log entry text (glob pattern). </td>
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
    </tr><tr> </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td></tr>
</table>

### helion mem *\<application\*###
Show the memory reservation for a deployed application.</td>
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-tail</td>
    <td>Complementary alias of --tail.</td>
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
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
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
    </tr><tr> </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td></tr>
</table>
### helion stats *\<application\*###
Display the resource usage for a deployed application.</td>
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-tail</td>
    <td>Complementary alias of --tail.</td>
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
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
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
    </tr><tr></tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td></tr>
</table>

### helion tail *\<application\* *\<apath\*###
Monitor file for changes and stream them.</td>
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--instance</td>
    <td>When present the instance to query. Cannot be used together with --all. Defaults to 0 (except when --all is present).</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-tail</td>
    <td>Complementary alias of --tail.</td>
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
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
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
    </tr><tr> </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td></tr>
</table>