---
layout: default-devplatform
permalink: /als/v1/admin/best-practices/logging-examples/
---

Log Drain Examples[](#log-drain-examples "Permalink to this headline")
=======================================================================

Detailed instructions on how to use drains with third party log analysis
software or services:

-   [*Papertrail*](#logging-examples-papertrail)
-   [*Loggly*](#logging-examples-loggly)
-   [*Splunk*](#logging-examples-splunk)

**Note**

Do not forward both application and system logs to the same destination.

Papertrail[](#papertrail "Permalink to this headline")
-------------------------------------------------------

1.  [Create an account for Papertrail](https://papertrailapp.com/plans)
2.  In the Dashboard screen, click *Add Systems*.

 <img src="/content/devplatform/stackato/images/ppt1.png" />

3.  In the Setup Systems screen under *Other log methods*, click
    *Alternatives*.

 <img src="/content/devplatform/stackato/images/ppt2.png" />

4.  Choose option C: *My system's hostname changes* and give it a
    suitable name.

 <img src="/content/devplatform/stackato/images/ppt3.png" />

5.  Note down the **port number**. You need this later on.

 <img src="/content/devplatform/stackato/images/ppt4.png" />

Enable system logging (via udp) by executing the following kato command:

``` {.literal-block}
kato log drain add drain-name udp://logs.papertrailapp.com:port#
```

**Note**

Papertrail requires systail log lines to have `<13>l`{.docutils
.literal} at the beginnging of each line. Make sure the drain you are
forwarding is formatted this way (see example in [*Saving Custom Log
Formats*](/als/v1/admin/server/logging/#logging-drains-save-format)).

Loggly[](#loggly "Permalink to this headline")
-----------------------------------------------

1.  [Create an account for Loggly](https://app.loggly.com/pricing)
2.  Under *Incoming Data* tab, click *Add Input*.

 <img src="/content/devplatform/stackato/images/loggly1.png" />

3.  In the Add Input screen:

-   Choose *Syslog UDP or TCP*
-   Choose *Combination Log Type*
-   [Optional] For JSON Logging, Choose UDP or TCP **with Stripe** and
    enable **JSON Logging**. (for system logs)

 <img src="/content/devplatform/stackato/images/loggly2.png" />

4.  If we want to accept logs from any Application Lifecycle Service nodes or applications
    modify Allowed Devices section:

-   Click *Add device*

 <img src="/content/devplatform/stackato/images/loggly3.png" />

-   Add IP Address 0.0.0.0/0 when prompted

 <img src="/content/devplatform/stackato/images/loggly4.png" />

5.  Turn off discovery since we allowed all devices. Also, note down the
    **port number**.

 <img src="/content/devplatform/stackato/images/loggly5.png" />

Enable system logging by executing the following kato command:

``` {.literal-block}
kato log drain add drain-name udp://logs.loggly.com:port#
```

OR

``` {.literal-block}
kato log drain add drain-name tcp://logs.loggly.com:port#
```

Loggly supports JSON format with minor configuration changes shown
above.

Enable system JSON logging by executing the following kato command:

``` {.literal-block}
kato log drain add --format json drain-name tcp://logs.loggly.com:port#
```

Splunk[](#splunk "Permalink to this headline")
-----------------------------------------------

1.  [Setup Splunk Server](http://www.splunk.com/download).
2.  In the welcome screen, click *Add data*

 <img src="/content/devplatform/stackato/images/splunk1.png" />

3.  Under *Choose a Data Source*, click “From a TCP port”. (or UDP)

 <img src="/content/devplatform/stackato/images/splunk2.png" />

4.  In the Add new Source screen:

-   Select a TCP/UDP port greater than **9999**
-   Give it a suitable **Source name**.
-   Set sourcetype to **Manual**
-   Leave Source Type **empty**

 <img src="/content/devplatform/stackato/images/splunk3.png" />

Enable system logging by executing the following kato command:

``` {.literal-block}
kato log drain add drain-name udp://splunk-server-address:port#
```

OR

``` {.literal-block}
kato log drain add drain-name tcp://splunk-server-address:port#
```

Splunk supports JSON format without further configuration.

Enable system JSON logging by executing the following kato command:

``` {.literal-block}
kato log drain add --format json drain-name tcp://splunk-server-address:port#
```

Hello World Custom Drain[](#hello-world-custom-drain "Permalink to this headline")
-----------------------------------------------------------------------------------

The command below starts a drain target server on a node, piping to a
local file:

    nc -lk 0.0.0.0 10000 > log-output.txt

As long as that nc command runs, this will funnel logs from all drains
targeting it into the file log-output.txt

Enable system logging by executing the following kato command:

``` {.literal-block}
kato log drain add drain-name udp://server-address:port#
```

OR

``` {.literal-block}
kato log drain add drain-name tcp://server-address:port#
```

### [Table Of Contents](/als/v1/index-2/)

-   [Log Drain Examples](#)
    -   [Papertrail](#papertrail)
    -   [Loggly](#loggly)
    -   [Splunk](#splunk)
    -   [Hello World Custom Drain](#hello-world-custom-drain)

