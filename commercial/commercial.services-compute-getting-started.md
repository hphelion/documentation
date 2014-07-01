---
layout: default
title: "Getting Started with HP Helion OpenStack&#174; Compute Service "
permalink: /helion/openstack/services/compute/getting-started/
product: commercial

---
# Getting Started with HP Helion OpenStack&#174; Compute #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

Leveraging OpenStack&reg; Compute, the HP Helion OpenStack&#174; Compute service provides a way to instantiate virtual servers on publicly accessible physical machines hosted in HP data centers. Key terms include:

- Flavor - A unique combination of disk space, memory capacity, and CPU
- Image - A collection of files used as a base installation, typically an operating system such as Ubuntu 10.10 or something similar.
- Server - An instance created out of a Flavor + an Image

A variety of flavors and images are provided by the Compute service that can be used to create a wide mix of servers.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack&#174; Dashboard](/helion/openstack/services/dashboard/overview/) to work with the HP Compute service.

###Using the API to access Networking### {#API}
 
You can use a low-level, raw REST API access to the Compute service. See the [HP Cloud v13.5 Compute Service API page](/api/v13/compute).

###Using the CLI### {#cli}

You can use any of several command-line interface software to access the Compute service. See [HP Cloud CLI](/cli/).

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/) The *Architecture* section contains useful information about how an OpenStack Cloud is put together. However, the HP Helion OpenStack&#174; edition takes care of these details for you. The *Operations* contains information on how to manage the system.

<!-- hide me Also see the Help topics that are available in the Operational Dashboard and Administration Dashboard.  Website copies are available:

* [HP Cloud OS Operational Dashboard Help](/helion/openstack/manage/operational-dashboard/)
* [HP Cloud OS Administration Dashboard Help](/helion/openstack/manage/administration-dashboard/) -->