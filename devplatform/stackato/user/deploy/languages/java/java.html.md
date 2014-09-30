---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/java/
---
<!--PUBLISHED-->

Java[](#java "Permalink to this headline")
===========================================

Whether you're deploying an application to the HP Helion Development Platform, a Cloud Foundry based Platform as a Service (PaaS), or writing applications that take advantage of HP Helion OpenStack® to manage infrastructure or software services, tools
to enable successful development are available in Java.

##Application Lifecycle Services
Application Lifecycle Services (ALS), a Cloud Foundry based Platform as a Service,
has support for multiple Java frameworks and for [Buildpacks](/als/v1/user/deploy/buildpack/#buildpacks) where you can define your own Java environment. Supported frameworks include Java Web, Spring,
Java EE (via TomEE or JBoss), Grails, and Lift.

To learn more see, the [stackato.yml reference](/als/v1/user/deploy/stackatoyml/).

##Using jclouds with HP Helion

Java applications can communicate directly with the [Helion APIs](http://docs.hpcloud.com/api/), through
a REST client or use [Apache jclouds](http://jclouds.apache.org/) Apache provides a well-documented API set to simplify working with the services.

For example, here is one way of writing and reading from object storage:
    
    // Get a context with hpcloud that offers the portable BlobStore API
     BlobStoreContext context = ContextBuilder.newBuilder(&quot;hpcloud-objectstorage&quot;)
      .credentials(&quot;tenantName:accessKey&quot;, &quot;password&quot;)
      .buildView(BlobStoreContext.class);
    
    // Create a container in the default location
    context.getBlobStore().createContainerInLocation(null, container);
    
    // Use the map interface for easy access to put/get things, keySet, etc.
    context.createInputStreamMap(container).put(&quot;blob.txt&quot;, inputStream);
    
    // When you need access to hpcloud specific features, use the provider-specific context
     HPCloudObjectStorageClient hpcloudClient =
     HPCloudObjectStorageClient.class.cast(context.getProviderSpecificContext().getApi());
    
    // Create a container with public access
   	boolean accessibleContainer = hpcloudClient.createContainer(&quot;public-container&quot;, withPublicAccess());
    
     ContainerMetadata cm = hpcloudClient.getContainerMetadata(&quot;public-container&quot;);
     if (cm.isPublic()) {
    ...
     }
    
     // When you want to use CDN features with a container, use the provider-specific CDN client
      HPCloudCDNClient cdnClient = hpcloudClient.getCDNExtension().get();
    
     // Get a CDN URL for the container
      URI uri = cdnClient.enableCDN(container);
    
     // Get the CDN Metadata for the container
     ContainerCDNMetadata cdnMetadata = cdnClient.getCDNMetadata(container)
     if (cdnMetadata.isCDNEnabled()) {
       ...
     }
    
    // Be sure to close the context when done
    context.close();
    
## Frameworks
Application Lifecycle Service has several Java frameworks to choose from:

-   [Java Web](#java-web)
-   [Spring](#java-spring)
-   [Java EE (via TomEE or JBoss)](#java-ee)
-   Grails
-   Lift
-   [Buildpack - Java](/als/v1/user/deploy/buildpack/#buildpacks)

You can push bytecode built on on your local machine with tools like
[Apache Ant](http://ant.apache.org/) and [Apache
Maven](http://maven.apache.org/), or build the Java bytecode on Application Lifecycle Service
itself using the [Java Buildpack](/als/v1/user/deploy/buildpack/#buildpacks)

Java Web Applications[](#java-web-applications "Permalink to this headline")
-----------------------------------------------------------------------------

The Java Web framework is the default Java framework in Application Lifecycle Service, and
requires little or no modification of application code in most cases.
Application Lifecycle Service simply deploys the WAR file.

[Hello Java Sample](https://github.com/Stackato-Apps/hello-java)
demonstrates a simple Servlet-based Java webapp using the Java Web
framework.

### Service Configuration[](#service-configuration "Permalink to this headline")

If you have created data services, you can get the service configuration
by using the [*environment
variables*](/als/v1/user/reference/environment/#environment-variables)
below:

-   DATABASE\_URL
-   STACKATO\_SERVICES
-   VCAP\_SERVICES

If your application uses only one data service, use the DATABASE\_URL
variable. If it uses more than one, use
[*STACKATO\_SERVICES*](/als/v1/user/services/data-services/#database-services-helion-services)
or
[*VCAP\_SERVICES*](/als/v1/user/services/data-services/#database-services-vcap-services).

### Using JDBC[](#using-jdbc "Permalink to this headline")

It is possible to access the database services using the standard JDBC
API:

    String helion_services = System.getenv("STACKATO_SERVICES");

    String hostname = NULL_STRING;
    String dbname = NULL_STRING;
    String user = NULL_STRING;
    String password = NULL_STRING;
    String port = NULL_STRING;

    if (helion_services != null && helion_services.length() > 0) {
      try
      {
        JsonRootNode root = new JdomParser().parse(helion_services);

        JsonNode credentials = root.getNode("mysql");

        dbname = credentials.getStringValue("name");
        hostname = credentials.getStringValue("hostname");
        user = credentials.getStringValue("user");
        password = credentials.getStringValue("password");
        port = credentials.getNumberValue("port");

        String dbUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbname;

        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbUrl, user, password);
        return connection;

      }
      catch (Exception e)
      {
        throw new SQLException(e);
      }
    }

### Example[](#example "Permalink to this headline")

The [Java-MySQL
(JDBC)](https://github.com/Stackato-Apps/hello-java-mysql) sample
demonstrates a simple Java application using a MySQL service.

### JPDA Debugging[](#jpda-debugging "Permalink to this headline")

You can debug java\_web applications running on Application Lifecycle Service via
[JPDA](/als/v1/admin/reference/architecture/)
by using the `-d` option with the
`helion push` command:

    $ helion push -d my-java-app

Application Lifecycle Service creates a port service for debugging and shows the external
port number in the command output:

    Debugging now enabled on port 30135

Alternatively, request a Harbor [*port
service*](/als/v1/user/services/port-service/#port-service) in
*stackato.yml* in the format: "*app-name*-debug". For example:

    services:
      ${name}-debug: harbor

The java\_web framework will recognize the service and activate
debugging through the port provided. Connect to this port with the JPDA
debugger of your choice.

To show the port number and external hostname for this service, use the
[*helion service*](/als/v1/user/reference/client-ref/#command-services)
command. For the 'my-java-app' example above, the command would be:

    $ helion service my-java-app-debug

Use the 'hostname' (or 'host' for an IP address) and 'port' values in
the 'credentials' section of the output to configure your local
debugging client.

The
[*STACKATO\_DEBUG\_COMMAND*](/als/v1/user/deploy/app-debug/#app-debug-helion-debug-command)
environment variable can be used to automatically start a debugger or
IDE instance with the appropriate host and port values.

**Note**

Though the `helion -d` option is similar to
`vmc -d`, the internal implementation is different.
`vmc -d` cannot be used to activate debugging in
Application Lifecycle Service.

Spring[](#spring "Permalink to this headline")
-----------------------------------------------

Applications that use the Spring framework are detected and automaticaly
configured if there is either a *spring-core* jar file or an
*org/springframework* folder.

### Service Configuration[](#id1 "Permalink to this headline")

If there is only one service of a given type (e.g. one MySQL data
service), the application is automatically reconfigured to use that
service.

Define a datasource bean like the following:

    <bean class="org.apache.commons.dbcp.BasicDataSource" id="dataSource">
        <property name="driverClassName" value="com.mysql.jdbc.Driver"/>
        <property name="url" value="jdbc:mysql://localhost:3306/inventory-db"/>
        <property name="username" value="myuser"/>
        <property name="password" value="mypass"/>
    </bean>

The property values are replaced during staging with the values for the
provisioned service.

If you have created more than one service of a given type, you will need
to use VCAP\_SERVICES environment variable to obtain the details for
each one (host, port, username, password).

### \<CLOUD\> Namespace Version[](#cloud-namespace-version "Permalink to this headline")

If you are using \<CLOUD\> namespace in your application, make sure the
cloudfoundry-runtime version is 0.8.2.

### Example[](#id2 "Permalink to this headline")

The
[Hello-Spring-MySQL](https://github.com/Stackato-Apps/hello-spring-mysql)
sample demonstrates a simple Spring application with one MySQL service.

JavaEE 6[](#javaee-6 "Permalink to this headline")
---------------------------------------------------

Application Lifecycle Service's 'java\_ee' framework has two application servers available:

-   TomEE - used for WAR files
-   JBoss - used for EAR files

The Java EE framework is detected if there is a *persistence.xml* file
located in *src/main/resources/META-INF/persistence.xml*.

### Service Configuration[](#id3 "Permalink to this headline")

For JavaEE applications, you must create a `persistence-unit` in your *persistence.xml* file with the name of your database
service.

For example in *stackato.yml*:

    services:
      service-1:
        type: mysql
      service-2:
        type: mysql

To use `service-1` in your persistence.xml:

    <?xml version="1.0" encoding="UTF-8"?>
    <persistence version="2.0"
      xmlns="http://java.sun.com/xml/ns/persistence"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://java.sun.com/xml/ns/persistence http://java.sun.com/xml/ns/persistence/persistence_2_0.xsd">
        <persistence-unit name="persistence-service-1" transaction-type="JTA">
          <jta-datasource>service-1</jta-datasource>
        </persistence-unit>
    </persistence>

And in your JavaEE code:

    @PersistenceContext(unitName = "persistence-service-1")
    private EntityManager em;

### Examples[](#examples "Permalink to this headline")

The [hello-jee-mysql](https://github.com/Stackato-Apps/hello-jee-mysql)
sample demonstrates a JavaEE 6 application with a MySQL service running
with Apache TomEE.

The [kitchensink-ear](https://github.com/Stackato-Apps/kitchensink-ear)
sample also uses a MySQL service, but uses the JBoss server instead of
TomEE.

HOME Directories[](#home-directories "Permalink to this headline")
-------------------------------------------------------------------

Java applications will have different HOME directories on Application Lifecycle Service
depending on which Java framework is used:

-   Java Web, Java EE (WAR file), Spring, Lift and Grails:
    **/home/stackato/tomcat/webapps/ROOT**
-   Java EE (EAR file): **/home/stackato/jboss/standalone/deployments**
-   Buildpack - Java, Play: **/home/stackato/app**

CATALINA\_OPTS[](#catalina-opts "Permalink to this headline")
--------------------------------------------------------------

The CATALINA\_OPTS environment variable can be set in the
`env:` block of stackato.yml (or set in the
Management Console) to override Application Lifecycle Service defaults.

**Note**

CATALINA\_OPTS settings cannot be modified without restaging.
Applications must be re-pushed with new settings to apply changes.

Application Lifecycle Service sets the CATALINA\_OPTS environment variable for applications
using Tomcat automatically, based on the `mem:`
value specified for application instances. Application Lifecycle Service will always leave at
least 64MB for the heap, but will otherwise reserves up to 96MB for
overhead, that is for the code of the JVM itself, for additional
libraries loaded via JNI, for additional processes to run in the
background, and for the JVM permanent pool.

This means, for example, a 128MB application will end up with 64MB for
the heap and 64MB for overhead, a 160MB application will still have 64MB
for the heap but 96MB for overhead, and a 512MB application will get a
416MB heap and allow 96MB for overhead.