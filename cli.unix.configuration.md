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
* [List Accounts](#ListAccounts)
* [Display Credentials for an Account](#DisplayCredsforAccount)
* [Copy an Account](#CopyAccount)
* [Assigning an Account as Default](#AssigningDefault)
* [Remove an Account](#RemoveAccount)
* [Specifying an Account for a Single Operation](#DefiningAccountsPerCommand)
* [Specifying an Availability Zone for a Single Operation](#DefiningAZsPerCommand)
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

When you use the `account:edit` command and you specify the `account_name` and `name_value_pairs`, the command will run without prompts.  For example, you wanted to change the storage availability zone for the `hp` account:

    $ hpcloud account:edit hp storage_availability_zone=region-b.geo-1

## List Accounts ## {#ListAccounts}
To view all your current accounts, use the [`account:list`](/cli/unix/reference#account) command:

     $ hpcloud account:list
     hp <= default
     account_1
     my_account_3

## Display Credentials for an Account ## {#DisplayCredsforAccount}
To view a specific account&#039;s credentials, use the [`account <account_name>`](/cli/unix/reference#account) command.

     $ hpcloud account account_1
     credentials:
       account_id: '229721xxxxxxx'
       secret_key: EueAi5RxxxxxxxxxUXAotdYDluP
       auth_uri: https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/
       tenant_id: '6642xxxxxxxx05'
     zones:
       compute_availability_zone: az-1.region-a.geo-1
       storage_availability_zone: region-b.geo-1
       cdn_availability_zone: region-a.geo-1
       block_availability_zone: az-1.region-a.geo-1
     options: {}

### Copy an Account ### {#CopyAccount}
To copy an existing account to a new account use the `account:copy <source_account_name> <new_account_name>` command.  This command will also overlay an existing account:

     $ hpcloud account:copy hp account_2 
     Account 'hp' copied to 'account_2'

## Assigning an Account as Default ## {#AssigningDefault}
When you execute a CLI command without designating a specific account with the *-a* option, the default account is used. You can redefine the default account by using the [`account:use <account_name>`](/cli/unix/reference#account:use) command:

     $ hpcloud account:use account_2
     Account 'account_2' is now the default

## Verify an Account ## {#VerifyAccount}
To verify an existing account, use the [`account:verify <account_name>`](/cli/unix/reference#account:verify) command:

     $ hpcloud account:use account_2
     Verifying 'account_2' account...
     Connected to 'account_2' successfully

## Remove an Account ## {#RemoveAccount}
To remove an existing account, use the [`account:remove <account_name>`](/cli/unix/reference#account:remove) command:

     $ hpcloud account:remove account_2
     Removed account 'account_2'

## Specifying an Account for a Single Operation ## {#DefiningAccountsPerCommand}
Account name can be specified for a single command line operation and does not affect your account’s base credentials. To run a command on an account other than the default account use the `-a` option.

To show the servers on `account2` rather than the default:

    $ hpcloud servers -a account2

Most commands allow you to use the `-a` option; see the [UNIX CLI Reference page](/cli/unix/reference) to determine if a particular command supports the option.

## Specifying an Availability Zone for a Single Operation ## {#DefiningAZsPerCommand}
Availability Zone can be specified for a single command line operation and does not affect your account’s base credentials. You can use this switch to quickly perform an operation in another availability zone not specified in your profile. To run a command on a different availability zone, use the `-z` option.  You can see [the full list of current availability zones](#ListofAZs) down at the bottom of this page.

To view servers using the `az-2.region-a.geo-1` availability zone:

    $ hpcloud servers -z az-2.region-a.geo-1
    
Most commands allow you to use the `-z` option; see the [UNIX CLI Reference page](/cli/unix/reference) to determine if a particular command supports the option.

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
