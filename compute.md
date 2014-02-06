---
layout: default
title: "HP Cloud Compute Overview"
permalink: /compute/
product: compute

---
# HP Cloud Compute Overview

<!-- <iframe src="http://player.vimeo.com/video/33922384?title=0&amp;byline=0&amp;portrait=0" width="580" height="420" frameborder="0"> </iframe> -->

Leveraging [OpenStack Compute](http://openstack.org/projects/compute/), HP Cloud compute provides a way to instantiate virtual servers on publicly accessible physical machines hosted in HP data centers.  Key terms include:

* **Flavor** - A unique combination of disk space, memory capacity, and CPU
* **Image** - A collection of files used as a base installation, typically an operating system such as Ubuntu 10.10 or something similar.
* **Server** - An instance created out of a **Flavor** + an **Image**

A variety of flavors and images are provided by HP Cloud compute that can be used to create a wide mix of servers.  The best way to learn more is to start using it yourself over at the [Management Console](https://console.hpcloud.com).  If you have any questions, try our [Forums](https://community.hpcloud.com) where you can learn from our own internal experts as well as other users in the HP Public Cloud community.

HP Cloud currently offers two versions of our cloud&mdash;v12.12 and the latest v13.5. See the [Version Overview](/version-overview) page for a description of what's new in v13.5.

**Note**: For security purposes, when you create a server, it is automatically assigned a floating, non-removable IP address.

## API
Do you need low level, raw REST API access to HP Cloud compute?  Take a look at the Compute API page for the version of HP Cloud you are using:

* [**Compute API page for v13.5**](/api/v13/compute)
* [**Compute API page for v12.12**](/api/compute)

## Bindings
If you are looking for an easier to use, language-specific way of using HP Cloud compute, check out our [Bindings section](/bindings).

## CLI
Want scriptable access you can put in a cron job or something similar?  Go on over to our [CLI documentation](/cli).

## For further information

Check out the following pages for more information on using HP Cloud compute services:

* [Ruby Fog bindings compute examples](/bindings/fog/compute/)
* [CLI UNIX compute examples](/cli/unix/compute/)
* [Windows PowerShell CLI compute examples](/cli/windows/compute/)
* [Management console compute dashboard information](/mc/compute/)
