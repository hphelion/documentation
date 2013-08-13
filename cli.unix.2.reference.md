---
layout: default
title: "UNIX CLI: Command Line Reference"
permalink: /cli/unix/2/reference/
product: unix-cli

---
Below you can find a full reference of supported UNIX command-line interface (CLI) commands. The commands are alphabetized.  You can also use the <font face="Courier">hpcloud help [<em>command</em>]</font> tool (where <em>command</em> is the name of the command on which you want help, for example <font face="Courier">account:setup</font>) to display usage, description, and option information from the command line.

Many of the commands support a `--debug` option to print verbose trace.  This trace may help you diagnose problems if the CLI is having difficulty communicating with the servers.

The <font face="Courier">hpcloud complete</font> command will attempt to install a bash completion file into your environment.  This will help if you like to use tab completion of commands.

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

##account:catalog## {#account:catalog}
Print the service catalog of the specified account.

###Syntax
`hpcloud account:catalog <account_to_catalog> [service]`

###Options
**--debug=DEBUG**
: Debug logging 1,2,3,...



###Description
Print the service catalog of the specified account.  Optionally, you may specify a particular service to print such as `Compute`.

###Examples
Print the service catalog of `useast`:

    hpcloud account:catalog useast

Print the compute catalog of `useast`:

    hpcloud account:catalog useast Compute


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
**--userpass**
: Use username/password authentication instead of authentication keys

**-n, --no-validate**
: Don't verify account settings during edit

**-p, --provider=PROVIDER**
: Cloud provider for migration: AWS, Rackspace, or Google



###Description
Create or edit your account credentials. If you do not specify an account name on the command line, the default account is updated.  If you do not specify name value pairs, you are prompted to input the account values.

You  need your Access Key Id, Secret Key and Project (aka Tenant) Id from the HP Cloud web site to set up your account. Optionally, you can specify your own endpoint to authorize your identity, but in most cases we recommend you use the default.

Availability zones typically have the format `az-1.region-a.geo-1` or `region-a.geo-1`, depending on the service.  See your account API keys page to see your list of activated availability zones: https://console.hpcloud.com/account/api_keys or use the `account:catalog` command to print out your service catalog.

You can re-run this command at any time to modify your settings.

The interactive mode prompts you for the following values:

* Access Key Id
* Secret Key
* Project (aka Tenant) Id
* Identify (Auth) Uri
* Various zones and regions you have activated

The command line mode allows you to set the following values:

* account_id
* secret_key
* auth_uri
* tenant_id
* userpass
* compute
* object storage
* cdn
* dns
* lbaas
* db
* network
* block storage
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

Create a Rackspace account for migration:

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
**--userpass**
: Use username/password authentication instead of authentication keys

**-n, --no-validate**
: Don't verify account settings during edit

**-p, --provider=PROVIDER**
: Cloud provider for migration: AWS, Rackspace, or Google



###Description
Create or edit your account credentials. If you do not specify an account name on the command line, the default account is updated.  If you do not specify name value pairs, you are prompted to input the account values.

You  need your Access Key Id, Secret Key and Project (aka Tenant) Id from the HP Cloud web site to set up your account. Optionally, you can specify your own endpoint to authorize your identity, but in most cases we recommend you use the default.

Availability zones typically have the format `az-1.region-a.geo-1` or `region-a.geo-1`, depending on the service.  See your account API keys page to see your list of activated availability zones: https://console.hpcloud.com/account/api_keys or use the `account:catalog` command to print out your service catalog.

You can re-run this command at any time to modify your settings.

The interactive mode prompts you for the following values:

* Access Key Id
* Secret Key
* Project (aka Tenant) Id
* Identify (Auth) Uri
* Various zones and regions you have activated

The command line mode allows you to set the following values:

* account_id
* secret_key
* auth_uri
* tenant_id
* userpass
* compute
* object storage
* cdn
* dns
* lbaas
* db
* network
* block storage
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

Create a Rackspace account for migration:

    hpcloud account:setup rackspace -p rackspace

###Aliases
`account:add, account:setup, account:update`

##account:tenants## {#account:tenants}
List the tenants.

###Syntax
`hpcloud account:tenants`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the tenants associated with this account.

###Examples
List all the tenants associated with the account:

    hpcloud account:tenants


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
**--debug=DEBUG**
: Debug logging 1,2,3,...



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
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Set the access control list (ACL) values for the specified container. The supported permissions are `r` (read), `w` (write), or `rw` (read and write). You may specify one or more user for the given permission.  If you do not specify a user, the permissions are set to public.  Public write permissions are not allowed.

###Examples
Allow anyone to read 'my_container':

    hpcloud acl:grant :my_container r

Allow Bob and Sally to read and write 'my_container':

    hpcloud acl:grant :my_container rw bob@example.com sally@example.com

Give Billy read permissions to 'my_container':

    hpcloud acl:grant :my_container r billy@example.com

###Aliases
`acl:set`

##acl:revoke## {#acl:revoke}
Revoke the specified permissions.

###Syntax
`hpcloud acl:revoke <container> <permissions> [user ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Revoke the access control list (ACL) values from the specified container. The supported permissions are `r` (read), `w` (write), or `rw` (read and write). You may specify one or more user fo the given permission.  If you do not specify a user, the permissions are set to public.  Public write permissions are not allowed.

###Examples
Revoke public read from 'my_container':

    hpcloud acl:revoke :my_container public-read

Revoke read and write from bob@example.com from 'my_container':

    hpcloud acl:revoke :my_container rw bob@example.com


##addresses## {#addresses}
Display list of available addresses.

###Syntax
`hpcloud addresses [ip_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
Allocate a new public IP address.

###Syntax
`hpcloud addresses:add`

###Options
**-n, --network=NETWORK**
: Name or id of the network associated with this IP.

**-p, --port=PORT**
: Name or id of the port associated with this IP.

**--fixed-ip=FIXED_IP**
: Fixed IP address to associate with this IP.

**--floating-ip=FLOATING_IP**
: Floating IP to assign.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add or allocate a new public IP address from the pool of available IP addresses.  If a network is not specified, the first external network found will be used.

###Examples
Add a new public IP address to external network:

    hpcloud addresses:add

Add a new IP address to `netty`:

    hpcloud addresses:add -n netty

###Aliases
`addresses:allocate`

##addresses:associate## {#addresses:associate}
Associate a public IP address to a port.

###Syntax
`hpcloud addresses:associate <ip_or_id> <port_name_or_id>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Associate an existing and unassigned public IP address, to the specified port.  Optionally, you can specify an availability.

###Examples
Associate the address `111.111.111.111` to port `myport`:

    hpcloud addresses:associate 111.111.111.111 myport


##addresses:disassociate## {#addresses:disassociate}
Disassociate any port associated to the public IP address.

###Syntax
`hpcloud addresses:disassociate ip_or_id [ip_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Disassociate any port associated to the public IP address. The public IP address is not removed or released to the pool. Optionally, you can specify an availability zone.

###Examples
Disassociate IP addresses `111.111.111.111` and `127.0.0.1` from their ports:

    hpcloud addresses:disassociate 111.111.111.111 127.0.0.1

Disassociate the address with the ID  '9709':

    hpcloud addresses:disassociate f01b27f3


##addresses:remove## {#addresses:remove}
Remove or release a public IP address.

###Syntax
`hpcloud addresses:remove ip_or_id [ip_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove or release a previously allocated public IP address. Any server instances that were associated to this address are disassociated. You may specify one ore more address IPs or IDs on the command line.  Optionally, you can specify an availability zone.

###Examples
Remove IP address '111.111.111.111':

    hpcloud addresses:remove 111.111.111.111

Remove addresses with the IDs 'a5bd6680' and 'c80dfe05':

    hpcloud addresses:remove a5bd6680 c80dfe05

###Aliases
`addresses:rm, addresses:delete, addresses:release, addresses:del`

##cdn:containers## {#cdn:containers}
List available containers on the CDN.

###Syntax
`hpcloud cdn:containers`

###Options
**-l, --all**
: List all the CDN containers, either enabled or disabled.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
`hpcloud cdn:containers:get <name> [attribute..]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Get the value of an attribute for an existing CDN container. The allowed attributes whose value can be retrieved are:
* `X-Ttl`
* `X-Cdn-Uri`
* `X-Cdn-Enabled`
* `X-Log-Retention`.

Optionally, you can specify an availability zone.

###Examples
List all the values:

    hpcloud cdn:containers:get :my_cdn_container

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
**-s, --ssl**
: Print the SSL version of the URL.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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

Set the attribute 'X-Cdn-Uri' to http://my.home.com/cdn:

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
Installs the HP Cloud bash completion file.:

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
**-f, --force**
: Don't prompt if container name is not a valid virtual host.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-f, --force**
: Force removal of non-empty containers.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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

##containers:sync## {#containers:sync}
Allow container synchronization.

###Syntax
`hpcloud containers:sync name key [location]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Allow container synchronization using the specified key.  If you are creating a destination for synchronization, only the key should be specified.  If you are creating a source for synchronization, specify a key and location.  The same key must be used in the source and destination.  It is possible have containers as both a source and destination.  List your synchronization information with the "hpcloud list --sync" command.

###Examples
Set up the container :atainer to be a destination for synchronization:

    hpcloud containers:sync :atainer keyo

Synchronize :btainer to remote container :atainer:

    hpcloud containers:sync :btainer keyo atainer

Create a two way synchronization betwee :atainer and :btainer:

    hpcloud containers:sync :atainer keyo https://region-b.geo-1.objects.hpcloudsvc.com:443/v1/96XXXXXX/btainer


##copy## {#copy}
Copy files from one resource to another.

###Syntax
`hpcloud copy <source> [source ...] <destination>`

###Options
**-m, --mime=MIME**
: Set the MIME type of the remote object.

**-s, --source-account=SOURCE_ACCOUNT**
: Source account name.

**-r, --restart**
: Restart a previous large file upload.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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

##dns## {#dns}
List the DNS domains.

###Syntax
`hpcloud dns [name_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the DNS domains that are associated with the account. The list begins with identifier and contains name, TTL, serial number, email and time created.  Optionally, you can filter the list by specifying name or ID.

###Examples
List all dns domains:

    hpcloud dns

List dns domain with id `421e8cbf`:

    hpcloud dns 421e8cbf

List dns domain `test.com.`:

    hpcloud dns test.com.

###Aliases
`dns:list`

##dns:add## {#dns:add}
Add a DNS domain.

###Syntax
`hpcloud dns:add <name> <email>`

###Options
**-t, --ttl=TTL**
: Time to live.

# Default: 3600

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a DNS domain with the specified name and email address.  Optionally, you can specify a TTL (time to live) to adjust DNS caching of your entry.  The default time to live (TTL) is 3600 (one hour).

###Examples
Create a new DNS domain `mydomain.com` with email address `email@example.com`:

    hpcloud dns:add mydomain.com. email@example.com

Create a new DNS domain `mydomain.com` with email address `email@example.com` and time to live 7200:

    hpcloud dns:add mydomain.com. email@xample.com -t 7200


##dns:records## {#dns:records}
List the records associated with the DNS domain.

###Syntax
`hpcloud dns:records <name_or_id>`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists records associated with the DNS domain specified by name or ID.

###Examples
List records for DNS domain with ID `421e8cbf`:

    hpcloud dns:records 421e8cbf

List records for DNS domain `test.com`:

    hpcloud dns:records test.com.


##dns:records:add## {#dns:records:add}
Add a DNS record.

###Syntax
`hpcloud dns:records:add <domain> <name> <type> <data>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a DNS record to the specified domain with the given name, type and data.

###Examples
Create a DNS record for domain `mydomain.com` and `A` record for `www.mydomain.com` pointing to address 10.0.0.1:

    hpcloud dns:records:add mydomain.com. www.mydomain.com. A 10.0.0.1


##dns:records:remove## {#dns:records:remove}
Remove a DNS record.

###Syntax
`hpcloud dns:records:remove <domain> <name ...>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove a DNS record to the specified domain.  Records may be specified by name or ID.

###Examples
Remove record `www.mydomain.com` from the domain `mydomain.com`.:

    hpcloud dns:records:remove mydomain.com. www.mydomain.com.


##dns:records:update## {#dns:records:update}
Update a DNS record.

###Syntax
`hpcloud dns:records:update <domain> <name> <type> <data>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Update a DNS record to the specified domain with the given name, type and data.

###Examples
Update a DNS domain `mydomain.com` record `A` for `www.mydomain.com` pointing to address 10.0.0.1:

    hpcloud dns:records:update mydomain.com. www.mydomain.com. A 10.0.0.1


##dns:remove## {#dns:remove}
Remove DNS domains (specified by name or ID).

###Syntax
`hpcloud dns:remove name_or_id [name_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove DNS domains by specifying their names or ID. You may specify more than one DNS name or ID on a command line.  Optionally, you can specify an availability zone.

###Examples
Delete the DNS domains `mydomain.com.` and `yourdomain.com.`:

    hpcloud dns:remove mydomain.com. yourdomain.com.

Delete the DNS domain with ID f3f3a427:

    hpcloud dns:remove f3f3a427

###Aliases
`dns:rm, dns:delete, dns:del`

##dns:servers## {#dns:servers}
List the servers associated with the DNS domain.

###Syntax
`hpcloud dns:servers <name_or_id>`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists servers associated with the DNS domain specified by name or ID.

###Examples
List servers for the DNS domain with ID `421e8cbf`:

    hpcloud dns:servers 421e8cbf

List servers for the DNS domain `test.com.`:

    hpcloud dns:servers test.com.


##dns:update## {#dns:update}
Update a DNS domain.

###Syntax
`hpcloud dns:update <name>`

###Options
**-e, --email=EMAIL**
: Email address.

**-t, --ttl=TTL**
: Time to live.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Update a DNS domain with the specified name.  Optionally, you can specify an email or a time to live (TTL) to adjust DNS caching for your entry.  The default TTL is 3600 (one hour).

###Examples
Update DNS domain `mydomain.com` with email address `email@example.com`:

    hpcloud dns:update mydomain.com. -e email@example.com

Update DNS domain `mydomain.com` with email address `email@example.com` and TTL 7200:

    hpcloud dns:update mydomain.com. -e email@xample.com -t 7200


##flavors## {#flavors}
List available flavors.

###Syntax
`hpcloud flavors [name_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.

**-m, --metadata=METADATA**
: Set the meta data.



###Description
Add a new image from an existing server to your compute account. Optionally, you may specify metadata or an availability zone.

###Examples
Create the new image 'my_image' from the existing server named 'my_server':

    hpcloud images:add my_image my_server

Create the new image 'my_image' from the existing server 'my_server' with metadata:

    hpcloud images:add my_image my_server -m this=that


##images:metadata## {#images:metadata}
List the metadata for an image.

###Syntax
`hpcloud images:metadata <image_name_or_id>`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
List the metadata for an image in your compute account. You may specify either the name or ID of the image.  Optionally, you may specify an availability zone.

###Examples
List the metadata for image 'Skynet':

    hpcloud images:metadata Skynet

List the metadata for image '7ba2a4b6':

    hpcloud images:metadata '7ba2a4b6'

###Aliases
`images:metadata:list`

##images:metadata:add## {#images:metadata:add}
Add metadata to an image.

###Syntax
`hpcloud images:metadata:add <name> <metadata>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove existing images by specifying thier names or IDs. Optionally, you may specify an availability zone.

###Examples
Delete image 'my-image':

    hpcloud images:remove my-image

Delete images '53e78869' and '8dbf51b8':

    hpcloud images:remove 53e78869 8dbf51b8

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
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-f, --fingerprint=FINGERPRINT**
: Specify a fingerprint to be used.

**-p, --private-key=PRIVATE_KEY**
: Specify private key data to be used.

**-o, --output**
: Save key pair in the ~/.hpcloud/keypairs folder.

# Default: true

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
Make the 'mykey' private key available for the CLI:

    hpcloud keypairs:private:add mykey ./mykey.pem


##keypairs:private:location## {#keypairs:private:location}
Find the private key for the given server

###Syntax
`hpcloud keypairs:private:location <server_name_or_id>`

###Description
Find the location of the private key for a given server.

###Examples
Print the location of the private key for 'myserver':

    hpcloud keypairs:private:location myserver


##keypairs:private:remove## {#keypairs:private:remove}
Remove a private key file

###Syntax
`hpcloud keypairs:private:remove <key_name> [key_name...]`

###Description
This command removes private key files from the ~/.hpcloud/keypairs directory which is the store used by the CLI. If you plan to continue to use this private key, make sure you have it stored somewhere else.  There is no way to recover a private key that has been deleted unless you have another copy of that key.  Keys are stored in the ~/.hpcloud/keypairs directory by key name and server id, so there may be multiple copies of a single key in the private key store.

###Examples
Remove 'mykey' and 'spare' from the private key storage:

    hpcloud keypairs:private:remove mykey spare

###Aliases
`keypairs:private:rm, keypairs:private:del`

##keypairs:public_key## {#keypairs:public_key}
Display the public keys of a key pair.

###Syntax
`hpcloud keypairs:public_key <name>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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

##lb## {#lb}
List the available load balancers.

###Syntax
`hpcloud lb [name_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the load balancers that are associated with the account. The list begins with identifier and contains name, algorithm, protocol, port and status.  Optionally, you can filter the list by specifying names or IDs.

###Examples
List all load balancers:

    hpcloud lb

List the details for load balancers `1`:

    hpcloud lb 1

List the details for load balancers `testvol`:

    hpcloud lb testvol

###Aliases
`lb:list`

##lb:add## {#lb:add}
Add a load balancer.

###Syntax
`hpcloud lb:add <name> <algorithm> <protocol> <port> -n, --nodes=NODES`

###Options
**-n, --nodes=NODES**
: Nodes to associate with the load balancer. Semicolon separated list of colon separated IP and port pairs

**-v, --ips=IPS**
: Semicolon separated list of of virtual IPs Ids to associate with the load balancer.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a load balancer with the specified name, algorithm, protocol and port.  You must specify a node and may specify a virtual IP id to create a load balancer.

###Examples
Create a new load balancer 'loady':

    hpcloud lb:add loady ROUND_ROBIN HTTP 80 -n '10.1.1.1:80;10.1.1.2:81' -v '123;39393'


##lb:algorithms## {#lb:algorithms}
List the available load balancer algorithms.

###Syntax
`hpcloud lb:algorithms`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the available load balancers algorithms.

###Examples
List all algorithms:

    hpcloud lb:algorithms


##lb:limits## {#lb:limits}
List the available load balancer limits.

###Syntax
`hpcloud lb:limits`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the available load balancers limits.

###Examples
List all limits:

    hpcloud lb:limits


##lb:nodes## {#lb:nodes}
List the nodes associated with the specified load balancer.

###Syntax
`hpcloud lb:nodes name_or_id`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the nodes associated with the specified load balancer. The list begins with identifier and address, port, condition and status.

###Examples
List all nodes for load balancer 'balancer':

    hpcloud lb:nodes balancer

###Aliases
`lb:nodes:list`

##lb:nodes:add## {#lb:nodes:add}
Add a node to the load balancer.

###Syntax
`hpcloud lb:nodes:add <lb_name_or_id> <address> <port>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a node to the load balancer with the specified adddress and port.

###Examples
Create a new node for load balancer 'loady':

    hpcloud lb:nodes:add loady 10.1.1.1 80


##lb:nodes:remove## {#lb:nodes:remove}
Remove the specified load balancer nodes.

###Syntax
`hpcloud lb:nodes:remove lb_name_or_id node_id [node_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove load balancer node by specifying the name or id of the load balancer and the id of the nodes.

###Examples
Delete the load balancers ndoe `1044952` from `scale`:

    hpcloud lb:nodes:remove scale 1044952

###Aliases
`lb:nodes:rm, lb:nodes:delete, lb:nodes:del`

##lb:nodes:update## {#lb:nodes:update}
Update a node in a load balancer.

###Syntax
`hpcloud lb:nodes:update <lb_name_or_id> <node_id> <condition>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Update a node in a load balancer with the specified condition.  The id of the node may be used or `address:port`.

###Examples
Update node '10.1.1.1:80' to 'DISABLED':

    hpcloud lb:nodes:update loady 10.1.1.1:80 DISABLED

Update node '1027580' to 'ENABLED':

    hpcloud lb:nodes:update 220303 1027580 ENABLED


##lb:protocols## {#lb:protocols}
List the available load balancer protocols.

###Syntax
`hpcloud lb:protocols`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the available load balancers protocols.

###Examples
List all protocols:

    hpcloud lb:protocols


##lb:remove## {#lb:remove}
Remove load balancer (specified by name or ID).

###Syntax
`hpcloud lb:remove name_or_id [name_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove load balancers by specifying their names or ID. You may specify more than one load balacner name or ID on a command line.

###Examples
Delete the load balancers `thing1` and `thing2`:

    hpcloud lb:remove thing1 thing2

Delete the load balancer with ID 998:

    hpcloud lb:remove 998

###Aliases
`lb:rm, lb:delete, lb:del`

##lb:update## {#lb:update}
Update a node in a load balancer.

###Syntax
`hpcloud lb:update <lb_name_or_id> <name_or_id> <algorithm>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Update a load balancer with the specified algorithm.  The name or id of the load balancer may be used to identify it.

###Examples
Update node 'loady' to 'ROUND_ROBIN':

    hpcloud lb:update loady ROUND_ROBIN

Update node '220303' to 'LEAST_CONNECTIONS':

    hpcloud lb:update 220303 LEAST_CONNECTIONS


##lb:versions## {#lb:versions}
List the available load balancer versions.

###Syntax
`hpcloud lb:versions`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the available load balancers versions.

###Examples
List all versions:

    hpcloud lb:versions


##lb:virtualips## {#lb:virtualips}
List the virtual IPs for the specified load balancer.

###Syntax
`hpcloud lb:virtualips name_or_id`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists the virtual IPs for the specified load balancer.

###Examples
List the virtual IPs for 'loader':

    hpcloud lb:virtualips loader


##list## {#list}
List containers or container contents.

###Syntax
`hpcloud list [container ...]`

###Options
**-l, --long**
: Long listing.

**--sync**
: List synchronizations.

**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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

##metadata## {#metadata}
Get the metadata value of a container or object.

###Syntax
`hpcloud metadata <name> [attribute...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Get the various metadata values for an object or container.

###Examples
List all the attributes:

    hpcloud metadata :my_container

Get the value of the attribute 'X-Cdn-Uri':

    hpcloud metadata :my_container X-Cdn-Uri

List all the attributes for the object:

    hpcloud metadata :my_container/dir/file.txt


##metadata:set## {#metadata:set}
Set attributes on a object.

###Syntax
`hpcloud metadata:set <name> <attribute> <value>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Set metadata values for containers and objects.  Container metadata keys generally begin with `X-Container-Meta-` and some other special metadata values you can set for containers include:

* Authorization
* X-Auth-Token
* X-Container-Read
* X-Container-Write
* X-Container-Sync-To
* X-Container-Sync-Key
* X-Container-Meta-Web-Index
* X-Container-Meta-Web-Error
* X-Container-Meta-Web-Listings
* X-Container-Meta-Web-Listings-CSS
* X-Versions-Location


Object metadata keys generally begin with `X-Object-Meta-` and some other special metadata values you can set for objects include:

* Content-Type
* Content-Disposition
* X-Delete-At
* X-Delete-After
* X-Object-Manifest


Check http://docs.hpcloud.com/api/object-storage/ for up to date changes on the valid keys and values.  Unfortunately, the server may positively acknowledge the setting of invalid keys.  It may be best to query for the value after setting it to verify the set worked.

###Examples
Set the attribute 'X-Container-Meta-Web-Index' to index.htm:

    hpcloud metadata :my_container "X-Container-Meta-Web-Index" index.htm

Set the attribute 'X-Object-Meta-Key' to metavalue:

    hpcloud metadata:set :my_container/objay.txt X-Object-Meta-Key metavalue

Set the attribute 'Content-Type' to text/plain:

    hpcloud metadata:set :my_container/objay.txt Content-Type text/plain


##migrate## {#migrate}
Migrate files from a provider described by the source account.

###Syntax
`hpcloud migrate <source_account> <source> [source ...] <destination>`

###Options
**-m, --mime=MIME**
: Set the MIME type of the remote object.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Migrates files from the designated provider to the HP Cloud destination. This command works similarly to `copy` except the first argument is the source account (for example, `AWS`).  The source objects may be containers, objects, or regular expressions.

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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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

##networks## {#networks}
List the available networks.

###Syntax
`hpcloud networks [name_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the networks that are associated with the account. The list begins with identifier and contains name, status, shared, admin state, and subnets.  Optionally, you can filter the list by specifying name or ID.

###Examples
List all networks:

    hpcloud networks

List the details for networks with id `12857174`:

    hpcloud networks 12857174

List the details for networks named `testo`:

    hpcloud networks testo

###Aliases
`networks:list`

##networks:add## {#networks:add}
Add a network.

###Syntax
`hpcloud networks:add <name>`

###Options
**-u, --adminstateup**
: Administrative state up.

# Default: true

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a new network in your account with the specified name.  Optionally, you can specify administrative state.

###Examples
Create a new network named 'netty':

    hpcloud networks:add netty

Create a new network named 'netty' admin state down:

    hpcloud networks:add netty --no-adminstateup


##networks:remove## {#networks:remove}
Remove a network (specified by name or ID).

###Syntax
`hpcloud networks:remove name_or_id [name_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove network by specifying their names or ID. You may specify more than one network name or ID on a command line.

###Examples
Delete the network 'arpa' and 'darpa':

    hpcloud networks:remove arpa darpa

Delete the network with ID 998:

    hpcloud networks:remove 0b78d0cd

###Aliases
`networks:rm, networks:delete, networks:del`

##networks:update## {#networks:update}
Update a network.

###Syntax
`hpcloud networks:update <name>`

###Options
**-u, --adminstateup**
: Administrative state up.

# Default: true

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Update network in your account with the specified name.  The administrative state may be updated.

###Examples
Updated 'netty' to up:

    hpcloud networks:update netty -u

Update 'netty' admin state down:

    hpcloud networks:update netty --no-adminstateup


##ports## {#ports}
List the available ports.

###Syntax
`hpcloud ports [name_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the ports that are associated with the account. The list begins with identifier and contains name, network identifier, fixed IPs, MAC address, status, admin state, device identifier, and device owner.  Optionally, you can filter the list by specifying name or ID.

###Examples
List all ports:

    hpcloud ports

List the details for ports with id `1`:

    hpcloud ports 1

List the details for ports named `testo`:

    hpcloud ports testo

###Aliases
`ports:list`

##ports:add## {#ports:add}
Add a port.

###Syntax
`hpcloud ports:add <name> <network_id_or_name>`

###Options
**-f, --fixedips=FIXEDIPS**
: Fixed IPs.

**-m, --macaddress=MACADDRESS**
: MAC address.

**-u, --adminstate**
: Administrative state.

# Default: true

**-d, --deviceid=DEVICEID**
: Device ID.

**-o, --deviceowner=DEVICEOWNER**
: Device owner.

**-g, --securitygroups=SECURITYGROUPS**
: Security groups.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a new port to your network with the specified name.  Optionally, you can specify fixed IPs, MAC address, administrative state, device identifier, device owner, and security groups.

###Examples
Create a new port named 'porto':

    hpcloud ports:add porto netty

Create a new port named 'porto' associated with 'devvy' and 'ohnur' administratively up:

    hpcloud ports:add porto netty -d devvy -o ohnur -u


##ports:remove## {#ports:remove}
Remove a port (specified by name or ID).

###Syntax
`hpcloud ports:remove name_or_id [name_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove port by specifying their names or ID. You may specify more than one port name or ID on a command line.

###Examples
Delete the port 'blue' and 'red':

    hpcloud ports:remove blue red

Delete the port with ID 6d45794b:

    hpcloud ports:remove 6d45794b

###Aliases
`ports:rm, ports:delete, ports:del`

##ports:update## {#ports:update}
Update a port.

###Syntax
`hpcloud ports:update <name>`

###Options
**-f, --fixedips=FIXEDIPS**
: Fixed IPs.

**-u, --adminstate**
: Administrative state.

# Default: true

**-d, --deviceid=DEVICEID**
: Device ID.

**-o, --deviceowner=DEVICEOWNER**
: Device owner.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Update fixed IPs, administrative state, device identifier, or device owner on a port in your network.

###Examples
Update 'porto' administrative status and device owner:

    hpcloud ports:update porto -u -d trump


##remove## {#remove}
Remove objects or containers.

###Syntax
`hpcloud remove object_or_container [object_or_container ...]`

###Options
**-f, --force**
: Do not confirm removal; remove non-empty containers.

**--at=AT**
: Delete the object at the specified UNIX epoch time.

**--after=AFTER**
: Delete the object after the specified number of seconds.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove objects or containers. Optionally, you can specify an availability zone.

###Examples
Delete objects 'my.txt' and 'other.txt' from container `tainer`:

    hpcloud remove :tainer/my.txt :tainer/other.txt

Delete container 'my_container':

    hpcloud remove :my_container

Delete object 'my_container/current.log' after 2 hours:

    hpcloud remove --after 7200 :my_container/current.log

Delete object 'my_container/current.log' in the morning of 4/16/2013:

    hpcloud remove --at 1366119838 :my_container/current.log

Delete container 'my_container' in availability zone `region-a.geo-1`:

    hpcloud remove :my_container -z region-a.geo-1

###Aliases
`rm, delete, destroy, del`

##routers## {#routers}
List the available routers.

###Syntax
`hpcloud routers [name_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the routers that are associated with the account. The list begins with identifier and contains name, status, administrative state, and gateways.  Optionally, you can filter the list by specifying name or ID.

###Examples
List all routers:

    hpcloud routers

List the details for routers with id `1`:

    hpcloud routers 1

List the details for routers named `testo`:

    hpcloud routers testo

###Aliases
`routers:list`

##routers:add## {#routers:add}
Add a router.

###Syntax
`hpcloud routers:add <name>`

###Options
**-g, --gateway=GATEWAY**
: Network to use as external router.

**-u, --adminstateup**
: Administrative state.

# Default: true

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a new router to your network with the specified name.  If a gateway is not specified, the first network that has router_external set to true is used (typically `Ext-Net`.  If you do not want to a external network, send the gateway option with an empty string.

###Examples
Create a new router named 'routerone':

    hpcloud routers:add routerone

Create a new router named 'routertwo' with the specified network as a gateway:

    hpcloud routers:add routertwo -g Ext-Net


##routers:interface:add## {#routers:interface:add}
Add an interface to a router.

###Syntax
`hpcloud routers:interface:add <router> <subnet_or_port>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add an interface to your router with the specified subnet or port.

###Examples
Add an interface to the subnet 'subnetty':

    hpcloud routers:interface:add trout subnetty

Add an interface to the port 'porto':

    hpcloud routers:interface:add trout proto


##routers:interface:remove## {#routers:interface:remove}
Remove router interface.

###Syntax
`hpcloud routers:interface:remove <router_name_or_id> <subnet_or_port>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove router port or subnet router interface from router.

###Examples
Delete port 'puerto' from 'trout':

    hpcloud routers:interface:remove trout puerto

Delete subnet 'netty' from 'trout':

    hpcloud routers:interface:remove trout netty

###Aliases
`routers:interface:rm, routers:interface:delete, routers:interface:del`

##routers:remove## {#routers:remove}
Remove a router (specified by name or ID).

###Syntax
`hpcloud routers:remove name_or_id [name_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove router by specifying their names or ID. You may specify more than one router name or ID on a command line.

###Examples
Delete the router 'blue' and 'red':

    hpcloud routers:remove blue red

Delete the router with ID 39e36520:

    hpcloud routers:remove 39e36520

###Aliases
`routers:rm, routers:delete, routers:del`

##routers:update## {#routers:update}
Update the specified router.

###Syntax
`hpcloud routers:update <name>`

###Options
**-g, --gateway=GATEWAY**
: Network to use as external router.

**-u, --adminstateup**
: Administrative state.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Update an existing router with new administrative state or gateway infomration.  If you do not want an external network, use the gateway option with an empty string.

###Examples
Update router 'trout' administrative state:

    hpcloud routers:update trout -u


##securitygroups## {#securitygroups}
List the available security groups.

###Syntax
`hpcloud securitygroups [name_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a new security group by specifying a name and a description. Optionally, you can specify an availability zone.

###Examples
Add new security group `mysecgroup` with description `seg group desc`:

    hpcloud securitygroups:add mysecgroup "seg group desc"


##securitygroups:remove## {#securitygroups:remove}
Remove a security group or groups.

###Syntax
`hpcloud securitygroups:remove name_or_id [name_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove existing security groups by name or ID. Optionally, you can specify an availability zone.

###Examples
Remove the security groups `group1` and `group2`:

    hpcloud securitygroups:remove group1 group2

Remove the security group with the ID `41fb5504`:

    hpcloud securitygroups:remove 41fb5504

###Aliases
`securitygroups:rm, securitygroups:delete, securitygroups:del`

##securitygroups:rules## {#securitygroups:rules}
Display the list of rules for a security group.

###Syntax
`hpcloud securitygroups:rules <sec_group_name>`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
List the rules for a security group for your compute account. Optionally, you can specify an availability zone.

###Examples
List the rules for security group `mysecgroup`:

    hpcloud securitygroups:rules mysecgroup

###Aliases
`securitygroups:rules:list`

##securitygroups:rules:add## {#securitygroups:rules:add}
Add a rule to the security group.

###Syntax
`hpcloud securitygroups:rules:add <sec_group_name> <ip_protocol>`

###Options
**-p, --port-range=PORT_RANGE**
: Specify a port range like 22..22

**-c, --cidr=CIDR**
: Specify a cidr ip range like 0.0.0.0/0

**-g, --source-group=SOURCE_GROUP**
: Specify a source group.

**--direction=DIRECTION**
: Direction egress or ingress.

# Default: egress

**--ethertype=ETHERTYPE**
: Ether type must be IPv6 or IPv4.

# Default: IPv4

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a rule to the security group. If <ip_protocol> is specified as `icmp`, then port range may be omitted.  If <cidr> is not specified, then the address defaults to `0.0.0.0/0`. To allow communications within a given security group, you must specify a source group while creating a rule. Optionally, you can specify an availability zone.

###Examples
Set the default port range to -1..-1:

    hpcloud securitygroups:rules:add mysggroup icmp

Set the default cidr to `0.0.0.0/0`:

    hpcloud securitygroups:rules:add mysggroup tcp -p 22..22

Set the cidr to `111.111.111.111/1`:

    hpcloud securitygroups:rules:add mysggroup tcp -p 80..80 -c "111.111.111.111/1"

Set the source group to `mysourcegroup`:

    hpcloud securitygroups:rules:add mysggroup tcp -p 80..80 -g "mysourcegroup"

###Aliases
`securitygroups:rules:authorize`

##securitygroups:rules:remove## {#securitygroups:rules:remove}
Remove security group rules.

###Syntax
`hpcloud securitygroups:rules:remove rule_id [rule_id...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove the specified security group rules.  More than one rule may be specified on the command line.

###Examples
Remove the rule `6686fc56`:

    hpcloud securitygroups:rules:remove 6686fc56

Remove the rule `6686fc56` and `2ffc3a4c`:

    hpcloud securitygroups:rules:remove 6686fc56 2ffc3a4c

###Aliases
`securitygroups:rules:rm, securitygroups:rules:revoke, securitygroups:rules:delete, securitygroups:rules:del`

##servers## {#servers}
List the available servers.

###Syntax
`hpcloud servers [name_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.

**--all-regions=ALL_REGIONS**
: List servers for all regions.



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
**-k, --key-name=KEY_NAME**
: Specify a key name to be used.

**-i, --image=IMAGE**
: Image to use to create the server.

**-v, --volume=VOLUME**
: Volume to use to create the server.

**-s, --security-group=SECURITY_GROUP**
: Specify a security group or comma seperated list of security groups to be used.

**-p, --private-key-file=PRIVATE_KEY_FILE**
: Name of the pem file with your private key.

**-m, --metadata=METADATA**
: Set the meta data.

**-n, --network=NETWORK**
: Network to use for the server.

**-u, --userdata=USERDATA**
: File which contains user data.

**--personality=PERSONALITY**
: Directory containing personality for server.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a new server to your compute account. You must specify:  Server name, a flavor, an image or volume to use, and a key pair.  If you are creating a windows server, the flavor must be at least a large and you must specify a security group that has the RDP port open.  Optionally, you can specify a security group, key name, metadata and availability zone.

###Examples
Create a new small server named 'my_server' with image 90ea5676 and key1:

    hpcloud servers:add my_server small -i 90ea5676 -k key1

Create a windows server with the specified key, security group, and private key to decrypt the password:

    hpcloud servers:add winserv large -i c80dfe05 -k winpair -s allowsRDP -p ./winpair.pem

Create a new large server named 'my_server' using volume `natty`, key `key1`, and the `sg1` security group:

    hpcloud servers:add my_server large -v natty -k key1 -s sg1

Create a new small server named 'my_server' using the specified image, flavor, key and metadata this=that:

    hpcloud servers:add my_server small -i 53e78869 -k key1 -m this=that

Create 'my_server' with the personality specified in the directory 'rootdir':

    hpcloud servers:add my_server large -i 53e78869 -k key1 --personality rootdir


##servers:console## {#servers:console}
Get the console output of a server or extract the windows password.

###Syntax
`hpcloud servers:console <server_name_or_id> [lines]`

###Options
**-p, --private-key-file=PRIVATE_KEY_FILE**
: Private key pem file used to decrypt windows password.

**-d, --dump-password**
: Dump the windows password if the private key is known by the CLI.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Display the console output of a server.  When the `-p` option is used with the private key file for the server, if the decrypted password is still available on the console, it is displayed.

###Examples
Display 100 lines of console ouput:

    hpcloud servers:console my-server 100

Display the password of the winserver:

    hpcloud servers:console winserver -p win.pem


##servers:limits## {#servers:limits}
List compute limits.

###Syntax
`hpcloud servers:limits`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the compute limits for this project.

###Examples
List all limits:

    hpcloud servers:limits


##servers:metadata## {#servers:metadata}
List the metadata for a server.

###Syntax
`hpcloud servers:metadata <name_or_id>`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
List the metadata for a server in your compute account. You can specify either the name or the ID of the server.  Optionally, you can specify an availability zone.

###Examples
List server metadata:

    hpcloud servers:metadata Skynet

###Aliases
`servers:metadata:list`

##servers:metadata:add## {#servers:metadata:add}
Add metadata to a server.

###Syntax
`hpcloud servers:metadata:add <name_or_id> <metadata>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Change the password for an existing server. The password must adhere to the existing security complexity naming rules. Optionally, you can specify an availability zone.

###Examples
Change the password for server 'my-server':

    hpcloud servers:password my-server my-password

###Aliases
`servers:passwd`

##servers:ratelimits## {#servers:ratelimits}
List compute rate limits.

###Syntax
`hpcloud servers:ratelimits`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the compute rate limits for this project.

###Examples
List all rate limits:

    hpcloud servers:ratelimits


##servers:reboot## {#servers:reboot}
Reboot a server or servers (specified by server name or ID).

###Syntax
`hpcloud servers:reboot name_or_id [name_or_id ...]`

###Options
**-h, --hard**
: Hard reboot a server.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Reboot an existing server specified name or ID. Rebooting a server can take some time so it might be necessary to check the status of the server by issuing the command `hpcloud servers`. The default is a soft reboot, but you can specify the `-h` option for a hard reboot. Optionally, you can specify an availability zone.

###Examples
Reboot server 'Hal9000':

    hpcloud servers:reboot Hal9000

Reboot the servers with the IDs 53e78869 and c80dfe05:

    hpcloud servers:reboot 53e78869 c80dfe05


##servers:rebuild## {#servers:rebuild}
Rebuild a server (specified by server name or ID).

###Syntax
`hpcloud servers:rebuild name_or_id [image_name_or_id]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Rebuild an existing server specified by name or ID. Optionally, you may rebuild the server with a new image.  Rebuilding a server may take some time so it might be necessary to check the status of the server by issuing the command `hpcloud servers`. Optionally, you can specify an availability zone.

###Examples
Rebuild server 'Hal9000':

    hpcloud servers:rebuild Hal9000

Rebuild server 53e78869 with image c80dfe05:

    hpcloud servers:rebuild 53e78869 c80dfe05


##servers:remove## {#servers:remove}
Remove a server or servers (specified by name or ID).

###Syntax
`hpcloud servers:remove name_or_id [name_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove existing servers by specifying their name or ID. Optionally, you can specify an availability zone.

###Examples
Delete 'my-server':

    hpcloud servers:remove my-server

Delete the servers 'DeepThought' and 'Blaine':

    hpcloud servers:remove DeepThought Blaine

Delete the server with the ID 53e78869:

    hpcloud servers:remove 53e78869

###Aliases
`servers:rm, servers:delete, servers:del`

##servers:securitygroups:add## {#servers:securitygroups:add}
Add a security group to a server.

###Syntax
`hpcloud servers:securitygroups:add <server> <security_group>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a security group to a server.

###Examples
Add the 'sg1' security group to 'my_server':

    hpcloud servers:securitygroups:add my_server sg1


##servers:securitygroups:remove## {#servers:securitygroups:remove}
Remove a security group from a server.

###Syntax
`hpcloud servers:securitygroups:remove <server> <security_groups>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove a security group from a server.

###Examples
Remove security group 'sg2' from 'my_server':

    hpcloud servers:securitygroups:remove my_server sg2


##servers:ssh## {#servers:ssh}
Secure shell into a server.

###Syntax
`hpcloud servers:ssh <server_name_or_id>`

###Options
**-p, --private-key-file=PRIVATE_KEY_FILE**
: Name of the pem file with your private key.

**-k, --keypair=KEYPAIR**
: Name of keypair to use.

**-l, --login=LOGIN**
: Login id to use.

**-c, --command=COMMAND**
: Command to use to connect.

# Default: ssh

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Log in using the secure shell to the specified server.

###Examples
Use the secure shell to log into the bugs server:

    hpcloud servers:ssh bugs -p bunny.pem

Use the secure shell to log into server `daffy`, which has a known key pair:

    hpcloud servers:ssh daffy

Use the secure shell to log into server with given public IP, which has a known key pair known to the CLI:

    hpcloud servers:ssh 15.185.104.210


##snapshots## {#snapshots}
List block devices available.

###Syntax
`hpcloud snapshots [name_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-d, --description=DESCRIPTION**
: Description of the snapshot.

**-m, --metadata=METADATA**
: Set the meta data.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove snapshots by specifying their names or ID. Optionally, you can specify an availability zone.

###Examples
Delete the snapshots `snappy1` and `snappy2`:

    hpcloud snapshots:remove snappy1 snappy2

Delete snapshot with the ID 53e78869:

    hpcloud snapshots:remove 53e78869

Delete snapshot `snappy` for availability zone `az-2.region-a.geo-1`:

    hpcloud snapshots:remove snappy -z az-2.region-a.geo-1

###Aliases
`snapshots:rm, snapshots:delete, snapshots:del`

##subnets## {#subnets}
List the available subnets.

###Syntax
`hpcloud subnets [name_or_id ...]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Lists all the subnets that are associated with the account. The list begins with identifier and contains name, status, shared, admin state, and subnets.  Optionally, you can filter the list by specifying name or ID.

###Examples
List all subnets:

    hpcloud subnets

List the details for subnets with id `1`:

    hpcloud subnets 1

List the details for subnets named `testo`:

    hpcloud subnets testo

###Aliases
`subnets:list`

##subnets:add## {#subnets:add}
Add a subnet.

###Syntax
`hpcloud subnets:add <name> <network_id_or_name> <cidr>`

###Options
**-i, --ipversion=IPVERSION**
: IP version.

**-g, --gateway=GATEWAY**
: Gateway IP address.

**-d, --dhcp**
: Enable DHCP.

# Default: true

**-n, --dnsnameservers=DNSNAMESERVERS**
: Comma separated list of DNS name servers.

**-h, --hostroutes=HOSTROUTES**
: Semicolon separated list of host routes pairs.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a new subnet to your network with the specified name and CIDR.  Optionally, you can specify IP version, gateway, DHCP, DNS name servers, or host routes.  The add command will do its best to guess the IP version from the CIDR, but you may override it.  The DNS name servers should be a command seperated list e.g.: 10.1.1.1,10.2.2.2.  The host routes should be a semicolon separated list of destination and nexthop pairs e.g.: 127.0.0.1/32,10.1.1.1;100.1.1.1/32,10.2.2.2

###Examples
Create a new subnet named 'subwoofer':

    hpcloud subnets:add subwoofer netty 127.0.0.0/24

Create a new subnet named 'subwoofer' with gateway and DHCP:

    hpcloud subnets:add subwoofer netty 127.0.0.0/24 -g 127.0.0.1 -d


##subnets:remove## {#subnets:remove}
Remove a subnet (specified by name or ID).

###Syntax
`hpcloud subnets:remove name_or_id [name_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove subnet by specifying their names or ID. You may specify more than one subnet name or ID on a command line.

###Examples
Delete the subnet 'blue' and 'red':

    hpcloud subnets:remove blue red

Delete the subnet with ID ffc0edba:

    hpcloud subnets:remove ffc0edba

###Aliases
`subnets:rm, subnets:delete, subnets:del`

##subnets:update## {#subnets:update}
Update a subnet.

###Syntax
`hpcloud subnets:update <name>`

###Options
**-i, --ipversion=IPVERSION**
: IP version.

**-g, --gateway=GATEWAY**
: Gateway IP address.

**-d, --dhcp**
: Enable DHCP.

**-n, --dnsnameservers=DNSNAMESERVERS**
: Comma separated list of DNS name servers.

**-h, --hostroutes=HOSTROUTES**
: Semicolon separated list of host routes pairs.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Update a subnet IP version, gateway, DHCP, DNS name servers, or host routes.  The update command will do its best to guess the IP version from the CIDR, but you may override it.  The DNS name servers should be a command seperated list e.g.: 10.1.1.1,10.2.2.2.  The host routes should be a semicolon separated list of destination and nexthop pairs e.g.: 127.0.0.1/32,10.1.1.1;100.1.1.1/32,10.2.2.2

###Examples
Update 'subwoofer' gateway:

    hpcloud subnets:update subwoofer -g 10.0.0.1

Update 'subwoofer' with new DNS and DHCP:

    hpcloud subnets:update subwoofer -n 100.1.1.1 -d


##tempurl## {#tempurl}
Create temporary URLs for the given objects.

###Syntax
`hpcloud tempurl <object> ...`

###Options
**-p, --time-period=TIME_PERIOD**
: time period to keep the url alive

**-u, --update**
: Update an existing tempurl

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



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
**-d, --description=DESCRIPTION**
: Description of the volume.

**-m, --metadata=METADATA**
: Set the metadata.

**-s, --snapshot=SNAPSHOT**
: Create a volume from the specified snapshot.

**-i, --image=IMAGE**
: Create a volume from the specified image.

**--zone=ZONE**
: Create a volume in the specified zone.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Add a new volume to your compute account with the specified name and size.  Optionally, you can specify a description, metadata or availability zone.  If you do not specify a size, it is taken from the specified snapshot or image.  If no image or snapshot is specified, the size defaults to 1 gigabyte.

###Examples
Create a new volume named 'my_volume' of size 10 in zone az3:

    hpcloud volumes:add my_volume 10 --zone az3

Create a new volume named 'my_volume' based on the snapshot 'snappy':

    hpcloud volumes:add my_volume -s 'snappy'

Create a new bootable volume named 'my_volume' based on the image '53e78869':

    hpcloud volumes:add my_volume -i 53e78869


##volumes:attach## {#volumes:attach}
Attach a volume to a server specified by device name or number.

###Syntax
`hpcloud volumes:attach <volume> <server> <device_or_number>`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Attach a volume to a server on the specified device name.  You may specify a device name in the format /dev/vdX where X is c, d, e, ... or a attacment point 3, 4, 5,...  The attacment point 1 would map to /dev/vda on a Linux platform, but /dev/vda and /dev/vdb are already in use by the server, so you need to start with 3 or /dev/vdc.  If you attempt to attach a volume to an attachment point that is in use, it will fail silently.  The call is asynchronous and the failure cannot be detected by the CLI.  If you attempt to mount to attachment point 4 and attachment point 3 is not in use, your volume will be attached to attachment point 3 or /dev/vdc on Linux.  This cannot be detected by the CLI.

###Examples
Attach volume `myVolume` to server `myServer` on device `/dev/vdc`:

    hpcloud volumes:attach myVolume myServer /dev/vdc

Attach volume `myVolume` to server `myServer` on device `/dev/vdb`:

    hpcloud volumes:attach myVolume myServer 4


##volumes:detach## {#volumes:detach}
Detach a volume or volumes.

###Syntax
`hpcloud volumes:detach name_or_id [name_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Detach volumes from all servers.  You may specify the volume by name or ID.  You can detach one more more volumes in a command line.

###Examples
Detach the volume 'myVolume':

    hpcloud volumes:detach myVolume

Detach the volume with ID 1159:

    hpcloud volumes:detach 3407653b


##volumes:remove## {#volumes:remove}
Remove a volume or volumes (specified by name or ID).

###Syntax
`hpcloud volumes:remove name_or_id [name_or_id ...]`

###Options
**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
Remove volumes by specifying their names or ID. You may specify more than one volume name or ID on a command line.  Optionally, you can specify an availability zone.

###Examples
Delete the volumes 'tome' and 'treatise':

    hpcloud volumes:remove tome treatise

Delete the volume with ID 038d0e77:

    hpcloud volumes:remove 038d0e77

###Aliases
`volumes:rm, volumes:delete, volumes:del`

##volumes:server## {#volumes:server}
List the volumes on server.

###Syntax
`hpcloud volumes:server [server]`

###Options
**-c, --columns=COLUMNS**
: Comma separated list of columns in report.

**-d, --separator=SEPARATOR**
: Use the specified value as the report separator.

**-z, --availability-zone=AVAILABILITY_ZONE**
: Set the availability zone.

**-x, --debug=DEBUG**
: Debug logging 1,2,3,...

**--tenantid=TENANTID**
: Tenant id for account.

**-a, --account-name=ACCOUNT_NAME**
: Select account.



###Description
List the volumes attached to servers with the device they are using.  Optionally, you may filter by specifying the server name or ID on the command line.

###Examples
List all the attached volumes:

    hpcloud volumes:server

List the volumes on server `myServer`:

    hpcloud volumes:server myServer


