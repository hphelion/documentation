---
layout: default
title: "HP Cloud jclouds Java/Clojure Bindings"
permalink: /bindings/jclouds/

---
# HP Cloud jclouds Java/Clojure Bindings

HP has developed an HP Cloud Compute jclouds provider for the [jclouds](http://www.jclouds.org) library.  By using this HP Cloud language binding, Java/Clojure developers can write applications that interact with HP Cloud Services without having to deal with the underlying REST API or XML document formats.
<!--add a link to a zip file; jeremy will provide the link, similar to how it is on the -->

The HP Cloud Compute jclouds provider extends the functionality of the jclouds OpenStack Nova API provider and provides metadata specific to HP Cloud Services. 
<!--Please refer to the jclouds documentation on how to access the [BlobStore API](http://www.jclouds.org/documentation/userguide/blobstore-guide) abstraction, as well as gaining access to the provider's API specific context.-->

##Installation ## {#Installation}

For installation, please [surf on over to the jclouds.org](http://www.jclouds.org/documentation/userguide/installation-guide) page and follow the instructions.

<!--Please refer to the official jclouds [Installation Guide](http://www.jclouds.org/documentation/userguide/installation-guide) for information on how to install jclouds.-->

<!--The jclouds [HP Cloud Quick Start Guide](http://www.jclouds.org/documentation/quickstart/hpcloud) provides information on the specific dependencies you will need for your project.-->

## Dependency Management## {#DependencyManagement}

Coordinating dependency management is a key component of Java development.  A common tool for Java developers to use is Maven.  With Maven, you only need to specify the following dependencies in order to use the HP Cloud Compute and Object Storage services with jclouds: 

        <dependencies>
                <dependency>
                    <groupId>org.jclouds.common</groupId>
                    <artifactId>openstack-common</artifactId>
                    <version>1.5.2</version>
                </dependency>
                <dependency>
                    <groupId>org.jclouds</groupId>
                    <artifactId>jclouds-core</artifactId>
                    <version>1.5.2</version>
                </dependency>
                <dependency>
                    <groupId>org.jclouds.provider</groupId>
                    <artifactId>hpcloud-objectstorage</artifactId>
                    <version>1.5.2</version>
                </dependency>
                <dependency>
                    <groupId>org.jclouds.provider</groupId>
                    <artifactId>hpcloud-compute</artifactId>
                    <version>1.5.2</version>
                </dependency>
            </dependencies>

For jclouds-specific requirements, please see the jclouds user guide for [Using jclouds with Apache Maven](http://www.jclouds.org/documentation/userguide/using-maven).

##Usage ## {#Usage}

The jclouds library is well documented on the community web site, but for specific examples using HP's provider, see:

* [Object Storage Examples](/bindings/jclouds/object-storage)
* [Compute Examples](/bindings/jclouds/compute)
* [CDN Examples](/bindings/jclouds/cdn)
* [Block Storage Examples](/bindings/jclouds/block-storage)

##Having trouble? ## {#HavingTrouble}
See the [release notes](http://www.jclouds.org/documentation/releasenotes/) for further information, or you can [get help over at the Forums](https://community.hpcloud.com).