---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/node/
product: devplatform
title: "Developing in Node"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1

---
<!--PUBLISHED-->

# HP Helion Development Platform: Developing in Node {#node-js}


Application Lifecycle Service has a built in Node framework with multiple versions of the
[Node.js](http://nodejs.org/) runtime. [NPM](https://npmjs.org/) is used
to install Node packages automatically.

NPM[](#node-npm "Permalink to this headline")
----------------------------------------------

Your application should list dependencies in a standard, top-level
*package.json* file ([specs](http://npmjs.org/doc/json)). Application Lifecycle Service
automatically installs packages listed in the "dependencies" section
before starting the server.

Alternatively, you can call NPM directly using
[*hooks*](/als/v1/user/deploy/manifestyml/#hooks) in the *manifest.yml*
file. 

For NPM packages which include callable scripts or binaries, executable components are automatically added to the container's \$PATH, so a "global install" (`npm install -g`) is not required.

Host and Port Environment Variables[](#host-and-port-environment-variables "Permalink to this headline")
---------------------------------------------------------------------------------------------------------

Deploying Node applications to Application Lifecycle Service requires changing some
application settings to use instance-specific values. These values are
provided to Application Lifecycle Service using environment variables. For example, the
application is not allowed to arbitrarily choose which port it runs on.
It must use the port assigned by Application Lifecycle Service with the `PORT` variable. To access this in a node application:

    process.env.PORT

Likewise, the host IP address is exposed by `VCAP_APP_HOST`:

    process.env.VCAP_APP_HOST

To make the application usable in both local and Application Lifecycle Service deployments,
use structures such as:

    var port = process.env.PORT || 1337;
    var host = process.env.VCAP_APP_HOST || "127.0.0.1";

Using Data Services[](#using-data-services "Permalink to this headline")
-------------------------------------------------------------------------

Data services need to be configured with values from VCAP\_SERVICES, DATABASE\_URL, or a database-specific environment
variable (see also [*Using Configured Database
Services*](/als/v1/user/services/data-services/#database-accessing)).

If the database module you use supports URL-formatted connection
strings, using the
[DATABASE\_URL](/als/v1/user/services/data-services/#database-database-url)
or [*database-specific URL
variable*](/als/v1/user/services/data-services/#database-specific-url)
(REDIS\_URL, MONGODB\_URL, etc.) is often the simplest option.

Use the variable in your code to connect your application to the
database. For example:

    console.log("attempting to connect to mongodb");
    if(process.env.MONGODB_URL){
      mongoose.connect(process.env.MONGODB_URL);
    } else {
      mongoose.connect("127.0.0.1", "myappdb", 27017);
    }

`VCAP_SERVICES` is a JSON object
containing information about all the data service bound to the
application. A typical `VCAP_SERVICES` variable
containing a single MongoDB service might look like this:

    {
      "mongodb": [
        {
          "name": "todos",
          "label": "mongodb-2.4",
          "plan": "free",
          "tags": [
            "mongodb",
            "mongodb-2.4",
            "nosql"
          ],
          "credentials": {
            "hostname": "192.168.66.117",
            "host": "192.168.66.117",
            "port": 25001,
            "username": "4ce459bf-7a15-4c40-ac28-81adbdeba902",
            "password": "00a42612-9751-4d63-a758-186429d4903f",
            "name": "b89e2bc0-cae7-482c-8a47-8c816c67c62e",
            "db": "db"
          }
        }
      ]
    }

To use this information in your application code, use something similar
to this block:

    if(process.env.VCAP_SERVICES){
      var services = JSON.parse(process.env.VCAP_SERVICES);
      var dbcreds = services['mongodb'][0].credentials;
    }

    if(dbcreds){
      console.log(dbcreds);
      mongoose.connect(dbcreds.host, dbcreds.db, dbcreds.port, {user: dbcreds.username, pass: dbcreds.password});
    } else {
      mongoose.connect("127.0.0.1", "myappdb", 27017);
    }

This is the typical pattern used for all databases exposed by
VCAP\_SERVICES.
