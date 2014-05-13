---
layout: default
title: "HP NAME OpenStack Community Edition: Installation and Configuration"
permalink: /cloudos/community/install/
product: community

---


<p style="font-size: small;"> <a href="/cloudos/community/">&#9664; PREV</a> | <a href="/cloudos/community/">&#9650; UP</a> | <a href="/cloudos/community/">NEXT &#9654;</a> </p>

# HP NAME OpenStack&reg; Community Edition: Installation and Configuration
The following topics explain how to install and configure HP NAME OpenStack Community cloud with the HP NAME OpenStack Community platform. It is important to read through these topics, before starting your installation.

* [Prerequisites](#prerequisites)

* [Before you begin](#before-you-begin)

* [Installing your cloud](#installing-your-cloud)

* [After you install](#after-you-install)

  * [Launch the Operational Dashboard](#launch-the-operational-dashboard)

  * [Launch the Administration Dashboard](#launch-the-administration-dashboard)

## Prerequisites

Before you start your installation and configuration, we recommend you review the [Technical overview](/cloudos/community/technical-overview), [Reference architecture](/cloudsos/community/reference-archtecture), and the [Services overview](/cloudos/community/services/overview).

To install HP OpenStack Community Edition, you must have a 64-bit Linux machine with at least 16 GB of memory to act as the host of the seed VM.

QUESTION: Are there any other Prereqs?

## Before you begin

Before you install HP OpenStack Community Edition, you have to perform a few tasks:

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

1. Launch HP OpenStack Community Download page
2. Download the seed ISO Image (single-click)
3. Boot the seed ISO image (VM on a laptop)
4. Identify the physical server for undercloud
5. Identify the physical servers for overcloud
6. Determine the number of controller and comp nodes
7. Download overcloud images from CODN
8. Use Heat templates to deploy the overcloud


Currently, you will use the CLI to install HP OpenStack Community edition. However, first you need to obtain your installation package. 
<!-- To do this:

1. step one
2. step two
3. step three
4. ...

Now that you have your installation package, follow the steps below to install HP OpenStack Community Edition.

1. Installation steps needed...
-->

## After you install

From Gavin: "We will provide a simple means of running a set of tests to act as a health check. Exact mechanism to launch the tests is TBD."

QUESTIONS:

- What does a user do after they install? Are there any post-install configuration steps?

- Do they log in to CODN to authenticate after installing Community?


### Launch the Dashboard

To launch the Dashboard:

1. From the VM, open a Mozilla Firefox or Google Chrome browser that has the appropriate IP addresses set as proxy exceptions.

2. In the browser, enter your URL, for example, **http://192.168.124.10**, to launch the Dashboard user interface.

3. Log in as an administrator using the default password you were provided.

	**Note:** When the system is first installed, you may have a *demo* account defined. You can create a user account by logging in as the admin user, and creating a user account for yourself. 

4. On the Environment tab, review the types of prerequisites, servers, connections, and networks in your environment.

QUESTION: Is the following true for this release? Gavin responded - "Re pre-defined login creds I cannot comment at this point. The admin password MAY be hard-coded into images provided, or MAY be randomly generated during install."

In the current release, the dashboards use pre-defined login credentials. These are not published in the web-hosted documentation. To get the pre-defined login credentials, refer to the readme file included in the same ZIP that contained the HP OpenStack Community Edition ISO. 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>
