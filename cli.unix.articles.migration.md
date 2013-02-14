---
layout: default
title: "Unix Command Line Interface: Object Store Migration"
permalink: /cli/unix/articles/migration
product: unix-cli
categories: cli linux object store migration
tags: cli linux object store migration aws rackspace google
---
#UNIX CLI: Performing UNIX Object Storage Migration#

You can use the Unix CLI to migrate object store data from other cloud storage providers to your HP Cloud Services (HPCS) object storage containers.  You can copy objects individually, or perform a recursive copy of multiple files.

You can perform object migration from the AWS, Google, and Rackspace services.  You may be able to migrate objects from other providers but that functionality is not currently supported.

* [Getting started migrating your data](#GettingStarted)
* [Performing a migration](#Performing)

##Getting Started Migrating Your Data## {#GettingStarted}

First you need to [download and install the latest Unix CLI client](/cli/unix/install) and set up your HPCS account as the default.  Next, create a UNIX CLI account with the credentials of the source from which you wish to migrate objects.  Use the `-p` option of the [`account:setup`](/cli/unix/reference#account:setup) to specify an alternate provider.  If you use the `-p` option with AWS, Google or Rackspace, you are prompted to enter the provider-appropriate credentials, and the `account:setup` command attempts to verify the account.  

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

##Performing a Migration## {#Performing}

Once you have set up an account, you can use the [`migrate`] (/cli/unix/reference#migrate) command to recursively copy data from the source account into your HPCS account.  

To move files from the `tuna` container in the Rackspace `sharkey` account to the `tarpon` container in your HPCS account:

    $ hpcloud migrate sharkey :tuna :tarpon
    Excon requests with a block are deprecated, pass :response_block instead
    WGI_0078.JPG: |===============================================|
    Excon requests with a block are deprecated, pass :response_block instead
    WGI_0080.JPG: |===============================================|
    Migrated :tuna => :tarpon
    $


You can ignore the deprecation message.  The last part of the object name is displayed during the migration, but the full names of objects are preserved.
