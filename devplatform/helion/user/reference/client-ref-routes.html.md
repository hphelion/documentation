---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/routes/
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Routes

- [Routes](#routes)
 	- [helion delete-route](#command-delete-route)
	- [helion routes](#command-routes)

### Routes[](#routes "Permalink to this headline")###
### helion delete-route *\<name\*###
Delete the named route. This is an Application Lifecycle Service 3 specific command.

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
    </tr>    <tr><td>--space</td>
    <td>The name of the space to use as context.
    Defaults to the current space.
    A current space is automatically set if there is none, either by
    taking the one space the user has, or asking the user to choose
    among the possibilities.</td>
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
###helion routes###
List all available routes. This is an Application Lifecycle Service 3 specific command.

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