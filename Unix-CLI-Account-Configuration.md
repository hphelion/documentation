---
layout: default
title: "Unix CLI: Account Configuration"
permalink: /cli/unix/configuration/
product: unix-cli

---
# Unix CLI: Account Configuration

This page discusses how to set up an accounts and using the HP Cloud Unix Command Line Interface.

* [Account Setup](#AccountSetup)
* [Account Edit](#EditAccount)
* [Updating Account Availability Zones](#ChangingAvailabilityZones)
* [Updating Account Credentials](#ModifyingAccountCredentials)
* [Updating Account Options](#ModifyingAccountOptions)
* [Specifying an Account for a Single Operation](#DefiningAccountsPerCommand)
* [Specifying an Availability Zone for a Single Operation](#DefiningAZsPerCommand)
<!--* [Using Other Important Account Commands](#UsingOtherImportantAccountCommands) -->
* [Full List of Current Availability Zones](#ListofAZs)

Remember that you can get detailed help for any command/task with the following command:

        $ hpcloud help <TASK>

## Account Setup ## {#AccountSetup}

The first thing you should do is set up an account.   To configure a new account, use the `account:setup` command.  The `account:setup` command prompts you for the values needed to create or modify an account:

    $ hpcloud account:setup

During a new configuration, you must supply the access key, secret key, and tenant ID that were assigned to you during the registration process; you can [find these in the system console](https://console.hpcloud.com/account/api_keys) by selecting `API Keys` on the dashboard or account page.  You can also define the availability zone during the initial setup.

## Edit Account ## {#EditAccount}

Executing the `account:edit` command with no arguments prompts the user in the same manner as the `account:setup` command, but for editing purposes. Current values are shown by default. Hit return to accept the current settings at each prompt.

    $ hpcloud account:edit

<!--When you execute the `account` command, the available configured accounts are displayed:

    $ hpcloud account
    default
    primary
    pro
    secondary

If you specify an account, the configuration of that account is displayed:

    $ hpcloud account primary
    credentials:
      account_id: '8ECJ3xxxxxxxxxxxxxxx'
      secret_key: 'PoJCRtriEsxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
      auth_uri: https://cs.aw1.hpcloud.net:35357/v2.0/
      tenant_id: '3850xxxxxxxxxx'
    zones: {}
    options: {}
-->

## Updating Account Availability Zones ## {#ChangingAvailabilityZones}

You can use the `account:update` command to change the availability zone for a particular service (compute, for example), a particular credential or account option. The `account:update` command is used to change account variables with a single command line rather than using the prompt method of `account:edit`.

The `account:update` requires two arguments: `account_name` and the `name_value_pair.

To change the availability zone of the object storage to region b:

(**Note**: Need to specify `default` if you have no other accounts created. To view all accounts, use the `hpcloud account` command.)

    hpcloud account:update default storage_availability_zone=region-b.geo-1

To change the availability zone of the compute service from its current setting to AZ2 for the account `account2`:

    hpcloud account:update account2 compute_availability_zone= az-2.region-a.geo-1

A full list of values for the availability zone variable can be found [here](#ListofAZs).

To display the active availability zones for your services, you can [find them in the system console](https://console.hpcloud.com/account/api_keys) by selecting `API Keys` on the dashboard or account page. 

## Updating Account Credentials ## {#ModifyingAccountCredentials}

You can use the `account:update` command to change any of the following account credentials:

* `account_id` 
* `secret_key`
* `auth_uri`
* `tenant_id`

The `account:update` requires two arguments: `account_name` and the `name_value_pair.

To change the access key:

(**Note**: Need to specify `default` if you have no other accounts created. To view all accounts, use the `hpcloud account` command.)

    hpcloud account:update default tenant_id=xxxxxxxxxxxxx     

## Updating Account Options ## {#ModifyingAccountOptions}

You can use the `account:update` command to change any of the following account options:

* `connect_timeout *seconds*`
* `read_timeout *seconds*`
* `write_timeout *seconds*`
* `ssl_verify_peer *true/false*`
* `ssl_ca_path *file_path*` 
* `ssl_ca_file *file_name*` 
* `preferred_flavor *flavor id* `
* `preferred_image *image id*`

The `account:update` requires two arguments: `account_name` and the `name_value_pair.

To change the connection timeout value:

(**Note**: Need to specify `default` if you have no other accounts created. To view all accounts, use the `hpcloud account` command.)

    hpcloud account:update default connect_timeout=40

## Specifying an Account for a Single Operation ## {#DefiningAccountsPerCommand}

Account name can be specified for a single command line operation and does not affect your account’s base credentials. You can use this switch to quickly perform an operation as another account other than `default`. To run a command on an account other than the `default` account use the `-a` option.

To manage servers using `account2` rather than the default:

    hpcloud servers –a account2

Most commands allow you to use the `-a` option; see the [UNIX CLI Reference page](/cli/unix/reference) to determine if a particular command supports the option.

## Specifying an Availability Zone for a Single Operation ## {#DefiningAZsPerCommand}

Availability Zone can be specified for a single command line operation and does not affect your account’s base credentials. You can use this switch to quickly perform an operation in another availability zone not specified in your profile.To run a command on a different availability zone, use the `-z` option.  You can see [the full list of current availability zones](#ListofAZs) down at the bottom of this page.

To view servers using the `az-2.region-a.geo-1` availability zone:

    hpcloud servers –z az-2.region-a.geo-1
    
To view volumes using the `aaz-3.region-a.geo-1` availability zone:

    hpcloud volumes –z az-3.region-a.geo-1
    
To view containers using the `region-b.geo-1` availability zone:

    hpcloud containers –z region-b.geo-1

To view security groups using the `az-1.region-a.geo-1` availability zone:

    hpcloud securitygroups –z az-1.region-a.geo-1     

To view flavors using the `az-3.region-a.geo-1` availability zone:

    hpcloud flavors –z az-3.region-a.geo-1     

Most commands allow you to use the `-z` option; see the [UNIX CLI Reference page](/cli/unix/reference) to determine if a particular command supports the option.

<!-- <h2 id="UsingOtherImportantAccountCommands">Using Other Important Account Commands</h2>

To copy an account configuration (for example, to make a backup copy of a configuration):

    $ hpcloud account:copy primary backup
    Account 'primary' copied to 'backup'

To use an account configuration as the default:

    $ hpcloud account:use primary
    Account 'primary' copied to 'default'

To remove an account:

    $ hpcloud account:remove backup
    Removed account 'backup'
-->

## Full List of Current Availability Zones ## {#ListofAZs}

The current usable availability zones for the compute service (`compute_availability_zone`):

* `az-1.region-a.geo-1`
* `az-2.region-a.geo-1`
* `az-3.region-a.geo-1`

The current usable availability zones for the object storage service (`storage_availability_zone`):

* `region-a.geo-1`
* `region-b.geo-1`

The current usable availability zones for the block storage service (`block_availability_zone`):

* `az-1.region-a.geo-1`
* `az-2.region-a.geo-1`
* `az-3.region-a.geo-1`