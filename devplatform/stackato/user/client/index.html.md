---
layout: default-devplatform
permalink: /als/v1/user/client/
---
<!--PUBLISHED-->

Application Lifecycle Service Client[](#helion-client "Permalink to this headline")
=================================================================

The `helion` client is the command-line interface
to Application Lifecycle Service. You can use it to push application code up to the server,
start and stop applications, create data services and link them to
applications, and a number of other application management operations.

The [*Command
Reference*](/als/v1/user/reference/client-ref/#command-ref-client) has full
descriptions of all client commands and options. These details are also
available at the command line via the `helion help`{.docutils
.literal} command.

Application Lifecycle Service Client Setup[](#helion-client-setup "Permalink to this headline")
-----------------------------------------------------------------------------

1.  Download the client for your platform (Windows, OS X, Linux x86,
    Linux x64)
2.  Unzip the archive in a convenient directory.
3.  Add the the executable to your system/shell \$PATH by:

> -   moving it to a directory in your \$PATH,
> -   creating a symlink from a directory in your \$PATH, or
> -   creating a shell alias for the executable.

4.  Confirm that the client is installed correctly by running
    `helion help`.

**Note**

Using the Windows `helion` client with
[Cygwin](http://www.cygwin.com/) is not supported.

Getting Help[](#getting-help "Permalink to this headline")
-----------------------------------------------------------

To get a list of available commands or help on a particular command:

    $ helion help [COMMAND]

See also the [*Command
Reference*](/als/v1/user/reference/client-ref/#command-ref-client) for a full
list of commands.

Targeting the API Endpoint[](#targeting-the-api-endpoint "Permalink to this headline")
---------------------------------------------------------------------------------------

Before you can use the client, you must set the target URL (also known
as the API Endpoint). This tells the client where it will be pushing
applications. For example:

    $ helion target api.helion.example.com

For a micro cloud VM, it might be something like:

    $ helion target api.helion-xxxx.local

HTTP Proxies[](#http-proxies "Permalink to this headline")
-----------------------------------------------------------

If there is an HTTP/HTTPS proxy on your network between your client and
the Application Lifecycle Service API endpoint, set the following environment variables in
your shell as appropriate for your proxy:

-   https\_proxy (e.g. "https://yourproxy.example.com:443/")
-   http\_proxy (e.g. "http://yourproxy.example.com:8080/")
-   http\_proxy\_user
-   http\_proxy\_pass

With these set, the client will recognize these settings and route
appropriately. On Windows the client queries the Internet Settings
values so this step should not be necessary.

Removing the Client[](#removing-the-client "Permalink to this headline")
-------------------------------------------------------------------------

To uninstall the client, simply delete the executable and remove any
aliases or \$PATH modifications you have made for it.

### [Table Of Contents](/als/v1/index-2/)

-   [Application Lifecycle Service Client](#)
    -   [Application Lifecycle Service Client Setup](#helion-client-setup)
    -   [Getting Help](#getting-help)
    -   [Targeting the API Endpoint](#targeting-the-api-endpoint)
    -   [HTTP Proxies](#http-proxies)
    -   [Removing the Client](#removing-the-client)

