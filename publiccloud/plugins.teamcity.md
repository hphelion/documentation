---
layout: public-cloud
title: "HP Helion Public Cloud Networking: Quick Start Guide"
permalink: /publiccloud/compute/teamcity/
product: public-cloud

---
<!--PUBLISHED-->

# HP TeamCity Plugin for HP Helion Public Cloud
=============================

HP has developed an HP Helion Public Cloud plugin for TeamCity CI/CD server. The plugin provides implementation of TeamCity's Cloud API and allows creation of virtual build agent on-demand in HP Helion Public Cloud. 

Please download the latest version of the [HP TeamCity Plugin for HP Helion Public Cloud](http://www.jetbrains.com/teamcity/plugins/)!

## Installation Prerequisites ##

The following are prerequisites for installing and running the

### Hardware requirements ###

The TeamCity server should be started on virtual machine with at least 3gb of RAM in total (RAM and swap)

### Software requirements ###

The following software should be installed on TeamCity server virtual machine:

- Apache Ant - A Java library for building the TeamCity plugin
- git - A source code management system to checkout the source code from repository
- JDK - Java Development Kit to compile, debug, and run applets and applications written using the Java programming language (such as [openJDK](http://openjdk.java.net/) or http://www.oracle.com/technetwork/java/javase/downloads/index.html).

## Installing the TeamCity server ## {#installing}

http://confluence.jetbrains.com/display/TCD7/Installing+and+Configuring+the+TeamCity+Server

1. Download the latest version of TeamCity from http://www.jetbrains.com/teamcity/download/index.html (TeamCity 8.1 and above version is recommended).
2. Unpack the archive or run the installer, as appropriate for your operating system.
3. Start the server. Starting the server creates `~/.BuildSever` folder in your home directory.

In addition, note the following:
- Make sure that the firewall and security group rules allow traffic to and from the port used by TeamCity (port 8111, by default).
- Update &#8220;/etc/hosts&#8221;  and add server`s name, if necessary.

## Installing the HP TeamCity Plugin ##

To install the plugin:

1. Shutdown the TeamCity server.
2. Copy the zip archive with the plugin into the <TeamCity Data Directory>/plugins directory.
3. Start the TeamCity server: the plugin files will be unpacked and processed automatically. The plugin will be available in the Plugins List in the Administration area.

## Difference between HP and Amazon versions ##

- The availability zone parameter is not used with the HP plugin
- Image with pre-installed build agent is used
	- Agent username must be specified
	- A private key file path must be specified to establish SSH connection between TeamCity server and a build agent.
- An HP instance can be started from the image or snapshot only.
- Virtual Private Cloud (VPC) is not supported by the HP TeamCity plugin

### Amazon profile configuration ###

1. Supports VPC
2. Agent images and instances may be entered in a text field separated by comma
3. Uses Agent Push plugin to automatically install build agent

## Creating a cloud image ##
 
HP Helion Public Cloud plug-in needs a virtual image with pre-configured build agents to establish a connection with TeamCity server. A Cloud Image is any custom image or can be created from a snapshot using any of the pre-existing public/private images, for instance sizes equal to or greater than SMALL and for any Operating System.  

To create a Cloud Image, install the TeamCity build agent, Java SDK and other DevTest environment dependencies on the preferred virtual image and take a snapshot. Any user can upload the newly created or customized virtual image to HP Helion Public Cloud as a Public/Private/Partner image using HP's OpenStack based Glance service. 

### Creating a build agent snapshot ###

1. Run an instance from an image of your choice
2. Add a floating IP to that instance
3. Copy the following directories to the build agent folder on your instance:
    <TEAMCITY-HOME>/buildAgent/bin
    <TEAMCITY-HOME>/buildAgent/conf
    <TEAMCITY-HOME>/buildAgent/launcher
    <TEAMCITY-HOME>/buildAgent/lib
    <TEAMCITY-HOME>/buildAgent/plugins
    <TEAMCITY-HOME>/buildAgent/tools
4. Install the following software:
    Java SDK
5. Add "127.0.0.1 my-instance" to /etc/hosts
6. Remove floating IP (optional)
7. Create a snapshot

## Create Cloud Profile ##

The TeamCity server supports Cloud integration using a configurable Cloud Profile. A user can create a new Cloud profile by selecting &#8220;HP Helion Public Cloud&#8221; from the Cloud Type drop-down.

Complete the Cloud Profile form with tenant credentials (Project Id, Access Key ID, and Secret Access Key) to establish a connection with HP Helion Public Cloud from TeamCity server. 

The following fields appear on the Cloud Profile form: 

	Location - Region where agent`s server should be started

	Availability zone - is always has &#8220;default&#8221;  value

	Key pair name - the name of public key which was created in HP management console

	Cloud image name - any readable value

	Agent username - username name which can be used to establish SSH connection with just started agent.
	
	Private key file - private key which is created in HP management console and which is matched public key from point 3 above.

	Instance type - OpenStack flavor (at least small)

	Security groups - the name of security group which is created in HP management console. Port 22 should be opened for agent.

	Agent Images and Instances - image which should be used for Agent. Please check that selected image has Agent pre-installed. Currently the &#8220;plain-tc-agent&#8221; image can be used.

	Maximum instances count - The maximum number of instances that can be run simultaneously.

## Create Cloud Connection in TeamCity Server ##

HP Helion Public Cloud plug-in supports two implementation of TeamCity build environment: 

**In-Cloud Connection** - HP Helion Public Cloud plugin can be used to launch an instance in the same network as TeamCity Server. In this scenario, the TeamCity server is hosted on HP Helion Public Cloud and the plug-in will create new build-agents in HP Helion Public Cloud (same subnet).

**Multi-Cloud Connection** - HP Helion Public Cloud Plug-in implements *virtual private connection* which supports builds creation in a remote Cloud environment or across different Cloud regions. The TeamCity server can be hosted on-premise or in Cloud and the plug-in can be configured to launch an instance across different networks.

HP Helion Public Cloud Connection can be configured as part of HP Helion Public Cloud profile.

## Creating a TeamCity Cloud Instance in the HP Helion Public Cloud ##

A complete Cloud Image and Cloud Profile is the pre-requisite for launching any TeamCity Cloud Instances in HP Helion Public Cloud. If the number of build requests exceeds the number of available build agents, then the plug-in will launch the new Cloud Instance using the Cloud Image in the HP Helion Public Cloud. 
The Cloud Instance is pre-configured to make connection with TeamCity server during the instance boot-up process. TeamCity server will detect this new connection using its Cloud API and will start the queued builds on this newly created Cloud Instance.
