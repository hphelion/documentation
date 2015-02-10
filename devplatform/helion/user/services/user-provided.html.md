---
layout: default-devplatform
permalink: /als/v1/user/services/user-provided/
product: devplatform
title: "User-Provided Services"
---
<!--PUBLISHED-->

# HP Helion 1.0 Development Platform: User-Provided Services {#user-provided-services}

User-provided service instances allow you connect applications running
on Application Lifecycle Service to specified external data services, without hard coding the
credentials into the application. The service instance provides the
connection information to the application via the VCAP\_SERVICES environment variables, just like the [built-in data services](/als/v1/user/services/data-services/#data-services).

Think of user-provided services as a credentials database for your Application Lifecycle Service application space. You provide the connection information and ALS stores it in a [*JSON object*](#user-provided-using) which can then be bound any applications in the space.

##Creating {#creating}

User-provided service instances will typically be used to connect
applications hosted on Application Lifecycle Service to existing external database hosts or clusters. For example, to connect an app to an externally-hosted PostgreSQL database:

    helion create-service user-provided prod-db-int
    Which credentials to use for connections [hostname, port, password]: host, port, database, user, pass
    host: dbhost1.example.com
    port: 5432
    database: prod-django-321
    user: ro-web
    pass: vsTLP2gs
    Creating new service ... OK

The parameter names provided in the first step will become the keys in
the JSON object exposed to the application later.

Binding[](#binding "Permalink to this headline")
-------------------------------------------------

Once the service instance has been created it can be bound to
applications, just like any other service:

    helion bind-service prod-db-int django-cms
    Binding prod-db-int to scaling-demo ...
    Stopping Application [django-cms] ... OK
    Starting Application [django-cms] ...
    OK
    http://django-cms.helion.example.com/ deployed

Using[](#using "Permalink to this headline")
---------------------------------------------

The `helion service` command will show the
credentials:

    $ helion service prod-db-int

    prod-db-int
    +--------------+------------------------------+
    | What         | Value                        |
    +--------------+------------------------------+
    | Type         | user-provided                |
    | Space        | example::example-dev         |
    |              |                              |
    | Credentials  |                              |
    | - database   | prod-django-321              |
    | - host       | dbhost1.example.com          |
    | - pass       | vsTLP2gs                     |
    | - port       | 5432                         |
    | - user       | ro-web                       |
    |              |                              |
    | Applications | django-cms                   |
    +--------------+------------------------------+

The [*VCAP\_SERVICES*](/als/v1/user/services/data-services/#database-services-vcap-services)
variables will expose the connection information within the application
container. The parameter names you provided when setting up the service
instance become the keys in the `prod-db-int` JSON
object:

    django-cms$ echo VCAP_SERVICES \|json
    {
      "prod-db-int": {
        "database": "prod-django-321",
        "host": "dbhost1.example.com",
        "pass": "vsTLP2gs",
        "port": "5432",
        "user": "ro-web"
      }
    }

To have your application use this information, parse the variable in your application code to extract the credentials at runtime. See the [Language Specific Deployment](/als/v1/user/deploy/#language-specific-deploy) documentation for examples.

Buildpacks that auto-configure applications for system-provided services can also do so for user-provided services. For example, the [java buildpack](https://github.com/cloudfoundry/java-buildpack) will configure applications to connect to a database if the service has a name or tag with *postgres*, *mariadb*, or *mysql* in it. Check the buildpack's documentation or code to see exactly what it supports. 

## Other Environment Variables {#user-provided-URL-env} 

User-provided service instances do not set **DATABASE_URL** or 
database-specific URL environment variables. 
 
If your application uses variables in URL format, you can add them manually to the application with the [*set-env*](/als/v1/user/reference/client-ref/) command. For example:: 
 
		helion set-env appname MYSQL_URL mysql:
		dbuser:pass@10.0.0.55:3306/dbname 
 
These variables can be created whether or not user-provided service instances have been created. 
