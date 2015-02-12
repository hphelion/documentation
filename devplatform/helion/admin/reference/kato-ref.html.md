---
layout: default-devplatform
permalink: /als/v1/admin/reference/kato-ref/
product: devplatform
title: "Kato Command Reference"
---
<!--PUBLISHED-->

# HP Helion 1.0 Development Platform: Kato Command Reference {#kato-command-reference}

Kato is the Application Lifecycle Service command line administration utility.

##Syntax {#usage}

**kato** *command* [--help] [arguments] [command-options]

##List of Commands {#commands}

-   [config](#kato-command-ref-config) Manipulate configuration values
    of Application Lifecycle Service components.
-   [data](#kato-command-ref-data) Import or export Application Lifecycle Service
    system data to or from clusters/nodes.
    -   data export
    -   data import
    -   data users
-   [debug](#kato-command-ref-debug-configwatch) Commands for
    debugging for Application Lifecycle Service internals.
    -   debug configwatch
    -   debug redis
-   [history](#kato-command-ref-history) Show the kato commands that
    have been run
-   [info](#kato-command-ref-info) Show information about this node or cluster.
-   [inspect](#kato-command-ref-inspect) Detect common problems with your Application Lifecycle Service installation.
-   [log](#kato-command-ref-log-stream) Logging utilities for Application Lifecycle Service
    -   log drain
    -   log stream
    -   log tail
-   [node](#kato-command-ref-node-attach) Node management
    -   node attach
    -   node detach
    -   node list
    -   node migrate
    -   node remove
    -   node rename
    -   node reset
    -   node retire
    -   node setup
    -   node upgrade
    -   node version
-   [op](#kato-command-ref-op) Various operational commands
-   [other commands](#other)
	- custom\_ssl\_cert
	- dhcp
	- defer
	- max\_client\_upload
	- regenerate
	- remap\_hosts
	- run\_deferred
	- set\_timezone
	- static\_ip
	- upstream\_proxy
	- update\_hostsfile
	- generate\_service\_tokens
	- help
	- user
	- pass
	- no-restart
-   [patch](#kato-command-ref-patch) Update an Application Lifecycle Service cluster with
    post-release fixes.
-   [process](#kato-command-ref-process-list) Start, stop, or restart
    individual processes. Generally not required.
    -   process list
    -   process ready
    -   process restart
    -   process start
    -   process stop
-   [relocate](#kato-command-ref-relocate) Move containers, application droplets, or services to a new mount point
-   [report](#kato-command-ref-report) Generate a report that can be
    sent to Application Lifecycle Service support.
-   [restart](#kato-command-ref-restart) Restart Application Lifecycle Service or
    individual roles.
-   [role](#kato-command-ref-role-add) Management of node roles
    -   role add
    -   role info
    -   role remove
-   [shell](#kato-command-ref-shell) Interactive shell for kato
-   [start](#kato-command-ref-start) Start Application Lifecycle Service or individual
    roles.
-   [status](#kato-command-ref-status) List configured roles and their
    current status across the cluster.
-   [stop](#kato-command-ref-stop) Stop Application Lifecycle Service or individual roles.
-   [version](#kato-command-ref-version) Display the version of Application Lifecycle Service being run.

##Command Usage Details {#command-usage-details}
###Config {#kato-command-ref-config}
Manipulate configuration values  of Application Lifecycle Service components.

*\<value\>* If value is not given for "set", then it read from STDIN.

*\<component\>* Can be "cluster", "local" or the name of a process.


**config** **get** [**options**] [*\<component\>*] [*\<key-path\>*]

**config** **set** [**options**] *\<component\>* *\<key-path\>*
[*\<value\>*]

**config** **del** [**options**] *\<component\>* *\<key-path\>*

**config** **push** [**options**] *\<component\>* *\<key-path\>*
*\<value\>*

**config** **pop** [**options**] *\<component\>* *\<key-path\>*
*\<value\>*

**-h** **--help** Show help information

**-j** **--json** For "set", use JSON format when setting config key values.
	For "get", use JSON format for displaying output.

**-y** **--yaml** Use YAML format when retrieving or setting config key values. YAML is the default output format.

**-f** **--flat** Use a flat output format *\<full-config-path\>> \<value\>*

**--force** Force updating value to different type.
<hr>
###Data {#kato-command-ref-data}
Import or export Application Lifecycle Service system data to or from clusters/nodes.

####Data Export
Exports Application Lifecycle Service system data to or from clusters/nodes. With no options specified, includes all data except 'resources' and 'aok-config'.

*\<filename\>* The filename the export will be written to

**data** **export** **--only-this-node** [**options**] [*\<filename\>*]

**data** **export** **--cluster** [**options**] [*\<filename\>*]

**data** **export** **--manual** [**options**] [*\<filename\>*]

**-h** **--help** Show help information

**--cluster** Operate on the entire cluster

**--only-this-node** Only affect this node

**--manual** Only import/export roles specified on the command line

**--force** Force import/export of specified roles even if they are not enabled. Requires `--manual`. Implies `--only-this-node`

**--remote** Remote import/export (internal use only)

**--base-dir** *\<base-dir\>* Base directory for extracting temporary files

**--droplets** Include droplets (uploaded apps)

**--exclude-droplets** Do not include droplets (uploaded apps)

**--packages** Include app packages

**--exclude-packages** Do not include app packages

**--resources** Include the upload cache

**--exclude-resources** Do not include the upload cache (default)

**--license** Include the Application Lifecycle Service license

**--exclude-license** Do not include the Application Lifecycle Service license

**--exclude-db-encryption-key** Do not include the key

**--main-db** Include the cloud controller's main database

**--exclude-main-db** Do not include the cloud controller's main
database

**--aok-db** Include AOK's database

**--exclude-aok-db** Do not include AOK's database

**--aok-config** Include AOK's configuration

**--exclude-aok-config** Do not include AOK's configuration (default)

**--helion-rest-db** Include Application Lifecycle Service Rest's database

**--exclude-helion-rest-db** Do not include Application Lifecycle Service Rest's database

**--filesystem** Include the filesystem service

**--exclude-filesystem** Do not include the filesystem service

**--exclude-filesystem-data** Do not include the filesystem service's
user data

**--exclude-filesystem-user-creation** Do not include the filesystem
service's user creation/quota

**--harbor** Include the harbor service

**--exclude-harbor** Do not include the harbor service

**--exclude-harbor-data** Do not include the harbor service's user
data

**--exclude-harbor-metadata** Do not include the harbor service's
metadata

**--mysql** Include the MySQL service

**--exclude-mysql** Do not include the MySQL service

 **--exclude-mysql-data** Do not include the MySQL service's data

 **--exclude-mysql-metadata** Do not include the MySQL service's
 metadata

 **--postgresql** Include the PostgreSQL service

 **--exclude-postgresql** Do not include the PostgreSQL service

 **--exclude-postgresql-data** Do not include the PostgreSQL service's
 data

 **--exclude-postgresql-metadata** Do not include the PostgreSQL
 service's metadata

 **--mongodb** Include the MongoDB service

 **--exclude-mongodb** Do not include the MongoDB service

 **--exclude-mongodb-data** Do not include the MongoDB service's data

 **--exclude-mongodb-metadata** Do not include the MongoDB service's
 metadata

 **--memcached** Include the memcached service

 **--exclude-memcached** Do not include the memcached service

 **--exclude-memcached-data** Do not include the memcached service's
 data

 **--exclude-memcached-metadata** Do not include the memcached
 service's metadata

 **--redis** Include the Redis service

 **--exclude-redis** Do not include the Redis service

 **--exclude-redis-data** Do not include the Redis service's data

 **--exclude-redis-metadata** Do not include the Redis service's
 metadata

 **--rabbit** Include the RabbitMQ service

 **--exclude-rabbit** Do not include the RabbitMQ service

 **--exclude-rabbit-data** Do not include the RabbitMQ service's data

 **--exclude-rabbit-metadata** Do not include the RabbitMQ service's
 metadata

 **--rabbit3** Include the RabbitMQ service

 **--exclude-rabbit3** Do not include the RabbitMQ service

 **--exclude-rabbit3-data** Do not include the RabbitMQ service's data

 **--exclude-rabbit3-metadata** Do not include the RabbitMQ service's
 metadata

<hr>
####Data Import
Imports Application Lifecycle Service system data to or from clusters/nodes. With no options
specified, includes all data except 'resources' and 'aok-config'.

*\<source\>* This can be a hostname or a filename to import from.

**data** **import** **--only-this-node** [**options**] *\<source\>*

**data** **import** **--cluster** [**options**] *\<source\>*

**data** **import** **--manual** [**options**] *\<source\>*

**-h** **--help** Show help information

**--cluster** Operate on the entire cluster

**--only-this-node** Only affect this node

**--manual** Only import/export roles specified on the command line

**--force** Force import/export of specified roles even if they are
not enabled. - Requires `--manual` - Implies `--only-this-node`

**--remote** Remote import/export (internal use only)

**--base-dir** *\<base-dir\>* Base directory for extracting temporary
files

**--legacy** Treat import as a legacy services import (internal use
only)

**--droplets** Include droplets (uploaded apps)

**--exclude-droplets** Do not include droplets (uploaded apps)

**--packages** Include app packages

**--exclude-packages** Do not include app packages

**--resources** Include the upload cache

**--exclude-resources** Do not include the upload cache (default)

**--license** Include the Application Lifecycle Service license

**--exclude-license** Do not include the Application Lifecycle Service license

**--db-encryption-key** Include the key used to encrypt the Application Lifecycle Service
DB (recommended)

**--exclude-db-encryption-key** Do not include the key

**--main-db** Include the cloud controller's main database

**--exclude-main-db** Do not include the cloud controller's main
database

**--aok-db** Include AOK's database

**--exclude-aok-db** Do not include AOK's database

**--aok-config** Include AOK's configuration

**--exclude-aok-config** Do not include AOK's configuration (default)

**--helion-rest-db** Include Application Lifecycle Service Rest's database

**--exclude-helion-rest-db** Do not include Application Lifecycle Service Rest's database

**--filesystem** Include the filesystem service

**--exclude-filesystem** Do not include the filesystem service

**--exclude-filesystem-data** Do not include the filesystem service's
user data

**--exclude-filesystem-user-creation** Do not include the filesystem
service's user creation/quota

**--harbor** Include the harbor service

**--exclude-harbor** Do not include the harbor service

**--exclude-harbor-data** Do not include the harbor service's user
data

**--exclude-harbor-metadata** Do not include the harbor service's
metadata

**--mysql** Include the MySQL service

**--exclude-mysql** Do not include the MySQL service

**--exclude-mysql-data** Do not include the MySQL service's data

**--exclude-mysql-metadata** Do not include the MySQL service's
metadata

**--postgresql** Include the PostgreSQL service

**--exclude-postgresql** Do not include the PostgreSQL service

**--exclude-postgresql-data** Do not include the PostgreSQL service's
data

**--exclude-postgresql-metadata** Do not include the PostgreSQL
service's metadata

**--mongodb** Include the MongoDB service

**--exclude-mongodb** Do not include the MongoDB service

**--exclude-mongodb-data** Do not include the MongoDB service's data

**--exclude-mongodb-metadata** Do not include the MongoDB service's
metadata

**--memcached** Include the memcached service

**--exclude-memcached** Do not include the memcached service

**--exclude-memcached-data** Do not include the memcached service's
data

**--exclude-memcached-metadata** Do not include the memcached
service's metadata

**--redis** Include the Redis service

**--exclude-redis** Do not include the Redis service

**--exclude-redis-data** Do not include the Redis service's data

**--exclude-redis-metadata** Do not include the Redis service's
metadata

**--rabbit** Include the RabbitMQ service

**--exclude-rabbit** Do not include the RabbitMQ service

**--exclude-rabbit-data** Do not include the RabbitMQ service's data

**--exclude-rabbit-metadata** Do not include the RabbitMQ service's
metadata

**--rabbit3** Include the RabbitMQ service

**--exclude-rabbit3** Do not include the RabbitMQ service

**--exclude-rabbit3-data** Do not include the RabbitMQ service's data

**--exclude-rabbit3-metadata** Do not include the RabbitMQ service's
metadata

<hr>
####Data Users
 Import or export a list of Application Lifecycle Service users (CSV format).

**data** **users** **import** [**options**] *\<filename\>*

**data** **users** **export** [**options**]
[**--exclude-password-hashes**] [*\<filename\>*]

 **-h** **--help** Show help information

 **-p** **--exclude-password-hashes** Do not include hashed passwords
 in export

 **-d** **--dry-run** Do not import/export anything, just show what will be done

<hr>
###Debug  {#kato-command-ref-debug-configwatch}
Commands for debugging for Application Lifecycle Service internals.

**debug** **configwatch** [**options**] [*\<process-name\>...*]

Watch changes to cluster config

**-d** **--dump-tree** Dump the config tree seen since starting

**-s** **--no-value** Do not print the value of path

**debug** **redis**

Connect to the Redis server used for cluster config via redis-cli

<hr>
###History {#kato-command-ref-history}
Show the kato commands that have been run.

**history** [**--help**] [**-n** *\<node-IP\>*] [**--json**]

**-h** **--help** Show help information

**-n** **--node** *\<node-IP\>* Get command history from a specific
cluster node

**-j** **--json** Output as JSON

<hr>
###Info {#kato-command-ref-info}
Show information about this node or cluster including assigned and available roles. 

**info** [**--help**] [**-n** *\<node-IP\>*] [**--json**] [**--yaml**]

**-h** **--help** Show help information

**-n** **--node** *\<node-IP\>* Show info on a specific cluster node

**-j** **--json** Output as JSON

**-y** **--yaml** Output as YAML

<hr>
###Inspect {#kato-command-ref-inspect}

Detect common problems with your Application Lifecycle Service installation.

**inspect** [**options**]

**inspect** [**options**] [**all**]

**inspect** [**options**] **group** *\<group-name\>*

**inspect** [**options**] **tests** *\<test-name\>...*

To run all tests, run:

	kato inspect

To use a specific group of tests, run:

	kato inspect group \<name of group\>

To run specific tests, run:

    kato inspect tests \<test1\> \<test2\> \<test3\>


**-h** **--help** Show help information

**-v** **--verbose** Verbose output

<hr>
###Log {#kato-command-ref-log-stream}
Logging utilities for Application Lifecycle Service.

**log** **drain** **add** [**options**] *\<name\>* *\<uri\>*
[*\<param\>...*]

Add a new log drain.

####Examples:



- Add a drain to receive system logs

   		 kato log drain add system\_splunk udp://logs.splunk.com:1234/



- Add a drain to forward all application and system logs as json

    		kato log drain add -f json -p apptail,systail app\_sys\_splunk
    		udp://logs.splunk.com:1235/



- Add a drain with a custom or named format,

	    kato log drain add -f "{{.Name}}: {{.Text}}" system\_splunk\_2
	    udp://logs.splunk.com:1236/ kato log drain add -f systail-syslog
	    system\_splunk\_2 udp://logs.splunk.com:1236/



- Passing custom parameters to a drain

    	kato log drain add mydrain redis://localhost:6379 key=logdata

**-h** **--help** Show help information

**-f** **--format** *\<format\>* Message format

**-p** **--prefix** *\<prefix\>* Message key prefix; possible values:
systail, event, apptail (comma-separated, no spaces)

<hr>

**log** **drain** **delete** [**options**] *\<name\>*

Delete a drain

**-h** **--help** Show help information
<hr>

**log** **drain** **list** [**options**]

List all log drains

**-h** **--help** Show help information

**-y** **--yaml** Output at YAML

**-j** **--json** Output at JSON

<hr>

**log** **drain** **status** [**options**] [*\<drain\>...*]

Show the status of all or specified log drains

**-h** **--help** Show help information

**-n** **--not-running** Show only drains not running

**-y** **--yaml** Output at YAML

**-j** **--json** Output at JSON
<hr>

**log** **stream** [**options**] *\<key\>...*

###Examples:

- stream cloud events

		kato log stream event
    
- stream DEA and app log stream

    	kato log stream systail.dea systail.stager apptail


- stream system logs (equivalent to 'kato log tail')

    	kato log stream systail

*\<key\>* Logyard stream key prefix (eg: systail.dea)

**-h** **--help** Show help information

**--no-color** Turn off color

**--raw** Show unformatted logs, including logyard INFO records
(skipped by default)

**--json** Show the original JSON

**--time** Show timestamp

**-n** **--node** *\<node-IP\>* Only show logs from a specific cluster
 node

**-l** **--local** Only show logs from the current node

<hr>

**log** **tail** [**options**] [*\<component\>...*]

*\<component\>* Can be a process name, role name or role group name

**-h** **--help** Show help information

**--no-color** Turn off color

**--raw** Show unformatted logs, including logyard INFO records
(skipped by default)

**--time** Show timestamp

**-n** **--node** *\<node-IP\>* Only show logs from a specific cluster
node

**-l** **--local** Only show logs from the current node
<hr>
###Node {#kato-command-ref-node-attach}

Node management commands.

**node** **attach** [**options**] *\<core-ip\>*

Attach this node to a core node

**-h** **--help** Show help information

**-e** **--enable** *\<roles\>* Enable the specified roles
(comma-separated, no spaces)

**-s** **--no-start** Do not auto start processes

**-v** **--verbose** Show process information when starting/stopping
roles

**-f** **--force** Forces this node to attach to a core node, ignoring
any version mismatches
<hr>

**node** **detach** [**options**]

Detach this node from a core node

**-h** **--help** Show help information

**-s** **--start** Automatically start processes after detaching

**-v** **--verbose** Show process information when starting/stopping
roles
<hr>

**node** **list** [**options**]

List all nodes known to this cluster

**-h** **--help** Show help information

**-j** **--json** Use JSON format for displaying output

**-y** **--yaml** Use YAML format for displaying output

<hr>

**node** **migrate** *\<old-node-IP\>* *\<new-node-IP\>*

Migrate the node configuration from old node to a new node

**-h** **--help** Show help information

**-r** **--no-restart** Do not restart roles after migration

<hr>

**node** **remove** *\<node-IP\>*

Remove the node from the cluster

**-h** **--help** Show help information

<hr>
**node** **rename** [**options**] *\<hostname\>*

**-h** **--help** Show help information.

**-s** **--skip-remap-hosts** Skip the remapping of existing app URLS
to the new domain.

**-l** **--skip-ssl-regeneration** Skip regenerating the SSL keys

**-r** **--no-restart** Do not restart roles.

**-v** **--verbose** Show process information when restarting roles.
<hr>

**node** **reset** **soft**

**node** **reset** **factory**

**node** **reset** **--help**

Reset the Application Lifecycle Service VM to its default configuration.

-   soft: clears all data and resets the VM to its state immediately
    after first boot.
-   factory: returns the VM to its state prior to first boot.

**-h** **--help** Show help information

<hr>

**node** **retire** [**options**]

Gracefully retires a DEA node from the cluster. New instances of the
apps are started on other available DEAs before the retiring DEA is
shut down.

**-h** **--help** Show help information

**-n** **--node** *\<node-id\>* Retire the specified DEA node, local
node is used if not specified

<hr>

**node** **setup** **core** [*\<endpoint\>*]

**node** **setup** **core** **--help**

Configure the core node of your Application Lifecycle Service cluster

**-h** **--help** Show help information

**-v** **--verbose** Show process information

<hr>

**node** **setup** **firstuser** [**options**] *\<email\>* *\<org\>*

First user setup.

*\<email\>* First user's email.

*\<org\>* First user's organization.

**-h** **--help** Show help information

**-p** **--password** *\<password\>* First user's password. If your unix password has not been updated, then
your unix password will be updated to this. Will be prompted for if not given.

**-u** **--username** *\<username\>* First user's username. Will be the provided email if not given.


<hr>

**node** **setup** **load\_balancer** [*\<IP\>...*] [**--force**]

**node** **setup** **load\_balancer** **--help**

Configure this node as a HTTP/S load balancer

**-h** **--help** Show help information

<hr>

**node** **setup** **micro** [**options**] [*\<role\>...*]

**node** **setup** **micro** **--help**

Configure this instance as a micro cloud

**-h** **--help** Show help information

**-d** **--delete** Delete old configuration and re-initialize
everything

**-s** **--no-start** Do not auto start processes

**-v** **--verbose** Show process information

<hr>

**node** **upgrade** [**options**]

Upgrades Application Lifecycle Service

**-h** **--help** Show help information

**-n** **--node** *\<node\>* Targets the provided node.

**-v** **--version** *\<version\>* The version of Application Lifecycle Service to upgrade
to. The latest version is used if this isn't supplied.

**--rollback** Rolls Application Lifecycle Service back to the previous version.

**--skip-confirmation** Skips initial confirmation of upgrade.

**--resume** Resumes an upgrade process, used internally by Kato and
should only be called manually when requested.

**--cluster** Performs an upgrade of all nodes in the cluster.

**--status** Shows the status of upgrades on a node.

**--force** Forces an upgrade to run.

**-j** **--json** Shows the status in json format.

**-u** **--update-kato** Updates kato node upgrade to the latest
codebase.

**--role-order** *\<role-order\>* Comma separated list of roles
defining the order that roles should be upgraded in a cluster.

**--ignore-inspect-failures** Display pre/post upgrade 'kato inspect'
tests as warnings instead of upgrade failures.
<hr>

**node** **version** [**options**] [*\<node-IP\>*]

 **-h** **--help** Show help information.

<hr>
###Op {#kato-command-ref-op}

Various operational commands.

**op** **--help**

**op** **custom\_ssl\_cert** **install** *\<key-path\>* *\<cert-path\>*
*\<domain\>* [**--wildcard-subdomains**] [**--update**]

**op** **custom\_ssl\_cert** **remove** *\<domain\>*

**op** **custom\_ssl\_cert** **list**

**op** **dhcp**

**op** **defer** *\<command\>* [**--run-as-root**] [**--reset**]

**op** **import\_from\_yaml\_files** [**--upgrade**]

**op** **max\_client\_upload** *\<max-size\>*

**op** **regenerate** **ssl\_cert**

**op** **regenerate** **mysql**

**op** **regenerate** **postgresql** [**--no-restart**]

**op** **regenerate** **helion-rest-auth**

**op** **regenerate** **cloud-controller-client-auth**

**op** **regenerate** **token-signing-secret**

**op** **remap\_hosts** *\<old-hostname\>* *\<new-hostname\>*

**op** **run\_deferred**

**op** **set\_timezone** [**--timezone** *\<TZ\>*]

**op** **static\_ip** [**--no-restart**]

**op** **upstream\_proxy** **set** *\<proxy-address\>* [**-u**
*\<user\>*] [**-p** *\<pass\>*]

**op** **upstream\_proxy** **delete**

**op** **update\_hostsfile**

**op** **generate\_service\_tokens**
<hr>
###Other commands {#other}
**custom\_ssl\_cert** Allows admin configuration of custom SSL
certificates to be used in conjunction with router2g and deployed applications.

**dhcp** Configures this node's networking to use DHCP

**defer** Defers a kato command to be run by 'op run\_deferred'

**max\_client\_upload** Set the maximum upload size in MB

**regenerate** Regenerate the configuration for a process

**remap\_hosts** Change the hostname to look for when remapping

**run\_deferred** Runs any previously deferred kato commands

**set\_timezone** Change the default system timezone for the host
machine

**static\_ip** Configures this node to use a static IP

**upstream\_proxy** Configure Application Lifecycle Service to use an external or upstream
proxy server and deployed apps.

**update\_hostsfile** Updates the /etc/hosts file with the endpoint
URI mapped to the CC's internal IP

**generate\_service\_tokens** Generates service auth tokens.

**-h** **--help** Show help information

**-u** **--user** *\<user\>* Proxy username

**-p** **--pass** *\<pass\>* Proxy password

**-r** **--no-restart** Do not restart processes.

<hr>
###Patch {#kato-command-ref-patch}
Update an Application Lifecycle Service cluster with post-release fixes.

**patch** **status** [**--all**]

**patch** **install** [**--only-this-node**] [**--no-restart**]
*\<patchname\>*

**patch** **reset**

**patch** **update**

**patch** **reinstall** [**--only-this-node**] [**--no-restart**]
*\<patchname\>*

**-h** **--help** Show help information

**-a** **--all** Show status for all patches

**-n** **--only-this-node** Only patch this node (otherwise entire
cluster will be patched)

**-r** **--no-restart** Don't restart any roles during patching

<hr>
###Process {#kato-command-ref-process-list} 
Start, stop, or restart individual processes. Generally not required.

**process** **list** [**options**] [*\<process\>...*]

Lists configured processes and their current running status.

**-h** **--help** Show help information

**-n** **--node** *\<node-IP\>* Get status for a specific cluster node
(defaults to local node)

**-c** **--cluster** Includes process status over all cluster nodes

**-j** **--json** Use JSON format for displaying output

**-y** **--yaml** Use YAML format for displaying output

<hr>

**process** **ready** [**options**] *\<process\>*

**-h** **--help** Show help information

**-b** **--block** *\<seconds\>* Block until ready, for max \<seconds\> seconds. If \<seconds\> is 0, then block forever.

**-n** **--node** *\<node-IP\>* Check process on a specific cluster node

<hr>

**process** **restart** [**options**] [*\<process\>...*]

**-h** **--help** Show help information

**-n** **--node** *\<node-IP\>* Restart process on a specific cluster
node

**-c** **--cluster** Restarts process on all nodes in the cluster

<hr>

**process** **start** [**options**] [*\<process\>...*]

 **-h** **--help** Show help information

 **-n** **--node** *\<node-IP\>* Start process on a specific cluster node

<hr>

**process** **stop** [**options**] [*\<process\>...*]

**-h** **--help** Show help information

**-n** **--node** *\<node-IP\>* Stop process on a specific cluster
node
<hr>
###Relocate {#kato-command-ref-relocate}
Move containers, application droplets, or services to a new mount point or filesystem location.

**relocate** [**-h**] **containers** *\<new\_location\>*

**relocate** [**-h**] **droplets** *\<new\_location\>*

**relocate** [**-h**] **services** *\<new\_location\>*

**-h** **--help** Show help information
<hr>

###Report {#kato-command-ref-report}
Generate a report that can be sent to Application Lifecycle Service support.

**report** **--node** *\<node-IP\>*

**report** **--cluster**

**report** **--help**

**-h** **--help** Show help information

**-c** **--cluster** Gather reports from entire cluster into one tarball

**-n** **--node** *\<node-IP\>* Gather report from a specific cluster node

<hr>
###Restart {#kato-command-ref-restart}

Restart the Application Lifecycle Service or individual roles.

**restart** [**options**] [*\<role\>...*]

**restart** **--help**

**-a** **--all** Also restart core processes

**-n** **--node** *\<node-IP\>* Restart a specific cluster node

**-v** **--verbose** Show process information

<hr>
###Role {#kato-command-ref-role-add}

Management of node roles.

**role** **add** **--help**

**role** **add** [**-v**] [**--node** *\<node-IP\>*] [**--no-start**]
*\<role\>...*

**role** **add** [**-v**] [**--node** *\<node-IP\>*] [**--no-start**]
**--all**

**role** **add** [**-v**] [**--node** *\<node-IP\>*] [**--no-start**]
**--all-but** *\<role\>...*

**role** **add** [**-v**] [**--node** *\<node-IP\>*] **--only**
*\<role\>...*

Enable roles on a node

**-h** **--help** Show help information

**-a** **--all** Enable all available roles

**-b** **--all-but** Enable all available roles except these

**-o** **--only** Enable only these roles, while disabling others

**-n** **--node** *\<node-IP\>* Add a role on a specific cluster node

**-s** **--no-start** Do not start processes

**-v** **--verbose** Show process information
<hr>

**role** **info** **--help**

**role** **info** [*\<role\>...*]

Display info on roles

**-h** **--help** Show help information
<hr>

**role** **remove** **--help**

**role** **remove** [**-v**] [**--node** *\<node-IP\>*] *\<role\>...*

**role** **remove** [**-v**] [**--node** *\<node-IP\>*] **--all**

**role** **remove** [**-v**] [**--node** *\<node-IP\>*] **--all-but**
*\<role\>...*

Disable roles for a node

**-h** **--help** Show help information

**-a** **--all** Disable all available roles

**-b** **--all-but** Disable all available roles except these

**-n** **--node** *\<node-IP\>* Remove a role on a specific cluster
node

**-v** **--verbose** Show process information

<hr>
###Shell {#kato-command-ref-shell}

Interactive shell for kato.

**shell** [**--help**]

**-h** **--help** Show help information

<hr>
###Start {#kato-command-ref-start}

Start Application Lifecycle Service or individual roles.

**start** [**options**] [*\<role\>...*]

**start** **--help**

**-n** **--node** *\<node-IP\>* Start a specific cluster node

**-e** **--ephemeral** Try not to regenerate/modify any config items

**-v** **--verbose** Show process information
<hr>
###Status {#kato-command-ref-status}

List configured roles and their current status across the cluster.

**status** [**options**]

List configured roles and their current status across the cluster.

**-h** **--help** Show help information

**-a** **--all** Show all roles, including roles not configured on
cluster

**-j** **--json** Use JSON format for displaying output.

**-y** **--yaml** Use YAML format for displaying output.

<hr>
###Stop {#kato-command-ref-stop}

Stop Application Lifecycle Service or individual roles. 

**stop** [**options**] [*\<role\>...*]

**stop** **--help**

**-n** **--node** *\<node-IP\>* Stop a specific cluster node

**-v** **--verbose** Show process information

<hr>
###Version {#kato-command-ref-version}

Display the version of Application Lifecycle Service being run.

**version** [**--help**]

**-h** **--help** Show help information
