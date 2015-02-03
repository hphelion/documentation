---
layout: default-devplatform
permalink: /als/v1/user/deploy/
product: devplatform
title: "General Deployment"

---
<!--PUBLISHED-->

# HP Helion Development Platform: General Deployment[](#general-deployment "Permalink to this headline")
=======================================================================

Applications are typically deployed to Application Lifecycle Service by pushing source code
and configuration to the system's API endpoint using the [*helion client*](/als/v1/user/client/#client) or other clients that use the
Application Lifecycle Service or Cloud Foundry API.

The steps for deploying applications will be slightly different
depending on the application and its requirements. 

**Note**

In Application Lifecycle Service 1.0 and later (Cloud Foundry v2 API), application deployment
is done primarily using [Buildpacks](/als/v1/user/deploy/buildpack/). A
special built-in 'Legacy' buildpack handles Cloud Foundry V1 frameworks for
existing application configurations.

Targeting & Authenticating[](#targeting-authenticating "Permalink to this headline")
-------------------------------------------------------------------------------------

Before deploying an app, the client must first target Application Lifecycle Service's API
endpoint URL. This will generally be the same URL that exposes the
Management Console. For example:

    $ helion target api.example.com
    Successfully targeted to [https://api.example.hphelion.com]
    ...

Use the `helion login` command to authenticate
with your username and password:

    $ helion login <username>
    Attempting login to [https://api.example.hphelion.com]
    Password: ******
    Successfully logged into [https://api.example.hphelion.com]

Selecting Org & Space[](#selecting-org-space "Permalink to this headline")
---------------------------------------------------------------------------

If your account is a member of multiple
[*organizations*](/als/v1/user/deploy/orgs-spaces/#orgs-spaces), choose which one you
want to operate under:

    $ helion switch-org exampleco

Likewise, if you are a member of more than one space, choose a default
space:

    $ helion switch-space devel-example

Pushing Application Code[](#pushing-application-code "Permalink to this headline")
-----------------------------------------------------------------------------------

Change to the root directory of your source code project, and use the
`helion push` command to deploy your application.
If you have a [*manifest.yml*](/als/v1/user/deploy/manifestyml/) config file in this
directory, you can use just:

    $ helion push -n

The "-n" option is an alias for "--no-prompt", which takes options from
the config YAML file instead of prompting for them.

The output of the push command will be something like:

    $ helion push -n
    Using manifest file "manifest.yml"
    Application Url: env.example.hphelion.com
    Creating Application [env] as [https://api.example.hphelion.com -> exampleco -> devel-example -> env] ... OK
      Map env.stacka.to ... OK
    Uploading Application [env] ...
      Checking for bad links ... 80 OK
      Copying to temp space ... 79 OK
      Checking for available resources ...  OK
      Processing resources ... OK
      Packing application ... OK
      Uploading (223K) ... 100% OK
    Push Status: OK
    ...
    helion.dea_ng: [STAGED_APP] Completed staging application
    helion.dea_ng.0: [SPAWNING_APP] Spawning app web process: node server.js
    app.0: Server running at
    app.0:   => http://0.0.0.0:50932/
    app.0: CTRL + C to shutdown
    OK
    http://env.heli.on/ deployed

The Helion client will show staging and running
logs for the deployment process. To inspect these logs after deployment
has finished, use the [*helion
logs*](/als/v1/user/reference/client-ref/#command-logs) command.

Language Specific Deployment[](#language-specific-deployment "Permalink to this headline")
-------------------------------------------------------------------------------------------

See each of these sections for language specific deployment details and
examples:

-   [Java](/als/v1/user/deploy/languages/java/)
-   [Node](/als/v1/user/deploy/languages/node/)
-   [PHP](/als/v1/user/deploy/languages/php/)
<!---   [Clojure](/als/v1/user/deploy/languages/clojure/)
-   [Go](/als/v1/user/deploy/languages/go/)
-   [Perl](/als/v1/user/deploy/languages/perl/)
-   [Python](/als/v1/user/deploy/languages/python/)
-   [Ruby](/als/v1/user/deploy/languages/ruby/)
-->
Configuring Your Application For Application Lifecycle Service[](#configuring-your-application-for-helion "Permalink to this headline")
---------------------------------------------------------------------------------------------------------------------

Most applications should be able to run under Application Lifecycle Service with only a few
changes.

**manifest.yml**
:   A manifest.yml file should be added to the root of
    your application to hold installation details as well as setup
    configuration instructions for your app.


    [*manifest.yml*](/als/v1/user/deploy/manifestyml/#manifest-yml)

**Data Services**
:   If you want to use Application Lifecycle Service's data services, your code will need to
    use the connection details provided by special environment variables
    (e.g. DATABASE\_URL). The code should generally check for the
    existence of these environment variables, use them if they exist,
    and otherwise fall back to some default setting.

    See the [*Data
    Services*](/als/v1/user/services/data-services/#data-services) section for
    further details.

**Environment Variables**
:   A number of special environment variables are available during
    staging and runtime. These can be used in
    [*hooks*](/als/v1/user/deploy/manifestyml/#hooks) or application code
    (for setting up databases, filesystem services, web server options,
    and cron jobs) in places where you would normally use hard-coded
    paths, credentials, or host-specific values.

    See the [*Environment
    Variables*](/als/v1/user/reference/environment/#environment-variables)
    section for a complete list.

Application Lifecycle Service push[](#helion-push "Permalink to this headline")
-------------------------------------------------------------

The [*helion push*](/als/v1/user/reference/client-ref/#command-push) command
creates (or updates) applications on Application Lifecycle Service. It negotiates with the
API endpoint to reserve application URLs, allocate application
instances, provision data services, upload application code, and
optionally stage and start the application.

The command will prompt for options or use those specified in a [*manifest.yml*](/als/v1/user/deploy/manifestyml/#manifest-yml) file.

**Note**

The application name must be a valid [hostname
label](http://en.wikipedia.org/wiki/Hostname#Restrictions_on_valid_host_names)
(i.e. containing only alphanumeric characters and hyphens).

The `push` command implicitly stages and starts the
application unless the `--no-start` option is used.
With this option, applications are pushed in a pre-staged, stopped state
where variables can be added (e.g. for use in staging hooks). The
application can then be staged and started with the [*helion
start*](/als/v1/user/reference/client-ref/#command-start) command or the Start
button in the [*Management
Console*](/als/v1/admin/console/customize/#user-console-welcome).

The client will display staging logs while pushing the application but
will generally exit before any application logs are visible. To view the
application logs, use the [*helion
logs*](/als/v1/user/reference/client-ref/#command-logs) command.

Allowed File Types[](#allowed-file-types "Permalink to this headline")
-----------------------------------------------------------------------

During the push process, Application Lifecycle Service includes only three file types:

1.  Files
2.  Folders
3.  Links

All other special file types are ignored.

Naming and URLs[](#naming-and-urls "Permalink to this headline")
-----------------------------------------------------------------

To prevent confusion or collisions, Application Lifecycle Service enforces uniqueness for
URLs, application names, and service names:

-   **URLs** (auto-generated or [*manually mapped*](#deploy-map-url))
    must be globally unique, and are allocated on a "first come, first
    serve" basis.
-   **Application names** must be unique within the scope of the
    [*space*](/als/v1/user/deploy/orgs-spaces/#orgs-spaces). Applications deployed in
    different spaces can have the same name, but the full application
    URL must be globally unique URL.
-   **Service names** must be unique within the scope of the
    [*space*](/als/v1/user/deploy/orgs-spaces/#orgs-spaces). The name given to a service
    during creation is a pointer to a globally unique string (i.e. the
    *actual* database name in the system as shown by
    VCAP\_SERVICES), so there is no possibility of naming conflicts
    with services created in other orgs and spaces.

Crontab Support[](#crontab-support "Permalink to this headline")
-----------------------------------------------------------------

**Note**

Cron commands are only executed on instance \#0 of the app.

Cron commands can be provided either in a regular crontab file in the
root directory of the app, or via the `cron:`
section in *manifest.yml* (See [*manifest.yml
Options*](/als/v1/user/deploy/manifestyml/).

The `HOME` and `PATH`
environment variables, as well as all variables that start with
`PERL`, `PYTHON`,
`VCAP`,
`BUNDLE`, `LEIN`,
`GEM`, `RACK`, `RAILS`, `RUBY` or `http`
are exported to the top of the crontab file. When applicable, the
following database related environment variables are also added:
`DATABASE_URL`, `MYSQL_URL`,
`POSTGRESQL_URL`, `REDIS_URL`,
`MONGODB_URL`, and `RABBITMQ_URL`.

This happens after the `pre-running` hook has
executed, so any changes made by those commands will be included in the
crontab file.

After setting up environment variables, we copy the *\$HOME/crontab*
file, and finally the commands from the `cron:`
section in *manifest.yml*. The resulting file is stored at
*\$HELION\_APP\_ROOT/crontab*.

### Whitespace & Newlines in Environment Variables[](#whitespace-newlines-in-environment-variables "Permalink to this headline")

To prevent breakage in cron, embedded newlines ("\\n") in environment
variable values will be replaced with "\\\\n" when generating the
crontab. Any leading and trailing spaces in environment variable values
are also stripped.

Mapping App URLs[](#mapping-app-urls "Permalink to this headline")
-------------------------------------------------------------------

Application Lifecycle Service automatically assigns to each application a URL made up of the
application's name and the base URL for the system. An application named
"myblog" deployed to an Application Lifecycle Service system at "api.example.com" would be given
the URL "myblog.example.com".

In addition to this default URL, additional URLs can be set for an
application using the [*helion
map*](/als/v1/user/reference/client-ref/#command-map) command. The application
will respond to requests on the mapped URL, provided a DNS record has
been set up resolving to Application Lifecycle Service's external IP or hostname.

For example, to map a URL to an existing application on Application Lifecycle Service:

    $ helion apps

    +--------------+---+--------+----------------------------------+------------+
    | Application  | # | Health | URLS                             | Services   |
    +--------------+---+--------+----------------------------------+------------+
    | myapp        | 1 | 100%   | myapp.example.com                  |            |
    +--------------+---+--------+----------------------------------+------------+

    $ helion map myapp example.com

    +--------------+---+--------+----------------------------------+------------+
    | Application  | # | Health | URLS                             | Services   |
    +--------------+---+--------+----------------------------------+------------+
    | myapp        | 1 | 100%   | myapp.example.com                  |            |
    |              |   |        | example.com                     |            |
    +--------------+---+--------+----------------------------------+------------+

If DNS is configured correctly, requests to "example.com" will resolve
transparently to "myapp.example.com".

**Note**

Application URLs are allocated on a "first come, first serve" basis, and
are reserved for the user who created the URL.

URLs can be mapped to multiple applications owned by the same user,
which can be useful for A/B testing. Application Lifecycle Service routes requests to the
mapped URL randomly between all available app instances.

Using the 'myapp.example.com' example above, you could push 'myapp-v2'
(e.g. a more recent revision) then map 'example.com' to that app as
well. You can access the specific versions directly using
'myapp.example.com' and 'myapp-v2.example.com', and use 'example.com' to
round robin between available instances of both versions:

    +-------------+---+---------+--------------------+-------------+
    | Application | # | Health  | URLS               | Services    |
    +-------------+---+---------+--------------------+-------------+
    | myapp       | 5 | RUNNING | myapp.example.com    |             |
    |             |   |         | example.com       |             |
    | myapp-v2    | 1 | RUNNING | myapp-v2.example.com |             |
    |             |   |         | example.com       |             |
    +-------------+---+---------+--------------------+-------------+

As you gain confidence with the new revision, you can increase the
number of instances of 'myapp-v2' (i.e. phasing that version into
production rather than cutting over) and eventually
[*unmap*](/als/v1/user/reference/client-ref/#command-unmap) 'example.com'
from the original 'myapp'.

Best Practices[](#best-practices "Permalink to this headline")
---------------------------------------------------------------

### Reducing downtime during app updates[](#reducing-downtime-during-app-updates "Permalink to this headline")

Updating an app can create downtime while the new code is being staged.
URL mapping can be used to reduce this downtime by switching between two
running versions of an app.

For example, we have an application called "customertracker". The pushed
application name will include a version or build number, but it is
mapped to a "production" URL as well:

    $ helion apps

    +--------------------+---+---------+------------------------------+------------+
    | Application        | # | Health  | URLS                         | Services   |
    +--------------------+---+---------+------------------------------+------------+
    | customertracker-v1 | 1 | RUNNING | customertracker-v1.example.com | customerdb |
    |                    |   |         | customertracker.example.com  |            |
    +--------------------+---+---------+------------------------------+------------+

Push the updated code with a new application name:

    $ helion push --as customertracker-v2

    ...

    $ helion apps

    +--------------------+---+---------+------------------------------+------------+
    | Application        | # | Health  | URLS                         | Services   |
    +--------------------+---+---------+------------------------------+------------+
    | customertracker-v1 | 1 | RUNNING | customertracker-v1.example.com | customerdb |
    |                    |   |         | customertracker.example.com  |            |
    | customertracker-v2 | 1 | RUNNING | customertracker-v2.example.com | customerdb |
    +--------------------+---+---------+------------------------------+------------+

**Note**

In this example, the configured service has the same name, so it is
bound to both versions of the application. This will only work if there
are no database schema changes or differences in the filesystem layout
on a persistent filesystem service. If there are such differences, use
distinct data services for the new version.

Map the "production" URL to the new app:

    $ helion map customertracker-v2 customertracker.example.com

    $ helion apps

    +--------------------+---+---------+------------------------------+------------+
    | Application        | # | Health  | URLS                         | Services   |
    +--------------------+---+---------+------------------------------+------------+
    | customertracker-v1 | 1 | RUNNING | customertracker-v1.stacka.to | customerdb |
    |                    |   |         | customertracker.example.com  |            |
    | customertracker-v2 | 1 | RUNNING | customertracker-v2.stacka.to | customerdb |
    |                    |   |         | customertracker.example.com  |            |
    +--------------------+---+---------+------------------------------+------------+

While both versions of the application are live and mapped to the same
production URL, the router will round-robin web requests to this URL
between both versions.

Next, unmap the production URL from the first app:

    $ helion unmap customertracker-v1 customertracker.example.com

The old version is still available in case it's needed for rollback. If
everything works as expected with the newer code, delete the old app:

    $ helion delete customertracker-v1

    $ helion apps

    +--------------------+---+---------+------------------------------+------------+
    | Application        | # | Health  | URLS                         | Services   |
    +--------------------+---+---------+------------------------------+------------+
    | customertracker-v2 | 1 | RUNNING | customertracker-v2.stacka.to | customerdb |
    |                    |   |         | customertracker.example.com  |            |
    +--------------------+---+---------+------------------------------+------------+

### Managing Multiple Targets[](#managing-multiple-targets "Permalink to this headline")

The Application Lifecycle Service client targets a single location with the command
`helion target`.

If you need to target two or more instances at the same time, use one of
the following methods:

1.  Use the `--target <target>` option. This sets
    the specified target for the current command only, and does not set
    it as the default:

        $ helion apps --target api.helion-xxx1.local

2.  Use two or more terminals to access multiple targets. Within each
    terminal, set the `HELION_TARGET` environment
    variable for the API endpoint URL you want to work with in that
    terminal. The client will use this URL, overriding any target set
    with the `helion target` command:

        $ export HELION_TARGET='api.helion-xxx2.local'

 This target is used until the variable is unset or the terminal is
 closed. To unset it:

	$ unset HELION_TARGET

Persistent Sessions[](#persistent-sessions "Permalink to this headline")
-------------------------------------------------------------------------

With multi-instance applications on Application Lifecycle Service, the Router will distribute
requests among all instances. Without session management, the end user
could access different application instances with each HTTP request
instead of connecting to the same instance that started their session. Application Lifecycle Service's default router does no special handling of
`JSESSIONID` or `SESSIONID`
cookies.

Cloud-enabled applications should use a shared database (e.g. Redis),
cache (e.g. Memcached), or filesystem as a back end for session
management. Some examples of this approach are:

-   Java:
    -   [Tomcat session
        manager](http://tomcat.apache.org/tomcat-6.0-doc/config/manager)
    -   [memcached-session-manager](http://code.google.com/p/memcached-session-manager/)
    -   [tomcat-redis-session-manager](https://github.com/jcoleman/tomcat-redis-session-manager)
-   Node.js:
    [connect-memcached](https://github.com/balor/connect-memcached#connect-memcached),
    a session store that uses Memcached
-   PHP:
    -   [Persistent Sessions](/als/v1/user/deploy/languages/php/#php-persistent-sessions-filesystem)
    -   [Memcached session support](http://php.net/manual/en/memcached.sessions.php)
-   Python: [Django "How to use
    sessions"](https://docs.djangoproject.com/en/dev/topics/http/sessions/)



