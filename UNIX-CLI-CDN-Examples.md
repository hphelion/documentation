---
layout: default
title: "UNIX CLI CDN Examples"
permalink: /cli/unix/cdn/

---
# UNIX CLI CDN Examples

This page gives you a few examples of how to perform various CDN tasks using the HP Cloud service.  This page discusses the following tasks:

* [Listing Containers](#ListingContainers)
* [Adding Containers](#AddingContainers)
* [Getting the Location of Containers](#GettingContainerLocation)
* [Getting the Value of an Attribute of a Container](#GettingAttributeValue)
* [Setting the Value of an Attribute of a Container](#SettingAttributeValue)
* [Removing Containers](#RemovingContainers)

You can get detailed help for any command/task with the following command:

        $ hpcloud help <TASK>

##Listing Containers## {#ListingContainers}

To list the available CDN-enabled containers:

        $ hpcloud cdn:containers
        # => demorama

##Adding Containers## {#AddingContainers}

To add an existing CDN-enabled container:

        $ hpcloud cdn:containers:add demorama2
        # => Added container 'demorama2' to the CDN.

##Getting the Location of Containers## {#GettingContainerLocation}

To get the location of an existing CDN-enabled container:

        $ hpcloud cdn:containers:location demorama2
        # => http://ha7828c283acdf403a69c74a35b5f8d97.cdn.hpcloudsvc.com

##Getting the Value of an Attribute of a Container## {#GettingAttributeValue}

To get the value of an attribute of a CDN-enabled container:

        $ hpcloud cdn:containers:get demorama2 X-Ttl
        # => 86400

##Setting the Value of an Attribute of a Container## {#SettingAttributeValue}

To set the value of an attribute of a CDN-enabled container:

        $ hpcloud cdn:containers:set demorama2 X-Ttl 900
        # => The attribute 'X-Ttl' with value '900' was set on CDN container 'demorama2'.

##Removing Containers## {#RemovingContainers}

To remove an existing CDN-enabled container:

        $ hpcloud cdn:containers:remove demorama2
        # => Removed container 'demorama2' from the CDN.
