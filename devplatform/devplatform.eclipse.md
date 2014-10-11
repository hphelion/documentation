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


1. The plugin currently depends on software from Cloud Foundry.  Install the package [directly from the site](http://marketplace.eclipse.org/content/cloud-foundry-integration-eclipse#.VDmkTRb7xig).
2. Open an Eclipse IDE window.
3. Drag the install link into the Package Explorer view.

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
4. Enter the URL of your ALS cluster and give it a name.  If you don’t have an ALS cluster set up, the fastest way to create one is to use the Quick Start Developer Trial in the public cloud.
	<img src="media/eclipse6.png">
4. Enter the credentials used to access your ALS cluster in the resulting dialog and then click **Validate** to ensure that the plugin can access the URL.
	<img src="media/eclipse5.png">
5. Note that you might get a warning about the site using a *self-signed certificate*.  Ignore the warning and click **Yes** to import the organizations and spaces that you’ve set up into the IDE.
6. Click **Finish**.
6. Now you should see **Helion Development Platform** as a configured Server in your IDE.  You can explore the apps that have been deployed already, or continue reading to learn how to deploy a sample app.


##Using the Eclipse Plugin: Tutorial
In order to demonstrate how the plugin works, we’ll use a simple Java sample app that connects to a MySQL service.  If you’d like to follow along, [download and install](/helion/devplatform/workbook/database/java/) the sample on your development machine.  If not, please skip the following section.

###Import the Sample Files
1. Start by adding a new project. Right-click on Project Explorer and select **New** > **Dynamic Web Project**. 
2. Name the project **MySQLSample** and then click **Finish**.
	<img src="media/eclipse8.png"/>
3. Right-click the new MySQLSample project and then select **Import** > **Import** to import the sample app.
	<img src="media/eclipse10.png"/>
4. There are multiple methods for importing sample apps. In this example we will import from a directory on the file system. Click the checkbox to **import all files** in the directory and then click **Finish**.
  	<img src="media/eclipse11.png"/>


1. If you’d like to modify the sample and build it locally, ensure that all references can be resolved.  This sample uses javax.servlet and net.sourceforge.argo.  Note that they are declared in the POM.xml file.  To resolve these references, navigate to the files with reference warnings and click on the red squiggle.  Alternatively, if you have Maven installed in Eclipse, you can build with Maven to resolve the references.
 
1. For this sample, you also need to import two external jar files.  You can find the javax.servlet.* modules in the Java EE SDK under the Glassfish directory.  The Argo modules can be downloaded [here](http://argo.sourceforge.net/downloads.html).
	<img src="media/eclipse12.png"/>

###Deploy sample
Now that our Sample app is set up, let’s deploy it using the Helion Development Platform plugin.  

1. Right-click the project and select **Run As** > **Run As Server**.
	<img src="media/eclipse13.png"/>
2. Select **Helion Development Platform** and click **Next**.  You can check the box to skip this step in future deployments.
	<img src="media/eclipse14.png"/>
3. Specify a name for your app. Since this is a standard Java applet, we will not specify a custom buildpack but use the default Java buildpack that is built into Helion Development Platform. Note that you can save these settings to your manifest if you'd prefer to deploy using the command-line tools in the future. 
	<img src="media/eclipse15.png"/>
1. You can see the deployment progressing in the console.
	<img src="media/eclipse16.png"/>

###Manage the App
Once your app is deployed, you can view the app in a browser window by selecting **Open Home Page** and you can also stop/restart/remove it.

You can also use the plugin to interact with the application directly from Eclipse. Select **Show Console** to bring up the ALS console.  
<img src="media/eclipse17.png"/>
 
----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
