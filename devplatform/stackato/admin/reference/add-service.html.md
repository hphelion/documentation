---
layout: default-devplatform
permalink: /als/v1/admin/reference/add-service/
---
<!--PUBLISHED-->

Adding System Services[](#adding-system-services "Permalink to this headline")
===============================================================================

Application Lifecycle Service has two Service definitions:

-   System Services: Service types (e.g. MySQL, RabbitMQ, Filesystem)
    available for use on the system
-   Provisioned Services: Instances of the System Services created for
    end user applications

The [*helion
services*](/als/v1/user/reference/client-ref/#command-services)
command will show a list of all System Services available on the current
target, as well as a list of Provisioned Services allocated to the
authenticated user.

Administrators can configure external data services to work in the same
way as core Application Lifecycle Service System Services, exposing existing sofware and
infrastructure for use by Application Lifecycle Service and its users.

Echo service sample[](#echo-service-sample "Permalink to this headline")
-------------------------------------------------------------------------

A simple Ruby echo service is available in this repository:

> <https://github.com/HP/helion-echoservice>

Warning

The current echo service sample is an Application Lifecycle Service v2 / Cloud Foundry v1
service. A replacement example is under development which will use the
Cloud Foundry v2 services API.

The configuration files and instructions can be adapted (with reference
to the built-in system services) to create and install more complex
services to Application Lifecycle Service.

Oracle Database Add-On[](#oracle-database-add-on "Permalink to this headline")
-------------------------------------------------------------------------------

An Oracle database service add-on is available from HP. It can
be added to an Application Lifecycle Service system to allow end users to automatically
provision databases for end user applications on an exsisting Oracle
Database server. Contact
[sales@activestate.com](mailto:sales%40activestate.com) to get access to
this add-on.

This add-on can be installed on any node in an Application Lifecycle Service cluster, but
should generally run on a Data Services node for consistency even though
the Oracle Database server itself will generally be running on a
separate host.

Two of the configuration steps must also be run on other nodes in the
cluster (noted below) unless the nodes have been created from copies of
the VM already configured with this plugin.

### Oracle Pre-requisites[](#oracle-pre-requisites "Permalink to this headline")

The add-on requires the Oracle Instant Client (Basic Instant Client
Package and SDK) on the target VM. The packages can be obtained from the
[Oracle Technology
Network](http://www.oracle.com/technetwork/database/features/instant-client/index-097480).

On the target VM, create a new */opt/oracle* directory owned by the
`helion` user. Copy the
*instantclient-basic-linux.x64* and *instantclient-sdk-linux.x64* files
to the target VM and unzip them in the new */opt/oracle/* directory.

You may need to symlink a shared object for the oci8 gem to function
correctly. For example:

    $ cd /opt/oracle/instantclient_11_2
    $ ln -s libclntsh.so.11.1 libclntsh.so

Repeat this step on all DEA nodes in the cluster.

**Note**

Version 11 of SQLPlus/InstantClient requires the 'libaio-dev' package,
which is installed on the Application Lifecycle Service VM but not in the application
container template (as of 2.10.6). Users can install this package by
adding the following to *stackato.yml*:

    requirements:
      running:
        ubuntu:
          - libaio-dev

Admins can modify the container template globally using:

    $ sudo chroot /lxc/template/rootfs
    ...
    $ apt-get install libaio-dev

### Copying the Add-on to Application Lifecycle Service[](#copying-the-add-on-to-helion "Permalink to this headline")

Copy the Oracle Database archive to the target VM and unzip it into
*/s/vcap/services/oracledb*. For example:

    $ scp oracledb.zip helion@helion-vm.example.com
    $ ssh helion@helion-vm.example.com
    ...
    $ unzip oracledb.zip -d /s/vcap/services/oracledb

### Install the service gems[](#install-the-service-gems "Permalink to this headline")

On the VM, go to the */s/vcap/services/oracledb* directory and run
`bundle update`:

    $ cd /s/vcap/services/oracledb
    $ env LD_LIBRARY_PATH=/opt/oracle/instantclient_11_2 bundle update

Some settings in the *config/oracledb\_gateway.yml* file will need to be
modified:

    * **cloud_controller_uri**: Needs to match the API endpoint of your system (e.g. api.helion.example.com)
    * **token**: Can be any string. You will need to add this auth token to the cloud_controller_ng config in a later step
    * **mbus**: This should match the setting for other services. You can check the correct setting using ``kato config get redis_node mbus``

Set the credentials for the external Oracle database in
config/oracledb\_node.yml:

-   **oracledb**:
    -   **user**: DBA username with permissions to provision new users
    -   **password**: DBA password for the above
    -   **connect**: Connection string for the [OCI8
        gem](https://github.com/kubo/ruby-oci8/blob/master/test/test_connstr.rb)
    -   **host**: DB host IP
    -   **port**: DB host port, default 1521
    -   **database**: The Oracle service you wish to connect to
-   **user\_tablespace\_max**: Maximum size in MB

You can optionally set the `privilege` key if you
need to connect with SYSDBA or SYSOPER privileges:

    $ kato config set oracledb_node privilege '"SYSDBA"' --json

Or:

    $ kato config set oracledb_node privilege '"SYSOPER"' --json

### Install to supervisord[](#install-to-supervisord "Permalink to this headline")

Supervisord monitors, starts, and stops all Application Lifecycle Service processes, and will
need to have configuration files for the 'oracledb\_gateway' and
'oracledb\_node' processes. These supervisord config files are in the
*helion-conf* sub-directory of the add-on.

First, stop `kato` and `supervisord`{.docutils
.literal}:

    $ kato stop
    ...
    $ stop-supervisord

Copy the supervisord config files:

    $ cp helion-conf/oracledb_*  /s/etc/supervisord.conf.d/

### Install to Kato[](#install-to-kato "Permalink to this headline")

The 'kato' administrative tool will also need configuration to recognize
the new service. This can be done by appending the contents of
*process-snippet.yml* and *roles-snippet.yml* to their respective
`kato` config files:

> \$ cat helion-conf/processes-snippet.yml \>\>
> /s/etc/kato/processes.yml \$ cat helion-conf/roles-snippet.yml \>\>
> /s/etc/kato/roles.yml

**Note**

Repeat this step on all cluster nodes.

Optionally, you can add `oracledb` to the
`data-services` group in *role\_groups.yml* or
create a new logical group.

### Loading the config[](#loading-the-config "Permalink to this headline")

Doozer is the centralized configuration management component in
Application Lifecycle Service, which must include the service configuration we have just
added. To load the settings from the YAML files in *oracledb/config/*:

First, start supervisord:

> \$ start-supervisord

Run the following two commands to load the config:

    $ cat /s/vcap/services/oracledb/config/oracledb_node.yml | kato config set oracledb_node / --yaml
    $ cat /s/vcap/services/oracledb/config/oracledb_gateway.yml | kato config set oracledb_gateway / --yaml

These commands must be run after any change in the YAML config files.

### Add the service AUTH token[](#add-the-service-auth-token "Permalink to this headline")

The `auth` token set in
*config/oracledb\_gateway.yml* must be added to the
cloud\_controller\_ng settings:

    $ kato config set cloud_controller_ng builtin_services/oracledb '{"token": "<oracledb_gateway.yml auth token>"}' --json

Replace the \<oracledb\_gateway.yml auth token\> string above with the
auth token you set up earlier.

### Enable oracledb and start[](#enable-oracledb-and-start "Permalink to this headline")

    $ kato role add oracledb
    -----> Adding roles
    adding role "oracledb"...                  ok
    -----> Starting roles
    role oracledb starting...                  ok

Finally, start all other helion processes:

    $ kato start

### Verify the service[](#verify-the-service "Permalink to this headline")

Once the oracledb service has been enabled and started in kato, clients
targeting the system should be able to see it listed in the System
Services output:

    $ helion services

    ============== System Services ==============

    +------------+---------+------------------------------------------+
    | Service    | Version | Description                              |
    +------------+---------+------------------------------------------+
    | filesystem | 1.0     | Persistent filesystem service            |
    | harbor     | 1.0     | External port mapping service            |
    | memcached  | 1.4     | Memcached in-memory object cache service |
    | mongodb    | 2.4     | MongoDB NoSQL store                      |
    | mysql      | 5.5     | MySQL database service                   |
    | oracledb   | 1.0     | OracleDB service                         |
    | postgresql | 9.1     | PostgreSQL database service              |
    | rabbitmq   | 2.4     | RabbitMQ message queue                   |
    | redis      | 2.6     | Redis key-value store service            |
    +------------+---------+------------------------------------------+

To create a new service:

    $ helion create-service oracledb
    Creating Service [oracledb-503db]: OK

### Default tablespace[](#default-tablespace "Permalink to this headline")

The service will create a new userspace per-user at provision time to
better isolate users. A default userspace for all users can be specified
by setting the following option in kato:

    $ kato config set oracledb_node default_user_tablespace '"<tablespace>"' --json

### DBshell support[](#dbshell-support "Permalink to this headline")

End users wishing to use `helion dbshell` from
their local systems with an Oracle database will need to install the
[SQLPLUS
client](http://www.oracle.com/technetwork/database/features/instant-client/index-097480)
locally.

To enable dbshell Oracle support *within the application containers* on
Application Lifecycle Service, install the *instantclient-sqlplus-linux.x64* files alongside
the other Oracle prerequisites in the */opt/oracle/instantclient\_11\_2*
directory. Users can then add the instant client directory to the
LD\_LIBRARY\_PATH and PATH environment variables in *stackato.yml*

    env:
      LD_LIBRARY_PATH: "/opt/oracle/instantclient_11_2:$LD_LIBRARY_PATH"
      PATH: "/opt/oracle/instantclient_11_2:$PATH"
    services:
      ${name}-db: oracledb

The application should have a minimum of 128MB of memory to run sqlplus
and dbshell.

### [Table Of Contents](/als/v1/index-2/)

-   [Adding System Services](#)
    -   [Echo service sample](#echo-service-sample)
    -   [Oracle Database Add-On](#oracle-database-add-on)
        -   [Oracle Pre-requisites](#oracle-pre-requisites)
        -   [Copying the Add-on to Application Lifecycle Service](#copying-the-add-on-to-helion)
        -   [Install the service gems](#install-the-service-gems)
        -   [Install to supervisord](#install-to-supervisord)
        -   [Install to Kato](#install-to-kato)
        -   [Loading the config](#loading-the-config)
        -   [Add the service AUTH token](#add-the-service-auth-token)
        -   [Enable oracledb and start](#enable-oracledb-and-start)
        -   [Verify the service](#verify-the-service)
        -   [Default tablespace](#default-tablespace)
        -   [DBshell support](#dbshell-support)

