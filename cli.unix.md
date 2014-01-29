---
layout: default
title: "Unix Command Line Interface"
permalink: /cli/unix/
product: unix-cli

---
# Unix Command Line Interface

___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life (EOL) Cycle process toward final deprecation. Please be aware that this does not mean that the UNIX CLI is "going away", but simply that HP Cloud is relinquishing its ownership of this CLI and, instead, making it available on the [HPCloud Github](https://github.com/hpcloud/unix_cli) repository. We want to encourage existing customers to eventually consider migrating to the OpenStackClient (Unified) CLIs. As such, during this 6-month transition timeframe, HP Cloud will be dedicating engineering efforts around the OpenStackClient CLI as the primary Unified CLI of choice for development around your OpenStack cloud services.

We wanted to ensure you were aware of the changes that may affect you during this 6-month transition time:

+ The UNIX CLI has moved to the HP Cloud Github repository

  + In order to encourage development by the community, HP Cloud is sharing it with the community as open source, hosted on [https://github.com/hpcloud/unix_cli](https://github.com/hpcloud/unix_cli). 
  + However, [links to 12.12 and 13.5 UNIX CLI downloads](#downloads), and all documentation, are still currently available on docs.hpcloud.com, as usual.
+ Bugs will be addressed

  + Although the CLI has moved into the open source community, showstoppers and significant defects will be examined and addressed by the HP Cloud SDK/CLI team on a case-by-case basis.

After 6 months, access to online resources will be available through GitHub, and no support will be offered from HP Public Cloud. Of course, you are most welcome to access the install from GitHub and continue your development ([HPCloud Github](https://github.com/hpcloud/unix_cli)).

_________________________________________

The Unix Command Line Interface is a tool which allows Unix or Mac users to manage their HP Cloud from the command line or automated through scripts.  There is no need to understand the underlying REST API or XML document format to use the Unix CLI.  There are two versions of the Unix CLI: the 2.0 version for HP Cloud version 13.5 and the 1.9 version for HP Cloud version 12.12. We recommend that you move to version v13.5, but during the transition you can still find the documentation for v12.12 here.

Access the following documentation and resources:

* [Version 13.5 documentation](#135)
* [Version 12.12 documentation](#1212)
* [Download the software](#downloads)
* [For more information](#articles)

##Version 13.5 (Unix CLI 2.0) documenation {#135}

* [Installation](/cli/unix/2/install)
* [Account Configuration](/cli/unix/2/configuration)
* [Advanced Account Management](/cli/unix/2/account-management)
* [Compute Examples](/cli/unix/2/compute)
* [Object Storage Examples](/cli/unix/2/object-storage)
* [CDN Examples](/cli/unix/2/cdn)
* [Block Storage Examples](/cli/unix/2/block-storage)
* [Volume Management](/block-storage/volume)
* [DNS Examples](/cli/unix/2/dns)
* [CLI Reference](/cli/unix/2/reference)
* [Release Notes](/cli/unix/release-notes)

##Version 12.12 (Unix CLI 1.9) documenation {#1212}

* [Installation](/cli/unix/install)
* [Account Configuration](/cli/unix/configuration)
* [Advanced Account Management](/cli/unix/account-management)
* [Compute Examples](/cli/unix/compute)
* [Object Storage Examples](/cli/unix/object-storage)
* [CDN Examples](/cli/unix/cdn)
* [Block Storage Examples](/cli/unix/block-storage)
* [Volume Management](/block-storage/volume)
* [DNS Examples](/cli/unix/dns)
* [CLI Reference](/cli/unix/reference)
* [Release Notes](/cli/unix/release-notes)

For some release-by-release information, take a look at [the UNIX CLI release notes](/cli/unix/release-notes)!

##Download the software## {#downloads}

Download the HP Cloud environment command-line interface (CLI) software for UNIX CLI for the HP Cloud version you are using:

+ [**HP Cloud version 13.5** environment CLI software for UNIX CLI](http://rubygems.org/gems/hpcloud)
+ [**HP Cloud version 12.12** environment CLI software for UNIX CLI](/file/hpcloud.gem)

##For more information## {#articles}

For additional tips and How-tos on using your UNIX command-line interface (CLI), see [UNIX CLI: Articles on to use the UNIX CLI](/cli/unix/articles/):

* [Using bash command completion](/cli/unix/articles/complete)
* [Generating verbose debugging output](/cli/unix/articles/debugging)
* [Accessing servers with managed key pairs](/cli/unix/articles/managedkeypairs)
* [Performing object store migration](/cli/unix/articles/migration)
* [Generating custom reports](/cli/unix/articles/reports)
* [Performing large file uploads](/cli/unix/articles/large)
* [Creating servers with user data](/cli/unix/articles/userdata)
* [Modifying report paging](/cli/unix/articles/paging)
* [Creating servers with custom personality](/cli/unix/articles/personality)
* [Creating servers with custom user data](/cli/unix/articles/userdata)
