---
layout: default-devplatform
permalink: /als/v1/user/services/port-service/
product: devplatform
title: "Port Service (Harbor)"
---
<!--PUBLISHED-->

# HP Helion 1.0 Development Platform: Port Service (Harbor) {#port-service-harbor}

HTTP and HTTPS ports and routing are provided automatically for all web applications deployed to Application Lifecycle Service (unless [processes:
web:](/als/v1/user/deploy/manifestyml/#web) is set to
"\~").

If your application requires additional TCP or UDP ports, use the Harbor service to allocate them.

##Requesting a Port {#requesting-a-port}

Additional ports are provisioned like any other data service. To request a port with the Helion command-line client:

    helion create-service harbor debug-port

To request a port from Harbor in the **manifest.yml** file, add it in the [**services**](/als/v1/user/deploy/manifestyml/#services) block.
For example:

    name: port-test
    mem: 256
    services:
      my-port: harbor

This creates a TCP port tunnel which the application can access on the
host and port specified in the \$HELION\_SERVICES environment
variable.

The example above might create the following "my-port" object in
\$HELION\_SERVICES:

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
    to Harbor (see also [Harbor Environment
    Variables](#port-service-env-vars)). Application(s) bound to the
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
use the [**helion
service**](/als/v1/user/reference/client-ref/#command-services) command.

### Harbor Environment Variables[](#harbor-environment-variables "Permalink to this headline")

If there is only one Harbor service, the **HELION_HARBOR** environment variable can be used to get the internal port
number.

If there is more than one Harbor service, **HELION_HARBOR** is not available. Instead, a custom
**HELION\_HARBOR\_<SERVICE\_NAME>** environment
variable will be created for each harbor service (service name
upper-cased with hyphens replaced by underscores).

For example, if your *manifest.yml* file configures the following
services:

    services:
      udp-port: harbor
      tcp-port: harbor

Two environment variables would be created:
`HELION_HARBOR_UDP_PORT` and
`HELION_HARBOR_TCP_PORT`.

This naming scheme can be used in conjunction with the
**HELION\_APP\_NAME\_UPCASE** environment variable. For
example, in an app with the following harbor services defined:

    services:
      udp-${name}: harbor
      tcp-${name}: harbor

The Harbor port number for the UDP service could be accessed within the
container with a construct such as:

    UDP_SERVICE_NAME=HELION_HARBOR_UDP_${HELION_APP_NAME_UPCASE}
    UDP_SERVICE_PORT=${!UDP_SERVICE_NAME}

**Note**

To use declarations like these in
[*hooks*](/als/v1/user/deploy/manifestyml/#hooks), put them in a
separate bash script. Brace expansion and grouping cannot be used directly in YAML files.

##Setting the Port Protocols {#setting-the-port-protocols}

Harbor supports both the TCP and UDP protocols. When you provision a service with Harbor it will create a TCP enabled port by default. If you want to have a UDP port provisioned instead, you simply prefix your
service name with udp, for example:

    helion create-service harbor udp-debug-port

If you have an application that requires both TCP **and** UDP, you can prefix your service name with either *multi-* or *both-* .
For example:

    helion create-service harbor both-debug-port

Harbor will then create UDP and TCP proxies for your application so that applications like DNS can use both protocols on the same provisioned port.

##Multiple Application Instances {#multiple-application-instances}

Harbor recognizes when you have multiple instances of your app running and will update the available app backends accordingly.

-   For TCP connections it will round-robin between your available
    backends on each new connection, in a similar fashion to the router
    component.
-   For UDP this is not the case, as it is a stateless protocol. For
    multiple UDP backends harbor will use a FIFO queue, that is the
    first app instance available becomes the primary backend, and any
    added later are queued.

HTTPS via Harbor[](#https-via-harbor "Permalink to this headline")
-------------------------------------------------------------------

SSL termination of HTTPS to applications hosted on Application Lifecycle Service normally
happens at the Router.

There is currently no mechanism for users to add SSL certificates for their own applications to the Router, but you can expose an external HTTPS interface via the Harbor port service which uses your SSL certificates.

To do this, upload the SSL certificate(s) and key(s) along with your application, and expose your application server directly on the TCP port provided by Harbor.

For example, an application running through the port service might have a URL such as: *https://harbor-node.helion.com:35048/*

You can set up aliases to this URL using DNS, but the explicit port
specification must always be added.

**Notes:** 


- When using this approach, the hostname / IP address of the app will be the one provided by the Harbor node the client will connect using the Harbor-assigned port number, **not** 443.
- Using Harbor in this way does **not** take advantage of any load balancing set up for regular web traffic through the Routers and Load Balancer.
- If you have multiple instances of your app routing through a Harbor TCP port, connections will be distributed via round-robin.

### HTTPS Container Proxy[](#https-container-proxy "Permalink to this headline")

If you are using a framework such as Python or Perl which sets up uWSGI
(or any other framework that provides its own intermediate web server)
Harbor can provision an HTTPS server in the app container that forwards
HTTPS requests to the framework's HTTP server. To do this, add the
suffix **https** to the name of your Harbor service. For example:

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

### Multiple SSL Certificates[](#multiple-ssl-certificates "Permalink to this headline")

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


