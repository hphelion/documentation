---
layout: default
title: "UNIX CLI: Advanced Account Management"
permalink: /cli/unix/account-management/
product: unix-cli

---
# UNIX CLI: Advanced Account Management

You may use the `account:edit` command in a non interactive mode if you specify one or more `name_value_pairs` of the settings you wish to modify.  There are options available through the command line that are not available through the interactive prompts.

* [Updating Account Availability Zones](#ChangingAvailabilityZones)
* [Updating Account Credentials](#ModifyingAccountCredentials)
* [Updating Account Options](#ModifyingAccountOptions)

## Updating Account Availability Zones ## {#ChangingAvailabilityZones}

You can use the `account:edit` command to change the availability zones for a particular service.  The `account:edit` requires two arguments: `account_name` and one or more `name_value_pairs`.

To change the availability zone of the object storage and CDN to region b:

    $ hpcloud account:edit hp storage_availability_zone=region-b.geo-1 cdn_availability_zone=region-b.geo-1

To change the availability zone of the compute service from its current setting to AZ2 for the account `account2`:

    $ hpcloud account:edit account2 compute_availability_zone=az-2.region-a.geo-1

To display the active availability zones for your services, you can [find them in the system console](https://console.hpcloud.com/account/api_keys) by selecting `API Keys` on the dashboard or account page. 

## Updating Account Credentials ## {#ModifyingAccountCredentials}

You can use the `account:edit` command to change any of the following account credentials:

* `account_id` 
* `secret_key`
* `auth_uri`
* `tenant_id`

The `account:edit` requires two arguments: `account_name` and the `name_value_pair.

To change the access key for the `hp` account:

    $ hpcloud account:edit hp tenant_id=xxxxxxxxxxxxx     

## Updating Account Options ## {#ModifyingAccountOptions}

You can use the `account:edit` command to change any of the following account options:

* `connect_timeout *seconds*`
* `read_timeout *seconds*`
* `write_timeout *seconds*`
* `ssl_verify_peer *true/false*`
* `ssl_ca_path *file_path*` 
* `ssl_ca_file *file_name*` 
* `preferred_flavor *flavor id* `
* `preferred_image *image id*`

The `account:edit` requires two arguments: `account_name` and the `name_value_pair.

To change the connection timeout value for the `hp` account:

    $ hpcloud account:edit hp connect_timeout=40

