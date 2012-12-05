---
layout: default
title: "UNIX CLI: Managing Multiple Accounts"
permalink: /cli/unix/account-management/
product: unix-cli

---
# UNIX CLI: Managing Multiple Accounts

The UNIX CLI allows you to have multiple accounts within the application. You can manage the credentials of each account separately. When you install and enter credentials, the *default* account is created. If you perform an operation without specifying another account with *-a* tag, the default account is used. 

The following lists the commands related to how to manage multiple accounts within the UNIX CLI.

* [List Accounts](#ListAccounts)
* [Display Credentials for an Account](#DisplayCredsforAccount)
* [Create a New Account](#CreateNewAccount)
* [Assigning an Account as Default](#AssigningDefault)
* [Remove an Account](#RemoveAccount)

## List Accounts ## {#ListAccounts}
To view all your current accounts, use the [`account:list`](/cli/unix/reference#account) command:

     $ hpcloud account:list
     default <= default
     account_1
     my_account_3

## Display Credentials for an Account ## {#DisplayCredsforAccount}
To view a specific account's credentials, use the [`account <account_name>`](/cli/unix/reference#account) command.

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

To see the credentials of the account currently set as *default*, specify **default** as the account name in the command:

     $ hpcloud account default

### Create a New Account ### {#CreateNewAccount}
To create a new account, use a currently created account (*default* if you have no other accounts set up) and copy its credentials to create a new account by supply the new account name, `account:copy <source_account_name>  <new_account_name>`:

     $ hpcloud account:copy default account_2 
     Account 'default' copied to 'account_2'

## Assigning an Account as Default ## {#AssigningDefault}
When you execute a CLI command without designating a specific account with the *-a* option, the default account is used. You can redefine the default account by using the [`account:use <account_name>`](/cli/unix/reference#account:use) command:

     $ hpcloud account:use account_2
     Account 'account_2' is now the default

## Remove an Account ## {#RemoveAccount}

To remove an existing account, use the [`account:remove <account_name>`](/cli/unix/reference#account:remove) command:

     $ hpcloud account:remove account_2
     Removed account 'account_2'
