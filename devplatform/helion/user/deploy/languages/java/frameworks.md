---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/java/frameworks
title: "Java Frameworks"

---
<!--PUBLISHED-->
#Java Frameworks
Application Lifecycle Service has several Java frameworks to choose from:

-   [Java Web](#java-web)
-   [Spring](#spring)
-   [Java EE (via TomEE or JBoss)](#javaee)
-	[HOME directories](#home-dir)


You can push bytecode built on your local machine with tools like [Maven](http://maven.apache.org/) or build the Java bytecode on Application Lifecycle Service
itself using the [Java Buildpack](/als/v1/user/deploy/buildpack/#buildpacks)


##Java Web Framework<a name="java-web"></a>

The Java Web framework is the default Java framework in Application Lifecycle Service, and
requires little or no modification of application code in most cases.
Application Lifecycle Service simply deploys the WAR file.

The [Hello World Java Sample](/helion/devplatform/workbook/helloworld/java/)
demonstrates a simple Servlet-based Java web app.

### Web Service Configuration

If you have created data services, you can get the service configuration
by using the [environment
variables](/als/v1/user/reference/environment/#environment-variables)
below:

-   DATABASE\_URL
-   VCAP\_SERVICES

If your application uses only one data service, use the DATABASE\_URL
variable. If it uses more than one, use
[*VCAP\_SERVICES*](/als/v1/user/services/data-services/#database-services-vcap-services). <!--[*STACKAT0\_SERVICES*](/als/v1/user/services/data-services/#database-services-helion-services)-->
### JPDA Debugging for the Web Framework

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
*manifest.yml* in the format: "*app-name*-debug". For example:

    services:
      ${name}-debug: harbor

The java\_web framework will recognize the service and activate
debugging through the port provided. Connect to this port with the JPDA
debugger of your choice.

To show the port number and external hostname for this service, use the 
[helion service](/als/v1/user/reference/client-ref/#command-services)
command. For the **my-java-app** example above, the command would be:

    $ helion service my-java-app-debug

Use the **hostname** (or **host** for an IP address) and **port** values in the **credentials** section of the output to configure your local
debugging client.

<!--The
[*STACKAT0\_DEBUG\_COMMAND*](/als/v1/user/deploy/app-debug/#app-debug-helion-debug-command)
environment variable can be used to automatically start a debugger or
IDE instance with the appropriate host and port values. -->

**Note**

Though the `helion -d` option is similar to
`vmc -d`, the internal implementation is different.
`vmc -d` cannot be used to activate debugging in
Application Lifecycle Service.


##Spring Framework<a name="spring"></a>

Applications that use the Spring framework are detected and automatically
configured if there is either a *spring-core* jar file or an
*org/springframework* folder.

### Spring Service Configuration

If there is only one service of a given type for example, only one MySQL data service; the application is automatically reconfigured to use that
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

**Note:** If you are using \<CLOUD\> namespace in your application, make sure the
cloudfoundry-runtime version is 0.8.2.


##JavaEE Framework <a name="javaee"></a>

Application Lifecycle Service's 'java\_ee' framework has two application servers available:

-   TomEE - used for WAR files
-   JBoss - used for EAR files

The Java EE framework is detected if there is a *persistence.xml* file
located in *src/main/resources/META-INF/persistence.xml*.

### JavaEE Service Configuration

For JavaEE applications, you must create a `persistence-unit` in your *persistence.xml* file with the name of your database
service.

For example in *manifest.yml*:

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

##HOME Directories<a name="home-dir"></a>

Java applications will have different HOME directories on Application Lifecycle Service
depending on which Java framework is used:

-   Java Web, Java EE (WAR file), Spring <!--Lift and Grails-->:
    **/home/helion/tomcat/webapps/ROOT**
-   Java EE (EAR file): **/home/helion/jboss/standalone/deployments**
-   Buildpack - Java<!--, Play-->: **/home/helion/app**
<!-- replaced Stackat0 with helion in previous URLs, correct? also removed undocumented pacs/frameworks-->

