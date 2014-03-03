---
layout: default
title: "UNIX CLI CDN Examples"
permalink: /cli/unix/2/cdn/
product: unix-cli

---
# UNIX CLI CDN Examples

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
