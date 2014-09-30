.. _get-started-java-sdk:

Get Started With Apache jclouds on HP Helion
============================================

Apache jclouds library is built on top of HP Helion APIs. Taking away many of the
complexities of working with the APIs to instead focus on writing applications in Java.
The library is designed to be pulled into Java applications where, through the use of
objects, methods, and functions, you can interact with HP Helion.

Getting The Library
-------------------
The Apache jclouds Library is available from `Apache <http://jclouds.apache.org/start/install/>`_
and `maven <http://maven-repository.com/artifact/org.jclouds.provider/hpcloud-objectstorage>`_. Apache Maven, for those
who don't already know, is a repository for distributing software packages.

It is very easy to install jclouds using Maven. If you're new to Maven, read
`Maven in 5 Minutes <http://maven.apache.org/guides/getting-started/maven-in-five-minutes.html>`_.
If you do not have a ``pom.xml`` file, you can copy and paste the one below. If your project already
has a ``pom.xml`` file, just add the dependency section below into it.

.. code-block:: xml

   <?xml version="1.0" encoding="UTF-8"?>
   <project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <properties>
    <jclouds.version>1.7.3</jclouds.version>
  </properties>
  <groupId>com.mycompany.app</groupId>
  <artifactId>my-app</artifactId>
  <version>1.0-SNAPSHOT</version>
  <dependencies>
    <dependency>
        <groupId>org.apache.jclouds</groupId>
        <artifactId>jclouds-all</artifactId>
        <version>${jclouds.version}</version>
      </dependency>
  </dependencies>
  </project>


Run ``mvn install`` or ``mvn package`` from command line/terminal in your application
directory to download the dependency into your application.

Logging
^^^^^^^
Debugging is an important part of working with APIs.
`SLF4J <http://www.slf4j.org/>`_ is the logging facade for jclouds.
To use SLF4J you need the jclouds-slf4j-X.X.X.jar and the implementation ``logback-*.jar`` 
files in your classpath. To get them via Maven add the following dependencies to your ``pom.xml`` file.

.. code-block:: xml

  <dependencies>
    <dependency>
      <groupId>org.apache.jclouds.driver</groupId>
      <artifactId>jclouds-slf4j</artifactId>
      <version>${jclouds.version}</version>
    </dependency>
    <dependency>
      <groupId>ch.qos.logback</groupId>
      <artifactId>logback-classic</artifactId>
      <version>1.0.13</version>
    </dependency>
  </dependencies>

Configure Logging
^^^^^^^^^^^^^^^^^^
Below is some example code of how to enable your code to use SLF4J.
The ``SLF4JLoggingModule`` needs to be added to the modules collection that is
passed into the ``ContextBuilder.modules(Iterable)`` method of whatever Context or API you're building.

.. code-block:: java

 Iterable<Module> modules = ImmutableSet.<Module> of(
    new SLF4JLoggingModule());

 MyContext context = ContextBuilder.newBuilder("my-cloud-provider")
    .credentials("myIdentity", "myCredential")
    .modules(modules)
    .buildView(MyContext.class);

 // Or

 MyApi myApi = ContextBuilder.newBuilder("my-cloud-provider")
    .credentials("myIdentity", "myCredential")
    .modules(modules)
    .buildApi(MyApi.class);
