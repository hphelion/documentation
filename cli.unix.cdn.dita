---
layout: default
title: "UNIX CLI for HP Helion Public Cloud CDN Examples"
permalink: /cli/unix/cdn/
product: unix-cli
published: false

---
<!--PUBLISHED-->
# UNIX CLI for HP Helion Public Cloud CDN Examples for v12.12

___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

HP Helion Public Cloud has contributed the Unix CLI back to the open source community, and you can get support, access the documentation, and download the source code [here](https://github.com/hpcloud/unix_cli).

_________________________________________

This page gives you a few examples of how to perform various CDN tasks using the HP Helion Public Cloud service.  This page discusses the following tasks:

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
    demorama

##Adding Containers## {#AddingContainers}

To add an existing CDN-enabled container:

    $ hpcloud cdn:containers:add demorama2
    Added container 'demorama2' to the CDN.

##Getting the Location of Containers## {#GettingContainerLocation}

To get the location of an existing CDN-enabled container:

    $ hpcloud cdn:containers:location demorama2
    http://ha7828c283acdf403a69c74a35b5f8d97.cdn.hpcloudsvc.com

##Getting the Value of an Attribute of a Container## {#GettingAttributeValue}

To get the value of an attribute of a CDN-enabled container:

    $ hpcloud cdn:containers:get demorama2 X-Ttl
    86400

##Setting the Value of an Attribute of a Container## {#SettingAttributeValue}

To set the value of an attribute of a CDN-enabled container:

    $ hpcloud cdn:containers:set demorama2 X-Ttl 900
    The attribute 'X-Ttl' with value '900' was set on CDN container 'demorama2'.

##Removing Containers## {#RemovingContainers}

To remove an existing CDN-enabled container:

    $ hpcloud cdn:containers:remove demorama2
    Removed container 'demorama2' from the CDN.


##Related topics

* [Installation](/cli/unix/install/)
* [Account Configuration](/cli/unix/configuration/)
* [Advanced Account Management](/cli/unix/account-management/)
* [Compute Examples](/cli/unix/compute/)
* [Object Storage Examples](/cli/unix/object-storage/)
* [Block Storage Examples](/cli/unix/block-storage/)
* [Volume Management](/block-storage/volume/)
* [DNS Examples](/cli/unix/dns/)
* [CLI Reference](/cli/unix/reference/)
