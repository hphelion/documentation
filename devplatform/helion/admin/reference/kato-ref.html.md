---
layout: default-devplatform
permalink: /als/v1/admin/reference/kato-ref/
product: devplatform
title: "Kato Command Reference"
---
<!--UNDER REVISION-->

#Kato Command Reference {#kato-command-reference}

Kato is the Application Lifecycle Service command line administration utility.

##Syntax {#usage}

<pre>kato <b>command</b> [--help] [arguments] [command-options]</pre>

##Command List {#kato-command-ref-list}

**Config**: Manipulates configuration values of Helion components.

- [config](#kato-command-ref-config)

**Data**: Import, export, or repair Helion system data

- [data export](#kato-command-ref-data-export)
- [data import](#kato-command-ref-data-import)
- [data repair](#kato-command-ref-data-repair-routes)

**Debug**: Commands for debugging Helion internals.

- [debug configwatch](#kato-command-ref-debug-configwatch)
- [debug redis](#kato-command-ref-debug-redis)

**History**: Display the kato commands that have been run

- [history](#kato-command-ref-history)

**Info**: Display information about this node or cluster, including assigned and available roles.

- [info](#kato-command-ref-info)
 
**Inspect**: Detect common problems with your installation.

- [inspect](#kato-command-ref-inspect)

**License**: Set the license in use for this microcloud or cluster.

- [license](#kato-command-ref-license) 

**Logging**: Logging utilities.

- [log](#kato-command-ref-log-stream)
- [log drain](#kato-command-ref-log-drain-add)
- [log stream](#kato-command-ref-log-stream)
- [log tail](#kato-command-ref-log-tail)


**Node**: Node management

- [node attach](#kato-command-ref-node-attach)
- [node availabilityzone](#kato-command-ref-node-availabilityzone)
- [node detach](#kato-command-ref-node-detach)
- [node list](#kato-command-ref-node-list)
- [node migrate](#kato-command-ref-node-migrate)
- [node placementzones](#kato-command-ref-node-placementzones-add)
- [node remove](#kato-command-ref-node-remove)
- [node rename](#kato-command-ref-node-rename)
- [node reset](#kato-command-ref-node-reset)
- [node retire](#kato-command-ref-node-retire)
- [node setup](#kato-command-ref-node-setup-core)
- [node update](#kato-command-ref-node-update)
- [node upgrade](#kato-command-ref-node-upgrade)
- [node version](#kato-command-ref-node-version)

**OP**: Various operational commands

- [op custom&#95;ssl_cert](#kato-command-ref-op-custom_ssl_cert)
- [op defer](#kato-command-ref-op-defer)
- [op dhcp](#kato-command-ref-op-dhcp)
- [op generate&#95;service_tokens](#kato-command-ref-op-generate_service_tokens)
- [op import&#95;from&#95;yaml_file](#kato-command-ref-op-import_from_yaml_file)
- [op import&#95;from&#95;yaml_files](#kato-command-ref-op-import_from_yaml_files)
- [op max&#95;client_upload](#kato-command-ref-op-max_client_upload)
- [op regenerate](#kato-command-ref-op-regenerate)
- [op remap_hosts](#kato-command-ref-op-remap_hosts)
- [op run_deferred](#kato-command-ref-op-run_deferred)
- [op set_timezone](#kato-command-ref-op-set_timezone)
- [op static_ip](#kato-command-ref-op-static_ip)
- [op update_hostsfile](#kato-command-ref-op-update_hostsfile)
- [op upstream_proxy](#kato-command-ref-op-upstream_proxy)

**Patch**: Update a cluster with post-release fixes.

- [patch](#kato-command-ref-patch) 

**Process**: Start, stop, or restart individual processes. Generally not required.

- [process list](#kato-command-ref-process-list)
- [process ready](#kato-command-ref-process-ready)
- [process restart](#kato-command-ref-process-restart)
- [process start](#kato-command-ref-process-start)
- [process stop](#kato-command-ref-process-stop)

**Relocate**: Move containers, application droplets, or services to a new mount point

- [relocate](#kato-command-ref-relocate) 

**Report**: Generate a report that can be sent to technical support.

- [report](#kato-command-ref-report) 

**Restart**: Restart the service or individual roles.

- [restart](#kato-command-ref-restart)

**Role**: Management of node roles
  
- [role add](#kato-command-ref-role-add)
- [role info](#kato-command-ref-role-info)
- [role remove](#kato-command-ref-role-remove)
   
**Shell**: Interactive shell for kato

- [shell](#kato-command-ref-shell) 

**Start**: Start the ALS or start individual roles.

- [start](#kato-command-ref-start) 

**Status**: List configured roles and their current status across the cluster.

- [status](#kato-command-ref-status) 

**Stop**: Stop the service or individual roles.

- [stop](#kato-command-ref-stop) 

**Version**: Display the version of Helion currently in use.

- [version](#kato-command-ref-version) 

## Command Usage Details {#kato-command-ref-details}

###Config {#kato-command-ref-config}
Manipulate configuration values of service components.

**Syntax**

**config** **get** [**options**] <*component*> *<key-path>*

**config** **set** [**options**] <*component*>  *<key-path>* <*value*>

**config** **del** [**options**] <*component*> *<key-path>*

**config** **push** [**options**] <*component*> *<key-path>* <*value*>

**config** **pop** [**options**] <*component*> *<key-path>* <*value*>

- <*value*>: If value is not given for *set*, then it is read from STDIN.
- <*component*>: Can be **cluster**, **local** or the name of a process.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 100px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h --help</td><td>Show help information</td></tr>
<tr><td>-j  --json</td><td>For <i>set</i>, use JSON format when setting config key values. For <i>get</i>, use JSON format when displaying output.</td></tr>
<tr><td>-y --yaml</td><td>Use YAML format when retrieving or setting config key values. YAML is the default output format.</td></tr>
<tr><td>-f --flat</td><td>Use a flat output format. <i><full-config-path> <value></i></td></tr>
<tr><td>--force</td><td>Force updating value to different type</td></tr>
</table>

<hr>
###Data Export {#kato-command-ref-data-export}
Export system data to or from clusters/nodes. <br />
If no options are specified, includes **all** data except *resources* and *aok-config*.

**Syntax**

	data export --only-this-node [options] <filename>
	
	data export --cluster [options] <filename>
	
	data export --manual [options] <filename>

- <*filename*>: The name of the file that the export will be written to.
- **--cluster**:  Affect the entire cluster 
- **--only-this-node**: Only affect this node
- **--manual**: Import/export ONLY the roles specified on the command line

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:250px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Display help information</td></tr>
<tr><td>--force</td><td>Force import/export of specified roles even if they are not enabled. This command requires --manual and implies --only-this-node</td></tr>
<tr><td>--remote</td><td>Remote import/export (internal use only)</td></tr>
<tr><td>--base-dir <<i>base-dir</i>></td><td>Base directory for extracting temporary files </td></tr>
<tr><td>--only-users-orgs</td><td>Include ONLY the portions related to users and organizations (parts of main-db, aok-db, aok-config, db-encryption-key, license) </td></tr>
<tr><td>--droplets</td><td>Include droplets (uploaded apps) in the export</td></tr>
<tr><td>--exclude-droplets</td><td>Do not include droplets (uploaded apps) in the export  </td></tr>
<tr><td>--packages</td><td>Include app packages in the export </td></tr>
<tr><td>--exclude-packages</td><td>Do not include app packages </td></tr>
<tr><td>--resources</td><td>Include the upload cache</td></tr>
<tr><td>--exclude-resources</td><td>Do not include the upload cache (default)</td></tr>
<tr><td>--license</td><td>Include the service license</td></tr>
<tr><td>--exclude-license</td><td>Do not include the service license</td></tr>
<tr><td>--db-encryption-key</td><td>Include the key used to encrypt the service DB (recommended) </td></tr>
<tr><td>--exclude-db-encryption-key</td><td>Do not include the database encryption key</td></tr>
<tr><td>--main-db</td><td>Include the cloud controller's main database</td></tr>
<tr><td>--exclude-main-db</td><td>Do not include the cloud controller's main database </td></tr>
<tr><td>--aok-db</td><td>Include AOK's database</td></tr>
<tr><td>--exclude-aok-db</td><td>Do not include AOK's database </td></tr>
<tr><td>--aok-config</td><td>Include AOK's configuration</td></tr>
<tr><td>--exclude-aok-config</td><td>Do not include AOK's configuration (default)</td></tr>
<tr><td>--helion-rest-db</td><td>Include the Rest's database</td></tr>
<tr><td>--exclude-helion-rest-db</td><td>Do not include the Rest's database</td></tr>
<tr><td>--filesystem</td><td>Include the filesystem service</td></tr>
<tr><td>--exclude-filesystem</td><td>Do not include the filesystem service</td></tr>
<tr><td>--exclude-filesystem-data</td><td>Do not include the filesystem service's user data</td></tr>
<tr><td>--exclude-filesystem-user-creation</td><td>Do not include the filesystem service's user creation/quota </td></tr>
<tr><td>--harbor</td><td>Include the harbor service </td></tr>
<tr><td>--exclude-harbor</td><td>Do not include the harbor service </td></tr>
<tr><td>--exclude-harbor-data</td><td>Do not include the harbor service's user data</td></tr>
<tr><td>--exclude-harbor-metadata</td><td>Do not include the harbor service's metadata </td></tr>
<tr><td>--mysql</td><td>Include the MySQL service </td></tr>
<tr><td>--exclude-mysql</td><td>Do not include the MySQL service</td></tr>
<tr><td>--exclude-mysql-data</td><td>Do not include the MySQL service's data</td></tr>
<tr><td>--exclude-mysql-metadata</td><td>Do not include the MySQL service's metadata </td></tr>
<tr><td>--postgresql</td><td>Include the PostgreSQL service</td></tr>
<tr><td>--exclude-postgresql</td><td>Do not include the PostgreSQL service</td></tr>
<tr><td>--exclude-postgresql-data</td><td>Do not include the PostgreSQL service's data </td></tr>
<tr><td>--exclude-postgresql-metadata</td><td>Do not include the PostgreSQL service's metadata </td></tr>
<tr><td>--mongodb</td><td>Include the MongoDB service</td></tr>
<tr><td>--exclude-mongodb</td><td>Do not include the MongoDB service</td></tr>
<tr><td>--exclude-mongodb-data</td><td>Do not include the MongoDB service's data</td></tr>
<tr><td>--exclude-mongodb-metadata</td><td>Do not include the MongoDB service's metadata </td></tr>
<tr><td>--memcached</td><td>Include the memcached service</td></tr>
<tr><td>--exclude-memcached</td><td>Do not include the memcached service</td></tr>
<tr><td>--exclude-memcached-data</td><td>Do not include the memcached service's data</td></tr>
<tr><td>--exclude-memcached-metadata</td><td>Do not include the memcached service's metadata </td></tr>
<tr><td>--redis</td><td>Include the Redis service</td></tr>
<tr><td>--exclude-redis</td><td>Do not include the Redis service </td></tr>
<tr><td>--exclude-redis-data</td><td>Do not include the Redis service's data</td></tr>
<tr><td>--exclude-redis-metadata</td><td>Do not include the Redis service's metadata</td></tr>
<tr><td>--rabbit</td><td>Include the RabbitMQ service (Messaging)</td></tr>
<tr><td>--exclude-rabbit</td><td>Do not include the RabbitMQ service </td></tr>
<tr><td>--exclude-rabbit-data</td><td>Do not include the RabbitMQ service's data</td></tr>
<tr><td>--exclude-rabbit-metadata</td><td>Do not include the RabbitMQ service's metadata </td></tr>
<tr><td>--rabbit3</td><td>Include the RabbitMQ service</td></tr>
<tr><td>--exclude-rabbit3</td><td>Do not include the RabbitMQ service</td></tr>
<tr><td>--exclude-rabbit3-data</td><td>Do not include the RabbitMQ service's data</td></tr>
<tr><td>--exclude-rabbit3-metadata</td><td>Do not include the RabbitMQ service's metadata </td></tr>
</table>

<hr>

###Data Import {#kato-command-ref-data-import}

Import system data to or from clusters/nodes. <br />
If no options are specified, includes **all** data except *resources* and *aok-config*.

**Syntax**

	data import --only-this-node [options] <source>
	data  import --cluster [options] <source>
	data import --manual [options] <source>

-  <*source*>:    The hostname or a filename to import from.
- **--cluster**:  Affect the entire cluster 
- **--only-this-node**: Only affect this node
- **--manual**: Import/export ONLY the roles specified on the command line

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:250px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
<tr><td>--fix-app-paths</td><td>Rewrite /app and /app/app paths in manifest.yml</td></tr>
<tr><td>--force</td><td>Force import/export of specified roles even if they are not enabled Requires --manual and implies --only-this-node</td></tr>
<tr><td>--remote</td><td>Remote import/export (internal use only)</td></tr>
<tr><td>--base-dir <<i>base-dir</i>></td><td>Base directory for extracting temporary files </td></tr>
<tr><td>--timeout <<i>seconds</i>></td><td>Override staging timeout default for legacy import</td></tr>
<tr><td>--legacy</td><td>Treat import as a legacy services import (internal use only)</td></tr>
<tr><td>--droplets</td><td>Include droplets (uploaded apps) in the export</td></tr>
<tr><td>--exclude-droplets</td><td>Do not include droplets (uploaded apps) in the export  </td></tr>
<tr><td>--packages</td><td>Include app packages in the export </td></tr>
<tr><td>--exclude-packages</td><td>Do not include app packages </td></tr>
<tr><td>--resources</td><td>Include the upload cache</td></tr>
<tr><td>--exclude-resources</td><td>Do not include the upload cache (default)</td></tr>
<tr><td>--license</td><td>Include the service license</td></tr>
<tr><td>--exclude-license</td><td>Do not include the service license</td></tr>
<tr><td>--db-encryption-key</td><td>Include the key used to encrypt the service DB (recommended) </td></tr>
<tr><td>--exclude-db-encryption-key</td><td>Do not include the database encryption key</td></tr>
<tr><td>--main-db</td><td>Include the cloud controller's main database</td></tr>
<tr><td>--exclude-main-db</td><td>Do not include the cloud controller's main database </td></tr>
<tr><td>--aok-db</td><td>Include AOK's database</td></tr>
<tr><td>--exclude-aok-db</td><td>Do not include AOK's database </td></tr>
<tr><td>--aok-config</td><td>Include AOK's configuration</td></tr>
<tr><td>--exclude-aok-config</td><td>Do not include AOK's configuration (default)</td></tr>
<tr><td>--helion-rest-db</td><td>Include the Rest's database</td></tr>
<tr><td>--exclude-helion-rest-db</td><td>Do not include the Rest's database</td></tr>
<tr><td>--filesystem</td><td>Include the filesystem service</td></tr>
<tr><td>--exclude-filesystem</td><td>Do not include the filesystem service</td></tr>
<tr><td>--exclude-filesystem-data</td><td>Do not include the filesystem service's user data</td></tr>
<tr><td>--exclude-filesystem-user-creation</td><td>Do not include the filesystem service's user creation/quota </td></tr>
<tr><td>--harbor</td><td>Include the harbor service </td></tr>
<tr><td>--exclude-harbor</td><td>Do not include the harbor service </td></tr>
<tr><td>--exclude-harbor-data</td><td>Do not include the harbor service's user data</td></tr>
<tr><td>--exclude-harbor-metadata</td><td>Do not include the harbor service's metadata </td></tr>
<tr><td>--mysql</td><td>Include the MySQL service </td></tr>
<tr><td>--exclude-mysql</td><td>Do not include the MySQL service</td></tr>
<tr><td>--exclude-mysql-data</td><td>Do not include the MySQL service's data</td></tr>
<tr><td>--exclude-mysql-metadata</td><td>Do not include the MySQL service's metadata </td></tr>
<tr><td>--postgresql</td><td>Include the PostgreSQL service</td></tr>
<tr><td>--exclude-postgresql</td><td>Do not include the PostgreSQL service</td></tr>
<tr><td>--exclude-postgresql-data</td><td>Do not include the PostgreSQL service's data </td></tr>
<tr><td>--exclude-postgresql-metadata</td><td>Do not include the PostgreSQL service's metadata </td></tr>
<tr><td>--mongodb</td><td>Include the MongoDB service</td></tr>
<tr><td>--exclude-mongodb</td><td>Do not include the MongoDB service</td></tr>
<tr><td>--exclude-mongodb-data</td><td>Do not include the MongoDB service's data</td></tr>
<tr><td>--exclude-mongodb-metadata</td><td>Do not include the MongoDB service's metadata </td></tr>
<tr><td>--memcached</td><td>Include the memcached service</td></tr>
<tr><td>--exclude-memcached</td><td>Do not include the memcached service</td></tr>
<tr><td>--exclude-memcached-data</td><td>Do not include the memcached service's data</td></tr>
<tr><td>--exclude-memcached-metadata</td><td>Do not include the memcached service's metadata </td></tr>
<tr><td>--redis</td><td>Include the Redis service</td></tr>
<tr><td>--exclude-redis</td><td>Do not include the Redis service </td></tr>
<tr><td>--exclude-redis-data</td><td>Do not include the Redis service's data</td></tr>
<tr><td>--exclude-redis-metadata</td><td>Do not include the Redis service's metadata</td></tr>
<tr><td>--rabbit</td><td>Include the RabbitMQ service (Messaging)</td></tr>
<tr><td>--exclude-rabbit</td><td>Do not include the RabbitMQ service </td></tr>
<tr><td>--exclude-rabbit-data</td><td>Do not include the RabbitMQ service's data</td></tr>
<tr><td>--exclude-rabbit-metadata</td><td>Do not include the RabbitMQ service's metadata </td></tr>
<tr><td>--rabbit3</td><td>Include the RabbitMQ service</td></tr>
<tr><td>--exclude-rabbit3</td><td>Do not include the RabbitMQ service</td></tr>
<tr><td>--exclude-rabbit3-data</td><td>Do not include the RabbitMQ service's data</td></tr>
<tr><td>--exclude-rabbit3-metadata</td><td>Do not include the RabbitMQ service's metadata </td></tr>
</table>

<hr>

###Data Repair {#kato-command-ref-data-repair-routes}

Detects and fixes issues in the cloud controller database routes:
  - Fix leading dots
  - Fix duplicate prefix
  
After a legacy import, some apps ended up having routes with a leading '.' character,  which is invalid. These routes were not present in the source cluster.

**Syntax**

	data repair routes [options]

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
<tr><td>-n  --dry-run</td><td>Display problematic routes, but don't change anything </td></tr>
<tr><td>-y --no-prompt</td><td>Convert all with no user prompting</td></tr>
<tr><td>-v --verbose</td><td>Be verbose. (display maximum information output)</td></tr>
<tr><td>-q --quiet</td><td>Be quiet. (display minimum or no information output)</td></tr>
</table> 
                
<hr>

###Debug Configwatch {#kato-command-ref-debug-configwatch}

Watch changes to cluster configuration.

**Syntax**

	debug configwatch [options] [<process-name>...]

**Options**

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-d  --dump-tree</td><td>Dump the config tree seen since starting</td></tr>
<tr><td>-s  --no-value</td><td>Do not print the value of path</td></tr>
</table>

<hr>

###Debug Redis {#kato-command-ref-debug-redis}
Connects to the Redis server used for cluster config via redis-cli

**Syntax**

	debug redis

**Options**

None.

<hr>

###History {#kato-command-ref-history}

Displays the kato commands that have been run.

**Syntax**

	history [--help] [-n <node-IP>*] [--json]

**Options**

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
<tr><td>-n  --node <<i>node-IP</i>></td><td>Get command history from a specific cluster node</td></tr>
<tr><td>-j --json</td><td>Output as JSON</td></tr>
</table>
                   
<hr>

###Info  {#kato-command-ref-info}

Display information about this node or cluster, including assigned and available roles.

**Syntax**

	info [--help] [-n <node-IP>] [--json] [--yaml]

**Options**

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
<tr><td>-n  --node <<i>node-IP</i>></td><td>Display info from a specific cluster node</td></tr>
<tr><td>-j --json</td><td>Output as JSON</td></tr>
<tr><td>-y --yaml</td><td>Output as YAML</td></tr>
</table>
                   
<hr>

### Inspect {#kato-command-ref-inspect}

Detect common problems with your installation.

**Syntax**

	inspect [options]

	inspect [options] all

	inspect [options] group <group-name>

	inspect [options] tests <test-name>

	inspect [options] list
  
To run all tests, enter:
  
	kato inspect

To run a specific group of tests, enter:

  	kato inspect group <name of group>

To run specific tests, enter:

  	kato inspect tests <testname1> <testname2> <testname3>

To list all available tests, enter:

 	kato inspect list

**Options**

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
<tr><td>-v  --verbose</td><td>Verbose (maximum) output</td></tr>
</table>                    

<hr>
### License {#kato-command-ref-license}

Set the service license in use for this microcloud or cluster.

**Syntax**

	license set [options] <value>
	    
	license enable
		    
	license disable

- <*value*>: The license to use; if not given then it is read from STDIN

**Options**

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

<hr>

### Log Drain Add {#kato-command-ref-log-drain-add}

Add a new log drain.

**Syntax**

	log drain add [options] <name> <uri> [<param>...]

**Examples**
  
Add a drain to receive system logs
    
    kato log drain add system_splunk udp://logs.splunk.com:1234/
    
Add a drain to forward all application and system logs as json
  
	kato log drain add -f json -p apptail,systail app_sys_splunk \
    udp://logs.splunk.com:1235/
    
Add a drain with a custom or named format,
    
    kato log drain add -f "{{.Name}}: {{.Text}}" system_splunk_2 \
      udp://logs.splunk.com:1236/
    kato log drain add -f systail-syslog system_splunk_2 \
      udp://logs.splunk.com:1236/
  
Pass custom parameters to a drain
  
    kato log drain add mydrain redis://localhost:6379 key=logdata 

**Options**

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
<tr><td>-f --format <<i>format</i>> </td><td>Set the message format</td></tr>
<tr><td>-p  --prefix  <<i>prefix</i>></td><td>Message key prefix; possible values: systail, event, apptail (comma-separated, no spaces)</td></tr>
</table>   
 
<hr>

### Log Drain Delete {#kato-command-ref-log-drain-delete}

**log** **drain** **delete** [**options**] *<name>*

  Delete a drain

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

<hr>

###Log Drain List {#kato-command-ref-log-drain-list}

**log** **drain** **list** [**options**]

  List all log drains

  **-h** **--help**                       Show help information

  **-y** **--yaml**                       Output at YAML

  **-j** **--json**                       Output at JSON

<hr>

### Log Drain Status {#kato-command-ref-log-drain-status}

**log** **drain** **status** [**options**] [*<drain>...*]

  Show the status of all or specified log drains

  **-h** **--help**                       Show help information

  **-n** **--not-running**                Show only drains not running

  **-y** **--yaml**                       Output at YAML

  **-j** **--json**                       Output at JSON

<hr>

###Log Stream {#kato-command-ref-log-stream}

**log** **stream** [**options**] *<key>...*

  Examples:
  
    # stream cloud events
    
    kato log stream event
  
    # stream DEA and app log stream
    
    kato log stream systail.dea systail.stager apptail
  
    # stream system logs (equivalent to 'kato log tail')
    
    kato log stream systail

  *<key>*                                 Logyard stream key prefix (eg: systail.dea)


  **-h** **--help**                       Show help information

  **--no-color**                          Turn off color

  **--raw**                               Show unformatted logs, including logyard INFO records (skipped by default)

  **--json**                              Show the original JSON

  **--time**                              Show timestamp

  **-n** **--node** *<node-IP>*           Only show logs from a specific cluster node

  **-l** **--local**                      Only show logs from the current node

<hr>

###Log Tail {#kato-command-ref-log-tail}

**log** **tail** [**options**] [*<component>...*]

  *<component>*                           Can be a process name, role name or role group name


  **-h** **--help**                       Show help information

  **--no-color**                          Turn off color

  **--raw**                               Show unformatted logs, including logyard INFO records (skipped by default)

  **--time**                              Show timestamp

  **-n** **--node** *<node-IP>*           Only show logs from a specific cluster node

  **-l** **--local**                      Only show logs from the current node

<hr>

### Node Attach {#kato-command-ref-node-attach}

**node** **attach** [**options**] *<core-ip>*

  Attach this node to an ALS core node

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-e** **--enable** *<roles>*           Enable the specified roles (comma-separated, no spaces)

  **-s** **--no-start**                   Do not auto start processes

  **-v** **--verbose**                    Show process information when starting/stopping roles

  **-f** **--force**                      Forces this node to attach to a core node, ignoring any version mismatches

<hr>

###Node Availability Zone {#kato-command-ref-node-availabilityzone}

**node** **availabilityzone** [**options**] [*<zone>*]

  Gets/sets the availability zone on a node.

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-n** **--node** *<node-id>*           Sets the availability zone on the specified DEA node, local node is used if not specified

<hr>

### Node Detach {#kato-command-ref-node-detach}

**node** **detach** [**options**]

  Detach this node from an ALS core node

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-s** **--start**                      Automatically start processes after detaching

  **-v** **--verbose**                    Show process information when starting/stopping roles

<hr>

###Node List {#kato-command-ref-node-list}

**node** **list** [**options**]

  List all nodes known to this cluster

  **-h** **--help**                       Show help information

  **-j** **--json**                       Use JSON format for displaying output

  **-y** **--yaml**                       Use YAML format for displaying output

<hr>

###Node Migrate {#kato-command-ref-node-migrate}

**node** **migrate** *<old-node-IP>* *<new-node-IP>*

  Migrate the node configuration from old node to a new node

  **-h** **--help**                       Show help information

  **-r** **--no-restart**                 Do not restart roles after migration

<hr>


###Node Placement Zones {#kato-command-ref-node-placementzones-add}

**node** **placementzones** **add** [**options**] *<zone>*

  Adds a DEA zone to the current node.

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-n** **--node** *<node-id>*           Add a zone on the specified DEA node, local node is used if not specified

<hr>

###Node Placement Zones List {#kato-command-ref-node-placementzones-list}

**node** **placementzones** **list** [**options**]

  Lists the DEA zones on the current node.

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-n** **--node** *<node-id>*           Add a zone on the specified DEA node, local node is used if not specified

<hr>

###Node Placement Zones Remove {#kato-command-ref-node-placementzones-remove}

**node** **placementzones** **remove** [**options**] *<zone>*

  Removes a DEA zone from the current node.

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-n** **--node** *<node-id>*           Remove a zone on the specified DEA node, local node is used if not specified

<hr>

###Node Remove {#kato-command-ref-node-remove}

**node** **remove** [**--skip-detach**] *<node-IP>...*

  Remove the node(s) from the cluster

  **-h** **--help**                       Show help information

  **-s** **--skip-detach**                Skips updating the removed nodes config via detaching the node, only use this if the node has already been destroyed
 
<hr>

###Node Rename {#kato-command-ref-node-rename}

**node** **rename** [**options**] *<hostname>*

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-s** **--skip-remap-hosts**           Skip the remapping of existing app URLS to the new domain.

  **-l** **--skip-ssl-regeneration**      Skip regenerating the SSL keys

  **-r** **--no-restart**                 Do not restart roles.

  **-v** **--verbose**                    Show process information when restarting roles.

<hr>

###Node Reset {#kato-command-ref-node-reset}

**node** **reset** **factory**

**node** **reset** **docker**

**node** **reset** **services**

**node** **reset** **--help**

  Reset the ALS VM to its default configuration.
  
  * factory: returns the VM to its state prior to first boot.
  * docker: removes all docker containers, and deletes all but the ALS
    release images; not meant for general use.
  * services: removes all service data; not meant for general use.

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

<hr>

###Node Retire {#kato-command-ref-node-retire}

**node** **retire** [**options**]

  Gracefully retires a DEA node from the cluster. New instances of the
  apps are started on other available DEAs before the retiring DEA is shut
  down. 

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-n** **--node** *<node-id>*           Retire the specified DEA node, local node is used if not specified

<hr>

###Node Setup Core {#kato-command-ref-node-setup-core}

**node** **setup** **core** [*<endpoint>*]

**node** **setup** **core** **--help**

  Configure the core node of your ALS cluster

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-v** **--verbose**                    Show process information

<hr>

###Node Setup Firstuser {#kato-command-ref-node-setup-firstuser}

**node** **setup** **firstuser** [**options**] *<email>* *<org>*

  First user setup.

  *<email>*                               First user's email.

  *<org>*                                 First user's organization.


<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-p** **--password** *<password>*      First user's password. If your unix password has not been updated, then your unix password will be updated to this. Will be prompted for if not given.

  **-u** **--username** *<username>*      First user's username. Will be the provided email if not given.

  **-s** **--space** *<space>*            First user's initial space. If not specified, user will not initially be in a space.

<hr>

###Node Setup Load Balancer {#kato-command-ref-node-setup-load_balancer}

**node** **setup** **load_balancer** [*<IP>...*] [**--force**]

**node** **setup** **load_balancer** **--help**

  Configure this node as a HTTP/S load balancer

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

<hr>

###Node Setup Micro {#kato-command-ref-node-setup-micro}

**node** **setup** **micro** [**options**] [*<role>...*]

**node** **setup** **micro** **--help**

  Configure this instance as a micro cloud

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-d** **--delete**                     Delete old configuration and re-initialize everything

  **-s** **--no-start**                   Do not auto start processes

  **-v** **--verbose**                    Show process information

<hr>

###Node Update {#kato-command-ref-node-update}

**node** **update** [**options**]

  Update IP references in config.

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

<hr>

###Node Upgrade {#kato-command-ref-node-upgrade}

**node** **upgrade** [**options**]

**node** **upgrade** **--run-command** *<command>*

  Upgrade the installation to the latest available version, preserving
  deployed applications, config, services, and other state.
  
  Will operate on current node by default; upgrade can be done for the
  entire cluster at once (with --cluster) or for a specific node (with
  --node).

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **-j** **--json**                       Shows the status in json format.

  **-n** **--node** *<node>*              Targets the provided node.

  **-u** **--update-kato**                Updates kato node upgrade to the latest codebase.

  **-v** **--version** *<version>*        The version to upgrade to. The latest version is used if this isn't supplied.

  **--force**                             Forces an upgrade to run.

  **--prepare**                           Prepare the core node for an upgrade.

  **--resume**                            Resumes an upgrade process, used internally by Kato and should only be called manually when requested.

  **--role-order** *<role-order>*         Comma separated list of roles defining the order that roles should be upgraded in a cluster.

  **--skip-confirmation**                 Skips initial confirmation of upgrade.

  **--status**                            Shows the status of upgrades on a node.

  **--development**                       Run a development upgrade (internal use only).

  **--cache-ip** *<cache-ip>*             The ip of the node to act as a cache for all nodes in the cluster during upgrade.

  **--download-only**                     Downloads the files required to perform an upgrade without starting an upgrade, must specify --cache-ip when using this option.

  **--cluster**                           Unused parameter for backwards compatibility.

  **--offline**                           Upgrade offline; requires the upgrade content to be previously downloaded.

<hr>

###Node Version {#kato-command-ref-node-version}

**node** **version** [**options**] [*<node-IP>*]

<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

<hr>

###OP Custom SSL Cert (#kato-command-ref-op-custom_ssl_cert}

**op** **custom_ssl_cert** **install** [**options**] *<key-path>* *<cert-path>* *<domain>*

**op** **custom_ssl_cert** **remove** *<domain>*

**op** **custom_ssl_cert** **list**

  Configuration of custom SSL certificates to be used in conjunction with
  router2g and deployed applications.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table>  

  **--wildcard-subdomains**               Wildcard SSL certificate

  **--update**                            Update an existing SSL certificate

<hr>

###OP Defer {#kato-command-ref-op-defer}

**op** **defer** (*<command>* | **--reset**) [**--run-as-root**] [**--post-start**]

  Defer a kato command to be run (by 'op run_deferred') when the system is
  rebooted and supervisord has started. Commands are saved to a
  /home/helion/.kato-deferred YAML file.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **--run-as-root**                       Run deferred command as root

  **--reset**                             Clear list of deferred commands

  **--post-start**                        Run the deferred command after all processes managed by kato have started

<hr>

###OP DHCP {#kato-command-ref-op-dhcp}

**op** **dhcp**

  Configure this node's networking to use DHCP

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 


###OP Generate Service Tokens {#kato-command-ref-op-generate_service_tokens}

**op** **generate_service_tokens**

  Generates auth tokens for services.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

<hr>

###OP Import from YAML File {#kato-command-ref-op-import_from_yaml_file}

**op** **import_from_yaml_file** [**--upgrade**] [**--new-key-file=<file>**] *<process>*

  Import the YAML configuration for a single process, deleting and
  replacing all prior configuration for that process.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **--new-key-file=<file>**               Override config with a specific YAML file

  **--upgrade**                           Merge the new configuration rather than deleting and replacing

<hr>
###OP Import from YAML Files {#kato-command-ref-op-import_from_yaml_files}

**op** **import_from_yaml_files** [**--upgrade**] [**--new-key-file=<file>**]

  Import configuration from YAML files for all processes, deleting and
  replacing prior configuration.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **--new-key-file=<file>**               Override config with a specific YAML file

  **--upgrade**                           Merge the new configuration rather than deleting and replacing

<hr>
### OP Max Client Upload {#kato-command-ref-op-max_client_upload}

**op** **max_client_upload** *<max-size>*

  Set the maximum upload size in MB from ALS clients

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

<hr>

###OP Regenerate {#kato-command-ref-op-regenerate}

**op** **regenerate** **all** [**--no-restart**] [**--no-prompt**]

**op** **regenerate** **cloud-controller-bulk-api-auth** [**--no-prompt**]

**op** **regenerate** **cloud-controller-client-auth** [**--no-prompt**]

**op** **regenerate** **cloud-controller-db-encryption-key** [**--no-prompt**]

**op** **regenerate** **cloud-controller-staging-auth** [**--no-prompt**]

**op** **regenerate** **mysql** [**--no-prompt**]

**op** **regenerate** **postgresql** [**--no-restart**] [**--no-prompt**]

**op** **regenerate** **ssh_keys** [**--no-prompt**]

**op** **regenerate** **ssl_cert** [**--no-prompt**]

**op** **regenerate** **helion-rest-auth** [**--no-prompt**]

**op** **regenerate** **helion-router-auth** [**--no-prompt**]

**op** **regenerate** **token-signing-secret** [**--no-prompt**]

  Regenerate the configuration for various processes and components

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-n** **--no-prompt**                  Show help information

  **-r** **--no-restart**                 Do not restart processes.

<hr>

### OP Remap Hosts {#kato-command-ref-op-remap_hosts}

**op** **remap_hosts** *<old-hostname>* *<new-hostname>*

  Change the fully qualified basename (i.e. the default shared domain) in
  the URLs of hosted applications. Used when renaming the system or
  migrating user applications to a new system.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

<hr>

###OP Run Deferred {#kato-command-ref-op-run_deferred}

**op** **run_deferred** [**--post-start**]

  Runs deferred commands saved with 'kato defer'

  **-h** **--help**                       Show help information

  **--post-start**                        Run the deferred command after all processes managed by kato have started

<hr>

###OP Set Timezone {#kato-command-ref-op-set_timezone}

**op** **set_timezone** [**--timezone** *<TZ>*]

  Change the default system timezone for the host machine

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

<hr>

### OP Static IP {#kato-command-ref-op-static_ip}

**op** **static_ip** [**--interface=<if>**] [**--ip=<ip>**] [**--netmask=<netmask>**] [**--gateway=<gateway>**] [**--dns-nameservers=<dnsname>**] [**--dns-search-domains=<dnssearch>**] [**--restart-network**] [**--no-restart**]

  Configures this node to use a static IP. Interactively prompts for
  inputs if they are not specified as options.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 
  **--interface=<if>**                    Network interface to configure (e.g. eth0)

  **--ip=<ip>**                           Host IP address

  **--netmask=<netmask>**                 Network netmask (e.g. 255.255.255.0)

  **--gateway=<gateway>**                 Network gateway (IP address)

  **--dns-nameservers=<ips>**             Optional list of DNS names servers (e.g. 10.0.0.252, 10.0.0.253)

  **--dns-search-domains=<domains>**      Optional list of DNS search domains (e.g. example.com, example.org)

  **--restart-network**                   Restart networking

  **--no-restart**                        Do not restart processes.

<hr>

###OP Update Hostsfile {#kato-command-ref-op-update_hostsfile}

**op** **update_hostsfile**

  Updates the /etc/hosts file with the endpoint URI mapped to the cloud
  controller's internal IP.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

<hr>

###OP Upstream Proxy {#kato-command-ref-op-upstream_proxy}

**op** **upstream_proxy** **set** *<proxy-address>* [**options**]

**op** **upstream_proxy** **delete**

  Configure ALS to use an external or upstream proxy server for
  staging and deployed apps.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-u** **--user** *<user>*              Proxy username

  **-p** **--pass** *<pass>*              Proxy password

  **--no-proxy** *<no_proxy>*             Comma separated list of domain names that should bypass the proxy

<hr>

###Patch {#kato-command-ref-patch}

**patch** **status** [**options**]

**patch** **install** [**--node** *<nodeip>*] [**options**]

**patch** **install** [**--node** *<nodeip>*] [**options**] *<patchname>*

**patch** **reset** [**--node** *<nodeip>*] [**options**]

**patch** **update** [--node <nodeip> | --local]

**patch** **mark** [**--node** *<nodeip>*] [**options**] *<patchname>*

**patch** **reinstall** [**--node** *<nodeip>*] [**options**] *<patchname>*

**patch** **revert** [**--node** *<nodeip>*] [**options**]

**patch** **revert** [**--node** *<nodeip>*] [**options**] *<patchname>*

  Update an ALS cluster with post-release fixes.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-a** **--all**                        Show status for all patches

  **-l** **--local**                      Only affect this node (otherwise operates on entire cluster)

  **-n** **--node** *<nodeip>*            Only affect specified node

  **-r** **--no-restart**                 Don't restart any roles during patching

  **-q** **--quiet**                      Be quieter

  **-j** **--json**                       Return JSON (for 'status')

  **-i** **--installed**                  Manually mark patch as installed

  **-d** **--notinstalled**               Manually mark patch as not installed

  **-m** **--manifest** *<manifest>*      Specify a custom manifest file

  **-u** **--force-update**               Force a new manifest to be downloaded

  **-s** **--single**                     Remotely install single patch (internal use only)

  **--to-patch-id** *<patch-id>*          Specify the id of the patch to patch the cluster up to. Patches above this ID will not be applied

<hr>

###Process List {#kato-command-ref-process-list}

**process** **list** [**options**] [*<process>...*]

  Lists configured processes and their current running status.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-n** **--node** *<node-IP>*           Get status for a specific cluster node (defaults to local node)

  **-c** **--cluster**                    Includes process status over all cluster nodes

  **-j** **--json**                       Use JSON format for displaying output

  **-y** **--yaml**                       Use YAML format for displaying output

<hr>

###Process Ready {#kato-command-ref-process-ready}

**process** **ready** [**options**] *<process>*

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-b** **--block** *<seconds>*          Block until ready, for max <seconds> seconds. If <seconds> is 0, then block forever

  **-n** **--node** *<node-IP>*           Check process on a specific cluster node
<hr>

###Process Restart {#kato-command-ref-process-restart}

**process** **restart** [**options**] [*<process>...*]

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-n** **--node** *<node-IP>*           Restart process on a specific cluster node

  **-c** **--cluster**                    Restarts process on all nodes in the cluster
<hr>

###Process Start {#kato-command-ref-process-start}

**process** **start** [**options**] [*<process>...*]

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-n** **--node** *<node-IP>*           Start process on a specific cluster node

<hr>

###Process Stop {#kato-command-ref-process-stop}

**process** **stop** [**options**] [*<process>...*]

  **-h** **--help**                       Show help information

  **-n** **--node** *<node-IP>*           Stop process on a specific cluster node

<hr>

###Relocate {#kato-command-ref-relocate}

**relocate** [**options**] **containers** *<new_location>*

**relocate** [**options**] **droplets** *<new_location>*

**relocate** [**options**] **services** *<new_location>*

  Move containers, application droplets, or services to a new mount point
  or filesystem location.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-v** **--verbose**                    Verbose output

<hr>

###Report {#kato-command-ref-report}

**report**

**report** **--node** *<node-IP>*

**report** **--cluster**

**report** **--help**

  Generate a report that can be sent to technical support.

  **-h** **--help**                       Show help information

  **-c** **--cluster**                    Gather reports from entire cluster into one tarball

  **-n** **--node** *<node-IP>*           Gather report from a specific cluster node

<hr>

###Restart {#kato-command-ref-restart}

**restart** [**options**] [*<role>...*]

**restart** **--help**

  Restart service or individual roles.

  **-n** **--node** *<node-IP>*           Restart a specific cluster node

  **-v** **--verbose**                    Show process information

<hr>

###Role Add {#kato-command-ref-role-add}

Enable roles on a node.

**role** **add** **--help**

**role** **add** [**-v**] [**--node** *<node-IP>*] [**--no-start**] *<role>...*

**role** **add** [**-v**] [**--node** *<node-IP>*] [**--no-start**] **--all**

**role** **add** [**-v**] [**--node** *<node-IP>*] [**--no-start**] **--all-but** *<role>...*

**role** **add** [**-v**] [**--node** *<node-IP>*] **--only** *<role>...*

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-a** **--all**                        Enable all available roles

  **-b** **--all-but**                    Enable all available roles except these

  **-o** **--only**                       Enable only these roles, while disabling others

  **-n** **--node** *<node-IP>*           Add a role on a specific cluster node

  **-s** **--no-start**                   Do not start processes

  **-v** **--verbose**                    Show process information

<hr>

###Role Info {#kato-command-ref-role-info}

**role** **info** **--help**

**role** **info** [*<role>...*]

  Display info on roles

  **-h** **--help**                       Show help information

<hr>

###Role Remove {#kato-command-ref-role-remove}

**role** **remove** **--help**

**role** **remove** [**-v**] [**--node** *<node-IP>*] *<role>...*

**role** **remove** [**-v**] [**--node** *<node-IP>*] **--all**

**role** **remove** [**-v**] [**--node** *<node-IP>*] **--all-but** *<role>...*

  Disable roles for a node

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-a** **--all**                        Disable all available roles

  **-b** **--all-but**                    Disable all available roles except these

  **-n** **--node** *<node-IP>*           Remove a role on a specific cluster node

  **-v** **--verbose**                    Show process information


<hr>

###Shell {#kato-command-ref-shell}

**shell** [**--help**]

  Interactive shell for kato

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

<hr>

###Start {#kato-command-ref-start}

**start** [**options**] [*<role>...*]

**start** **--help**

  Start service or individual roles.

  **-n** **--node** *<node-IP>*           Start a specific cluster node

  **-e** **--ephemeral**                  Try not to regenerate/modify any config items

  **-v** **--verbose**                    Show process information

<hr>

###Status {#kato-command-ref-status}

**status** [**options**]

  List configured roles and their current status across the cluster.
**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 

  **-a** **--all**                        Show all roles, including roles not configured on cluster

  **-j** **--json**                       Use JSON format for displaying output.

  **-y** **--yaml**                       Use YAML format for displaying output.

<hr>

###Stop {#kato-command-ref-stop}
Stop service or individual roles.

**Syntax**

	stop [options] [<rolename1> <rolename2>...]

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
<tr><td>-n  --node <<i>node-IP</i>></td><td>Stop a specific node</td></tr>
<tr><td>-v  --verbose</td><td>Display process information</td></tr>
</table> 

<hr>

###Version {#kato-command-ref-version}

**Syntax**

	version [-h]

Display the version of ALS currently in use.

**Options**
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width:150px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>-h  --help</td><td>Show help information</td></tr>
</table> 