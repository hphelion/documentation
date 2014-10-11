---
layout: default-devplatform
title: "Using the Eclipse Deployment Plugin"
permalink: /helion/devplatform/eclipse/
product: devplatform

---
<!--UNDER REVISION-->
#Using the Eclipse Development Plugin
If you’re building apps in Eclipse, use this plug-in to configure, package, and deploy your app directly to HP Helion Development Platform. 

Follow the steps outlined in this document to get the plugin up and running and to deploy one of the sample apps.

Before you begin, we recommend having [Eclipse IDE for Java EE developers](https://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/lunasr1) installed along with the Java Runtime Environment and [JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) if you’d like to deploy the Java samples we provide.

##Installation


1. The plugin currently depends on software from Cloud Foundry.  Please install that package by visiting that site directly and dragging the install link into the Package Explorer view in an open Eclipse IDE window.

 	<img src="media/eclipse1.png">



1. Open the Eclipse IDE and install the plugin through the **add new software** dialog.  You can find this dialog by clicking on **Help** and then **Install New Software**.
  <img src="media/eclipse2.png">
2. Type in the link to the software site that distributes the Helion Eclipse plugin.  The link is https://region-b.geo-1.objects.hpcloudsvc.com/v1/10822257696083/helioneclipseplugin.  Once the packages are discovered, ensure HP Helion Development Platform is checked and click **Next**.
	<img src="media/eclipse3.png">
3. Accept the license agreement and click **Finish**.  Note that you might see a warning about unsigned content.  If you see this dialog box, click **OK** to proceed.
4. You will be prompted to restart Eclipse.  
##Setup/Configuration


1. Once Eclipse has reloaded, open the Servers window by navigating to Window-> Show View-> Servers
	 <img src="media/eclipse4.png">

1. Launch the HP Helion Development Platform plugin. In the Servers window, click on the **Add New Server** link.  
2. Select **HP Helion Development Platform** from the tree view and click **Next**.
	<img src="media/eclipse7.png">
3. Click **Manage Cloud**.  
4. Enter the URL of your ALS cluster and give it a name.  If you don’t have an ALS cluster set up, the fastest way to create a sandbox environment is to [create one](link to ALS trial creation doc) on the HP Public Cloud.
	<img src="media/eclipse6.png">
4. Enter the credentials used to access your ALS cluster in the resulting dialog and then click **Validate** to ensure that the plugin can access the URL.
	<img src="media/eclipse5.png">
5. Note that you might get a warning about the site using a *self-signed certificate*.  Ignore the warning and click **Yes** to import the organizations and spaces that you’ve set up into the IDE.
6. Click **Finish**.
6. Now you should see **Helion Development Platform** as a configured Server in your IDE.  You can explore the apps that have been deployed already, or continue reading to learn how to deploy a sample app.

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
