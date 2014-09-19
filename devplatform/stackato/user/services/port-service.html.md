---
layout: default-devplatform
permalink: /als/v1/user/services/port-service/
---
<!--PUBLISHED-->

Port Service (Harbor)[](#port-service-harbor "Permalink to this headline")
===========================================================================

HTTP and HTTPS ports and routing are provided automatically for all web
applications deployed to Application Lifecycle Service (unless [*processes:
web:*](/als/v1/user/deploy/stackatoyml/#helion-yml-processes) is set to
"\~").

If your application requires additional TCP or UDP ports, use the Harbor
service to allocate them.

Requesting a Port[](#requesting-a-port "Permalink to this headline")
---------------------------------------------------------------------

Additional ports are provisioned like any other data service. To request
a port with the `helion` client:

    $ helion create-service harbor debug-port

To request a port from Harbor in the *stackato.yml* file, add it in a
[*services*](/als/v1/user/deploy/stackatoyml/#helion-yml-services) block.
For example:

    name: port-test
    mem: 256
    services:
      my-port: harbor

This creates a TCP port tunnel which the application can access on the
host and port specified in the \$STACKATO\_SERVICES environment
variable.

The example above might create the following "my-port" object in
\$STACKATO\_SERVICES:

    {
      "my-port": {
        "hostname": "192.168.68.111",
        "host": "192.168.68.111",
        "port": 30134,
        "name": "cf7f868a-8b7b-4ac8-ab4d-9fd87efb7c09",
        "node_id": "harbor_node_1",
        "int_port": 4100,
        "ext_hostname": "ports.example.com",
        "ext_host": "15.185.104.122"
      }
    }

This provides the following information:

-   **hostname**: The internal hostname (if configured) of the node
    providing the service (i.e. the Harbor node). If none is configured
    by the admin, this will show the internal IP address.
-   **host**: The internal IP address of the Harbor node.
-   **port**: The external port number exposed by the service.
    Connections from external clients and other internal applications
    (those not directly bound to the service) will connect with this
    port number.
-   **name**: The service instance ID (Application Lifecycle Service internal refer).
-   **node\_id**: The Harbor node ID (Application Lifecycle Service internal).
-   **int\_port**: The port on the application container which forwards
    to Harbor (see also [*Harbor Environment
    Variables*](#port-service-env-vars)). Application(s) bound to the
    service should connect to this port.

Access to the port from outside of the Application Lifecycle Service system/cluster may or
may not be exposed, depending on how the Harbor service is configured by
the Admin. If Harbor is set up to allow public port access, the
following two settings will also be shown:

-   **ext\_hostname**: The public hostname (if configured) exposing the
    port.
-   **ext\_host**: The public IP address exposing the port.

**Note**

To remotely check the settings and credentials of any Application Lifecycle Service service,
use the [*helion
service*](/als/v1/user/reference/client-ref/#command-services) command.

### Harbor Environment Variables[](#harbor-environment-variables "Permalink to this headline")

If there is only one Harbor service, the `STACKATO_HARBOR` environment variable can be used to get the internal port
number.

If there is more than one Harbor service, `STACKATO_HARBOR` is not available. Instead, a custom
`STACKATO_HARBOR_<SERVICE_NAME>` environment
variable will be created for each harbor service (service name
upper-cased with hyphens replaced by underscores).

For example, if your *manifest.yml* file configures the following
services:

    services:
      udp-port: harbor
      tcp-port: harbor

Two environment variables would be created:
`STACKATO_HARBOR_UDP_PORT` and
`STACKATO_HARBOR_TCP_PORT`.

This naming scheme can be used in conjunction with the
`STACKATO_APP_NAME_UPCASE` environment variable. For
example, in an app with the following harbor services defined:

    services:
      udp-${name}: harbor
      tcp-${name}: harbor

The Harbor port number for the UDP service could be accessed within the
container with a construct such as:

    UDP_SERVICE_NAME=STACKATO_HARBOR_UDP_${STACKATO_APP_NAME_UPCASE}
    UDP_SERVICE_PORT=${!UDP_SERVICE_NAME}

**Note**

To use declarations like these in
[*hooks*](/als/v1/user/deploy/stackatoyml/#stackato-yml-hooks), put them in a
separate bash script. Brace expansion and grouping cannot be used
directly in YAML files.

Setting the Port Protocols[](#setting-the-port-protocols "Permalink to this headline")
---------------------------------------------------------------------------------------

Harbor supports both the TCP and UDP protocols. When you provision a
service with Harbor it will create a TCP enabled port by default. If you
want to have a UDP port provisioned instead, you simply prefix your
service name with udp, for example:

    $ helion create-service harbor udp-debug-port

If you have an application that requires both TCP & UDP, you can prefix
your service name with both, for example:

    $ helion create-service harbor both-debug-port

Harbor will then create UDP and TCP proxies for your application, so
applications like DNS can use both protocols on the same provisioned
port.

Multiple Application Instances[](#multiple-application-instances "Permalink to this headline")
-----------------------------------------------------------------------------------------------

Harbor recognises when you have multiple instances of your app running,
and will update the available app backends accordingly.

-   For TCP connections it will round-robin between your available
    backends on each new connection, in a similar fashion to the router
    component.
-   For UDP this is not the case, as it is a stateless protocol. For
    multiple UDP backends harbor will use a FIFO queue, that is the
    first app instance available becomes the primary backend, and any
    added later are queued.

Example[](#example "Permalink to this headline")
-------------------------------------------------

The [bukkit-server](https://github.com/Stackato-Apps/bukkit-server)
sample appliation shows how to host a
[CraftBukkit](http://wiki.bukkit.org/Main_Page) multi-player Minecraft
server on Application Lifecycle Service using the Harbor port service:
 <https://github.com/Stackato-Apps/bukkit-server>

HTTPS via Harbor[](#https-via-harbor "Permalink to this headline")
-------------------------------------------------------------------

SSL termination of HTTPS to applications hosted on Application Lifecycle Service normally
happens at the Router.

There is currently no mechanism for users to add SSL certs for their own
applications to the Router, but you can expose an external HTTPS
interface via the Harbor port service which uses your SSL certs.

To do this, upload the SSL certificate(s) and key(s) along with your
application, and expose your application server directly on the TCP port
provided by Harbor.

**Note** that when using this approach, the hostname / IP address of the app will be the one provided by the Harbor node the client will connect using the Harbor-assigned port number, **not 443**.

For example, an application running through the port service might have a URL such as: <https://harbor-node.helion.com:35048/>

You can set up aliases to this URL using DNS, but the explicit port
specification must always be added.

### HTTPS Container Proxy[](#https-container-proxy "Permalink to this headline")

If you are using a framework such as Python or Perl which sets up uWSGI
(or any other framework that provides its own intermediate web server)
Harbor can provision an HTTPS server in the app container that forwards
HTTPS requests to the framework's HTTP server. To do this, add the
suffix 'https' to the name of your Harbor service. For example:

    name: harbor-test-app

    services:
      custom-cert-https: harbor

Put your server certificate and key (named *harbor.crt* and *harbor.key*
respectively) in a folder called *certs* in the application's root
directory. For example:

    app_root
    	certs
        harbor.crt
        harbor.key
    	...

Alternatively, use a standalone or buildpack setup which provisions its
own intermediate web server instead.

### Mutiple SSL Certificates[](#mutiple-ssl-certificates "Permalink to this headline")

If your application uses multiple SSL certificates, use the following
naming scheme:

-   *harbor service name*.key
-   *harbor service name*.crt

For example:

    app_root
    	certs
        	harbor-https-custom-1.crt
        	harbor-https-custom-2.key
    	...

The proxy will look for these certs before reverting to `harbor.crt` and `harbor.key`.

### Caveats[](#caveats "Permalink to this headline")

Using Harbor in this way does not take advantage of any load balancing
set up for regular web traffic through the Routers and Load Balancer.

If you have multiple instances of your app routing through a Harbor TCP
port as above, connections will be distributed via round-robin.