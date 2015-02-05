---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/management
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Management

- [Management](#command-Applications-Management)
	- [helion create-app](#command-create-app)
	- [helion dbshell](#command-dbshell)
	- [helion delete](#command-delete)
	- [helion drain add](#command-drain-add)
	- [helion drain delete](#command-drain-delete )
	- [helion env-add](#command-env-add)
	- [helion env-del](#command-env-del)
	- [helion map ](#command-map)
	- [helion open](#command-open)
	- [helion push](#command-push)
	- [helion rename](#command-rename)
	- [helion restart](#command-restart)
	- [helion rollback](#command-rollback)
	- [helion run](#command-run)
	- [helion scale](#command-scale)
	- [helion scp](#command-scp)
	- [helion set-env](#command-set-env)
	- [helion ssh](#command-ssh)
	- [helion start](#command-start)
	- [helion stop](#command-stop)
	- [helion switch-version](#command-switch-version)
	- [helion unmap](#command-unmap)
	- [helion unset-env](#command-unset-env)

</table>
##**Management**##
### helion create-app *\<application\*###
Create an empty application with the specified configuration.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--buildpack</td>
    <td>Url of a custom buildpack. This is an Application Lifecycle Service 3 specific option.</td>
    </tr>    <tr><td>--command</td>
    <td>The application's start command. Defaults to a framework-specific
    value if required and not specified by manifest.yml.</td>
    </tr>    <tr><td>--disk</td>
    <td>The application's per-instance disk allocation. Defaults to a
    framework-specific value if not specified by manifest.yml.</td>
    </tr>    <tr><td>--env</td>
    <td>Environment variable overrides. These are always applied
    regardless of --env-mode. The mode is restricted to the variable
    declarations found in the manifest.</td>
    </tr>    <tr><td>--env-mode</td>
    <td>Environment replacement mode. One of preserve, or replace. The
    default is "preserve". Using mode "replace" implies --reset as
    well, for push. Note that new variables are always set. Preserve
    only prevents update of existing variables. This setting applies
    only to the variable declarations found in the manifest. Overrides
    made with --env are always applied.</td>
    </tr>    <tr><td>--framework</td>
    <td>Specify the framework to use. Cannot be used together with --no-framework. Defaults to a heuristically chosen value if not
    specified, and none for --no-framework. This is an Application Lifecycle Service 2
    specific option.</td>
    </tr>    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--instances</td>
    <td>The number of application instances to create. Defaults to 1, if
    not specified by a manifest.yml.</td>
    </tr>    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--mem</td>
    <td>The application's per-instance memory allocation. Defaults to a
    framework-specific value if not specified by manifest.yml.</td>
    </tr>    <tr><td>--no-framework</td>
    <td>Create application without any framework. Cannot be used together
    with --framework. This is an Application Lifecycle Service 2 specific option.</td>
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
    </tr>    <tr><td>--reset</td>
    <td>Analogue of --env-mode, for the regular settings.</td>
    </tr>    <tr><td>--runtime</td>
    <td>The name of the runtime to use. Default is framework specific, if
    not specified by a manifest.yml. This is an Application Lifecycle Service 2 specific
    option.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--stack</td>
    <td>The OS foundation the application will run on. This is an Application Lifecycle Service
    3 specific option.</td>
    </tr>    <tr><td>--helion-debug</td>
    <td>host:port of the Komodo debugger listener to inject into the
    application as environment variables.</td>
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
    </tr>    <tr><td>--url</td>
    <td>The urls to map the application to. I.e. can be specified multiple
    times.</td>
    </tr><tr>
    <td>-d</td>
	<td>Set up debugging through an application-specific harbor (port)
    service. Target version 2.8+ only.</td>
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

### helion dbshell *\<application\* *\<service\*###
Invoke interactive db shell for a bound service.</td>
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--dry</td>
    <td>Print the low-level ssh command to stdout instead of executing it.</td>
    </tr>    <tr><td>--dry-run</td>
    <td>Alias of --dry.</td>
    </tr>    <tr><td>--group</td>
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
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td> </tr></table>
### helion delete *\<application\*###
Delete the specified application(s).
    
<table>
    <tr><td>--all</td>
    <td>Delete all applications. Cannot be used together with application
    names.</td>
    </tr>    <tr><td>--force</td>
    <td>Force deletion.</td>
    </tr>    <tr><td>--group</td>
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
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion drain add *\<application\* *\<drain\* *\<uri\*###
Attach a new named drain to the application.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--json</td>
    <td>The drain target takes raw json log entries.</td>
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
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td></tr>
</table>
###helion drain delete *\<application\* *\<drain\*###
Remove the named drain from the application.</td>

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
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td> </tr></table>
### helion env-add *\<application\* *\<varname\* *\<value\*###
Add the specified environment variable to the named application.</td>

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
    </tr>    <tr><td>--timeout</td>
    <td>The time the client waits for an application to start before
    giving up and returning, in seconds. Note that this is measured
    from the last entry seen in the log stream. While there is
    activity in the log the timeout is reset.
    The default is 2 minutes.
    Use the suffixes 'm', 'h', and 'd' for the convenient
    specification of minutes, hours, and days. The optional suffix 's'
    stands for seconds.</td>
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
### helion env-del *\<application\* *\<varname\*###
Remove the specified environment variable from the named
application.

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
    </tr>    <tr><td>--timeout</td>
    <td>The time the client waits for an application to start before
    giving up and returning, in seconds. Note that this is measured
    from the last entry seen in the log stream. While there is
    activity in the log the timeout is reset.
    The default is 2 minutes.
    Use the suffixes 'm', 'h', and 'd' for the convenient
    specification of minutes, hours, and days. The optional suffix 's'
    stands for seconds.</td>
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
### helion map *\<application\* *\<url\*###
Make the application accessible through the specified URL (a route
consisting of host and domain)

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
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion open *\<application\*###
Open the url of the specified application in the default web browser. If 'api' is specified as the app name, the Management Console is opened. With no arguments, the 'name' value from the manifest.yml in the current directory is used (if            present). 

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
### helion push *\<application\*###
Configure, create, push, map, and start a new application.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--as</td>
    <td>The name of the application to push/update the selected
    application as. Possible only if a single application is pushed or
    updated.</td>
    </tr>    <tr><td>--buildpack</td>
    <td>Url of a custom buildpack. This is an Application Lifecycle Service 3 specific option.</td>
    </tr>    <tr><td>--command</td>
    <td>The application's start command. Defaults to a framework-specific
    value if required and not specified by manifest.yml.</td>
    </tr>    <tr><td>--copy-unsafe-links</td>
    <td>Links pointing outside of the application directory are copied
    into the application.</td>
    </tr>    <tr><td>--disk</td>
    <td>The application's per-instance disk allocation. Defaults to a
    framework-specific value if not specified by manifest.yml.</td>
    </tr>    <tr><td>--env</td>
    <td>Environment variable overrides. These are always applied
    regardless of --env-mode. The mode is restricted to the variable
    declarations found in the manifest.</td>
    </tr>    <tr><td>--env-mode</td>
    <td>Environment replacement mode. One of preserve, or replace. The
    default is "preserve". Using mode "replace" implies --reset as
    well, for push. Note that new variables are always set. Preserve
    only prevents update of existing variables. This setting applies
    only to the variable declarations found in the manifest. Overrides
    made with --env are always applied.</td>
    </tr>    <tr><td>--force-start</td>
    <td>Push, and start the application, even when stopped.</td>
    </tr>    <tr><td>--framework</td>
    <td>Specify the framework to use. Cannot be used together with --no-framework. Defaults to a heuristically chosen value if not
    specified, and none for --no-framework. This is an Application Lifecycle Service 2
    specific option.</td>
    </tr>    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--instances</td>
    <td>The number of application instances to create. Defaults to 1, if
    not specified by a manifest.yml.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--mem</td>
    <td>The application's per-instance memory allocation. Defaults to a
    framework-specific value if not specified by manifest.yml.</td>
    </tr>    <tr><td>--no-framework</td>
    <td>Create application without any framework. Cannot be used together
    with --framework. This is an Application Lifecycle Service 2 specific option.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-resources</td>
    <td>Do not optimize upload by checking for existing file resources.</td>
    </tr>    <tr><td>--no-start</td>
    <td>Push, but do not start the application.</td>
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
    <td>--noresources</td>
    <td>Alias of --no-resources.</td>
    </tr>    <tr><td>--nostart</td>
    <td>Alias of --no-start.</td>
    </tr>    <tr><td>--organization</td>
    <td>The once-off organization to use for the current operation. This
    is an Application Lifecycle Service 3 option.</td>
    </tr>    <tr><td>--path</td>
    <td>Path of the directory holding the application files to push.
    Defaults to the current working directory.</td>
    </tr>    <tr><td>--reset</td>
    <td>Analogue of --env-mode, for the regular settings.</td>
    </tr>    <tr><td>--runtime</td>
    <td>The name of the runtime to use. Default is framework specific, if
    not specified by a manifest.yml. This is an Application Lifecycle Service 2 specific
    option.</td>
    </tr>    <tr><td>--space</td>
    <td>The once-off space to use for the current operation, specified by
    name. This is an Application Lifecycle Service 3 option. Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. This is an Application Lifecycle Service 3 option. Cannot be used together with --space.</td>
    </tr>    <tr><td>--stack</td>
    <td>The OS foundation the application will run on. This is an Application Lifecycle Service
    3 specific option.</td>
    </tr>    <tr><td>--helion-debug</td>
    <td>host:port of the Komodo debugger listener to inject into the
    application as environment variables.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
    </tr>    <tr><td>--target</td>
    <td>The once-off target to use for the current operation.</td>
    </tr>    <tr><td>--timeout</td>
    <td>The time the client waits for an application to start before
    giving up and returning, in seconds. Note that this is measured
    from the last entry seen in the log stream. While there is
    activity in the log the timeout is reset.
    The default is 2 minutes.
    Use the suffixes 'm', 'h', and 'd' for the convenient
    specification of minutes, hours, and days. The optional suffix 's'
    stands for seconds.</td>
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
    </tr>    <tr><td>--url</td>
    <td>The urls to map the application to. I.e. can be specified multiple
    times.</td>
    </tr><tr>
    <td>-d</td>
    <td>Set up debugging through an application-specific harbor (port)
    service. Target version 2.8+ only.</td>
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

### helion rename *\<application\* *\<name\*###
Rename the specified application. This is an Application Lifecycle Service 3 specific
command.

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
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion restart *\<application\*###
Stop and restart a deployed application.

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
    </tr>    <tr><td>--timeout</td>
    <td>The time the client waits for an application to start before
    giving up and returning, in seconds. Note that this is measured
    from the last entry seen in the log stream. While there is
    activity in the log the timeout is reset.
    The default is 2 minutes.
    Use the suffixes 'm', 'h', and 'd' for the convenient
    specification of minutes, hours, and days. The optional suffix 's'
    stands for seconds.</td>
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
### helion run *\<command\*###
Run an arbitrary command on a running instance.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--all</td>
    <td>Run the command on all instances. Cannot be used together with --instance.</td>
    </tr>    <tr><td>--application</td>
    <td>Name of the application to operate on.</td>
    </tr>    <tr><td>--banner</td>
    <td>Show the leading and trailing banner to separate instance data.
    Applies only when --all is used. Defaults to on.</td>
    </tr>    <tr><td>--dry</td>
    <td>Print the low-level ssh command to stdout instead of executing it.</td>
    </tr>    <tr><td>--dry-run</td>
    <td>Alias of --dry.</td>
    </tr>    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--instance</td>
    <td>The instance to access with the command. Defaults to 0. Cannot be
    used together with --all.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-banner</td>
    <td>Complementary alias of --banner.</td>
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
    <td>-a</td>
    <td>Alias of --application.</td>
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
### helion scale *\<application\*###
Update the number of instances, memory and/or disk reservation for a deployed application.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--disk</td>
    <td>The new disk reservation to use.</td>
    </tr>    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--instances</td>
    <td>Absolute number of instances to scale to, or relative change.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--mem</td>
    <td>The new memory reservation to use.</td>
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
    </tr>    <tr><td>--timeout</td>
    <td>The time the client waits for an application to start before
    giving up and returning, in seconds. Note that this is measured
    from the last entry seen in the log stream. While there is
    activity in the log the timeout is reset.
    The default is 2 minutes.
    Use the suffixes 'm', 'h', and 'd' for the convenient
    specification of minutes, hours, and days. The optional suffix 's'
    stands for seconds.</td>
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
    <td>-d</td>
    <td>Alias of --disk.</td> </tr><tr>
    <td>-i</td>
    <td>Alias of --instances.</td>
    </tr><tr>
    <td>-m</td>
    <td>Alias of --mem.</td>
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
### helion scp *\<paths\*###
Copy source files and directories to the destination.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--application</td>
    <td>Name of the application to operate on.</td>
    </tr>    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--instance</td>
    <td>The instance to access with the command. Defaults to 0.</td>
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
    <td>-a</td>
    <td>Alias of --application.</td>
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
### helion set-env *\<application\* *\<varname\* *\<value\*###
Add the specified environment variable to the named application.

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
    </tr>    <tr><td>--timeout</td>
    <td>The time the client waits for an application to start before
    giving up and returning, in seconds. Note that this is measured
    from the last entry seen in the log stream. While there is
    activity in the log the timeout is reset.
    The default is 2 minutes.
    Use the suffixes 'm', 'h', and 'd' for the convenient
    specification of minutes, hours, and days. The optional suffix 's'
    stands for seconds.</td>
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
### helion ssh *\<command\*###
SSH to a running instance (or target), or run an arbitrary command.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--all</td>
    <td>Run the command on all instances. Cannot be used together with --instance.</td>
    </tr>    <tr><td>--application</td>
    <td>Name of the application to operate on, or "api" to talk to the
    cloud controller node.</td>
    </tr>    <tr><td>--banner</td>
    <td>Show the leading and trailing banner to separate instance data.
    Applies only when --all is used. Defaults to on.</td>
    </tr>    <tr><td>--dry</td>
    <td>Print the low-level ssh command to stdout instead of executing it.</td>
    </tr>    <tr><td>--dry-run</td>
    <td>Alias of --dry.</td>
    </tr>    <tr><td>--group</td>
    <td>The once-off group to use for the current operation. This is a
    Application Lifecycle Service 2 option.</td>
    </tr>    <tr><td>--instance</td>
    <td>The instance to access with the command. Defaults to 0. Cannot be
    used together with --all.</td>
    </tr>    <tr><td>--manifest</td>
    <td>Path of the manifest file to use. If not specified a search is
    done.</td>
    </tr>    <tr><td>--no-banner</td>
    <td>Complementary alias of --banner.</td>
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
    <td>-a</td>
    <td>Alias of --application.</td> </tr><tr>
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
### helion start *\<application\*###
Start a deployed application.

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
    name.  Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid. Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
    </tr>    <tr><td>--target</td>
    <td>The once-off target to use for the current operation.</td>
    </tr>    <tr><td>--timeout</td>
    <td>The time the client waits for an application to start before
    giving up and returning, in seconds. Note that this is measured
    from the last entry seen in the log stream. While there is
    activity in the log the timeout is reset.
    The default is 2 minutes.
    Use the suffixes 'm', 'h', and 'd' for the convenient
    specification of minutes, hours, and days. The optional suffix 's'
    stands for seconds.</td>
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
### helion stop *\<application\*###
Stop a deployed application.

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
    name.  Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid.  Cannot be used together with --space.</td>
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
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion unmap *\<application\* *\<url\*###
Unregister the application from a URL.

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
    name.  Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid.  Cannot be used together with --space.</td>
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
    </tr><tr>
    <td>-o</td>
    <td>Alias of --organization.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion unset-env *\<application\* *\<varname\*###
Remove the specified environment variable from the named application.

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
    name.  Cannot be used together with --space-guid.</td>
    </tr>    <tr><td>--space-guid</td>
    <td>The once-off space to use for the current operation, specified by
    guid.  Cannot be used together with --space.</td>
    </tr>    <tr><td>--tail</td>
    <td>Request target to stream the log.</td>
    </tr>    <tr><td>--target</td>
    <td>The once-off target to use for the current operation.</td>
    </tr>    <tr><td>--timeout</td>
    <td>The time the client waits for an application to start before
    giving up and returning, in seconds. Note that this is measured
    from the last entry seen in the log stream. While there is
    activity in the log the timeout is reset.
    The default is 2 minutes.
    <Use the suffixes 'm', 'h', and 'd' for the convenient
    specification of minutes, hours, and days. The optional suffix 's'
    stands for seconds.</td>
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