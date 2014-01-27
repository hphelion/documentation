---
layout: default
title: "UNIX CLI CDN Examples"
permalink: /cli/unix/2/cdn/
product: unix-cli

---
# UNIX CLI v13.5 CDN Examples

If you are using v12.12, click [here](https://docs.hpcloud.com/cli/unix/cdn) for documentation.
___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life (EOL) Cycle process toward final deprecation. Please be aware that this does not mean that the UNIX CLI is "going away", but simply that HP Cloud is relinquishing its ownership of this CLI and, instead, making it available on the [HPCloud Github](https://github.com/hpcloud/unix_cli) repository. We encourage existing customers to consider migrating to the OpenStackClient (Unified) CLIs. As such, during this 6-month transition timeframe, HP Cloud will be dedicating engineering efforts around the OpenStackClient CLI as the primary Unified CLI of choice for development around your OpenStack cloud services.

We wanted to ensure you were aware of the changes that may affect you during this 6-month transition time:

+ The UNIX CLI has moved to the HP Cloud Github repository

  + In order to encourage development by the community, HP Cloud is sharing it with the community as open source, hosted on [https://github.com/hpcloud/unix_cli](https://github.com/hpcloud/unix_cli).
 
  + However, [links to 12.12 and 13.5 UNIX CLI downloads](#downloads), and all documentation, are still currently available on docs.hpcloud.com, as usual.

+ Bugs will be addressed

  + Although the CLI has moved into the open source community, showstoppers and significant defects will be examined and addressed by the HP Cloud SDK/CLI team on a case-by-case basis.

After 6 months, access to online resources will be available through GitHub, and no support will be offered from HP Public Cloud. Of course, you are most welcome to access the install from GitHub and continue your development ([HPCloud Github](https://github.com/hpcloud/unix_cli)).

_________________________________________

This page discusses CDN tasks and provides a few examples of how to perform them using  HP Cloud:

* [Listing Containers](#ListingContainers)
* [Adding Containers](#AddingContainers)
* [Getting the Location of Containers](#GettingContainerLocation)
* [Getting the Value of an Attribute of a Container](#GettingAttributeValue)
* [Setting the Value of an Attribute of a Container](#SettingAttributeValue)
* [Removing Containers](#RemovingContainers)

For detailed help for any command/task, run the following command:

    $ hpcloud help <TASK>

##Listing Containers## {#ListingContainers}

To list the available CDN-enabled containers, run:

    $ hpcloud cdn:containers
    demorama

##Adding Containers## {#AddingContainers}

To add an existing CDN-enabled container, run:

    $ hpcloud cdn:containers:add demorama2
    Added container 'demorama2' to the CDN.

##Getting the Location of Containers## {#GettingContainerLocation}

To get the location of an existing CDN-enabled container, run:

    $ hpcloud cdn:containers:location demorama2
    http://ha7828c283acdf403a69c74a35b5f8d97.cdn.hpcloudsvc.com

##Getting the Value of a Container Attribute## {#GettingAttributeValue}

To get the CDN-enabled container attribute, run:

    $ hpcloud cdn:containers:get demorama2 X-Ttl
    86400

##Setting the Value of a Container Attribute## {#SettingAttributeValue}

To set the value of a CDN-enabled container attribute, run:

    $ hpcloud cdn:containers:set demorama2 X-Ttl 900
    The attribute 'X-Ttl' with value '900' was set on CDN container 'demorama2'.

##Removing Containers## {#RemovingContainers}

To remove an existing CDN-enabled container, run:

    $ hpcloud cdn:containers:remove demorama2
    Removed container 'demorama2' from the CDN.
