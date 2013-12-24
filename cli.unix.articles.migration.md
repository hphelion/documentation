---
layout: default
title: "Unix Command Line Interface: Object Store Migration"
permalink: /cli/unix/articles/migration/
product: unix-cli
categories: cli linux object store migration
tags: cli linux object store migration aws rackspace google
---
#UNIX CLI: Performing UNIX object storage migration#

___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

After 6-months, access to online resources will still be available, but no support will be offered from HP Public Cloud, and the software download will be disabled—although you are most welcome to continue development at your discretion! HP Cloud has contributed the Unix CLI back to the open source community, and you can access the source code, documentation, and downloads [here](https://github.com/hpcloud/unix_cli).

_________________________________________

You can use the Unix CLI to migrate object store data from other cloud storage providers to your HP Cloud object storage containers.  You can copy objects individually, or perform a recursive copy of multiple files.

You can perform object migration from the AWS, Google, and Rackspace services.  You may be able to migrate objects from other providers but that functionality is not currently supported.

* [Getting started migrating your data](#GettingStarted)
* [Performing a migration](#Performing)

##Getting started migrating your data## {#GettingStarted}

First you need to [download and install the latest Unix CLI client](/cli/unix/install) and set up your HP Public Cloud account as the default.  Next, create a UNIX CLI account with the credentials of the source from which you wish to migrate objects.  Use the `-p` option of the [`account:setup`](/cli/unix/reference#account:setup) to specify an alternate provider.  If you use the `-p` option with AWS, Google or Rackspace, you are prompted to enter the provider-appropriate credentials, and the `account:setup` command attempts to verify the account.  

**Note**: You can use this account only to perform migrations.  

To create a UNIX CLI account to be used to migrate objects from the account `sharkey` on the Rackspace server:

    $ hpcloud account:setup -p rackspace sharkey
    ****** Setup your Rackspace sharkey account ******
    Username: [sharkey] 
    API Key: [4ade0XXXXXXXXXXXXXXXXXXXXXXXXXXX] 
    Verifying your Rackspace account...
    Account credentials for Rackspace have been edited.
    Accounts for providers other than HP are only supported for migration
    $

You can use simple commands such as `list` with this account:

    $ hpcloud list -a sharkey
    tuna
    $

##Performing a migration## {#Performing}

Once you have set up an account, you can use the [`migrate`] (/cli/unix/reference#migrate) command to recursively copy data from the source account into your HP Public Cloud account.  

To move files from the `tuna` container in the Rackspace `sharkey` account to the `tarpon` container in your HP Public Cloud account:

    $ hpcloud migrate sharkey :tuna :tarpon
    Excon requests with a block are deprecated, pass :response_block instead
    WGI_0078.JPG: |===============================================|
    Excon requests with a block are deprecated, pass :response_block instead
    WGI_0080.JPG: |===============================================|
    Migrated :tuna => :tarpon
    $


You can ignore the deprecation message.  The last part of the object name is displayed during the migration, but the full names of objects are preserved.
