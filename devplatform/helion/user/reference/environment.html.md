---
layout: default-devplatform
permalink: /als/v1/user/reference/environment/
product: devplatform
title: "Environment Variables"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
authors: Jayme P

---
<!--PUBLISHED-->

# HP Helion Development Platform: Environment Variables {#environment-variables}

Application Lifecycle Service exposes a number of predefined [environment variables](http://manpages.ubuntu.com/manpages/man7/environ.7) during runtime, including hook processing, cron jobs and ssh commands.

Some environment variables are also available during application [staging](#staging).

You can set your own environment variables:

-   in an `env:` block in [*manifest.yml*](/als/v1/user/deploy/manifestyml/#env),
-   via the application's Details page in the [Management
    Console](/als/v1/admin/console/customize/#management-console), or
-   using the [env-add](/als/v1/user/reference/client-ref/management/#command-env-add)
    command.

**Note**

To see a complete list of environment variables in an Application Lifecycle Service application container, deploy the [node-env](https://github.com/Stackato-Apps/node-env) sample.

#### DATABASE\_URL
Contains an access URL for a database service. If more than one type of database is present, `DATABASE_URL` will not be available. Instead, use the [Database-Specific URL](/als/v1/user/services/data-services/#database-specific-url) variables.

Example:

    mysql://u93Mm8XmGXQ9R:p8LwNeQXMrNzi@192.168.0.112:3306/d0a60c0be931f4982bbef153f993237bc

#### MEMCACHE\_URL
Location of and credentials for the bound **Memcached** service, if there is (only) one.

#### MYSQL\_URL
Location of and credentials for the bound **MySQL** service, if there is (only) one.

#### POSTGRESQL\_URL
Location of and credentials for the bound **PostgreSQL** service, if there is (only) one.

#### REDIS\_URL
Location of and credentials for the bound **Redis** service, if there is (only) one.

#### RABBITMQ\_URL
Location of and credentials for the bound **RabbitMQ** service, if there is (only) one.

#### HOME {#home}
Identifies the working directory assigned to a particular user on login. In an Application Lifecycle Service application container, this is generally set to */home/helion/app/* by default.

#### HTTP\_PROXY
A variable recognized by many web applications to direct them to a proxy HTTP server.

#### MEMORY\_LIMIT
The amount of memory allocated to the application container. 

#### PATH
A list of directories, separated by ":", which are to be searched for the names of executable files to be interpreted as commands.

#### PIP\_OPTS
Custom/alternate [PIP](/als/v1/user/reference/glossary/#term-pip) repo location. 

 Example:

    env:
          PIP_OPTS: "--extra-index-url=http://company.com/inhouse-pypi-mirror"

#### PORT
Application Lifecycle Service alternative for VCAP\_APP\_PORT.

#### PROCESSES\_WEB
This variable contains the default start command that would be used when [*manifest.yml*](/als/v1/user/deploy/manifestyml/) doesn't override it. It is provided so that users can specify a wrapper around the default command.
For example:

    processes:
       web: newrelic\_wrapper \$PROCESSES\_WEB

Note that `PROCESSES_WEB` may be undefined when Application Lifecycle Service can't determine the default command. This may occur because the app uses a non-standard main application file.

#### PYPM\_OPTS
Custom/alternate [PyPM](/als/v1/user/reference/glossary/#term-pypm) repo location. Repo mirroring is an undocumented feature. Example:

    env:
        PYPM_OPTS: "-R http://pypm-free.activestate.com/2.7/linux-x86_64/"

#### HELION\_APP\_ENV 
Note: Internal use, subject to change.
Contains a list of all environment variables set with [env-add](/als/v1/user/reference/client-ref/management/#command-env-add) or through the [manifest.yml](/als/v1/user/deploy/manifestyml/#env) file.

#### HELION\_APP\_NAME
Contains the application name as specified during application push (or in *manifest.yml*). Available during staging as well as in the application instance.

#### HELION\_APP\_NAME\_UPCASE
Contains the same value as HELION\_APP\_NAME transformed to uppercase, with dashes replaced by underscores. For example if HELION\_APP\_NAME is "php-info", then HELION\_APP\_NAME\_UPCASE will be "PHP\_INFO".

This makes it possible to access the environment variables for [*harbor*](/als/v1/user/services/port-service/#port-service-env-vars) and [*filesystem*](/als/v1/user/services/filesystem/#file-system-usage) services.

#### HELION\_APP\_ROOT
This is the "root" directory from the Application Lifecycle Service point of view. It contains app specific HOME directory (app/), the log file directory (logs/) and various scripts.

The [HOME](#home) environment variable will actually point to the app directory, which looks mostly like the directory uploaded by the client. This is where *manifest.yml* and all the application files live.

#### HELION\_DOCUMENT\_ROOT
This contains the root directory where the user can access. The document-root must always be specified relative to \$HOME (/home/helion/app).

#### HELION\_FILESYSTEM
If the app uses a single `filesystem` service, then the local mount point is stored in this variable. If there is more than one `filesystem` service, `HELION_FILESYSTEM` is not available. Instead, a custom environment variable `HELION_FILESYSTEM_*` will be created based on the name of each filesystem service (with hyphens replaced by underscores).

For example, if your *manifest.yml* file configures the following services:

        services:
          my-data: filesystem
          plugins: filesystem

Two environment variables would be created:
    `HELION_FILESYSTEM_MY_DATA` and
    `HELION_FILESYSTEM_PLUGINS`.

#### HELION\_TARGET
Can be set in the local shell to specify the API endpoint target for the `helion` client. When set, the `helion target` command is ignored until the variable is explicitly unset. Can be overridden with the `--target` option.

#### HELION\_UWSGI
Set by the Perl and Python frameworks only. It contains the default uswgi start command to run the application via uwsgi. It is provided in case the user wants to add additional uwsgi options in [*manifest.yml*](/als/v1/user/deploy/manifestyml/):

        processes:
          web: $HELION_UWSGI --another-uwsgi-option

#### VCAP\_APP\_HOST
This variable contains the IP address of the host that the application is running on.

#### VCAP\_APP\_PORT
This variable contains the port that the application will be exposed on.

#### VCAP\_APPLICATION
This variable contains all relevant application details for the Application Lifecycle Service Application. (Instance ID, App Name, App Uris, Users/Groups etc.)

#### VCAP\_SERVICES
Contains connection details, credentials, and meta data for services bound to the application. See [VCAP\_SERVICES](/als/v1/user/services/data-services/#database-services-vcap-services).

## Staging Variables {#staging}
The following environment variables are available during application staging and can be used in buildpacks or staging hooks: 
 
<table style="text-align: left; vertical-align: top; width:600px;">
<tr style="background-color: #C8C8C8;">
<td style="width: 100px;"><b>Name</b></td><td><b>Purpose</b></td>
</tr>
<tr><td>BUILDPACK_CACHE</td><td>Filesystem location the buildpack uses to store assets during the build.</td></tr>
<tr><td>http_proxy and https_proxy</td><td>The proxy host:port of the DEA running the staging container.</td></tr>
<tr><td>HOME</td><td>As above, but containing a different filesystem path during staging</td></tr>
<tr><td>STAGING_TIMEOUT</td><td>Time limit for staging to complete.</td></tr>
<tr><td>USER</td><td>Will always be <i>helion</i>.</td></tr>
<tr><td>MEMORY_LIMIT</td><td>The amount of memory allocated to the application container.</td></tr>
<tr><td>HELION_APP_NAME</td><td>Contains the application name as specified during application push (or in manifest.yml).</td></tr>
<tr><td>HELION_APP_NAME_UPCASE</td><td>Contains the same value as HELION_APP_NAME but transformed to uppercase. Dashes are replaced by underscores.</td></tr>
<tr><td>HELION_APP_ROOT</td><td>This is the "root" directory from the ALS point of view. It contains the app-specific HOME directory (app/), the log file directory (logs/) and various scripts.</td></tr>
<tr><td>HELION_LOG_FILES</td><td>A colon-separated list of log files to be included in the application log stream. You can add up to five additional files to the default list by modifying this variable.</td></tr>
<tr><td>HELION_SERVICES</td><td>Contains connection details and credentials for services bound to the application. For filesystem services, it contains the local mount point.</td></tr>
<tr><td>VCAP_APPLICATION</td><td>This variable contains all relevant application details: Instance ID, App Name, App Uris, Users/Groups, etc.</td></tr>
<tr><td>VCAP_SERVICES</td><td>Contains connection details, credentials, and meta data for services bound to the application.</td></tr>
</table>
 
**Note**: Service instance variables (VCAP_SERVICES) can change between staging and running. Do not save values from these variables to config files during staging as the hard-coded values may no longer be applicable after staging. 
