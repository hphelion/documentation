---
layout: default-devplatform
permalink: /als/v1/user/reference/client-ref/
---

Application Lifecycle Service Client Command Reference[](#helion-client-command-reference "Permalink to this headline")
=====================================================================================================

Usage[](#usage "Permalink to this headline")
---------------------------------------------

**helion** [*options*] *command* [*arguments*] [*command-options*]

Try `helion help`,
`helion help [command]`, and
`helion options` for more information.

Many of the informational commands take a `--json`
option if you wish to generate machine-parseable output. In some cases
the `--json` option reveals additional details.

**Note**

Administrative user privileges are required for some commands.

### Getting Started[](#getting-started "Permalink to this headline")

> helion login *\<email\>*
> :   Log in to the current or specified target with the named user.
>
>     + options
>
>     --credentials
>
>     The credentials to use. Each use of the option declares a single
>     element, using the form "key: value" for the argument. This is a
>     Application Lifecycle Service 3 specific option.
>
>     --group
>
>     The group to use for the login. This is an Application Lifecycle Service 2 specific
>     option.
>
>     --ignore-missing
>
>      
>
>     Disable errors generated for missing organization and/or space.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The organization to use. This is an Application Lifecycle Service 3 specific option. If
>     not specified the user is asked interactively to choose an
>     organization.
>
>     --passwd
>
>     Alias of --password.
>
>     --password
>
>     The password to use. For Application Lifecycle Service 3 this is a shorthand for
>     --credentials 'password: ...'.
>
>     --space
>
>     The space (in the organization) to use. This is an Application Lifecycle Service 3
>     specific option. If not specified the user is asked interactively
>     to choose among the possible spaces in either the chosen
>     organization, or all organizations it belongs to.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion logout *\<target\>*
> :   Log out of the current, specified, or all targets.
>
>     + options
>
>     --all
>
>     When present, log out of all targets we know. Cannot be used
>     together with a target.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion target *\<url\>*
> :   Set the target API endpoint for the client, or report the current
>     target.
>
>     + options
>
>     --allow-http
>
>     Required to prevent the client from rejecting http urls.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The organization to set as current for this target. This is a
>     Application Lifecycle Service 3 specific option.
>
>     --space
>
>     The space to set as current for this target. This is an Application Lifecycle Service 3
>     specific option.
>
>     --verbose
>
>     More verbose operation.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -s
>
>     Alias of --space.
>
>     \</div\>\</div\>
>
### Applications[](#applications "Permalink to this headline")

> helion apps
> :   List the applications deployed to the target.
>
>     + options
>
>     --all
>
>     Show all applications instead of just those associated with the
>     current space.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion app *\<application\>*
> :   Show the information of the specified application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion list
> :   List the applications deployed to the target.
>
>     + options
>
>     --all
>
>     Show all applications instead of just those associated with the
>     current space.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
>     \</div\>\</div\>
>
> **Information**

> helion crashes *\<application\>*
> :   List recent application crashes.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion crashlogs *\<application\>*
> :   Display log information for the application. An alias of 'logs'.
>
>     + options
>
>     --all
>
>     Retrieve the logs from all instances. Before 2.3 only.
>
>     --filename
>
>     Filter the log stream by origin file (glob pattern). Target
>     version 2.4+ only.
>
>     --follow
>
>     Tail -f the log stream. Target version 2.4+ only.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instance
>
>     The id of the instance to filter the log stream for, or (before
>     2.3), to retrieve the logs of.
>
>     --json
>
>     Print the raw json log stream, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --num
>
>     Show the last num entries of the log stream. Target version 2.4+
>     only.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --prefix
>
>     Put instance information before each line of a shown log file.
>     Before 2.3 only.
>
>     --prefix-logs
>
>     Alias of --prefix.
>
>     --prefixlogs
>
>     Alias of --prefix.
>
>     --source
>
>     Filter the log stream by origin stage (glob pattern). Target
>     version 2.4+ only.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --text
>
>     Filter the log stream by log entry text (glob pattern). Target
>     version 2.4+ only.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion disk *\<application\>*
> :   Show the disk reservation for a deployed application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion drain list *\<application\>*
> :   Show the list of drains attached to the application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion drains *\<application\>*
> :   Show the list of drains attached to the application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion env *\<application\>*
> :   List the application's environment variables.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion events *\<application\>*
> :   Show recorded application events, for application or space.
>     Without an application given the current or specified space is
>     used, otherwise that application. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion files *\<application\>* *\<apath\>*
> :   Display directory listing or file.
>
>     + options
>
>     --all
>
>     When present, access all instances for the file or directory.
>     Cannot be used together with --instance.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instance
>
>     When present the instance to query. Cannot be used together with
>     --all. Defaults to 0 (except when --all is present).
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --prefix
>
>     Put instance information before each line of a shown file or
>     directory listing. Effective only for --all.
>
>     --prefix-logs
>
>     Alias of --prefix.
>
>     --prefixlogs
>
>     Alias of --prefix.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion file *\<application\>* *\<apath\>*
> :   Display directory listing or file.
>
>     + options
>
>     --all
>
>     When present, access all instances for the file or directory.
>     Cannot be used together with --instance.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instance
>
>     When present the instance to query. Cannot be used together with
>     --all. Defaults to 0 (except when --all is present).
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --prefix
>
>     Put instance information before each line of a shown file or
>     directory listing. Effective only for --all.
>
>     --prefix-logs
>
>     Alias of --prefix.
>
>     --prefixlogs
>
>     Alias of --prefix.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion health *\<application\>*
> :   Report the health of the specified application(s).
>
>     + options
>
>     --all
>
>     Report on all applications in the current space. Cannot be used
>     together with application names.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion instances *\<application\>*
> :   List application instances for a deployed application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion logs *\<application\>*
> :   Display the application log stream.
>
>     + options
>
>     --all
>
>     Retrieve the logs from all instances. Before 2.3 only.
>
>     --filename
>
>     Filter the log stream by origin file (glob pattern). Target
>     version 2.4+ only.
>
>     --follow
>
>     Tail -f the log stream. Target version 2.4+ only.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instance
>
>     The id of the instance to filter the log stream for, or (before
>     2.3), to retrieve the logs of.
>
>     --json
>
>     Print the raw json log stream, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --num
>
>     Show the last num entries of the log stream. Target version 2.4+
>     only.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --prefix
>
>     Put instance information before each line of a shown log file.
>     Before 2.3 only.
>
>     --prefix-logs
>
>     Alias of --prefix.
>
>     --prefixlogs
>
>     Alias of --prefix.
>
>     --source
>
>     Filter the log stream by origin stage (glob pattern). Target
>     version 2.4+ only.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --text
>
>     Filter the log stream by log entry text (glob pattern). Target
>     version 2.4+ only.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion mem *\<application\>*
> :   Show the memory reservation for a deployed application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion stats *\<application\>*
> :   Display the resource usage for a deployed application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion tail *\<application\>* *\<apath\>*
> :   Monitor file for changes and stream them.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instance
>
>     When present the instance to query. Cannot be used together with
>     --all. Defaults to 0 (except when --all is present).
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> **Management**

> helion create-app *\<application\>*
> :   Create an empty application with the specified configuration.
>
>     + options
>
>     --buildpack
>
>     Url of a custom buildpack. This is an Application Lifecycle Service 3 specific option.
>
>     --command
>
>     The application's start command. Defaults to a framework-specific
>     value if required and not specified by stackato.yml.
>
>     --disk
>
>     The application's per-instance disk allocation. Defaults to a
>     framework-specific value if not specified by stackato.yml.
>
>     --env
>
>     Environment variable overrides. These are always applied
>     regardless of --env-mode. The mode is restricted to the variable
>     declarations found in the manifest.
>
>     --env-mode
>
>     Environment replacement mode. One of preserve, or replace. The
>     default is "preserve". Using mode "replace" implies --reset as
>     well, for push. Note that new variables are always set. Preserve
>     only prevents update of existing variables. This setting applies
>     only to the variable declarations found in the manifest. Overrides
>     made with --env are always applied.
>
>     --framework
>
>     Specify the framework to use. Cannot be used together with
>     --no-framework. Defaults to a heuristically chosen value if not
>     specified, and none for --no-framework. This is an Application Lifecycle Service 2
>     specific option.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instances
>
>     The number of application instances to create. Defaults to 1, if
>     not specified by a stackato.yml.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --mem
>
>     The application's per-instance memory allocation. Defaults to a
>     framework-specific value if not specified by stackato.yml.
>
>     --no-framework
>
>     Create application without any framework. Cannot be used together
>     with --framework. This is an Application Lifecycle Service 2 specific option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --reset
>
>     Analogue of --env-mode, for the regular settings.
>
>     --runtime
>
>     The name of the runtime to use. Default is framework specific, if
>     not specified by a stackato.yml. This is an Application Lifecycle Service 2 specific
>     option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --stack
>
>     The OS foundation the application will run on. This is an Application Lifecycle Service
>     3 specific option.
>
>     --helion-debug
>
>      
>
>     host:port of the Komodo debugger listener to inject into the
>     application as environment variables.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     --url
>
>     The urls to map the application to. I.e. can be specified muliple
>     times.
>
>     -d
>
>     Set up debugging through an application-specific harbor (port)
>     service. Target version 2.8+ only.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion dbshell *\<application\>* *\<service\>*
> :   Invoke interactive db shell for a bound service.
>
>     + options
>
>     --dry
>
>     Print the low-level ssh command to stdout instead of executing it.
>
>     --dry-run
>
>     Alias of --dry.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion delete *\<application\>*
> :   Delete the specified application(s).
>
>     + options
>
>     --all
>
>     Delete all applications. Cannot be used together with application
>     names.
>
>     --force
>
>     Force deletion.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion drain add *\<application\>* *\<drain\>* *\<uri\>*
> :   Attach a new named drain to the application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     The drain target takes raw json log entries.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion drain delete *\<application\>* *\<drain\>*
> :   Remove the named drain from the application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion env-add *\<application\>* *\<varname\>* *\<value\>*
> :   Add the specified environment variable to the named application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion env-del *\<application\>* *\<varname\>*
> :   Remove the specified environment variable from the named
>     application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion map *\<application\>* *\<url\>*
> :   Make the application accessible through the specified URL (a route
>     consisting of host and domain)
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion open *\<application\>*
> :   Open the url of the specified application in the default web
>     browser. If 'api' is specified as the app name, the Management
>     Console is opened. With no arguments, the 'name' value from the
>     stackato.yml/manifest.yml in the current directory is used (if
>     present).
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion push *\<application\>*
> :   Configure, create, push, map, and start a new application.
>
>     + options
>
>     --as
>
>     The name of the application to push/update the selected
>     application as. Possible only if a single application is pushed or
>     updated.
>
>     --buildpack
>
>     Url of a custom buildpack. This is an Application Lifecycle Service 3 specific option.
>
>     --command
>
>     The application's start command. Defaults to a framework-specific
>     value if required and not specified by stackato.yml.
>
>     --copy-unsafe-links
>
>      
>
>     Links pointing outside of the application directory are copied
>     into the application.
>
>     --disk
>
>     The application's per-instance disk allocation. Defaults to a
>     framework-specific value if not specified by stackato.yml.
>
>     --env
>
>     Environment variable overrides. These are always applied
>     regardless of --env-mode. The mode is restricted to the variable
>     declarations found in the manifest.
>
>     --env-mode
>
>     Environment replacement mode. One of preserve, or replace. The
>     default is "preserve". Using mode "replace" implies --reset as
>     well, for push. Note that new variables are always set. Preserve
>     only prevents update of existing variables. This setting applies
>     only to the variable declarations found in the manifest. Overrides
>     made with --env are always applied.
>
>     --force-start
>
>     Push, and start the application, even when stopped.
>
>     --framework
>
>     Specify the framework to use. Cannot be used together with
>     --no-framework. Defaults to a heuristically chosen value if not
>     specified, and none for --no-framework. This is an Application Lifecycle Service 2
>     specific option.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instances
>
>     The number of application instances to create. Defaults to 1, if
>     not specified by a stackato.yml.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --mem
>
>     The application's per-instance memory allocation. Defaults to a
>     framework-specific value if not specified by stackato.yml.
>
>     --no-framework
>
>     Create application without any framework. Cannot be used together
>     with --framework. This is an Application Lifecycle Service 2 specific option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-resources
>
>     Do not optimize upload by checking for existing file resources.
>
>     --no-start
>
>     Push, but do not start the application.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --noresources
>
>     Alias of --no-resources.
>
>     --nostart
>
>     Alias of --no-start.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --reset
>
>     Analogue of --env-mode, for the regular settings.
>
>     --runtime
>
>     The name of the runtime to use. Default is framework specific, if
>     not specified by a stackato.yml. This is an Application Lifecycle Service 2 specific
>     option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --stack
>
>     The OS foundation the application will run on. This is an Application Lifecycle Service
>     3 specific option.
>
>     --helion-debug
>
>      
>
>     host:port of the Komodo debugger listener to inject into the
>     application as environment variables.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     --url
>
>     The urls to map the application to. I.e. can be specified muliple
>     times.
>
>     -d
>
>     Set up debugging through an application-specific harbor (port)
>     service. Target version 2.8+ only.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion rename *\<application\>* *\<name\>*
> :   Rename the specified application. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion restart *\<application\>*
> :   Stop and restart a deployed application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion run *\<command\>*
> :   Run an arbitrary command on a running instance.
>
>     + options
>
>     --all
>
>     Run the command on all instances. Cannot be used together with
>     --instance.
>
>     --application
>
>     Name of the application to operate on.
>
>     --banner
>
>     Show the leading and trailing banner to separate instance data.
>     Applies only when --all is used. Defaults to on.
>
>     --dry
>
>     Print the low-level ssh command to stdout instead of executing it.
>
>     --dry-run
>
>     Alias of --dry.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instance
>
>     The instance to access with the command. Defaults to 0. Cannot be
>     used together with --all.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-banner
>
>     Complementary alias of --banner.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -a
>
>     Alias of --application.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion scale *\<application\>*
> :   Update the number of instances, memory and/or disk reservation for
>     a deployed application.
>
>     + options
>
>     --disk
>
>     The new disk reservation to use.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instances
>
>     Absolute number of instances to scale to, or relative change.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --mem
>
>     The new memory reservation to use.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -d
>
>     Alias of --disk.
>
>     -i
>
>     Alias of --instances.
>
>     -m
>
>     Alias of --mem.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion scp *\<paths\>*
> :   Copy source files and directories to the destination.
>
>     + options
>
>     --application
>
>     Name of the application to operate on.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instance
>
>     The instance to access with the command. Defaults to 0.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -a
>
>     Alias of --application.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion set-env *\<application\>* *\<varname\>* *\<value\>*
> :   Add the specified environment variable to the named application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion ssh *\<command\>*
> :   SSH to a running instance (or target), or run an arbitrary
>     command.
>
>     + options
>
>     --all
>
>     Run the command on all instances. Cannot be used together with
>     --instance.
>
>     --application
>
>     Name of the application to operate on, or "api" to talk to the
>     cloud controller node.
>
>     --banner
>
>     Show the leading and trailing banner to separate instance data.
>     Applies only when --all is used. Defaults to on.
>
>     --dry
>
>     Print the low-level ssh command to stdout instead of executing it.
>
>     --dry-run
>
>     Alias of --dry.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --instance
>
>     The instance to access with the command. Defaults to 0. Cannot be
>     used together with --all.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-banner
>
>     Complementary alias of --banner.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -a
>
>     Alias of --application.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion start *\<application\>*
> :   Start a deployed application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion stop *\<application\>*
> :   Stop a deployed application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion unmap *\<application\>* *\<url\>*
> :   Unregister the application from a URL.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion unset-env *\<application\>* *\<varname\>*
> :   Remove the specified environment variable from the named
>     application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
### Services[](#services "Permalink to this headline")

> helion service-plans
> :   List all available plans of the supported services. This is a
>     Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion services
> :   List the supported and provisioned services of the target.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion service *\<name\>*
> :   Show the information about the named service.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
>     \</div\>\</div\>
>
> **Authentication Tokens**

> helion create-service-auth-token *\<label\>* *\<provider\>*
> :   Create a new service authentication token. This is an Application Lifecycle Service 3
>     specific command.
>
>     + options
>
>     --auth-token
>
>     Value of the new token.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion delete-service-auth-token *\<label\>*
> :   Delete the specified service authentication token. This is a
>     Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion service-auth-tokens
> :   Show all service authentication tokens knowns to the target. This
>     is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion update-service-auth-token *\<label\>*
> :   Update the specified service authentication token. This is a
>     Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --auth-token
>
>     New value of the specified token.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> **Brokers**

> helion add-service-broker *\<name\>*
> :   Make the named service broker known. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --broker-token
>
>     Value of the broker's token.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     --url
>
>     Location of the broker.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion delete-service-broker *\<name\>*
> :   Remove the named service broker from the target. This is a
>     Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion remove-service-broker *\<name\>*
> :   Remove the named service broker from the target. This is a
>     Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion service-brokers
> :   Show the list of known service brokers. This is an Application Lifecycle Service 3
>     specific command.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion update-service-broker *\<name\>* *\<newname\>*
> :   Update the target's knowledge of the named service broker. This is
>     an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --broker-token
>
>     New value of the broker's token.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     --url
>
>     New location of the broker.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> **Management**

> helion bind-service *\<service\>* *\<application\>*
> :   Bind the named service to the specified application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion clone-services *\<source\>* *\<application\>*
> :   Copy the service bindings of the source application to the
>     destination application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion create-service *\<vendor\>* *\<name\>* *\<application\>*
> :   Create a new provisioned service, and optionally bind it to an
>     application.
>
>     + options
>
>     --credentials
>
>     The credentials to use. Each use of the option declares a single
>     element, using the form "key: value" for the argument. This is a
>     Application Lifecycle Service 3 specific option. This is restricted to user-provided
>     services.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --plan
>
>     The service plan to use. This is an Application Lifecycle Service 3 specific option.
>
>     --provider
>
>     The service provider. Use this to disambiguate between multiple
>     providers of the same vendor/type. This is an Application Lifecycle Service 3 specific
>     option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     --version
>
>     The service version. Use this to disambiguate between multiple
>     versions of the same vendor/type. This is an Application Lifecycle Service 3 specific
>     option.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion delete-service *\<service\>*
> :   Delete the named provisioned service.
>
>     + options
>
>     --all
>
>     Delete all services. Cannot be used together with named service
>     instances.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     --unbind
>
>     Unbind service from applications before deleting. By default bound
>     services are skipped and not deleted. This is an Application Lifecycle Service 3
>     specific option.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion rename-service *\<service\>* *\<name\>*
> :   Rename the specified service instance. This is an Application Lifecycle Service 3
>     specific command.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion tunnel *\<service\>* *\<tunnelclient\>*
> :   Create a local tunnel to a service, optionally start a local
>     client as well.
>
>     + options
>
>     --allow-http
>
>     Required to prevent the client from rejecting http urls.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --port
>
>     Port used for the tunnel.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     --url
>
>     Url the tunnel helper application is mapped to and listens on.
>     Relevant if and only if the helper has to be pushed,i.e. on first
>     use of the tunnel command.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion unbind-service *\<service\>* *\<application\>*
> :   Disconnect the named service from the specified application.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --manifest
>
>     Path of the manifest file to use. If not specified a search is
>     done.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-tail
>
>     Complementary alias of --tail.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --path
>
>     Path of the directory holding the application files to push.
>     Defaults to the current working directory.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --tail
>
>     Request target to stream the log.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --timeout
>
>     The time the client waits for an application to start before
>     giving up and returning, in seconds. Note that this is measured
>     from the last entry seen in the log stream. While there is
>     activity in the log the timeout is reset.
>
>     The default is 2 minutes.
>
>     Use the suffixes 'm', 'h', and 'd' for the convenient
>     specification of minutes, hours, and days. The optional suffix 's'
>     stands for seconds.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
### Organizations[](#organizations "Permalink to this headline")

> helion create-org *\<name\>*
> :   Create a new organization. This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --activate
>
>     Switch the current organization to the newly created one. Done by
>     default.
>
>     --add-self
>
>     Add yourself to the new organization, as developer. Done by
>     default.
>
>     --no-activate
>
>     Complementary alias of --activate.
>
>     --no-add-self
>
>     Complementary alias of --add-self.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --quota
>
>     The named quota of the new organization. Default is the target's
>     choice.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion delete-org *\<name\>*
> :   Delete the named organization. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --recursive
>
>     Remove all sub-ordinate parts, and relations.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -r
>
>     Alias of --recursive.
>
>     -t
>
>     Alias of --trace.
>
> helion link-user-org *\<user\>* *\<org\>*
> :   Add the specified user to the named organization, in various
>     roles. This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --auditor
>
>     Affect the auditor role
>
>     --billing
>
>     Affect the billing manager role
>
>     --manager
>
>     Affect the manager role
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion orgs
> :   List the available organizations. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --full
>
>     Show more details.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion org *\<name\>*
> :   Show the named organization's information. This is an Application Lifecycle Service 3
>     specific command.
>
>     + options
>
>     --full
>
>     Show more details.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion quota-org *\<name\>* *\<quota\>*
> :   Set the quotas for the current or named organization. This is a
>     Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion rename-org *\<name\>* *\<newname\>*
> :   Rename the named organization. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion switch-org *\<name\>*
> :   Switch the current organization to the named organization. This
>     invalidates the current space. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion unlink-user-org *\<user\>* *\<org\>*
> :   Remove the specified user from the named organization, in various
>     roles. This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --auditor
>
>     Affect the auditor role
>
>     --billing
>
>     Affect the billing manager role
>
>     --manager
>
>     Affect the manager role
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
>     \</div\>\</div\>
>
### Spaces[](#spaces "Permalink to this headline")

> helion create-space *\<name\>*
> :   Create a new space. This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --activate
>
>     Switch the current space to the newly created one. Done by
>     default.
>
>     --auditor
>
>     Add yourself to the new space, as auditor. By request.
>
>     --developer
>
>     Add yourself to the new space, as developer. Done by default.
>
>     --manager
>
>     Add yourself to the new space, as manager. Done by default.
>
>     --no-activate
>
>     Complementary alias of --activate.
>
>     --no-auditor
>
>     Complementary alias of --auditor.
>
>     --no-developer
>
>     Complementary alias of --developer.
>
>     --no-manager
>
>     Complementary alias of --manager.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion delete-space *\<name\>*
> :   Delete the named space. This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --recursive
>
>     Remove all sub-ordinate parts, and relations.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -r
>
>     Alias of --recursive.
>
>     -t
>
>     Alias of --trace.
>
> helion link-user-space *\<user\>* *\<space\>*
> :   Add the specified user to the named space, in various roles. This
>     is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --auditor
>
>     Affect the auditor role
>
>     --developer
>
>     Affect the developer role
>
>     --manager
>
>     Affect the manager role
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion rename-space *\<name\>* *\<newname\>*
> :   Rename the named space. This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion spaces
> :   List the available spaces in the specified organization. See
>     --organization for details This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --full
>
>     Show more details.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion space *\<name\>*
> :   Show the named space's information. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --full
>
>     Show more details.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion switch-space *\<name\>*
> :   Switch from the current space to the named space. This may switch
>     the organization as well. This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion unlink-user-space *\<user\>* *\<space\>*
> :   Remove the specified user from the named space, in various roles.
>     This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --auditor
>
>     Affect the auditor role
>
>     --developer
>
>     Affect the developer role
>
>     --manager
>
>     Affect the manager role
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
>     \</div\>\</div\>
>
### Routes[](#routes "Permalink to this headline")

> helion delete-route *\<name\>*
> :   Delete the named route. This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --space
>
>     The name of the space to use as context.
>
>     Defaults to the current space.
>
>     A current space is automatically set if there is none, either by
>     taking the one space the user has, or asking the user to choose
>     among the possibilities.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion routes
> :   List all available routes. This is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
>     \</div\>\</div\>
>
### Domains[](#domains "Permalink to this headline")

> helion domains
> :   List the available domains in the specified space, or all. This is
>     an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --all
>
>     Query information about all domains. Cannot be used together with
>     a space.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --space
>
>     The name of the space to use as context.
>
>     Defaults to the current space.
>
>     A current space is automatically set if there is none, either by
>     taking the one space the user has, or asking the user to choose
>     among the possibilities.
>
>     Cannot be used together with --all.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion map-domain *\<name\>*
> :   Add the named domain to an organization or space. This is a
>     Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --space
>
>     The name of the space to use as context.
>
>     Defaults to the current space.
>
>     A current space is automatically set if there is none, either by
>     taking the one space the user has, or asking the user to choose
>     among the possibilities.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion unmap-domain *\<name\>*
> :   Remove the named domain from an organization or space. This is a
>     Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The name of the parent organization to use as context.
>
>     Defaults to the current organization.
>
>     A current organization is automatically set if there is none,
>     either by taking the one organization the user belongs to, or
>     asking the user to choose among the possibilities.
>
>     --space
>
>     The name of the space to use as context.
>
>     Defaults to the current space.
>
>     A current space is automatically set if there is none, either by
>     taking the one space the user has, or asking the user to choose
>     among the possibilities.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
>     \</div\>\</div\>
>
### Administration[](#administration "Permalink to this headline")

> helion admin grant *\<email\>*
> :   Grant the named user administrator privileges for the current or
>     specified target.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion admin list
> :   Show a list of the administrators for the current or specified
>     target.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion admin patch *\<patch\>*
> :   Apply a patch to the current or specified target.
>
>     + options
>
>     --dry
>
>     Print the low-level ssh command to stdout instead of executing it.
>
>     --dry-run
>
>     Alias of --dry.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion admin report *\<destination\>*
> :   Retrieve a report containing the logs of the current or specified
>     target.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion admin revoke *\<email\>*
> :   Revoke administrator privileges for the named user at the current
>     or specified target.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion frameworks
> :   List the supported frameworks of the target. This is an Application Lifecycle Service 2
>     specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion groups add-user *\<group\>* *\<user\>*
> :   Add the named user to the specified group. This is an Application Lifecycle Service 2
>     specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion groups create *\<name\>*
> :   Create a new group with the specified name. This is an Application Lifecycle Service 2
>     specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion groups delete-user *\<group\>* *\<user\>*
> :   Remove the named user from the specified group. This is an Application Lifecycle Service
>     2 specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion groups delete *\<name\>*
> :   Delete the named group. This is an Application Lifecycle Service 2 specific command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion groups limits *\<group\>*
> :   Show and/or modify the limits applying to applications in the
>     named group. This is an Application Lifecycle Service 2 specific command.
>
>     + options
>
>     --apps
>
>     Limit for the number of applications in the group.
>
>     --appuris
>
>     Limit for the number of mapped uris per application.
>
>     --drains
>
>     Limit for the number of drains in the group.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --mem
>
>     Amount of memory applications can use.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-sudo
>
>     Complementary alias of --sudo.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --services
>
>     Limit for the number of services in the group.
>
>     --sudo
>
>     Applications can use sudo (or not).
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion groups show
> :   Show the list of groups known to the target. This is an Application Lifecycle Service 2
>     specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion groups users *\<group\>*
> :   Show the list of users in the named group. This is an Application Lifecycle Service 2
>     specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion group *\<name\>*
> :   Report the current group, or (un)set it. This is an Application Lifecycle Service 2
>     specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --reset
>
>     Reset the current group to nothing. Cannot be used together with
>     name.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion info
> :   Show the basic system and account information.
>
>     + options
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion limits *\<group\>*
> :   Show and/or modify the limits applying to applications in the
>     named group. This is an Application Lifecycle Service 2 specific command.
>
>     + options
>
>     --apps
>
>     Limit for the number of applications in the group.
>
>     --appuris
>
>     Limit for the number of mapped uris per application.
>
>     --drains
>
>     Limit for the number of drains in the group.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --mem
>
>     Amount of memory applications can use.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-sudo
>
>     Complementary alias of --sudo.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --services
>
>     Limit for the number of services in the group.
>
>     --sudo
>
>     Applications can use sudo (or not).
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion quota configure *\<name\>*
> :   Reconfigure the named quota definition. This is an Application Lifecycle Service 3
>     specific command.
>
>     + options
>
>     --allow-sudo
>
>     Applications can use sudo in their container.
>
>     --mem
>
>     Amount of memory applications can use.
>
>     --no-allow-sudo
>
>      
>
>     Complementary alias of --allow-sudo.
>
>     --no-paid-services-allowed
>
>      
>
>     Complementary alias of --paid-services-allowed.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --no-trial-db-allowed
>
>      
>
>     Complementary alias of --trial-db-allowed.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --paid-services-allowed
>
>      
>
>     Applications can use non-free services.
>
>     --services
>
>     Limit for the number of services in the quota.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     --trial-db-allowed
>
>      
>
>     Applications can use trial databases.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion quota create *\<name\>*
> :   Create a new quota definition. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --allow-sudo
>
>     Applications can use sudo in their container.
>
>     --mem
>
>     Amount of memory applications can use.
>
>     --no-allow-sudo
>
>      
>
>     Complementary alias of --allow-sudo.
>
>     --no-paid-services-allowed
>
>      
>
>     Complementary alias of --paid-services-allowed.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --no-trial-db-allowed
>
>      
>
>     Complementary alias of --trial-db-allowed.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --paid-services-allowed
>
>      
>
>     Applications can use non-free services.
>
>     --services
>
>     Limit for the number of services in the quota.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     --trial-db-allowed
>
>      
>
>     Applications can use trial databases.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion quota delete *\<name\>*
> :   Delete the named quota definition. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion quota list
> :   List the available quota definitions. This is an Application Lifecycle Service 3
>     specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion quota rename *\<name\>* *\<newname\>*
> :   Rename the named quota definition. This is an Application Lifecycle Service 3 specific
>     command.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion quota show *\<name\>*
> :   Show the details of the named quota definition. If not specified
>     it will be asked for interactively (menu). This is an Application Lifecycle Service 3
>     specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion quotas
> :   List the available quota definitions. This is an Application Lifecycle Service 3
>     specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion runtimes
> :   List the supported runtimes of the target. This is an Application Lifecycle Service 2
>     specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion stacks
> :   List the supported stacks of the target. This is an Application Lifecycle Service 3
>     specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion targets
> :   List the available targets, and their authorization tokens, if
>     any.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion tokens
> :   List the available targets, and their authorization tokens, if
>     any.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion usage *\<userOrGroup\>*
> :   Show the current memory allocation and usage of the active or
>     specified user/group (Application Lifecycle Service 2), or the specified or current
>     space (Application Lifecycle Service 3).
>
>     + options
>
>     --all
>
>     Query information about everything. Cannot be used together with
>     userOrGroup.
>
>     --group
>
>     The once-off group to use for the current operation. This is a
>     Application Lifecycle Service 2 option.
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The once-off organization to use for the current operation. This
>     is an Application Lifecycle Service 3 option.
>
>     --space
>
>     The once-off space to use for the current operation, specified by
>     name. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space-guid.
>
>     --space-guid
>
>     The once-off space to use for the current operation, specified by
>     guid. This is an Application Lifecycle Service 3 option. Cannot be used together with
>     --space.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion user-info *\<name\>*
> :   Shows the information of a user in the current or specified
>     target. Defaults to the current user. Naming a specific user
>     requires an Application Lifecycle Service 3 target.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion user
> :   Show the name of the current user in the current or specified
>     target.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion version
> :   Print the version number of the client.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
>     \</div\>\</div\>
>
> **User Management**

> helion add-user *\<name\>*
> :   Register a new user in the current or specified target. This
>     operation requires administrator privileges, except if
>     "allow\_registration" is set server-side.
>
>     + options
>
>     --admin
>
>     Give the newly created user administrator privileges.
>
>     --apps
>
>     Limit for the number of applications in the group.
>
>     --appuris
>
>     Limit for the number of mapped uris per application.
>
>     --drains
>
>     Limit for the number of drains in the group.
>
>     --email
>
>     The email of the user to create. This is an Application Lifecycle Service 3 specific
>     option.
>
>     --group
>
>     The group to put the new user into. This is an Application Lifecycle Service 2 specific
>     option.
>
>     --mem
>
>     Amount of memory applications can use.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-sudo
>
>     Complementary alias of --sudo.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The organization to place the new user into. Defaults to the
>     current organization. This is an Application Lifecycle Service 3 specific option.
>
>     --passwd
>
>     Alias of --password.
>
>     --password
>
>     The password to use.
>
>     --services
>
>     Limit for the number of services in the group.
>
>     --sudo
>
>     Applications can use sudo (or not).
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion delete-user *\<email\>*
> :   Delete the named user, and the user's applications and services
>     from the current or specified target. This operation requires
>     administrator privileges.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion login-fields
> :   Show the names of the credential fields needed for a login. This
>     is an Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion passwd
> :   Change the password of the current user in the current or
>     specified target.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --passwd
>
>     Alias of --password.
>
>     --password
>
>     The new password. If not present it will be interactively asked
>     for.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion register *\<name\>*
> :   Register a new user in the current or specified target. This
>     operation requires administrator privileges, except if
>     "allow\_registration" is set server-side.
>
>     + options
>
>     --admin
>
>     Give the newly created user administrator privileges.
>
>     --apps
>
>     Limit for the number of applications in the group.
>
>     --appuris
>
>     Limit for the number of mapped uris per application.
>
>     --drains
>
>     Limit for the number of drains in the group.
>
>     --email
>
>     The email of the user to create. This is an Application Lifecycle Service 3 specific
>     option.
>
>     --group
>
>     The group to put the new user into. This is an Application Lifecycle Service 2 specific
>     option.
>
>     --mem
>
>     Amount of memory applications can use.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-sudo
>
>     Complementary alias of --sudo.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --organization
>
>     The organization to place the new user into. Defaults to the
>     current organization. This is an Application Lifecycle Service 3 specific option.
>
>     --passwd
>
>     Alias of --password.
>
>     --password
>
>     The password to use.
>
>     --services
>
>     Limit for the number of services in the group.
>
>     --sudo
>
>     Applications can use sudo (or not).
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -o
>
>     Alias of --organization.
>
>     -t
>
>     Alias of --trace.
>
> helion token
> :   Interactively set authentication token.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion unregister *\<email\>*
> :   Delete the named user, and the user's applications and services
>     from the current or specified target. This operation requires
>     administrator privileges.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion users
> :   Show the list of users known to the current or specified target.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
### Convenience[](#convenience "Permalink to this headline")

> helion aliases
> :   List the known aliases (shortcuts).
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion alias *\<name\>* *\<command\>*
> :   Create a shortcut for a command (prefix).
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion unalias *\<name\>*
> :   Remove a shortcut by name.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
>     \</div\>\</div\>
>
### Miscellaneous[](#miscellaneous "Permalink to this headline")

> helion admin exit
> :   Exit the shell. No-op if not in a shell.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion admin help *\<cmdname\>*
> :   Retrieve help for a command or command set. Without arguments help
>     for all commands is given. The default format is --full.
>
>     + options
>
>     --by-category
>
>     Activate by-category form of the help.
>
>     --full
>
>     Activate full form of the help.
>
>     --json
>
>     Activate json form of the help.
>
>     --list
>
>     Activate list form of the help.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --short
>
>     Activate short form of the help.
>
>     --width
>
>     The line width to format the help for. Defaults to the terminal
>     width, or 80 when no terminal is available.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -w
>
>     Alias of --width.
>
> helion curl *\<operation\>* *\<path\>* *\<header\>*
> :   Run a raw rest request against the chosen target
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --no-trace
>
>     Complementary alias of --trace.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --target
>
>     The once-off target to use for the current operation.
>
>     --token
>
>     The once-off authentication token to use for the current
>     operation.
>
>     --token-file
>
>     Path to an existing and readable file containing the targets and
>     authorization tokens.
>
>     --trace
>
>     Activate tracing of the issued REST requests and responses. This
>     option is a no-op now. Tracing is always active. See the 'trace'
>     command to print the saved trace to stdout.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -t
>
>     Alias of --trace.
>
> helion debug-packages
> :   Show the packages used the client, and their versions.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion drain exit
> :   Exit the shell. No-op if not in a shell.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion drain help *\<cmdname\>*
> :   Retrieve help for a command or command set. Without arguments help
>     for all commands is given. The default format is --full.
>
>     + options
>
>     --by-category
>
>     Activate by-category form of the help.
>
>     --full
>
>     Activate full form of the help.
>
>     --json
>
>     Activate json form of the help.
>
>     --list
>
>     Activate list form of the help.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --short
>
>     Activate short form of the help.
>
>     --width
>
>     The line width to format the help for. Defaults to the terminal
>     width, or 80 when no terminal is available.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -w
>
>     Alias of --width.
>
> helion exit
> :   Exit the shell. No-op if not in a shell.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion groups exit
> :   Exit the shell. No-op if not in a shell.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion groups help *\<cmdname\>*
> :   Retrieve help for a command or command set. Without arguments help
>     for all commands is given. The default format is --full.
>
>     + options
>
>     --by-category
>
>     Activate by-category form of the help.
>
>     --full
>
>     Activate full form of the help.
>
>     --json
>
>     Activate json form of the help.
>
>     --list
>
>     Activate list form of the help.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --short
>
>     Activate short form of the help.
>
>     --width
>
>     The line width to format the help for. Defaults to the terminal
>     width, or 80 when no terminal is available.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -w
>
>     Alias of --width.
>
> helion guid *\<type\>* *\<name\>*
> :   Map the specified name into a uuid, given the type. This is a
>     Application Lifecycle Service 3 specific command.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion help *\<cmdname\>*
> :   Retrieve help for a command or command set. Without arguments help
>     for all commands is given. The default format is --full.
>
>     + options
>
>     --by-category
>
>     Activate by-category form of the help.
>
>     --full
>
>     Activate full form of the help.
>
>     --json
>
>     Activate json form of the help.
>
>     --list
>
>     Activate list form of the help.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --short
>
>     Activate short form of the help.
>
>     --width
>
>     The line width to format the help for. Defaults to the terminal
>     width, or 80 when no terminal is available.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -w
>
>     Alias of --width.
>
> helion named-entities
> :   List the entity types usable for 'guid'. I.e. the types of the
>     named entities known to the client.
>
>     + options
>
>     --json
>
>     Print raw json as output, not human-formatted data.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion quota exit
> :   Exit the shell. No-op if not in a shell.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
> helion quota help *\<cmdname\>*
> :   Retrieve help for a command or command set. Without arguments help
>     for all commands is given. The default format is --full.
>
>     + options
>
>     --by-category
>
>     Activate by-category form of the help.
>
>     --full
>
>     Activate full form of the help.
>
>     --json
>
>     Activate json form of the help.
>
>     --list
>
>     Activate list form of the help.
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     --short
>
>     Activate short form of the help.
>
>     --width
>
>     The line width to format the help for. Defaults to the terminal
>     width, or 80 when no terminal is available.
>
>     -n
>
>     Alias of --no-prompt.
>
>     -w
>
>     Alias of --width.
>
> helion trace
> :   Print the saved REST trace for the last client command to stdout.
>
>     + options
>
>     --no-prompt
>
>     Disable interactive queries.
>
>     --non-interactive
>
>      
>
>     Alias of --no-prompt.
>
>     --noprompt
>
>     Alias of --no-prompt.
>
>     -n
>
>     Alias of --no-prompt.
>
>     \</div\>\</div\>
>
### [Table Of Contents](/als/v1/index-2/)

-   [Application Lifecycle Service Client Command Reference](#)
    -   [Usage](#usage)
        -   [Getting Started](#getting-started)
        -   [Applications](#applications)
        -   [Services](#services)
        -   [Organizations](#organizations)
        -   [Spaces](#spaces)
        -   [Routes](#routes)
        -   [Domains](#domains)
        -   [Administration](#administration)
        -   [Convenience](#convenience)
        -   [Miscellaneous](#miscellaneous)

