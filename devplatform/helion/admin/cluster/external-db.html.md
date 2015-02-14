---
layout: default-devplatform
permalink: /als/v1/admin/cluster/external-db/
product: devplatform
title: "External Data Services"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer
role2: Security Engineer
role3: ISV Developer 
role4: Service Developer
role5: Network Administrator
role6: Systems Administrator 
role7: Net Ops Engineer 
role8: NOC Engineer 
authors: Jayme P

---
<!--PUBLISHED-->

# HP Helion Development Platform: External Data Services {#external-data-services}

- [General Principles](#general-principles)
- [MySQL](#mysql)
- [PostgreSQL](#postgresql)
- [Troubleshooting](#troubleshooting)

Application Lifecycle Service comes with several data services that can be enabled on an Application Lifecycle Service cluster. However, for implementations where high
availability or high performance databases are required, it's advisable
to configure Application Lifecycle Service to connect to an externally maintained database or
data service.

External data services can be configured at the discretion of the
administrator or service provider, but in many cases they can be set up
so that Application Lifecycle Service can allocate databases in the same way it does for the
built-in databases.

General Principles[](#general-principles "Permalink to this headline")
-----------------------------------------------------------------------

Any application running on Application Lifecycle Service can connect to an external database
directly as long as the instance can route to the IP address and port of
the database server. Database connections can be hard coded in the
application without needing to make any changes to Application Lifecycle Service
configuration.

To automatically provision databases for applications on these external
servers, Application Lifecycle Service must have access to an administrator account on the
database server with permissions to create users and databases. The
credentials for this account, along with the hostname and port of the
database server, are set in the Application Lifecycle Service configuration (via [*kato
config*](/als/v1/admin/reference/kato-ref/#kato-command-ref-config)).

MySQL[](#mysql "Permalink to this headline")
---------------------------------------------

The MySQL server must be set up to allow connections over the network
(rather than just on 'localhost'). Make sure the 'bind-address' is set
to the host's IP address (or '0.0.0.0').

Enter the `mysql` shell and grant the root user
privileges on all tables. For example:

    $ GRANT ALL PRIVILEGES ON *.* TO 'root'@'10.5.120.%' IDENTIFIED BY
    '<PASSWORD>'
    WITH GRANT OPTION;
    $ FLUSH PRIVILEGES;

The `10.5.120.%` portion above should be in relation
to the Application Lifecycle Service `mysql_node` IP address. For
increased security you can create a special 'helion' user with the
same privileges as the 'root' user as an alternative option.

Once the user is configured to accept connections from Application Lifecycle Service and to
create users and databases, change the configuration for 'mysql\_node'
in Application Lifecycle Service. For example:

    $ kato config set mysql_node mysql/host 10.5.120.101
    $ kato config set mysql_node mysql/pass yourpassword
    $ kato config set mysql_node mysql/port 3306
    $ kato config set mysql_node mysql/user root

Once these have been set, restart mysql:

    $ kato restart mysql

PostgreSQL[](#postgresql "Permalink to this headline")
-------------------------------------------------------

Make sure the PostgreSQL database server (version 9.1 or later) will
accept connections over the network. Edit *postgresql.conf* make sure
the 'listen\_addresses' is uncommented and set to the networked
interface IP. For example:

    listen_addresses = 'localhost, 10.5.120.102'

Edit *pg\_hba.conf* and make sure a line exists that allows all Application Lifecycle Service
instances to connect to it. For example:

    host    all   all       10.5.120.0/23   md5

Restart PostgreSQL.

Using the default 'postgres' user (or another account with the same
superuser privileges), change the configuration for 'postgresql\_node'
in Application Lifecycle Service. For example:

    $ kato config set postgresql_node postgresql/host 10.5.120.102
    $ kato config set postgresql_node postgresql/pass yourpassword
    $ kato config set postgresql_node postgresql/port 5432
    $ kato config set postgresql_node postgresql/user postgres

Once these have been set, restart the postgresql\_node process:

    $ kato restart postgresql_node

Troubleshooting[](#troubleshooting "Permalink to this headline")
-----------------------------------------------------------------

The `psql` and `mysql` clients
are available at the command line on the Application Lifecycle Service VM. Log in to the Core
node (i.e. the one running the Cloud Controller) and test the database
connection directly with the appropriate client. For example:

    $ mysql -u helion -p mypassword -h 10.5.120.101
    mysql> show databases;
    ...

If the basic client connection works, test database creation using the
`helion create-service ...` command:

    $ helion create-service mysql
    Creating Service [mysql-24901]: OK

If there are problems, check the corresponding logs on the database
server. These are generally found in */var/log/postgresql* and
*/var/log/mysql*.

Logs from Application Lifecycle Service can be viewed with `kato log tail`:

    $ kato log tail postgresql_node
