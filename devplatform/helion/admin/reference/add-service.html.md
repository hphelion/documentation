---
layout: default-devplatform
permalink: /als/v1/admin/reference/add-service/
product: devplatform
title: "Adding System Services"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
---
<!--UNDER REVISION-->

# HP Helion Development Platform: Adding System Services[](#adding-system-services "Permalink to this headline")

The Application Lifecycle Service has three Service definitions:

-   **System Services**: Service *types* (e.g. MySQL, RabbitMQ, Filesystem) available for use.
-   **Provisioned Services**: *Instances* of the System Services created for use by end-user applications.
-   [**User-Provided Service Instances**](/als/v1/user/services/user-provided/): Credentials and connection information for *external* services.

The [helion services](/als/v1/user/reference/client-ref/#command-services) command will show a list of all System Services available on the current target. This command will also display a list of Provisioned Services allocated to the currently authenticated user.

Administrators can configure external data services to work in the same way that core System Services do, providing users and applications with access to existing software and infrastructure.

##Service Brokers

Service brokers are RESTful web services which connect Helion to services that the hosted apps can consume.

The built-in system services have their own service brokers which handle the provisioning of service instances, but you can add your own service brokers to provide custom services (databases, message queues, etc.) to end users.

The Cloud Foundry v2 Service Broker API provides a simplified mechanism for connecting data services to the system. A service broker is responsible for:

- implementing a REST server to interface with the Cloud Controller
- authenticating requests using HTTP basic auth
- providing an interface to the data service for all provision/unprovision & bind/unbind events
- maintaining a catalog of available services and associated service plans
- maintaining a consistent record of the provisioned service instances and bindings to ensure services are persistent between broker restarts

##CF Services Connector (Node.js)

ActiveState has created an open-source service broker library written in Node.js called *cf-services-connector* to help you create custom service brokers.

You can install the library with *npm install cf-services-connector* or include it in the *package.json* file of your service broker implementation. 

###Example Echo Service

The *cf-services-connector-nodejs* repository provides an example service broker called [**echo-service**](https://github.com/ActiveState/cf-services-connector-nodejs/tree/master/example/echo-service).

Review the echo-service.json file and change the **authUser**, **authPassword**, and **database: encryptionKey**  settings before deploying it.

Descriptions of the settings from the **services** block in this file can be found in the following Cloud Foundry documentation:

- [Service Broker API: Catalog Management](http://docs.cloudfoundry.org/services/api.html#catalog-mgmt)
- [Catalog Metadata](http://docs.cloudfoundry.org/services/catalog-metadata.html)

Once the echo-service application has been deployed, an admin can add the service broker with the [add-service-broker](/als/v1/user/reference/client-ref/#command-add-service-broker) command.

	helion add-service-broker
	Enter name: echo-broker
	Enter url: http://echo-service-broker.example.com
	Enter username: admin
	Enter password: mypasswd
	Creating new service broker [echo-broker] ... OK


Once the service broker has been added to the system, the services it provides will become available to users:

	helion services
	============== Service Plans ================
	
	+----+-------------+-------------------------------+----------+---------+-----------+----------------------------+------+
	|    | Name        | Description                   | Provider | Version | Plan      | Details                    | Orgs |
	+----+-------------+-------------------------------+----------+---------+-----------+----------------------------+------+
	| F- | echoservice | Echo Service - it echoes      |          |         | default   | This is the first plan     |      |
	| F- | echoservice | Echo Service - it echoes      |          |         | secondary | This is the secondary plan |      |
	| FP | filesystem  | Persistent filesystem service | core     | 1.0     | free      | free                       |      |
	| FP | mysql       | MySQL database service        | core     | 5.5     | free      | free                       |      |
	| FP | postgresql  | PostgreSQL database service   | core     | 9.1     | free      | free                       |      |
	+----+-------------+-------------------------------+----------+---------+-----------+----------------------------+------+


By default, service plans are created as private (the "P" in the leftmost column above). To make the plan available to your Organization, run the following command:

	helion update-service-plan --public echoservice
