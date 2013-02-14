---
layout: default
title: "Unix Command Line Interface: Object Store Migration"
permalink: /cli/unix/articles/migration
product: unix-cli
categories: cli linux object store migration
tags: cli linux object store migration aws rackspace google
---
#UNIX CLI: Performing UNIX Object Storage Migration#

The Unix CLI now supports migration of object store data from AWS, Google and Rackspace to HPCS.  Objects from the store may be copied recursively from one account to another.  It may be possible to migrate data from other providers, but these three have been tested.

To get started migrating your data, [download and install the latest Unix CLI client](/cli/unix/install) and set up your HPCS account as the default.  Next, create a UNIX CLI account with the credentials of the source from which you wish to migrate objects.  The `account:setup` command now supports the `-p` option which can be used to specify an alternate provider.  If the option is used with AWS, Google or Rackspace, the command will prompt you for the provider appropriate credentials and attempt to verify the account.  The account will only work for the purposes of migration.  For example, if I wanted to migrate from the Rackspace sharkey account:

    $ hpcloud account:setup -p rackspace sharkey
    ****** Setup your Rackspace sharkey account ******
    Username: [sharkey] 
    API Key: [4ade0XXXXXXXXXXXXXXXXXXXXXXXXXXX] 
    Verifying your Rackspace account...
    Account credentials for Rackspace have been edited.
    Accounts for providers other than HP are only supported for migration
    $

Some simple commands such as `list` may work with this account:

    $ hpcloud list -a sharkey
    tuna
    $

Once the account is set up, you may use the migrate command to recursively copy data from the source account into your HPCS account.  For example, if you were moving files from the "tuna" container in the sharkey account to the "tarpon" container in your HPCS account:

    $ hpcloud migrate sharkey :tuna :tarpon
    Excon requests with a block are deprecated, pass :response_block instead
    WGI_0078.JPG: |===============================================|
    Excon requests with a block are deprecated, pass :response_block instead
    WGI_0080.JPG: |===============================================|
    Migrated :tuna => :tarpon
    $


You may safely ignore the deprecation message.  The last part of the object name will be printed during the migration, but the full names of objects are preserved.
