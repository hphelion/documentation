---
layout: default
title: "HP Helion OpenStack: Installation and Configuration"
permalink: /cloudos/commercial/install/
product: commercial

---



<p style="font-size: small;"> <a href="/cloudos/commercial/">&#9664; PREV</a> | <a href="/cloudos/commercial/">&#9650; UP</a> | <a href="/cloudos/commercial/">NEXT &#9654;</a> </p>

# HP Helion OpenStack: Installation and Configuration
The following topics explain how to install and configure HP Helion OpenStack cloud with the HP Helion OpenStack platform. It is important to read through these topics, before starting your installation.

* [Prerequisites](#prerequisites)

* [Before you begin](#before-you-begin)

* [Installing your cloud](#installing-your-cloud)

* [After you install](#after-you-install)

  * [Launch the Operational Dashboard](#launch-the-operational-dashboard)

  * [Launch the Administration Dashboard](#launch-the-administration-dashboard)

## Prerequisites

Before you start your installation and configuration, we recommend you review the [Technical overview](/cloudos/commercial/technical-overview), [Reference architecture](/cloudsos/commercial/reference-archtecture), and the [Services overview](/cloudos/commercial/services/overview).

To install HP Helion OpenStack, you must have a 64-bit Linux machine with at least 16 GB of memory to act as the host of the seed VM.

QUESTION: Are there any other Prereqs?

## Before you begin

Before you install HP Helion OpenStack, you have to perform a few tasks:

- Set up the disk configuration of the undercloud and overcloud servers
    - steps needed or link to information
- Configure the physical network connecting the undercloud and overcloud servers
    - steps needed or link to information
- Capture all required configuration information
    - steps needed or link to information
- Verify that the seed VM, the undercloud and overcloud servers, and network are correctly configured
    - steps needed or link to information

## Installing your cloud

QUESTION: Are these steps representative of the truth?

1. Launch HP Helion OpenStack Download page
2. Download the seed ISO Image (single-click)
3. Boot the seed ISO image (VM on a laptop)
4. Identify the physical server for undercloud
5. Identify the physical servers for overcloud
6. Determine the number of controller and comp nodes
7. Download overcloud images from CODN
8. Use Heat templates to deploy the overcloud

Currently, you will use the CLI to install HP Helion OpenStack. However, first you need to obtain your installation package. To do this:

1. step one
2. step two
3. step three
4. ...

Now that you have your installation package, follow the steps below to install HP Helion OpenStack.

1. Installation steps needed...



## After you install

From Gavin: "We will provide a simple means of running a set of tests to act as a health check. Exact mechanism to launch the tests is TBD."

QUESTIONS:

- What does a user do after they install? Are there any post-install configuration steps?

- Do they log in to CODN to authenticate after installing commercial?



### Launch the Operational Dashboard

To launch the Operational Dashboard:

1. From the VM, open a Mozilla Firefox or Google Chrome browser that has the appropriate IP addresses set as proxy exceptions.

2. In the browser, enter your URL, for example, **http://192.168.124.10:9000**, to launch the Operational Dashboard user interface. 

3. On the Environment tab, review the types of prerequisites, servers, connections, and networks in your environment.

### Launch the Administration Dashboard

To access the Administration Dashboard:

1. Get the IP address of your main control plane node using **<yet to be defined process>**.

2. Open a Mozilla Firefox or Google Chrome browser pointing to this IP address.

3. Log in as the **admin** user with the admin password that is provided using **<yet to be defined process>**.



QUESTION: Is the following true for this release? Gavin responded - "Re pre-defined login creds I cannot comment at this point. The admin password MAY be hard-coded into images provided, or MAY be randomly generated during install."

In the current release, the dashboards use pre-defined login credentials. These are not published in the web-hosted documentation. To get the pre-defined login credentials, refer to the readme file included in the same ZIP that contained the HP Helion OpenStack ISO. 



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
