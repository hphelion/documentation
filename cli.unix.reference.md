---
layout: default
title: "UNIX CLI: Command Line Reference"
permalink: /cli/unix/reference/
product: unix-cli

---
#UNIX CLI Command Line Reference

Below you can find a full reference of supported UNIX command-line interface (CLI) commands. The commands are alphabetized.  You can also use the <font face="Courier">hpcloud help [<em>command</em>]</font> tool (where <em>command</em> is the name of the command on which you want help, for example <font face="Courier">account:setup</font>) to display usage, description, and option information from the command line.

##account## {#account}
List your accounts and account settings.

###Syntax
`hpcloud account [account_name]`

###Description
List your accounts and your account settings.

###Examples
List your accounts and account settings:

    hpcloud account

List your accounts and account settings:

    hpcloud account:list

List your accounts and account settings for domain `useast`:

    hpcloud account:list useast

###Aliases
`account:list`

##account:copy## {#account:copy}
Copy account data to the specified account.

###Syntax
`hpcloud account:copy <from_account> <to_account>`

###Description
The copy command overwrites the destination account with the source account information.

###Examples
Copy account `useast` to account `backup`:

    hpcloud account:copy useast backup


##account:edit## {#account:edit}
Create or edit your account credentials.

###Syntax
`hpcloud account:edit <account_name> [name_value_pair ...]`

###Options
<dl>
<dt><b>-n, [--no-validate]</b></dt><dd>Don't verify account settings during edit</dd>  
<dt><b>-p, [--provider=PROVIDER]</b></dt><dd>Cloud provider for migration: AWS, Rackspace, or Google</dd>  
</dl>

###Description
Create or edit your account credentials. If you do not specify an account name on the command line, the default account is updated.  If you do not specify name value pairs, you are prompted to input the account values.

You  need your Access Key Id, Secret Key and Tenant Id from the HP Cloud web site to set up your account. Optionally, you can specify your own endpoint to access, but in most cases we recommend you use the default.

Availability zones typically have the format `az-1.region-a.geo-1` or `region-a.geo-1`, depending on the service.  See your account API keys page to see your list of activated availability zones: https://console.hpcloud.com/account/api_keys

You can re-run this command at any time to modify your settings.

The interactive mode prompts you for the following values:

* Access Key Id
* Secret Key
* Auth Uri
* Tenant Id
* Compute zone
* Storage zone
* Block zone

The command line mode allows you to set the following values:

* account_id
* secret_key
* auth_uri
* tenant_id
* compute_availability_zone
* storage_availability_zone
* cdn_availability_zone
* block_availability_zone
* connect_timeout
* read_timeout
* write_timeout
* ssl_verify_peer
* ssl_ca_path
* ssl_ca_file
* preferred_flavor
* preferred_win_image
* preferred_image

###Examples
Create or edit the default account interactively:

    hpcloud account:setup

Edit the default account settings interactively:

    hpcloud account:edit

Set the account credential authorization URI to `https://127.0.0.1` and the block availability zone to `az-2.region-a.geo-1`:

    hpcloud account:edit pro auth_uri='https://127.0.0.1/' block_availability_zone='az-2.region-a.geo-1'

Create a Rackspace account for migration

    hpcloud account:setup rackspace -p rackspace

###Aliases
`account:add, account:setup, account:update`

##account:remove## {#account:remove}
Remove accounts.

###Syntax
`hpcloud account:remove account_name [account_name ...]`

###Description
Remove accounts.  You may specify one or more account to remove on the command line.

###Examples
Remove the `useast` and `uswest` accounts:

    hpcloud account:remove useast uswest

###Aliases
`account:rm, account:delete, account:del`

##account:setup## {#account:setup}
Create or edit your account credentials.

###Syntax
`hpcloud account:edit <account_name> [name_value_pair ...]`

###Options
<dl>
<dt><b>-n, [--no-validate]</b></dt><dd>Don't verify account settings during edit</dd>  
<dt><b>-p, [--provider=PROVIDER]</b></dt><dd>Cloud provider for migration: AWS, Rackspace, or Google</dd>  
</dl>

###Description
Create or edit your account credentials. If you do not specify an account name on the command line, the default account is updated.  If you do not specify name value pairs, you are prompted to input the account values.

You  need your Access Key Id, Secret Key and Tenant Id from the HP Cloud web site to set up your account. Optionally, you can specify your own endpoint to access, but in most cases we recommend you use the default.

Availability zones typically have the format `az-1.region-a.geo-1` or `region-a.geo-1`, depending on the service.  See your account API keys page to see your list of activated availability zones: https://console.hpcloud.com/account/api_keys

You can re-run this command at any time to modify your settings.

The interactive mode prompts you for the following values:

* Access Key Id
* Secret Key
* Auth Uri
* Tenant Id
* Compute zone
* Storage zone
* Block zone

The command line mode allows you to set the following values:

* account_id
* secret_key
* auth_uri
* tenant_id
* compute_availability_zone
* storage_availability_zone
* cdn_availability_zone
* block_availability_zone
* connect_timeout
* read_timeout
* write_timeout
* ssl_verify_peer
* ssl_ca_path
* ssl_ca_file
* preferred_flavor
* preferred_win_image
* preferred_image

###Examples
Create or edit the default account interactively:

    hpcloud account:setup

Edit the default account settings interactively:

    hpcloud account:edit

Set the account credential authorization URI to `https://127.0.0.1` and the block availability zone to `az-2.region-a.geo-1`:

    hpcloud account:edit pro auth_uri='https://127.0.0.1/' block_availability_zone='az-2.region-a.geo-1'

Create a Rackspace account for migration

    hpcloud account:setup rackspace -p rackspace

###Aliases
`account:add, account:setup, account:update`

##account:use## {#account:use}
Set the named account to the default account.

###Syntax
`hpcloud account:use <account_to_use>`

###Description
Use the specified account as your default account.  Any command executed without the `-a` account_name option uses this account.

###Examples
Set the default account to `useast`:

    hpcloud account:use useast


##account:verify## {#account:verify}
Verify the credentials of the specified account.

###Syntax
`hpcloud account:verify <account_to_verify>`

###Options
<dl>
[<dt><b>--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
</dl>

###Description
Verify the credentials of an account.

###Examples
Verify the `useast` account credentials:

    hpcloud account:verify useast


##acl## {#acl}
View the ACL for an object or container.

###Syntax
`hpcloud acl <object/container>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
View the access control list (ACL) for a container or object. Optionally, you can specify an availability zone.

###Examples
Display the ACL for the object 'my_file.txt':

    hpcloud acl :my_container/my_file.txt

Display the ACL for the container 'my_container':

    hpcloud acl :my_container

Display the ACL for the container 'my_container' for availability zone `region-a.geo-1`:

    hpcloud acl :my_container -z region-a.geo-1


##acl:grant## {#acl:grant}
Grant the specified permissions.

###Syntax
`hpcloud acl:grant <container> <permissions> [user ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Set the access control list (ACL) values for the specified container. The supported permissions are `r` (read), `w` (write), or `rw` (read and write). You may specify one or more user for the given permission.  If you do not specify a user, the permissions are set to public.  Public write permissions are not allowed.

###Examples
Allow anyone to read 'my_container'

    hpcloud acl:grant :my_container r

Allow Bob and Sally to read and write 'my_container'

    hpcloud acl:grant :my_container rw bob@example.com sally@example.com

Give Billy read permissions to 'my_container'

    hpcloud acl:grant :my_container r billy@example.com

###Aliases
`acl:set`

##acl:revoke## {#acl:revoke}
Revoke the specified permissions.

###Syntax
`hpcloud acl:revoke <container> <permissions> [user ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Revoke the access control list (ACL) values from the specified container. The supported permissions are `r` (read), `w` (write), or `rw` (read and write). You may specify one or more user fo the given permission.  If you do not specify a user, the permissions are set to public.  Public write permissions are not allowed.

###Examples
Revoke public read from 'my_container'

    hpcloud acl:revoke :my_container public-read

Revoke read and write from bob@example.com from 'my_container'

    hpcloud acl:revoke :my_container rw bob@example.com


##addresses## {#addresses}
Display list of available addresses.

###Syntax
`hpcloud addresses [ip_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the available addresses for your account. You may filter the addresses listed by specifying one or more IPs or IDs on the command line.  Optionally, you can specify an availability zone.

###Examples
List addresses:

    hpcloud addresses

List address information for IP address 127.0.0.2:

    hpcloud addresses 127.0.0.2

List addresses for availability zone `az-2.region-a.geo-1`:

    hpcloud addresses -z az-2.region-a.geo-1

###Aliases
`addresses:list`

##addresses:add## {#addresses:add}
Add or allocate a new public IP address.

###Syntax
`hpcloud addresses:add`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add or allocate a new public IP address from the pool of available IP addresses.  Optionally, you can set an availability zone.

###Examples
Add a new public IP address:

    hpcloud addresses:add

Add a new public IP address in availability zone `az-2.region-a.geo-1`:

    hpcloud addresses:add -z az-2.region-a.geo-1

###Aliases
`addresses:allocate`

##addresses:associate## {#addresses:associate}
Associate a public IP address to a server instance.

###Syntax
`hpcloud addresses:associate <ip_or_id> <server_name_or_id>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Associate an existing and unassigned public IP address, to the specified server instance.  Optionally, you can specify an availability.

###Examples
Associate the address `111.111.111.111` to server `myserver`:

    hpcloud addresses:associate 111.111.111.111 myserver

Associate the address `111.111.111.111` to server `myserver` in availability zone `az-2.region-a.geo-1`:

    hpcloud addresses:associate 111.111.111.111 myserver -z az-2.region-a.geo-1


##addresses:disassociate## {#addresses:disassociate}
Disassociate any server instance associated to the public IP address.

###Syntax
`hpcloud addresses:disassociate ip_or_id [ip_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Disassociate any server instance associated to the public IP address. The public IP address is not removed or released to the pool. Optionally, you can specify an availability zone.

###Examples
Disassociate IP addresses `111.111.111.111` and `127.0.0.1` from the default server:

    hpcloud addresses:disassociate 111.111.111.111 127.0.0.1

Disassociate the address with the ID  '9709':

    hpcloud addresses:disassociate 9709

Disassociate the address `111.111.111.111` for availability zone `az-2.region-a.geo-1`:

    hpcloud addresses:disassociate 111.111.111.111 -z az-2.region-a.geo-1


##addresses:remove## {#addresses:remove}
Remove or release a public IP address.

###Syntax
`hpcloud addresses:remove ip_or_id [ip_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove or release a previously allocated public IP address. Any server instances that were associated to this address are disassociated. You may specify one ore more address IPs or IDs on the command line.  Optionally, you can specify an availability zone.

###Examples
Remove IP address '111.111.111.111':

    hpcloud addresses:remove 111.111.111.111

Remove addresses with the IDs '1078' and '3709':

    hpcloud addresses:remove 1078 3709

Remove IP address '111.111.111.111' for availability zone `az-2.region-a.geo-1`:

    hpcloud addresses:remove 111.111.111.111 -z az-2.region-a.geo-1

###Aliases
`addresses:rm, addresses:delete, addresses:release, addresses:del`

##cdn:containers## {#cdn:containers}
List available containers on the CDN.

###Syntax
`hpcloud cdn:containers`

###Options
<dl>
<dt><b>-l, [--all]</b></dt><dd>List all the CDN containers, either enabled or disabled.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the available containers on the content delivery network (CDN). Optionally, you can specify an availability zone.

###Examples
List only the CDN-enabled containers:

    hpcloud cdn:containers

List all the container on the CDN:

    hpcloud cdn:containers -l

List only the CDN-enabled containers for availability zone `region-a.geo-1`:

    hpcloud cdn:containers -z region-a.geo-1

###Aliases
`cdn:containers:list`

##cdn:containers:add## {#cdn:containers:add}
Add containers to the CDN.

###Syntax
`hpcloud cdn:containers:add name [name ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add existing containers from your storage account to the CDN. Container names can be specified with or without the preceding colon: `my_container` or `:my_container`. Optionally, you can specify an availability zone.

###Examples
Add the containers`tainer1` and `tainer2` to the CDN:

    hpcloud cdn:containers:add :tainer1 :tainer2

Add the container `my_cdn_container` to the CDN in the  availability zone `region-a.geo`:

    hpcloud cdn:containers:add :my_cdn_container -z region-a.geo-1


##cdn:containers:get## {#cdn:containers:get}
Get the value of an attribute of a CDN container.

###Syntax
`hpcloud cdn:containers:get <name> <attribute>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Get the value of an attribute for an existing CDN container. The allowed attributes whose value can be retrieved are:
* `X-Ttl`
* `X-Cdn-Uri`
* `X-Cdn-Enabled`
* `X-Log-Retention`.

Optionally, you can specify an availability zone.

###Examples
Get the value of the attribute 'X-Ttl':

    hpcloud cdn:containers:get :my_cdn_container "X-Ttl"

Get the value of the attribute 'X-Cdn-Uri':

    hpcloud cdn:containers:get :my_cdn_container "X-Cdn-Uri"

Get the value of the attribute `X-Ttl` for availability zone `regioni-a.geo`:

    hpcloud cdn:containers:get :my_cdn_container "X-Ttl" -z region-a.geo-1


##cdn:containers:location## {#cdn:containers:location}
Get the location of a container on the CDN.

###Syntax
`hpcloud cdn:containers:location <name>`

###Options
<dl>
<dt><b>-s, [--ssl]</b></dt><dd>Print the SSL version of the URL.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Get the location of an existing container on the CDN. Optionally, you can specify an availability zone.

###Examples
Get the location of the container 'my_cdn_container':

    hpcloud cdn:containers:location :my_cdn_container

Get the location of the container `my_cdn_container` for availability zone `region-a.geo-1`:

    hpcloud cdn:containers:location :my_cdn_container -z region-a.geo-1

###Aliases
`cdn:containers:loc`

##cdn:containers:remove## {#cdn:containers:remove}
Remove containers from the CDN.

###Syntax
`hpcloud cdn:containers:remove name [name ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove containers from the CDN. Optionally, you can specify an availability zone.

###Examples
Delete the containers `:tainer1` and `:tainer2` from the CDN:

    hpcloud cdn:containers:remove :tainer1 :tainer2

Delete the container `my_cdn_container for the availability zone `region-a.geo-1` from the CDN:

    hpcloud cdn:containers:remove :my_cdn_container -z region-a.geo-1

###Aliases
`cdn:containers:rm, cdn:containers:delete, cdn:containers:del`

##cdn:containers:set## {#cdn:containers:set}
Set attributes on a CDN container.

###Syntax
`hpcloud cdn:containers:set <name> <attribute> <value>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Set attributes for an existing CDN container by specifying their values. The allowed attributes that can be set are:

* `X-Ttl`
* `X-Cdn-Uri`
* `X-Cdn-Enabled`
* `X-Log-Retention`.

Optionally, you can specify an availability zone.

###Examples
Set the attribute 'X-Ttl' to 900:

    hpcloud cdn:containers:set :my_cdn_container "X-Ttl" 900

Set the attribute 'X-Cdn-Uri' to http://my.home.com/cdn :

    hpcloud cdn:containers:set :my_cdn_container "X-Cdn-Uri" "http://my.home.com/cdn"

Set the attribute `X-Ttl` to 900 for availability zoneregion-a.geo-1`:

    hpcloud cdn:containers:set :my_cdn_container "X-Ttl" 900 -z region-a.geo-1


##complete## {#complete}
Installs the bash completion file.

###Syntax
`hpcloud complete`

###Description
Installs the HP Cloud bash completion file.  If you run this command as the root user, the file is installed in a system-wide directory (if one is available).  Otherwise, the file is installed  in the `~/.bash_completion.d/` directory.  The `~/.bash_completion.d/` directory is not run by default; you must run the completion script explicitly.

###Examples
Installs the HP Cloud bash completion file.

    hpcloud complete


##config## {#config}
List the current configuration settings.

###Syntax
`hpcloud config`

###Description
List the current configuration settings.

###Examples
List the current configuration settings:

    hpcloud config

###Aliases
`config:list`

##config:set## {#config:set}
Set values in the configuration file.

###Syntax
`hpcloud config:set key=value [key=value ...]`

###Description
Set values in the configuration file.  You may specify multiple name value pairs separated by spaces on a single command line.  Valid settings include:

* connect_timeout (in seconds)
* read_timeout (in seconds)
* write_timeout (in seconds)

###Examples
Set the read timeout to 120 seconds:

    hpcloud config:set read_timeout=120

Set the write timeout to 60 seconds and the read timeout to 60 seconds:

    hpcloud config:set write_timeout=60 read_time=60

###Aliases
`config:add, config:update`

##containers:add## {#containers:add}
Add a container.

###Syntax
`hpcloud containers:add name [name ...]`

###Options
<dl>
<dt><b>-f, [--force]</b></dt><dd>Don't prompt if container name is not a valid virtual host.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a new container to your storage account. You may creeate multiple containers by specifying more than one container name on the command line.  You can specify the ontainer name  with or without the preceding colon: `my_container` or `:my_container`. Optionally, you can specify an availability zone.

###Examples
Create a new container called 'my_container':

    hpcloud containers:add :my_container

Create two new containers called 'con' and 'tainer':

    hpcloud containers:add :con :tainer

Create the container `my_container` for the availability zone `region-a.geo-1`:

    hpcloud containers:add :my_container -z region-a.geo-1


##containers:remove## {#containers:remove}
Remove a containers.

###Syntax
`hpcloud containers:remove name [name ...]`

###Options
<dl>
<dt><b>-f, [--force]</b></dt><dd>Force removal of non-empty containers.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove one or more containers. By default this command removes a container if it is empty, but you may use the `--force` flag to delete non-empty containers.  Be careful with this flag or you could have a really bad day.

###Examples
Delete 'my_container' (if empty):

    hpcloud containers:remove :my_container

Delete 'tainer1' and 'tainer2' (if empty):

    hpcloud containers:remove :tainer1 :tainer2

Delete `my container` (regardless of contents):

    hpcloud containers:remove :my_container --force

Delete the container `my_container` for availability zone 'region-a.geo-1`:

    hpcloud containers:remove :my_container -z region-a.geo-1

###Aliases
`containers:rm, containers:delete, containers:del`

##copy## {#copy}
Copy files from one resource to another.

###Syntax
`hpcloud copy <source> [source ...] <destination>`

###Options
<dl>
<dt><b>-m, [--mime=MIME]</b></dt><dd>Set the MIME type of the remote object.</dd>  
<dt><b>-s, [--source-account=SOURCE_ACCOUNT]</b></dt><dd>Source account name.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Copy a file between your file system and a container, inside a container, or between containers. You may copy multiple files to a directory or container on one command line.  Optionally, you can specify an availability zone.  Note that a leading colon `:` is required when you specify a container; for example `:my_container`.

###Examples
Copy the file `my_file.txt` to container 'my_container':

    hpcloud copy my_file.txt :my_container

Copy the file `file.txt` from container `my_container` to your local system:

    hpcloud copy :my_container/file.txt file.txt

Copy the file `today` to new location `old/weds` inside container `logs`:

    hpcloud copy :logs/today :logs/old/weds

Copy file.txt from container `one` to container `two`:

    hpcloud copy :one/file.txt :two/file.txt

Copy container `one` to the `/usr/local` directory on your local system:

    hpcloud copy :one /usr/local

Copy directory `/usr/local` to container `two`:

    hpcloud copy /usr/local :two

Copy text files `one.txt` and `two.txt` to  container `numbers`:

    hpcloud copy one.txt two.txt :numbers

Copy the file `my_file.txt` to container 'my_container' for availability zone `region-a.geo-1`:

    hpcloud copy my_file.txt :my_container -z region-a.geo-1

###Aliases
`cp`
``

##flavors## {#flavors}
List available flavors.

###Syntax
`hpcloud flavors [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the flavors in your compute account. You may filter the output by specifying the names or IDs of the flavors you wish to see.  Optionally, you can specify an availability zone.

###Examples
List the flavors:

    hpcloud flavors

List the flavors `xsmall` and `small`:

    hpcloud flavors xsmall small

List the flavors for  availability zone `az-2.region-a.geo-1`:

    hpcloud flavors -z az-2.region-a.geo-1

###Aliases
`flavors:list`

##get## {#get}
Fetch objects to your local directory.

###Syntax
`hpcloud get object [object ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Copy remote objects from a container to your current directory. Optionally, you can specify an availability zone.

###Examples
Copy `file.txt` and `resume.txt` to your current directory:

    hpcloud get :my_container/file.txt :my_container/resume.txt

Copy `file.txt` to your current directory for availability zone `region-a.geo-1`:

    hpcloud get :my_container/file.txt -z region-a.geo-1

###Aliases
`fetch`

##help## {#help}
Describe available tasks or one specific task

###Syntax
`hpcloud help [TASK]``Describe available tasks or one specific task`
##images## {#images}
List the available images in your compute account.

###Syntax
`hpcloud images [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the images in your compute account. You may filter the images displayed by specifying one ore more image names or IDs on the command line.  Optionally, you can specify an availability zone.

###Examples
List the images:

    hpcloud images

List image '1239':

    hpcloud images 1239

List images for availability zone `az-2.region-a.geo-1`:

    hpcloud images -z az-2.region-a.geo-1

###Aliases
`images:list`

##images:add## {#images:add}
Add an image from an existing server.

###Syntax
`hpcloud images:add <name> <server_name>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
<dt><b>-m, [--metadata=METADATA]</b></dt><dd>Set the meta data.</dd>  
</dl>

###Description
Add a new image from an existing server to your compute account. Optionally, you may specify metadata or an availability zone.

###Examples
Create the new image 'my_image' from the existing server named 'my_server':

    hpcloud images:add my_image my_server

Create the new image 'my_image' from the existing server 'my_server' with metadata:

    hpcloud images:add my_image my_server -m this=that

Create the new image `my_image` from the existing server `my_server` in  availability zone `az-2.region-a.geo-1`:

    hpcloud images:add my_image my_server -z az-2.region-a.geo-1


##images:metadata## {#images:metadata}
List the metadata for an image.

###Syntax
`hpcloud images:metadata <image_name_or_id>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the metadata for an image in your compute account. You may specify either the name or ID of the image.  Optionally, you may specify an availability zone.

###Examples
List the metadata for image 'Skynet':

    hpcloud images:metadata Skynet

List the metadata for image '1151':

    hpcloud images:metadata '1151'

List the metadata for image `565394` for availability zone `az-2.region-a.geo-1`:

    hpcloud images:metadata -z az-2.region-a.geo-1 565394

###Aliases
`images:metadata:list`

##images:metadata:add## {#images:metadata:add}
Add metadata to an image.

###Syntax
`hpcloud images:metadata:add <name> <metadata>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add metadata to a image in your compute account.  You may specify the mage name or ID.  If metadata already exists, it is updated.  You must specify the Mmetadata as a comma separated list of name value pairs.  Optionally, you may specify an availability zone.

###Examples
Add the specified metadata to the image (if the metadata exists, it is updated):

    hpcloud images:metadata:add my_image 'r2=d2,c3=po'

###Aliases
`images:metadata:update`

##images:metadata:remove## {#images:metadata:remove}
Remove metadata from an image.

###Syntax
`hpcloud images:metadata:remove <image_name_or_id> [metadata_key ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove metadata from an image in your compute account.  You may specify an image name or ID.  Optionally, you may specify an availability zone.

###Examples
Remove the specified metadata from the image:

    hpcloud images:metadata:remove my_image r2 c3

###Aliases
`images:metadata:rm`

##images:remove## {#images:remove}
Remove images by name or identifier.

###Syntax
`hpcloud images:remove name_or_id [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove existing images by specifying thier names or IDs. Optionally, you may specify an availability zone.

###Examples
Delete image 'my-image':

    hpcloud images:remove my-image

Delete images '1172' and '1078':

    hpcloud images:remove 1172 1078

Delete image `my-image` for availability zone `az-2.region-a.geo-1:

    hpcloud images:remove my-image -z az-2.region-a.geo-1

###Aliases
`images:rm, images:delete, images:del`

##info## {#info}
Display info about the HP Cloud UNIX CLI.

###Syntax
`hpcloud info``Display info about the HP Cloud UNIX CLI.`
##keypairs## {#keypairs}
List the available keypairs.

###Syntax
`hpcloud keypairs [name ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the key pairs in your compute account. You may filter the output of keys displayed by specifying the key pairs you want displayed on the command line.  Optionally, you can specify an availability zone.

###Examples
List the key pairs:

    hpcloud keypairs

List the key pair 'brat':

    hpcloud keypairs brat

List the key pairs for availability zone `az-2.region-a.geo-1`:

    hpcloud keypairs -z az-2.region-a.geo-1

###Aliases
`keypairs:list`

##keypairs:add## {#keypairs:add}
add a key pair

###Syntax
`hpcloud keypairs:add <key_name>`

###Options
<dl>
<dt><b>-f, [--fingerprint=FINGERPRINT]</b></dt><dd>Specify a fingerprint to be used.</dd>  
<dt><b>-p, [--private-key=PRIVATE_KEY]</b></dt><dd>Specify private key data to be used.</dd>  
<dt><b>-o, [--output]</b></dt><dd>Save key pair in the ~/.hpcloud/keypairs folder.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a key pair by specifying the name. Optionally you can specify a fingerprint and private key data. You can use the `-o` option to save the key to a file. Optionally, you can specify an availability zone.

###Examples
Create the key 'mykey':

    hpcloud keypairs:add mykey

Create the key 'mykey' using the supplied fingerprint:

    hpcloud keypairs:add mykey -f <fingerprint>

Create the key 'mykey' using the supplied private key data:

    hpcloud keypairs:add mykey -p 'private key data'

Create the key 'mykey' using the supplied fingerprint and private key data:

    hpcloud keypairs:add mykey -f <fingerprint> -p 'private key data'

Create the key `mykey` and save it to file `mykey.pem`  in the current folder:

    hpcloud keypairs:add mykey -o

Create the key `mykey` for availability zone `az-2.region-a.geo-1`:

    hpcloud keypairs:add mykey -z az-2.region-a.geo-1


##keypairs:import## {#keypairs:import}
Import a key pair.

###Syntax
`hpcloud keypairs:import <key_name> <public_key_data>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Import a key pair by specifying the public key data. Alternately, you may specify the name of the import file on the command line.  Optionally, you can specify an availability zone.

###Examples
Import a key from file `~/.ssh/id_rs.pub`:

    hpcloud keypairs:import mykey ~/.ssh/id_rsa.pub

Import a key from public key data:

    hpcloud keypairs:import mykey 'public_key_data'

Import a key from public key data for availability zone `az-2.region-a.geo-1`:

    hpcloud keypairs:import mykey 'public_key_data' -z az-2.region-a.geo-1


##keypairs:private## {#keypairs:private}
List private keypairs in local directory

###Syntax
`hpcloud keypairs:private`

###Description
List the private keys stored on this machine.  These private keys are *not* available on other systems unless you copy them to that system.

###Examples
Create the key 'mykey':

    hpcloud keypairs:private

Create the key 'mykey':

    hpcloud keypairs:private mykey


##keypairs:private:add## {#keypairs:private:add}
Make a private key available for the CLI

###Syntax
`hpcloud keypairs:private:add <key_name> <file_name>`

###Description
This command copies the private key file to ~/.hpcloud/keypairs directory so the CLI can use it for various commands to access servers.  This command does *not* upload the private key anywhere and it will *only* be available for the CLI on the current server.

###Examples
Make the 'mykey' private key available for the CLI

    hpcloud keypairs:private:add mykey ./mykey.pem


##keypairs:private:location## {#keypairs:private:location}
Find the private key for the given server

###Syntax
`hpcloud keypairs:private:location <server_name_or_id>`

###Description
Find the location of the private key for a given server.

###Examples
Print the location of the private key for 'myserver'

    hpcloud keypairs:private:location myserver


##keypairs:private:remove## {#keypairs:private:remove}
Remove a private key file

###Syntax
`hpcloud keypairs:private:remove <key_name> [key_name...]`

###Description
This command removes private key files from the ~/.hpcloud/keypairs directory which is the store used by the CLI. If you plan to continue to use this private key, make sure you have it stored somewhere else.  There is no way to recover a private key that has been deleted unless you have another copy of that key.  Keys are stored in the ~/.hpcloud/keypairs directory by key name and server id, so there may be multiple copies of a single key in the private key store.

###Examples
Remove 'mykey' and 'spare' from the private key storage

    hpcloud keypairs:private:remove mykey spare

###Aliases
`keypairs:private:rm, keypairs:private:del`

##keypairs:public_key## {#keypairs:public_key}
Display the public keys of a key pair.

###Syntax
`hpcloud keypairs:public_key <name>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Display the public key of the specified keypair.  Optionally, you can specify an availability zone.

###Examples
Remove the public key `keyno`:

    hpcloud keypairs:public_key keyno

Remove the public key `keyno` for availability zone `az-2.region-a.geo-1`:

    hpcloud keypairs:public_key keyno -z az-2.region-a.geo-1


##keypairs:remove## {#keypairs:remove}
Remove a key pair (by name).

###Syntax
`hpcloud keypairs:remove name [name ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove an existing key pair by name. You may specify more than one key pair to remove on a single command line.  Optionally, you can specify an availability zone.

###Examples
Remove the key pair 'mykey':

    hpcloud keypairs:remove mykey

Remove the key pairs 'mykey' and 'myotherkey':

    hpcloud keypairs:remove mykey myotherkey

Remove the key pair `mykey` for availability zone `az-2.region-a.geo-1:

    hpcloud keypairs:remove mykey -z az-2.region-a.geo-1

###Aliases
`keypairs:rm, keypairs:delete, keypairs:del`

##list## {#list}
List containers or container contents.

###Syntax
`hpcloud list [container ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List containers or the contents of the specified containers. Optionally, an availability zone can be passed.

###Examples
List the contents of the subdirectory `/sub/` in `tain1` and `tain2`:

    hpcloud list :tain1/sub/ :tain2/sub/

List the PNG files in `tain1`:

    hpcloud list :tain1/.*png

List all the objects in container `tainer`:

    hpcloud list :tainer

List all containers:

    hpcloud list

List all the objects in container `my_container` for availability zone `region-a.geo-1`:

    hpcloud list :my_container -z region-a.geo-1

###Aliases
`ls`

##location## {#location}
Display the URIs for the specified resources.

###Syntax
`hpcloud location <object/container> ...`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Display the URI of the specified object or container. Optionally, you can specify an availability zone.

###Examples
Display the URI for the file `file.txt` that resides in container `my_container`:

    hpcloud location :my_container/file.txt

 Display the URI for all objects in container `my_container`:

    hpcloud location :my_container

Display the URIs for the objects `file.txt` and `other.txt` that reside in container `my_container`:

    hpcloud location :my_container/file.txt :my_container/other.txt

Display the URI for the file `file.txt` that resides in container `my_container` in availability zone `region-a.geo-1`:

    hpcloud location :my_container/file.txt -z region-a.geo-1

###Aliases
`loc`

##migrate## {#migrate}
Migrate files from a provider described by the source account.

###Syntax
`hpcloud migrate <source_account> <source> [source ...] <destination>`

###Options
<dl>
<dt><b>-m, [--mime=MIME]</b></dt><dd>Set the MIME type of the remote object.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Migrates files from the deisgnated provider to the HP Cloud destination. This command works similarly to `copy` except the first argument is the source account (for example, `AWS`).  The source objects may be containers, objects, or regular expressions.

###Examples
Migrate objects from the AWS `:aws_tainer` container to the `:hp_tainer` container:

    hpcloud migrate aws :aws_tainer :hp_tainer

Migrate objects from the two containers in the Rackspace account to the `:hp_tainer` container:

    hpcloud migrate rackspace :rackspace1 :rackspace2 :hp_tainer


##move## {#move}
Move objects inside or between containers.

###Syntax
`hpcloud move <source ...> <destination>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Move objects to a new location inside a container or between containers. The source file is removed after a successful transfer. If you specify more than one source, the destination must be a container, or a directory ending in `/`.  Optionally, you can specify an availability zone.  For copying files to and from your local filesystem see `copy`.

###Examples
Move file `file.txt` to new name and location `old/backup.txt` in container `my_container`:

    hpcloud move :my_container/file.txt :my_container/old/backup.txt

 Move file `file.txt` from container `my_container` to container `other_container`:

    hpcloud move :my_container/file.txt :other_container/file.txt

Move files `f1.txt` and f2.txt` from container `tain` to directory `/directory` in container `othertain`:

    hpcloud move :tain/f1.txt :tain/f2.txt :othertain/directory/

Move file `file.txt` to new name and location `old/backup.txt` in container `my_container` for availability zone `region-a.geo-1`:

    hpcloud move :my_container/file.txt :my_container/old/backup.txt -z region-a.geo-1

###Aliases
`mv`

##remove## {#remove}
Remove objects or containers.

###Syntax
`hpcloud remove object_or_container [object_or_container ...]`

###Options
<dl>
<dt><b>-f, [--force]</b></dt><dd>Do not confirm removal, remove non-empty containers.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove objects or containers. Optionally, you can specify an availability zone.

###Examples
Delete objects 'my.txt' and 'other.txt' from container `tainer`:

    hpcloud remove :tainer/my.txt :tainer/other.txt

Delete container 'my_container':

    hpcloud remove :my_container

Delete container 'my_container' in availability zone `region-a.geo-1`:

    hpcloud remove :my_container -z region-a.geo-1

###Aliases
`rm, delete, destroy, del`

##securitygroups## {#securitygroups}
List the available security groups.

###Syntax
`hpcloud securitygroups [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the security groups in your compute account. You may filter the display by specifying names or IDs of security groups on the command line.  Optionally, you can specify an availability zone.

###Examples
List the security groups:

    hpcloud securitygroups

List security group `mysecgrp`:

    hpcloud securitygroups mysecgrp

List the security groups for availability zone `az-2.region-a.geo-1`:

    hpcloud securitygroups -z az-2.region-a.geo-1

###Aliases
`securitygroups:list`

##securitygroups:add## {#securitygroups:add}
Add a security group.

###Syntax
`hpcloud securitygroups:add <name> <description>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a new security group by specifying a name and a description. Optionally, you can specify an availability zone.

###Examples
Add new security group `mysecgroup` with description `seg group desc`:

    hpcloud securitygroups:add mysecgroup "seg group desc"

Add new security group `mysecgroup` with description `seg group desc` for availability zone `az-2.region-a.geo-1`:

    hpcloud securitygroups:add mysecgroup "seg group desc" -z az-2.region-a.geo-1


##securitygroups:remove## {#securitygroups:remove}
Remove a security group or groups.

###Syntax
`hpcloud securitygroups:remove name_or_id [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove existing security groups by name or ID. Optionally, you can specify an availability zone.

###Examples
Remove the security groups `group1` and `group2`:

    hpcloud securitygroups:remove group1 group2

Remove the security group with the ID `30725`:

    hpcloud securitygroups:remove 30725

Remove the security group `mysecgroup` for availability zone `az-2.region-a.geo-1`:

    hpcloud securitygroups:remove mysecgroup -z az-2.region-a.geo-1

###Aliases
`securitygroups:rm, securitygroups:delete, securitygroups:del`

##securitygroups:rules## {#securitygroups:rules}
Display the list of rules for a security group.

###Syntax
`hpcloud securitygroups:rules <sec_group_name>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the rules for a security group for your compute account. Optionally, you can specify an availability zone.

###Examples
List the rules for security group `mysecgroup`:

    hpcloud securitygroups:rules mysecgroup

List the rules for security group `mysecgroup` for availability zone `az-2.region-a.geo-1`:

    hpcloud securitygroups:rules mysecgroup -z az-2.region-a.geo-1

###Aliases
`securitygroups:rules:list`

##securitygroups:rules:add## {#securitygroups:rules:add}
Add a rule to the security group.

###Syntax
`hpcloud securitygroups:rules:add <sec_group_name> <ip_protocol>`

###Options
<dl>
<dt><b>-p, [--port-range=PORT_RANGE]</b></dt><dd>Specify a port range like 22..22</dd>  
<dt><b>-c, [--cidr=CIDR]</b></dt><dd>Specify a cidr ip range like 0.0.0.0/0</dd>  
<dt><b>-g, [--source-group=SOURCE_GROUP]</b></dt><dd>Specify a source group.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a rule to the security group. If <ip_protocol> is specified as `icmp`, then <port_range> is set to -1..-1.  If <ip_address> is not specified, then the address defaults to `0.0.0.0/0`. To allow communications within a given security group, you must specify a source group while creating a rule. Optionally, you can specify an availability zone.

###Examples
Set the default port range to -1..-1

    hpcloud securitygroups:rules:add mysggroup icmp

Set the default cidr to `0.0.0.0/0`:

    hpcloud securitygroups:rules:add mysggroup tcp -p 22..22

Set the cidr to `111.111.111.111/1`:

    hpcloud securitygroups:rules:add mysggroup tcp -p 80..80 -c "111.111.111.111/1"

Set the source group to `mysourcegroup`:

    hpcloud securitygroups:rules:add mysggroup tcp -p 80..80 -g "mysourcegroup"

Set the availability zone to `az-2.region-a.geo-1`:

    hpcloud securitygroups:rules:add mysggroup icmp -z az-2.region-a.geo-1

###Aliases
`securitygroups:rules:authorize`

##securitygroups:rules:remove## {#securitygroups:rules:remove}
Remove a rule from the security group.

###Syntax
`hpcloud securitygroups:rules:remove <sec_group_name> <rule_id>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove a rule from the security group, specifyied its ID. Optionally, you can specify an availability zone.

###Examples
Remove the rule `mysecgroup` from security group `111`:

    hpcloud securitygroups:rules:remove mysecgroup 111

Remove the rule `mysecgroup` from security group `111` for availability zone `az-2.region-a.geo-1`:

    hpcloud securitygroups:rules:remove mysecgroup 111 -z az-2.region-a.geo-1

###Aliases
`securitygroups:rules:rm, securitygroups:rules:revoke, securitygroups:rules:delete, securitygroups:rules:del`

##servers## {#servers}
List the available servers.

###Syntax
`hpcloud servers [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the servers in your compute account. You may filter the list by server name or ID.  Optionally, you can specify an availability zone.

###Examples
List the servers:

    hpcloud servers

List server `hal`:

    hpcloud servers hal

List the servers for availability zone `az-2.region-a.geo-1`:

    hpcloud servers -z az-2.region-a.geo-1

###Aliases
`servers:list`

##servers:add## {#servers:add}
Add a server.

###Syntax
`hpcloud servers:add <name> <flavor> -k, --key-name=KEY_NAME`

###Options
<dl>
<dt><b>-k, --key-name=KEY_NAME</b></dt><dd>Specify a key name to be used.</dd>  
<dt><b>-i, [--image=IMAGE]</b></dt><dd>Image to use to create the server.</dd>  
<dt><b>-v, [--volume=VOLUME]</b></dt><dd>Volume to use to create the server.</dd>  
<dt><b>-s, [--security-group=SECURITY_GROUP]</b></dt><dd>Specify a security group to be used.</dd>  
<dt><b>-p, [--private-key-file=PRIVATE_KEY_FILE]</b></dt><dd>Name of the pem file with your private key.</dd>  
<dt><b>-m, [--metadata=METADATA]</b></dt><dd>Set the meta data.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a new server to your compute account. You must specify:  Server name, a flavor, an image or volume to use, and a key pair.  If you are creating a windows server, the flavor must be at least a large and you must specify a security group that has the RDP port open.  Optionally, you can specify a security group, key name, metadata and availability zone.

###Examples
Create a new small server named 'my_server' with image 7 and key1:

    hpcloud servers:add my_server small -i 7 -k key1

Create a windows server with the specified key, security group, and private key to decrypt the password:

    hpcloud servers:add winserv large -i 100006567 -k winpair -s allowsRDP -p ./winpair.pem

Create a new large server named 'my_server' using volume `natty`, key `key1`, and the `sg1` security group:

    hpcloud servers:add my_server large -v natty -k key1 -s sg1

Create a new small server named 'my_server' using the specified image, flavor, key and metadata this=that:

    hpcloud servers:add my_server small -i 20634 -k key1 -m this=that

Create a new server named 'my_server' using the key `key1` for availability zone `az-2.region-a.geo-1`:

    hpcloud servers:add my_server xlarge -i 7 -k key1 -z az-2.region-a.geo-1


##servers:console## {#servers:console}
Get the console output of a server or extract the windows password.

###Syntax
`hpcloud servers:console <server_name_or_id> [lines]`

###Options
<dl>
<dt><b>-p, [--private-key-file=PRIVATE_KEY_FILE]</b></dt><dd>Private key pem file used to decrypt windows password.</dd>  
<dt><b>-d, [--dump-password]</b></dt><dd>Dump the windows password if the private key is known by the CLI.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Display the console output of a server.  When the `-p` option is used with the private key file for the server, if the decrypted password is still available on the console, it is displayed.

###Examples
Display 100 lines of console ouput:

    hpcloud servers:console my-server 100

Display the password of the winserver:

    hpcloud servers:console winserver -p win.pem


##servers:metadata## {#servers:metadata}
List the metadata for a server.

###Syntax
`hpcloud servers:metadata <name_or_id>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the metadata for a server in your compute account. You can specify either the name or the ID of the server.  Optionally, you can specify an availability zone.

###Examples
List server metadata:

    hpcloud servers:metadata Skynet

List server metadata for availability zone `az-2region-a.geo-1`:

    hpcloud servers:metadata -z az-2.region-a.geo-1 565394

###Aliases
`servers:metadata:list`

##servers:metadata:add## {#servers:metadata:add}
Add metadata to a server.

###Syntax
`hpcloud servers:metadata:add <name_or_id> <metadata>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add metadata to a server in your compute account.  You can specify the erver name or ID.  Optionally, you can an availability zone. The metadata should be a comma separated list of name value pairs.

###Examples
Add the specified metadata to the server (if the metadata exists, it is updated):

    hpcloud servers:metadata:add my_server 'r2=d2,c3=po'

###Aliases
`servers:metadata:update`

##servers:metadata:remove## {#servers:metadata:remove}
Remove metadata from a server.

###Syntax
`hpcloud servers:metadata:remove <name> <metadata_key> ...`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove metadata from a server in your compute account.  You can speciry the erver name or ID.  You can specify one or more metadata keys on the command line.  Optionally, you can specify an availability zone.

###Examples
Remove the the r2 and c3 metadata from the server:

    hpcloud servers:metadata:remove :my_server r2 c3

###Aliases
`servers:metadata:rm`

##servers:password## {#servers:password}
Change the password for a server.

###Syntax
`hpcloud servers:password <server_name> <password>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Change the password for an existing server. The password must adhere to the existing security complexity naming rules. Optionally, you can specify an availability zone.

###Examples
Change the password for server 'my-server':

    hpcloud servers:password my-server my-password

Change the password for server 'my-server` for availability zone `az-2.region-a.geo-1`:

    hpcloud servers:password my-server my-password -z az-2.region-a.geo-1

###Aliases
`servers:passwd`

##servers:reboot## {#servers:reboot}
Reboot a server or servers (specified by server name or ID).

###Syntax
`hpcloud servers:reboot name_or_id [name_or_id ...]`

###Options
<dl>
<dt><b>-h, [--hard]</b></dt><dd>Hard reboot a server.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Reboot an existing server specified name or ID. Rebooting a server can take some time so it might be necessary to check the status of the server by issuing the command `hpcloud servers`. The default is a soft reboot, but you can specify the `-h` option for a hard reboot. Optionally, you can specify an availability zone.

###Examples
Reboot server 'Hal9000':

    hpcloud servers:reboot Hal9000

Reboot the servers with the IDs 1003 and 222

    hpcloud servers:reboot 1003 222

Reboot the server `DeepThought` for availability zone `az-2.region-a.geo-1`:

    hpcloud servers:reboot DeepThought -z az-2.region-a.geo-1


##servers:rebuild## {#servers:rebuild}
Rebuild a server (specified by server name or ID).

###Syntax
`hpcloud servers:rebuild name_or_id [image_name_or_id]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Rebuild an existing server specified by name or ID. Optionally, you may rebuild the server with a new image.  Rebuilding a server may take some time so it might be necessary to check the status of the server by issuing the command `hpcloud servers`. Optionally, you can specify an availability zone.

###Examples
Rebuild server 'Hal9000':

    hpcloud servers:rebuild Hal9000

Rebuild server 1003 with image 222:

    hpcloud servers:rebuild 1003 222

Rebuild server `DeepThought` for availability zone `az-2.region-a.geo-1`:

    hpcloud servers:rebuild DeepThought -z az-2.region-a.geo-1


##servers:remove## {#servers:remove}
Remove a server or servers (specified by name or ID).

###Syntax
`hpcloud servers:remove name_or_id [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove existing servers by specifying their name or ID. Optionally, you can specify an availability zone.

###Examples
Delete 'my-server':

    hpcloud servers:remove my-server

Delete the servers 'DeepThought' and 'Blaine':

    hpcloud servers:remove DeepThought Blaine

Delete the server with the ID 369765

    hpcloud servers:remove 369765

Delete server `my-server` for availability zone `az-2.region-a.geo-1`:

    hpcloud servers:remove my-server -z az-2.region-a.geo-1

###Aliases
`servers:rm, servers:delete, servers:del`

##servers:ssh## {#servers:ssh}
Secure shell into the server.

###Syntax
`hpcloud servers:ssh <server_name_or_id>`

###Options
<dl>
<dt><b>-p, [--private-key-file=PRIVATE_KEY_FILE]</b></dt><dd>Name of the pem file with your private key.</dd>  
<dt><b>-k, [--keypair=KEYPAIR]</b></dt><dd>Name of keypair to use.</dd>  
<dt><b>-l, [--login=LOGIN]</b></dt><dd>Login id to use.</dd>  
<dt><b>-c, [--command=COMMAND]</b></dt><dd>Command to use to connect.</dd>  
# Default: ssh  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Log in using the secure shell to the designated server.

###Examples
Use the secure shell to log in to the bugs server:

    hpcloud servers:console bugs -p bunny.pem

Use the secure shell to log in to server `daffy`, which has a know keypair

    hpcloud servers:console daffy


##snapshots## {#snapshots}
List block devices available.

###Syntax
`hpcloud snapshots [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Lists all block snapshots associated with the account on the server. The list starts with identifier and contains name, size, type, create date, status, description and servers to which it is attached.  Optionally, you can filter the list by name or ID.

###Examples
List all snapshots:

    hpcloud snapshots

List the detail information for snapshot `1`:

    hpcloud snapshots 1

List the detail information about snapshot `testsnap`:

    hpcloud snapshots testsnap

###Aliases
`snapshots:list`

##snapshots:add## {#snapshots:add}
Create a snapshot.

###Syntax
`hpcloud snapshots:add <name> <volume>`

###Options
<dl>
<dt><b>-d, [--description=DESCRIPTION]</b></dt><dd>Description of the snapshot.</dd>  
<dt><b>-m, [--metadata=METADATA]</b></dt><dd>Set the meta data.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Create a snapshot with the given name from a volume.  Optionally, you can specify a description.

###Examples
Create the new snapshot 'my_snapshot' from the specified volume:

    hpcloud snapshots:add my_snapshot vol10

Creates the new snapshot 'my_snapshot' from the specified volume with the description `test vol`:

    hpcloud snapshots:add my_snapshot vol10 -d 'test vol'


##snapshots:remove## {#snapshots:remove}
Remove a snapshot or snapshots (specified by name or ID).

###Syntax
`hpcloud snapshots:remove <name_or_id> [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove snapshots by specifying their names or ID. Optionally, you can specify an availability zone.

###Examples
Delete the snapshots `snappy1` and `snappy2`:

    hpcloud snapshots:remove snappy1 snappy2

Delete snapshot with the ID 998:

    hpcloud snapshots:remove 998

Delete snapshot `snappy` for availability zone `az-2.region-a.geo-1`:

    hpcloud snapshots:remove snappy -z az-2.region-a.geo-1

###Aliases
`snapshots:rm, snapshots:delete, snapshots:del`

##tempurl## {#tempurl}
Create temporary URLs for the given objects.

###Syntax
`hpcloud tempurl <object> ...`

###Options
<dl>
<dt><b>-p, [--time-period=TIME_PERIOD]</b></dt><dd>time period to keep the url alive</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Create temporary URLS for the given objects. Creating a temporary URL allows you to share an object for a specified period of time making it available to everyone.  Only users with access to the URL can access the file.  You can specify the time period in seconds (s), hours (h), or days (d).  If you do not specify a time period, the default is two days.  Optionally, you can specify an availability zone.

###Examples
Create a temporary URL for the file `file.txt` with a period of 7 days:

    hpcloud tempurl -p7d :my_container/file.txt

 Create temporary URLs for the files `file.txt` and `other.txt` in container `my_container` with a period of 24 hours:

    hpcloud tempurl -p24h :my_container/file.txt :my_container/other.txt

Create a temporary URL for the file `file.txt` with a period of 7 days for availability zone `region-a.geo-1`:

    hpcloud tempurl :my_container/file.txt -z region-a.geo-1

###Aliases
`tmpurl`

##volumes## {#volumes}
List the available block devices.

###Syntax
`hpcloud volumes [name_or_id ...]`

###Options
<dl>
<dt><b>-b, [--bootable]</b></dt><dd>List the bootable volumes.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Lists all the block volumes that are associated with the account on the server. The list begins with identifier and contains name, size, type, create date, status, description and servers on which it is attached.  Optionally, you can filter the list by specifying name or ID.

###Examples
List all volumes:

    hpcloud volumes

List the details for volume `1`:

    hpcloud volumes 1

List the details for volume `testvol`:

    hpcloud volumes testvol

###Aliases
`volumes:list`

##volumes:add## {#volumes:add}
Add a volume.

###Syntax
`hpcloud volumes:add <name> [size]`

###Options
<dl>
<dt><b>-d, [--description=DESCRIPTION]</b></dt><dd>Description of the volume.</dd>  
<dt><b>-m, [--metadata=METADATA]</b></dt><dd>Set the metadata.</dd>  
<dt><b>-s, [--snapshot=SNAPSHOT]</b></dt><dd>Create a volume from the specified snapshot.</dd>  
<dt><b>-i, [--image=IMAGE]</b></dt><dd>Create a volume from the specified image.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a new volume to your compute account with the specified name and size.  Optionally, you can specify a description, metadata or availability zone.  If you do not specify a size, it is taken from the specified snapshot or image.  If no image or snapshot is specified, the size defaults to 1 gigabyte.

###Examples
Create a new volume named 'my_volume' of size 10:

    hpcloud volumes:add my_volume 10

Create a new volume named 'my_volume' of size 10 with a description:

    hpcloud volumes:add my_volume 10 -d 'test vol'

Create a new volume named 'my_volume' based on the snapshot 'snappy':

    hpcloud volumes:add my_volume -s 'snappy'

Create a new bootable volume named 'my_volume' based on the image '20103':

    hpcloud volumes:add my_volume -i 20103

Creates volume `my_volume` in availability zone `az-2.region-a.geo-1`:

    hpcloud volumes:add my_volume 1 -z az-2.region-a.geo-1


##volumes:attach## {#volumes:attach}
Attach a volume to a server specified by device name or number.

###Syntax
`hpcloud volumes:attach <volume> <server> <device_or_number>`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Attach a volume to a server on the specified device name.  You may specify a device name in the format /dev/sdX where X is b, c, d, ... or a mount point 1, 2, 3,...  The mount point 1 would map to /dev/sdb on a Linux platform.

###Examples
Attach volume `myVolume` to server `myServer` on device `/dev/sdf`:

    hpcloud volumes:attach myVolume myServer /dev/sdf

Attach volume `myVolume` to server `myServer` on device `/dev/sdb`:

    hpcloud volumes:attach myVolume myServer 1

Attach volume `my-volume` to server `myServer` on device `/dev/sdf` for availability zone `az-2.region-a.geo-1`:

    hpcloud volumes:attach my-volume myServer /dev/sdg -z az-2.region-a.geo-1


##volumes:detach## {#volumes:detach}
Detach a volume or volumes.

###Syntax
`hpcloud volumes:detach name_or_id [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Detach volumes from all servers.  You may specify the volume by name or ID.  You can detach one more more volumes in a command line.

###Examples
Detach the volume 'myVolume':

    hpcloud volumes:detach myVolume

Detach the volume with ID 1159:

    hpcloud volumes:detach 1159

Detach the volume 'myVolume' for availability zone `az-2.region-a.geo-1`:

    hpcloud volumes:detach myVolume -z az-2.region-a.geo-1


##volumes:remove## {#volumes:remove}
Remove a volume or volumes (specified by name or ID).

###Syntax
`hpcloud volumes:remove name_or_id [name_or_id ...]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove volumes by specifying their names or ID. You may specify more than one volume name or ID on a command line.  Optionally, you can specify an availability zone.

###Examples
Delete the volumes 'tome' and 'treatise':

    hpcloud volumes:remove tome treatise

Delete the volume with ID 998:

    hpcloud volumes:remove 998

Delete the volume `my-volume` for availability zone `az-2.region-a.geo-1`:

    hpcloud volumes:remove my-volume -z az-2.region-a.geo-1

###Aliases
`volumes:rm, volumes:delete, volumes:del`

##volumes:server## {#volumes:server}
List the volumes on server.

###Syntax
`hpcloud volumes:server [server]`

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-x, [--debug=DEBUG]</b></dt><dd>Debug logging 1,2,3,...</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the volumes attached to servers with the device they are using.  Optionally, you may filter by specifying the server name or ID on the command line.

###Examples
List all the attached volumes:

    hpcloud volumes:server

List the volumes on server `myServer`:

    hpcloud volumes:server myServer

List the volumes on server `myServer` for availability zone `az-2.region-a.geo-1`:

    hpcloud volumes:server myServer -z az-2.region-a.geo-1


