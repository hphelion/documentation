---
layout: default-devplatform
title: "Creating a Database Instance"
permalink: /helion/devplatform/marketplace/
product: devplatform

---
<!--UNDER REVISION-->
#The Marketplace (Beta)
The Marketplace, currently in beta, is a repository where teams can download the latest services they need to accelerate development of their applications. In its beta incarnation, the Marketplace has a single application: the Vertica 7 Community Edition. 

The following topics explain how to install and deploy an instance of Vertica 7 Community Edition:

- [Marketplace concepts](#concepts)
- [Prerequisites](#prereq)
- [Installing a package](#install)
- [Deploying an environment](#create)
- [Creating a Deployed Instance of an Application](#deploy)
- [Deployment Notes](#notes)

## <a name="concepts"></a>Marketplace Concepts
The Marketplace deploys packages of services and applications to specified environments. 

- The term **Application** actually covers applications and services that can reside in the Marketplace. For the purposes of this documentation, we will use the term Application even though we are deploying a database, which is a service. 
- **Packages** are zip files that contain instructions for Application deployment.
- **Environments** are groups of Applications managed by a single tenant. Applications within a single Environment *may* be logically related to one another, but do not have to be.  Applications in different Environments are always independent from one another. 

##<a name="prereq"></a>Prerequisites
Install the Marketplace component of the [HP Helion Development Platform](/helion/devplatform/install/) during the Development Platform install process.

##<a name="install"></a>Installing a Package
In this example, the package being installed is the Vertica 7 Community Edition package. 

###<a name="create"></a>Create a Target Environment
1. Log into Horizon and open the **Marketplace** panel under your Project. Click on **Application Catalog**, and then click on the Environments tab. 
 

	<img src="media/marketplace1.png"/>

1. Click the **Create Environment** button.  

	<img src="media/marketplace2.png"/>

1. After the environment has been created, your view should look like this:

	<img src="media/marketplace3.png"/>
 

###<a name="deploy"></a>Create a Deployed Instance of an Application
The following section will show how to create an instance of Vertica 7 Community Edition in the environment created above.

1. Log in to the Horizon console and open the **Marketplace** panel under your Project. Click on **Application Catalog** and then click on the **Applications** tab. You will see the Vertica 7 Community Edition package.
 
	<img src="media/marketplace4.png"/>


1. Click the Add to Env button from within the Vertica 7 Community Edition section. You will see an **Add Application to &lt;selected environment name&gt;** dialog. Agree to the Terms and Conditions, then scroll down to the bottom of the dialog and click on the Next button.


	<img src="media/marketplace5.png"/>


1. The **Add Application to &lt;selected environment&gt;** dialog will come up. Fill out
	- **Application name** - can be anything
	
	- **Flavor** for instances, can be:
		- m1.medium
		- m1.large
		- m1.xlarge
	4. Select the **image** to use. In this case there is only one image, the Vertica 7 Community Edition (Debian) image. 
	5. Add a keypair if you don't have one already, by selecting the **+** link. If you are adding a keypair, you will be prompted to supply a name and a public key. You can generate a public key in &#42;nix using <a href="http://linux.die.net/man/1/ssh-keygen">ssh-keygen</a> or Windows&reg; using <a href="http://the.earth.li/~sgtatham/putty/0.63/htmldoc/Chapter8.html#pubkey-puttygen">puTTYgen</a>. Insert public key text and click the **Import Key Pair** button.

	<img src="media/marketplace6.png"/>
 
4. Supply a database name and a password, complying with the on-page instructions and then click the **Next** button.

	<img src="media/marketplace7.png"/>

1. You will be prompted to add the Application you have created to the environment you selected. Click **Create** to continue. 
 
	<img src="media/marketplace8.png"/>


1. You will see that Vertica 7 Community Edition has been installed in the test1 environment. Note that the Environment has **not** been deployed yet. That is the next step.

	<img src="media/marketplace9.png"/>

1. To deploy the environment, click on the  **Deploy This Environment** button. Expect deployment to take between 5 and 10 minutes. 

	<img src="media/marketplace10.png"/>

1. When this process has completed, you will see that the Vertica 7 Community Edition is available for consumption. Connection information is given in the **last operation** column.

	<img src="media/marketplace11.png"/>
 
###<a name="notes"></a>Deployment Notes
This section discusses some of the details of deployment that you may encounter.



1. Environments cannot be deployed unless there is at least one Application in the Environment. 
2. Deploying an Application to an Environment that has already been deployed follows the same flow as above.
	- In order to instantiate a newly-configured application, re-deploy its Environment.
	- When an Environment is re-deployed, all applications it contains will be re-deployed. 


 
----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


