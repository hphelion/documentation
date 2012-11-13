---
layout: default
title: "UNIX CLI: Command Line Reference"
permalink: /cli/unix/reference/

---
# UNIX CLI: Command Line Reference

Below you can find a full reference of supported UNIX command-line interface (CLI) commands. The commands are alphabetized.  You can also use the <font face="Courier">hpcloud help [<em>command</em>]</font> tool (where <em>command</em> is the name of the command on which you want help, for example <font face="Courier">account:setup</font>) to display usage, description, and option information from the command line.

<h2 id="account">account</h2>
List your accounts and account settings.

###Syntax
<font face="Courier">hpcloud account [<i>account_name</i>]</font>

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
<font face='courier'>account:list</font>

<h2 id="account:copy">account:copy</h2>
Copy account data to the specified account.

###Syntax
<font face="Courier">hpcloud account:copy &lt;<i>from_account</i>&gt; &lt;<i>to_account</i>&gt;</font>

###Description
The copy command overwrites the destination account with the source account information.

###Examples
Copy account `useast` to account `backup`:

    hpcloud account:copy useast backup


<h2 id="account:edit">account:edit</h2>
Edit your account credentials.

###Syntax
<font face="Courier">hpcloud account:edit [<i>account_name</i>]</font>

###Options
<dl>
<dt><b>-n, [--no-validate]</b></dt><dd>Don't verify account settings during edit</dd>  
</dl>

###Description
Set up or modify your account credentials. If you do not specify an account name on the command line, the default account is updated.

You  need your Access Key Id, Secret Key and Tenant Id from the HP Cloud web site to set up your account. Optionally, you can specify your own endpoint to access, but in most cases we recommend you use the default.

Availability zones typically have the format <font face='courier'>az-1.region-a.geo-1</font> or <font face='courier'>region-a.geo-1</font>, depending on the service.  See your account API keys page to see your list of activated availability zones: https://console.hpcloud.com/account/api_keys

<font face='courier'>account:edit</font> prompts you for the following values:

* Access Key Id
* Secret Key
* Auth Uri
* Tenant Id
* Compute zone
* Storage zone
* Block zone

You can re-run this command at any time to modify your settings.

###Examples
Edit the <font face='courier'>default</font> account settings:

    hpcloud account:edit


<h2 id="account:remove">account:remove</h2>
Remove accounts.

###Syntax
<font face="Courier">hpcloud account:remove account_name [<i>account_name ...</i>]</font>

###Description
Remove accounts.  You may specify one or more account to remove on the command line.

###Examples
Remove the `useast` and `uswest` accounts:

    hpcloud account:remove useast uswest

###Aliases
<font face='courier'>account:rm, account:delete, account:del</font>

<h2 id="account:setup">account:setup</h2>
Set up or modify your credentials.

###Syntax
<font face="Courier">hpcloud account:setup [<i>account_name</i>]</font>

###Options
<dl>
<dt><b>-n, [--no-validate]</b></dt><dd>Don't verify account settings during setup</dd>  
</dl>

###Description
Set up or modify your account credentials. This is generally the first step in the process of using the HP Cloud Services command-line interface.  If you do not specify an account name on the command line, the `default` account is updated.

You need your Access Key Id, Secret Key and Tenant Id from the HP Cloud web site to set up your account. Optionally, you can specify your own endpoint to access, but in most cases we recommend you  use the default.

Availability zones typically have the format az-1.region-a.geo-1 or region-a.geo-1 depending on the service.  See your account API keys page to see your list of activated availability zones: https://console.hpcloud.com/account/api_keys

<font face='courier'>account:edit</font> prompts you for the following values:

* Access Key Id
* Secret Key
* Auth Uri
* Tenant Id
* Compute zone
* Storage zone
* CDN zone
* Block zone

###Examples
Set up the default account:

    account:setup


<h2 id="account:update">account:update</h2>
Modify your account credentials, zones, or options.

###Syntax
<font face="Courier">hpcloud account:update &lt;<i>account_name</i>&gt; &lt;<i>name_value_pair</i>&gt; ...</font>

###Description
Add or update your account credentials, zones, or options.  You may specify one or more name value pairs to update on a single command line.  Valid settings include:

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

Availability zones typically have the format `az-1.region-a.geo-1` or `region-a.geo-1` depending on the service.  See your account API keys page to see your list of activated availability zones: https://console.hpcloud.com/account/api_keys

###Examples
Set the account credential authorization URI to `https://127.0.0.1` and the block availability zone to `region-a`:

    hpcloud account:update pro auth_uri='https://127.0.0.1/' block_availability_zone='region-a'

###Aliases
<font face='courier'>account:add</font>

<h2 id="account:use">account:use</h2>
Overwrite the default account with specified account.

###Syntax
<font face="Courier">hpcloud account:use &lt;<i>account_to_use</i>&gt;</font>

###Description
Use the specified account as your default account.  This command overwrites the default account.

###Examples
Set the default account to `useast`:

    hpcloud account:use useast


<h2 id="acl">acl</h2>
View the ACL for an object or container.

###Syntax
<font face="Courier">hpcloud acl &lt;<i>object/container</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
View the access control list (ACL) for a container or object. Optionally, you can specify an availability zone.

###Examples
Display the ACL for the object <font face='courier'>my_file.txt</font>:

    hpcloud acl :my_container/my_file.txt

Display the ACL for the container <font face='courier'>my_container</font>:

    hpcloud acl :my_container

Display the ACL for the container <font face='courier'>my_container</font> for availability zone `region-a.geo-1`:

    hpcloud acl :my_container -z region-a.geo-1


<h2 id="acl:set">acl:set</h2>
Set a given resource to a canned ACL.

###Syntax
<font face="Courier">hpcloud acl:set &lt;<i>resource</i>&gt; &lt;<i>acl</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Set the Access Control List (ACL) values for the specified containers. The supported ACL settings are private or public-read. Optionally, you can select a specific availability zone.

###Examples
Set the <font face='courier'>my_container</font> ACL value to public-read.

    hpcloud acl:set :my_container public-read

Set the <font face='courier'>my_container</font> ACL value to private.

    hpcloud acl:set :my_container private

Set <font face='courier'>my_container</font> ACL to public-read for an availability zone.

    hpcloud acl:set :my_container public-read -z region-a.geo-1


<h2 id="addresses">addresses</h2>
Display list of available addresses.

###Syntax
<font face="Courier">hpcloud addresses [<i>ip_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>addresses:list</font>

<h2 id="addresses:add">addresses:add</h2>
Add or allocate a new public IP address.

###Syntax
<font face="Courier">hpcloud addresses:add</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>addresses:allocate</font>

<h2 id="addresses:associate">addresses:associate</h2>
Associate a public IP address to a server instance.

###Syntax
<font face="Courier">hpcloud addresses:associate &lt;<i>ip_or_id</i>&gt; &lt;<i>server_name_or_id</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Associate an existing and unassigned public IP address, to the specified server instance.  Optionally, you can specify an availability.

###Examples
Associate the address `111.111.111.111` to server `myserver`:

    hpcloud addresses:associate 111.111.111.111 myserver

Associate the address `111.111.111.111` to server `myserver` in availability zone `az-2.region-a.geo-1`:

    hpcloud addresses:associate 111.111.111.111 myserver -z az-2.region-a.geo-1


<h2 id="addresses:disassociate">addresses:disassociate</h2>
Disassociate any server instance associated to the public IP address.

###Syntax
<font face="Courier">hpcloud addresses:disassociate ip_or_id [<i>ip_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Disassociate any server instance associated to the public IP address. The public IP address is not removed or released to the pool. Optionally, you can specify an availability zone.

###Examples
Disassociate IP addresses `111.111.111.111` and `127.0.0.1` from the default server:

    hpcloud addresses:disassociate 111.111.111.111 127.0.0.1

Disassociate the address with the ID  <font face='courier'>9709</font>:

    hpcloud addresses:disassociate 9709

Disassociate the address `111.111.111.111` for availability zone `az-2.region-a.geo-1`:

    hpcloud addresses:disassociate 111.111.111.111 -z az-2.region-a.geo-1


<h2 id="addresses:remove">addresses:remove</h2>
Remove or release a public IP address.

###Syntax
<font face="Courier">hpcloud addresses:remove ip_or_id [<i>ip_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove or release a previously allocated public IP address. Any server instances that were associated to this address are disassociated. You may specify one ore more address IPs or IDs on the command line.  Optionally, you can specify an availability zone.

###Examples
Remove IP address <font face='courier'>111.111.111.111</font>:

    hpcloud addresses:remove 111.111.111.111

Remove addresses with the IDs <font face='courier'>1078</font> and <font face='courier'>3709</font>:

    hpcloud addresses:remove 1078 3709

Remove IP address <font face='courier'>111.111.111.111</font> for availability zone `az-2.region-a.geo-1`:

    hpcloud addresses:remove 111.111.111.111 -z az-2.region-a.geo-1

###Aliases
<font face='courier'>addresses:rm, addresses:delete, addresses:release, addresses:del</font>

<h2 id="cdn:containers">cdn:containers</h2>
List available containers on the CDN.

###Syntax
<font face="Courier">hpcloud cdn:containers</font>

###Options
<dl>
<dt><b>-l, [--all]</b></dt><dd>List all the CDN containers, either enabled or disabled.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>cdn:containers:list</font>

<h2 id="cdn:containers:add">cdn:containers:add</h2>
Add containers to the CDN.

###Syntax
<font face="Courier">hpcloud cdn:containers:add name [<i>name ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add existing containers from your storage account to the CDN. Container names can be specified with or without the preceding colon: <font face='courier'>my_container</font> or <font face='courier'>:my_container</font>. Optionally, you can specify an availability zone.

###Examples
Add the containers`tainer1` and `tainer2` to the CDN:

    hpcloud cdn:containers:add :tainer1 :tainer2

Add the container `my_cdn_container` to the CDN in the  availability zone `region-a.geo`:

    hpcloud cdn:containers:add :my_cdn_container -z region-a.geo-1


<h2 id="cdn:containers:get">cdn:containers:get</h2>
Get the value of an attribute of a CDN container.

###Syntax
<font face="Courier">hpcloud cdn:containers:get &lt;<i>name</i>&gt; &lt;<i>attribute</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Get the value of an attribute for an existing CDN container. The allowed attributes whose value can be retrieved are:
* <font face='courier'>X-Ttl</font>
* <font face='courier'>X-Cdn-Uri</font>
* <font face='courier'>X-Cdn-Enabled</font>
* <font face='courier'>X-Log-Retention</font>.

Optionally, you can specify an availability zone.

###Examples
Get the value of the attribute <font face='courier'>X-Ttl</font>:

    hpcloud cdn:containers:get :my_cdn_container "X-Ttl"

Get the value of the attribute <font face='courier'>X-Cdn-Uri</font>:

    hpcloud cdn:containers:get :my_cdn_container "X-Cdn-Uri"

Get the value of the attribute `X-Ttl` for availability zone `regioni-a.geo`:

    hpcloud cdn:containers:get :my_cdn_container "X-Ttl" -z region-a.geo-1


<h2 id="cdn:containers:location">cdn:containers:location</h2>
Get the location of a container on the CDN.

###Syntax
<font face="Courier">hpcloud cdn:containers:location &lt;<i>name</i>&gt;</font>

###Options
<dl>
<dt><b>-s, [--ssl]</b></dt><dd>Print the ssl version of the url.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Get the location of an existing container on the CDN. Optionally, you can specify an availability zone.

###Examples
Get the location of the container <font face='courier'>my_cdn_container</font>:

    hpcloud cdn:containers:location :my_cdn_container

Get the location of the container `my_cdn_container` for availability zone `region-a.geo-1`:

    hpcloud cdn:containers:location :my_cdn_container -z region-a.geo-1

###Aliases
<font face='courier'>cdn:containers:loc</font>

<h2 id="cdn:containers:remove">cdn:containers:remove</h2>
Remove containers from the CDN.

###Syntax
<font face="Courier">hpcloud cdn:containers:remove name [<i>name ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>cdn:containers:rm, cdn:containers:delete, cdn:containers:del</font>

<h2 id="cdn:containers:set">cdn:containers:set</h2>
Set attributes on a CDN container.

###Syntax
<font face="Courier">hpcloud cdn:containers:set &lt;<i>name</i>&gt; &lt;<i>attribute</i>&gt; &lt;<i>value</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Set attributes for an existing CDN container by specifying their values. The allowed attributes that can be set are:

* <font face='courier'>X-Ttl</font>
* <font face='courier'>X-Cdn-Uri</font>
* <font face='courier'>X-Cdn-Enabled</font>
* <font face='courier'>X-Log-Retention</font>.

Optionally, you can specify an availability zone.

###Examples
Set the attribute <font face='courier'>X-Ttl</font> to 900:

    hpcloud cdn:containers:set :my_cdn_container "X-Ttl" 900

Set the attribute <font face='courier'>X-Cdn-Uri</font> to http://my.home.com/cdn :

    hpcloud cdn:containers:set :my_cdn_container "X-Cdn-Uri" "http://my.home.com/cdn"

Set the attribute `X-Ttl` to 900 for availability zoneregion-a.geo-1`:

    hpcloud cdn:containers:set :my_cdn_container "X-Ttl" 900 -z region-a.geo-1


<h2 id="config">config</h2>
List the current configuration settings.

###Syntax
<font face="Courier">hpcloud config</font>

###Description
List the current configuration settings.

###Examples
List the current configuration settings:

    hpcloud config

###Aliases
<font face='courier'>config:list</font>

<h2 id="config:set">config:set</h2>
Set values in the configuration file.

###Syntax
<font face="Courier">hpcloud config:set key=value [<i>key=value ...</i>]</font>

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
<font face='courier'>config:add, config:update</font>

<h2 id="containers:add">containers:add</h2>
Add a container.

###Syntax
<font face="Courier">hpcloud containers:add name [<i>name ...</i>]</font>

###Options
<dl>
<dt><b>-f, [--force]</b></dt><dd>Don't prompt if container name is not a valid virtual host.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a new container to your storage account. You may creeate multiple containers by specifying more than one container name on the command line.  You can specify the ontainer name  with or without the preceding colon: <font face='courier'>my_container</font> or <font face='courier'>:my_container</font>. Optionally, you can specify an availability zone.

###Examples
Create a new container called <font face='courier'>my_container</font>:

    hpcloud containers:add :my_container

Create two new containers called <font face='courier'>con</font> and <font face='courier'>tainer</font>:

    hpcloud containers:add :con :tainer

Create the container `my_container` for the availability zone `region-a.geo-1`:

    hpcloud containers:add :my_container -z region-a.geo-1


<h2 id="containers:remove">containers:remove</h2>
Remove a containers.

###Syntax
<font face="Courier">hpcloud containers:remove name [<i>name ...</i>]</font>

###Options
<dl>
<dt><b>-f, [--force]</b></dt><dd>Force removal of non-empty containers.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove a container. By default this command removes a container if it empty. The `--force` flag deletes non-empty containers.  Be careful with this flag or you could have a really bad day.  Optionally, you can specify an availability zone.

###Examples
Delete <font face='courier'>my_container</font> (if empty):

    hpcloud containers:remove :my_container

Delete `my container` (regardless of contents):

    hpcloud containers:remove :my_container --force

Delete the container `my_container` for availability zone 'region-a.geo-1`:

    hpcloud containers:remove :my_container -z region-a.geo-1

###Aliases
<font face='courier'>containers:rm, containers:delete, containers:del</font>

<h2 id="copy">copy</h2>
Copy files from one resource to another.

###Syntax
<font face="Courier">hpcloud copy &lt;<i>source</i>&gt; [<i>source ...</i>] &lt;<i>destination</i>&gt;</font>

###Options
<dl>
<dt><b>-m, [--mime=MIME]</b></dt><dd>Set the mime-type of the remote object.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Copy a file between your file system and a container, inside a container, or between containers. You may copy multiple files to a directory or container on one command line.  Optionally, you can specify an availability zone.  Note that a leading colon `:` is required when you specify a container; for example `:my_container`.

###Examples
Copy the file `my_file.txt` to container <font face='courier'>my_container</font>:

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

Copy the file `my_file.txt` to container <font face='courier'>my_container</font> for availability zone `region-a.geo-1`:

    hpcloud copy my_file.txt :my_container -z region-a.geo-1

###Aliases
<font face='courier'>cp</font>
<font face='courier'></font>

<h2 id="flavors">flavors</h2>
List available flavors.

###Syntax
<font face="Courier">hpcloud flavors [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>flavors:list</font>

<h2 id="get">get</h2>
Fetch objects to your local directory.

###Syntax
<font face="Courier">hpcloud get object [<i>object ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>fetch</font>

<h2 id="help">help</h2>
Describe available tasks or one specific task

###Syntax
<font face="Courier">hpcloud help [<i>TASK</i>]</font><font face="Courier">Describe available tasks or one specific task</font>
<h2 id="images">images</h2>
List the available images in your compute account.

###Syntax
<font face="Courier">hpcloud images [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the images in your compute account. You may filter the images displayed by specifying one ore more image names or IDs on the command line.  Optionally, you can specify an availability zone.

###Examples
List the images:

    hpcloud images

List image <font face='courier'>1239</font>:

    hpcloud images 1239

List images for availability zone `az-2.region-a.geo-1`:

    hpcloud images -z az-2.region-a.geo-1

###Aliases
<font face='courier'>images:list</font>

<h2 id="images:add">images:add</h2>
Add an image from an existing server.

###Syntax
<font face="Courier">hpcloud images:add &lt;<i>name</i>&gt; &lt;<i>server_name</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
<dt><b>-m, [--metadata=METADATA]</b></dt><dd>Set the meta data.</dd>  
</dl>

###Description
Add a new image from an existing server to your compute account. Optionally, you may specify metadata or an availability zone.

###Examples
Create the new image <font face='courier'>my_image</font> from the existing server named <font face='courier'>my_server</font>:

    hpcloud images:add my_image my_server

Create the new image <font face='courier'>my_image</font> from the existing server <font face='courier'>my_server</font> with metadata:

    hpcloud images:add my_image my_server -m this=that

Create the new image `my_image` from the existing server `my_server` in  availability zone `az-2.region-a.geo-1`:

    hpcloud images:add my_image my_server -z az-2.region-a.geo-1


<h2 id="images:metadata">images:metadata</h2>
List the metadata for an image.

###Syntax
<font face="Courier">hpcloud images:metadata &lt;<i>image_name_or_id</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the metadata for an image in your compute account. You may specify either the name or ID of the image.  Optionally, you may specify an availability zone.

###Examples
List the metadata for image <font face='courier'>Skynet</font>:

    hpcloud images:metadata Skynet

List the metadata for image <font face='courier'>1151</font>:

    hpcloud images:metadata '1151'

List the metadata for image `565394 for availability zone `az-2.region-a.geo-1`:

    hpcloud images:metadata -z az-2.region-a.geo-1 565394

###Aliases
<font face='courier'>images:metadata:list</font>

<h2 id="images:metadata:add">images:metadata:add</h2>
Add metadata to an image.

###Syntax
<font face="Courier">hpcloud images:metadata:add &lt;<i>name</i>&gt; &lt;<i>metadata</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add metadata to a image in your compute account.  You may specify the mage name or ID.  If metadata already exists, it is updated.  You must specify the Mmetadata as a comma separated list of name value pairs.  Optionally, you may specify an availability zone.

###Examples
Add the specified metadata to the image (if the metadata exists, it is updated):

    hpcloud images:metadata:add my_image 'r2=d2,c3=po'

###Aliases
<font face='courier'>images:metadata:update</font>

<h2 id="images:metadata:remove">images:metadata:remove</h2>
Remove metadata from an image.

###Syntax
<font face="Courier">hpcloud images:metadata:remove &lt;<i>image_name_or_id</i>&gt; [<i>metadata_key ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove metadata from an image in your compute account.  You may specify an image name or ID.  Optionally, you may specify an availability zone.

###Examples
Remove the specified metadata from the image:

    hpcloud images:metadata:remove my_image r2 c3

###Aliases
<font face='courier'>images:metadata:rm</font>

<h2 id="images:remove">images:remove</h2>
Remove images (by name or ID).

###Syntax
<font face="Courier">hpcloud images:remove name_or_id [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove existing images by specifying thier names or IDs. Optionally, you may specify an availability zone.

###Examples
Delete image <font face='courier'>my-image</font>:

    hpcloud images:remove my-image

Delete images <font face='courier'>1172</font> and <font face='courier'>1078</font>:

    hpcloud images:remove 1172 1078

Delete image `my-image` for availability zone `az-2.region-a.geo-1:

    hpcloud images:remove my-image -z az-2.region-a.geo-1

###Aliases
<font face='courier'>images:rm, images:delete, images:del</font>

<h2 id="info">info</h2>
Display info about the HP Cloud UNIX CLI.

###Syntax
<font face="Courier">hpcloud info</font><font face="Courier">Display info about the HP Cloud UNIX CLI.</font>
<h2 id="keypairs">keypairs</h2>
List the available keypairs.

###Syntax
<font face="Courier">hpcloud keypairs [<i>name ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List the key pairs in your compute account. You may filter the output of keys displayed by specifying the key pairs you want displayed on the command line.  Optionally, you can specify an availability zone.

###Examples
List the key pairs:

    hpcloud keypairs

List the key pair <font face='courier'>brat</font>:

    hpcloud keypairs brat

List the key pairs for availability zone `az-2.region-a.geo-1`:

    hpcloud keypairs -z az-2.region-a.geo-1

###Aliases
<font face='courier'>keypairs:list</font>

<h2 id="keypairs:add">keypairs:add</h2>
add a key pair

###Syntax
<font face="Courier">hpcloud keypairs:add &lt;<i>key_name</i>&gt;</font>

###Options
<dl>
<dt><b>-f, [--fingerprint=FINGERPRINT]</b></dt><dd>Specify a fingerprint to be used.</dd>  
<dt><b>-p, [--private-key=PRIVATE_KEY]</b></dt><dd>Specify private key data to be used.</dd>  
<dt><b>-o, [--output]</b></dt><dd>Save the key pair to a file in the current folder.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a key pair by specifying the name. Optionally you can specify a fingerprint and private key data. You can use the `-o` option to save the key to a file. Optionally, you can specify an availability zone.

###Examples
Create the key <font face='courier'>mykey</font>:

    hpcloud keypairs:add mykey

Create the key <font face='courier'>mykey</font> using the supplied fingerprint:

    hpcloud keypairs:add mykey -f <fingerprint>

Create the key <font face='courier'>mykey</font> using the supplied private key data:

    hpcloud keypairs:add mykey -p 'private key data'

Create the key <font face='courier'>mykey</font> using the supplied fingerprint and private key data:

    hpcloud keypairs:add mykey -f <fingerprint> -p 'private key data'

Create the key `mykey` and save it to file `mykey.pem`  in the current folder:

    hpcloud keypairs:add mykey -o

Create the key `mykey` for availability zone `az-2.region-a.geo-1`:

    hpcloud keypairs:add mykey -z az-2.region-a.geo-1


<h2 id="keypairs:import">keypairs:import</h2>
Import a key pair.

###Syntax
<font face="Courier">hpcloud keypairs:import &lt;<i>key_name</i>&gt; &lt;<i>public_key_data</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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


<h2 id="keypairs:public_key">keypairs:public_key</h2>
Display the public keys of a key pair.

###Syntax
<font face="Courier">hpcloud keypairs:public_key &lt;<i>name</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Display the public key of the specified keypair.  Optionally, you can specify an availability zone.

###Examples
Remove the public key `keyno`:

    hpcloud keypairs:public_key keyno

Remove the public key `keyno` for availability zone `az-2.region-a.geo-1`:

    hpcloud keypairs:public_key keyno -z az-2.region-a.geo-1


<h2 id="keypairs:remove">keypairs:remove</h2>
Remove a key pair (by name).

###Syntax
<font face="Courier">hpcloud keypairs:remove name [<i>name ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove an existing key pair by name. You may specify more than one key pair to remove on a single command line.  Optionally, you can specify an availability zone.

###Examples
Remove the key pair <font face='courier'>mykey</font>:

    hpcloud keypairs:remove mykey

Remove the key pairs <font face='courier'>mykey</font> and <font face='courier'>myotherkey</font>:

    hpcloud keypairs:remove mykey myotherkey

Remove the key pair `mykey` for availability zone `az-2.region-a.geo-1:

    hpcloud keypairs:remove mykey -z az-2.region-a.geo-1

###Aliases
<font face='courier'>keypairs:rm, keypairs:delete, keypairs:del</font>

<h2 id="list">list</h2>
List containers or container contents.

###Syntax
<font face="Courier">hpcloud list [<i>container ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
List containers or the contents of the specified containers. Optionally, an availability zone can be passed.

###Examples
List the two objects `1.txt` and 2.txt` in the container `tainer`:

    hpcloud list :tainer/1.txt :tainer/2.txt

List all the objects in container `tainer`:

    hpcloud list :tainer

List all containers:

    hpcloud list

List all the objects in container `my_container` for availability zone `region-a.geo-1`:

    hpcloud list :my_container -z region-a.geo-1

###Aliases
<font face='courier'>ls</font>

<h2 id="location">location</h2>
Display the URIs for the specified resources.

###Syntax
<font face="Courier">hpcloud location &lt;<i>object/container</i>&gt; ...</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>loc</font>

<h2 id="move">move</h2>
Move objects inside or between containers.

###Syntax
<font face="Courier">hpcloud move &lt;<i>source ...</i>&gt; &lt;<i>destination</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>mv</font>

<h2 id="remove">remove</h2>
Remove objects or containers.

###Syntax
<font face="Courier">hpcloud remove object_or_container [<i>object_or_container ...</i>]</font>

###Options
<dl>
<dt><b>-f, [--force]</b></dt><dd>Do not confirm removal, remove non-empty containers.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove objects or containers. Optionally, you can specify an availability zone.

###Examples
Delete objects <font face='courier'>my.txt</font> and <font face='courier'>other.txt</font> from container `tainer`:

    hpcloud remove :tainer/my.txt :tainer/other.txt

Delete container <font face='courier'>my_container</font>:

    hpcloud remove :my_container

Delete container 'my_container` in availability zone `region-a.geo-1`:

    hpcloud remove :my_container -z region-a.geo-1

###Aliases
<font face='courier'>rm, delete, destroy, del</font>

<h2 id="securitygroups">securitygroups</h2>
List the available security groups.

###Syntax
<font face="Courier">hpcloud securitygroups [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>securitygroups:list</font>

<h2 id="securitygroups:add">securitygroups:add</h2>
Add a security group.

###Syntax
<font face="Courier">hpcloud securitygroups:add &lt;<i>name</i>&gt; &lt;<i>description</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a new security group by specifying a name and a description. Optionally, you can specify an availability zone.

###Examples
Add new security group `mysecgroup` with description `seg group desc`:

    hpcloud securitygroups:add mysecgroup "seg group desc"

Add new security group `mysecgroup` with description `seg group desc` for availability zone `az-2.region-a.geo-1`:

    hpcloud securitygroups:add mysecgroup "seg group desc" -z az-2.region-a.geo-1


<h2 id="securitygroups:remove">securitygroups:remove</h2>
Remove a security group or groups.

###Syntax
<font face="Courier">hpcloud securitygroups:remove name_or_id [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>securitygroups:rm, securitygroups:delete, securitygroups:del</font>

<h2 id="securitygroups:rules">securitygroups:rules</h2>
Display the list of rules for a security group.

###Syntax
<font face="Courier">hpcloud securitygroups:rules &lt;<i>sec_group_name</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>securitygroups:rules:list</font>

<h2 id="securitygroups:rules:add">securitygroups:rules:add</h2>
Add a rule to the security group.

###Syntax
<font face="Courier">hpcloud securitygroups:rules:add &lt;<i>sec_group_name</i>&gt; &lt;<i>ip_protocol</i>&gt;</font>

###Options
<dl>
<dt><b>-p, [--port-range=PORT_RANGE]</b></dt><dd>Specify a port range like 22..22</dd>  
<dt><b>-c, [--cidr=CIDR]</b></dt><dd>Specify a cidr ip range like 0.0.0.0/0</dd>  
<dt><b>-g, [--source-group=SOURCE_GROUP]</b></dt><dd>Specify a source group.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a rule to the security group. If <i>ip_protocol</i> is specified as <font face='courier'>icmp</font>, then <i>port_range</i> is set to -1..-1.  If <i>ip_address</i> is not specified, then the address defaults to <font face='courier'>0.0.0.0/0</font>. To allow communications within a given security group, you must specify a source group while creating a rule. Optionally, you can specify an availability zone.

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
<font face='courier'>securitygroups:rules:authorize</font>

<h2 id="securitygroups:rules:remove">securitygroups:rules:remove</h2>
Remove a rule from the security group.

###Syntax
<font face="Courier">hpcloud securitygroups:rules:remove &lt;<i>sec_group_name</i>&gt; &lt;<i>rule_id</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>securitygroups:rules:rm, securitygroups:rules:revoke, securitygroups:rules:delete, securitygroups:rules:del</font>

<h2 id="servers">servers</h2>
List the available servers.

###Syntax
<font face="Courier">hpcloud servers [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>servers:list</font>

<h2 id="servers:add">servers:add</h2>
Add a server.

###Syntax
<font face="Courier">hpcloud servers:add &lt;<i>name</i>&gt; &lt;<i>image</i>&gt; &lt;<i>flavor</i>&gt; -k, --key-name=KEY_NAME</font>

###Options
<dl>
<dt><b>-k, --key-name=KEY_NAME</b></dt><dd>Specify a key name to be used.</dd>  
<dt><b>-s, [--security-group=SECURITY_GROUP]</b></dt><dd>Specify a security group to be used.</dd>  
<dt><b>-p, [--private-key-file=PRIVATE_KEY_FILE]</b></dt><dd>Name of the pem file with your private key.</dd>  
<dt><b>-m, [--metadata=METADATA]</b></dt><dd>Set the meta data.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a new server to your compute account. You must specify an name for the server, an image to use to create the server, a flavor, and a keypair.  If you are creating a windows image, the flavor must be at least a large image and you must specify a security group that has the RDP port open.  Optionally, you can specify a security group, key name, metadata and availability zone.

###Examples
Create a new server named <font face='courier'>my_server</font> using an image, flavor and a key:

    hpcloud servers:add my_server 7 small -k key1

Create a windows server with the specified key, security group, and private key to decrypt the password:

    hpcloud servers:add winserv 100006567 large -k winpair -s allowsRDP -p ./winpair.pem

Create a new server named <font face='courier'>my_server</font> using an image, flavor, key and security group:

    hpcloud servers:add my_server 7 large -k key1 -s sg1

Create a new server named <font face='courier'>my_server</font> using an image, flavor, key and metadata this=that:

    hpcloud servers:add my_server 7 small -k key1 -m this=that

Create a new server named <font face='courier'>my_server</font> using a key for  availability zone `az-2.region-a.geo-1`:

    hpcloud servers:add my_server 7 xlarge -k key1 -z az-2.region-a.geo-1


<h2 id="servers:metadata">servers:metadata</h2>
List the metadata for a server.

###Syntax
<font face="Courier">hpcloud servers:metadata &lt;<i>name_or_id</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>servers:metadata:list</font>

<h2 id="servers:metadata:add">servers:metadata:add</h2>
Add metadata to a server.

###Syntax
<font face="Courier">hpcloud servers:metadata:add &lt;<i>name_or_id</i>&gt; &lt;<i>metadata</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add metadata to a server in your compute account.  You can specify the erver name or ID.  Optionally, you can an availability zone. The metadata should be a comma separated list of name value pairs.

###Examples
Add the specified metadata to the server (if the metadata exists, it is updated):

    hpcloud servers:metadata:add my_server 'r2=d2,c3=po'

###Aliases
<font face='courier'>servers:metadata:update</font>

<h2 id="servers:metadata:remove">servers:metadata:remove</h2>
Remove metadata from a server.

###Syntax
<font face="Courier">hpcloud servers:metadata:remove &lt;<i>name</i>&gt; &lt;<i>metadata_key</i>&gt; ...</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove metadata from a server in your compute account.  You can speciry the erver name or ID.  You can specify one or more metadata keys on the command line.  Optionally, you can specify an availability zone.

###Examples
Remove the the r2 and c3 metadata from the server:

    hpcloud servers:metadata:remove :my_server r2 c3

###Aliases
<font face='courier'>servers:metadata:rm</font>

<h2 id="servers:password">servers:password</h2>
Change the password for a server.

###Syntax
<font face="Courier">hpcloud servers:password &lt;<i>server_name</i>&gt; &lt;<i>password</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Change the password for an existing server. The password must adhere to the existing security complexity naming rules. Optionally, you can specify an availability zone.

###Examples
Change the password for server <font face='courier'>my-server</font>:

    hpcloud servers:password my-server my-password

Change the password for server 'my-server` for availability zone `az-2.region-a.geo-1`:

    hpcloud servers:password my-server my-password -z az-2.region-a.geo-1

###Aliases
<font face='courier'>servers:passwd</font>

<h2 id="servers:reboot">servers:reboot</h2>
Reboot a server or servers (specified by server name or ID).

###Syntax
<font face="Courier">hpcloud servers:reboot name_or_id [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-h, [--hard]</b></dt><dd>Hard reboot a server.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Reboot an existing server specified name or ID. Rebooting a server can take some time so it might be necessary to check the status of the server by issuing the command `hpcloud servers`. The default is a soft reboot, but you can specify the `-h` option for a hard reboot. Optionally, you can specify an availability zone.

###Examples
Reboot server <font face='courier'>Hal9000</font>:

    hpcloud servers:reboot Hal9000

Reboot the servers with the IDs 1003 and 222

    hpcloud servers:reboot 1003 222

Reboot the server `DeepThought` for availability zone `az-2.region-a.geo-1`:

    hpcloud servers:reboot DeepThought -z az-2.region-a.geo-1


<h2 id="servers:rebuild">servers:rebuild</h2>
Rebuild a server (specified by server name or ID).

###Syntax
<font face="Courier">hpcloud servers:rebuild name_or_id [<i>image_name_or_id</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Rebuild an existing server specified name or ID. Optionally, the server may be rebuilt with a new image.  Rebuilding a server may take some time so it might be necessary to check the status of the server by issuing the command <font face='courier'>hpcloud servers</font>. Optionally, you can specify an availability zone.

###Examples
Rebuild server <font face='courier'>Hal9000</font>:

    hpcloud servers:rebuild Hal9000

Rebuild server 1003 with image 222:

    hpcloud servers:rebuild 1003 222

Rebuild server `DeepThought` for availability zone `az-2.region-a.geo-1`:

    hpcloud servers:rebuild DeepThought -z az-2.region-a.geo-1


<h2 id="servers:remove">servers:remove</h2>
Remove a server or servers (specified by name or ID).

###Syntax
<font face="Courier">hpcloud servers:remove name_or_id [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove existing servers by specifying their name or ID. Optionally, you can specify an availability zone.

###Examples
Delete <font face='courier'>my-server</font>:

    hpcloud servers:remove my-server

Delete the servers <font face='courier'>DeepThought</font> and <font face='courier'>Blaine</font>:

    hpcloud servers:remove DeepThought Blaine

Delete the server with the ID 369765

    hpcloud servers:remove 369765

Delete server `my-server` for availability zone `az-2.region-a.geo-1`:

    hpcloud servers:remove my-server -z az-2.region-a.geo-1

###Aliases
<font face='courier'>servers:rm, servers:delete, servers:del</font>

<h2 id="snapshots">snapshots</h2>
List block devices available.

###Syntax
<font face="Courier">hpcloud snapshots [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>snapshots:list</font>

<h2 id="snapshots:add">snapshots:add</h2>
Create a snapshot.

###Syntax
<font face="Courier">hpcloud snapshots:add &lt;<i>name</i>&gt; &lt;<i>volume</i>&gt;</font>

###Options
<dl>
<dt><b>-d, [--description=DESCRIPTION]</b></dt><dd>Description of the snapshot.</dd>  
<dt><b>-m, [--metadata=METADATA]</b></dt><dd>Set the meta data.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Create a snapshot with the given name from a volume.  Optionally, you can specify a description.

###Examples
Create the new snapshot <font face='courier'>my_snapshot</font> from the specified volume:

    hpcloud snapshots:add my_snapshot vol10

Creates the new snapshot <font face='courier'>my_snapshot</font> from the specified volume with the description `test vol`:

    hpcloud snapshots:add my_snapshot vol10 -d 'test vol'


<h2 id="snapshots:remove">snapshots:remove</h2>
Remove a snapshot or snapshots (specified by name or ID).

###Syntax
<font face="Courier">hpcloud snapshots:remove &lt;<i>name_or_id</i>&gt; [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>snapshots:rm, snapshots:delete, snapshots:del</font>

<h2 id="tempurl">tempurl</h2>
Create temporary URLs for the given objects.

###Syntax
<font face="Courier">hpcloud tempurl &lt;<i>object</i>&gt; ...</font>

###Options
<dl>
<dt><b>-p, [--time-period=TIME_PERIOD]</b></dt><dd>time period to keep the url alive</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>tmpurl</font>

<h2 id="volumes">volumes</h2>
List the available block devices.

###Syntax
<font face="Courier">hpcloud volumes [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
<font face='courier'>volumes:list</font>

<h2 id="volumes:add">volumes:add</h2>
Add a volume.

###Syntax
<font face="Courier">hpcloud volumes:add &lt;<i>name</i>&gt; [<i>size</i>]</font>

###Options
<dl>
<dt><b>-d, [--description=DESCRIPTION]</b></dt><dd>Description of the volume.</dd>  
<dt><b>-m, [--metadata=METADATA]</b></dt><dd>Set the meta data.</dd>  
<dt><b>-s, [--snapshot=SNAPSHOT]</b></dt><dd>Create volume the specified snapshot.</dd>  
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Add a new volume to your compute account with the specified name and size.  Optionally, you can specify a description, metadata or availability zone.  If you do not specify a size, it is taken from the snapshot (if specified) or default to 1 gigabyte.

###Examples
Create a new volume named <font face='courier'>my_volume</font> of size 10:

    hpcloud volumes:add my_volume 10

Create a new volume named <font face='courier'>my_volume</font> of size 10 with a description:

    hpcloud volumes:add my_volume 10 -d 'test vol'

Create a new volume named <font face='courier'>my_volume</font> based on the snapshot <font face='courier'>snappy</font>:

    hpcloud volumes:add my_volume -s 'snappy'

Creates volume `my_volume` in availability zone `az-2.region-a.geo-1`:

    hpcloud volumes:add my_volume 1 -z az-2.region-a.geo-1


<h2 id="volumes:attach">volumes:attach</h2>
Attach a volume to a server (specified by device name).

###Syntax
<font face="Courier">hpcloud volumes:attach &lt;<i>volume</i>&gt; &lt;<i>server</i>&gt; &lt;<i>device</i>&gt;</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Attach a volume to a server on the specified device name.

###Examples
Attach volume `myVolume` to server `myServer` on device `/dev/sdf`:

    hpcloud volumes:attach myVolume myServer /dev/sdf

Attach volume `my-volume` to server `myServer` on device `/dev/sdf` for availability zone `az-2.region-a.geo-1`:

    hpcloud volumes:attach my-volume myServer /dev/sdg -z az-2.region-a.geo-1


<h2 id="volumes:detach">volumes:detach</h2>
Detach a volume or volumes.

###Syntax
<font face="Courier">hpcloud volumes:detach name_or_id [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Detach volumes from all servers.  You may specify the volume by name or ID.  You can detach one more more volumes in a command line.

###Examples
Detach the volume <font face='courier'>myVolume</font>:

    hpcloud volumes:detach myVolume

Detach the volume with ID 1159:

    hpcloud volumes:detach 1159

Detach the volume <font face='courier'>myVolume</font> for availability zone `az-2.region-a.geo-1`:

    hpcloud volumes:detach myVolume -z az-2.region-a.geo-1


<h2 id="volumes:remove">volumes:remove</h2>
Remove a volume or volumes (specified by name or ID).

###Syntax
<font face="Courier">hpcloud volumes:remove name_or_id [<i>name_or_id ...</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
<dt><b>-a, [--account-name=ACCOUNT_NAME]</b></dt><dd>Select account.</dd>  
</dl>

###Description
Remove volumes by specifying their names or ID. You may specify more than one volume name or ID on a command line.  Optionally, you can specify an availability zone.

###Examples
Delete the volumes <font face='courier'>tome</font> and <font face='courier'>treatise</font>:

    hpcloud volumes:remove tome treatise

Delete the volume with ID 998:

    hpcloud volumes:remove 998

Delete the volume `my-volume` for availability zone `az-2.region-a.geo-1`:

    hpcloud volumes:remove my-volume -z az-2.region-a.geo-1

###Aliases
<font face='courier'>volumes:rm, volumes:delete, volumes:del</font>

<h2 id="volumes:server">volumes:server</h2>
List the volumes on server.

###Syntax
<font face="Courier">hpcloud volumes:server [<i>server</i>]</font>

###Options
<dl>
<dt><b>-z, [--availability-zone=AVAILABILITY_ZONE]</b></dt><dd>Set the availability zone.</dd>  
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
