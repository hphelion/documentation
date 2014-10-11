---
layout: default-devplatform
title: "Creating a Database Instance"
permalink: /helion/devplatform/marketplace/
product: devplatform

---
<!--UNDER REVISION-->
#The Marketplace (Beta)
The Marketplace, currently in beta, is a repository where teams can download the latest services they need to accelerate development of their applications. In its beta incarnation, the Marketplace has a single application: the Vertica 7 Community Edition. 

The following topics explain how to install and deploy a Marketplace instance:

- [Marketplace concepts](#concepts)
- [Prerequisites](#prereq)
- [Installing an image](#install)
- [Creating an environment](#create)
- [Creating a Deployed Instance of an Application](#deploy)
- [Deployment Notes](#notes)

##Marketplace Concepts<a name="concepts"></a>
The Marketplace deploys packages of services and applications to specified environments. 

- The term **Application** refers to both applications and services that can reside in the Marketplace. For the purposes of this documentation, we will use the term Application for deploying a database, which is a service. 
- **Packages** are compressed files that contain instructions for Application deployment.
- **Environments** are groups of Applications managed by a single tenant. Applications within a single Environment *may* be logically related to one other, but do not have to be.  Applications in different Environments are always independent from one another. 

##Pre-requisites<a name="prereq"></a>
Install the Marketplace component of the [HP Helion Development Platform](/helion/devplatform/install/) during the Development Platform install process.

##Installing a Package<a name="install"></a>
In this example, the package being installed is the Vertica 7 Community Edition package. 

###Create a Target Environment<a name="create"></a>
1. Log into Horizon and open the **Marketplace** panel under your Project.
2. Click the **Instances** tab and then click **Application Catalog**.
3. Click the **Environments** tab.  

	//_screenshot here_

1. Click  **Create Environment**.  

	//_screenshot here_

1. After the environment has been created, your view should look like this:

	//_screenshot here_ 
 

###Create a Deployed Instance of an Application<a name="deploy"></a>
This section will show how to create an instance of Vertica 7 Community Edition in the Environment created above.

1. Log into the Horizon console.
2. Under your Project, open the **Marketplace** panel.
3. Click the **Instances** tab and then click  **Application Catalog**
4. Click the **Applications** tab.<br> You will see the Vertica 7 Community Edition package.
 
	//_screenshot here_ 

1. From within the Vertica 7 Community Edition section, click **Add to Env**. 
2. You will see an **Add Application to <selected environment name\>** dialog. Agree to the Terms and Conditions, then scroll down to the bottom of the dialog and click **Next**.

	//_screenshot here_

1. The Add Application to <selected environment> dialog will come up. Fill out
	1. **Application name** – can be anything
	2. **Flavor** for instances, can be:
		1. m1.medium
		2. m1.large
		3. m1.xlarge
	4. Select the **image** to use. In this case there is only one image, the Vertica 7 Community Edition (Debian) image. 
	5. If you don’t have one already, select the **+** link to add a **keypair**. You will be prompted to supply a name and a public key. You can generate a public key in Unix using *ssh-keygen* or Windows&reg; using *puTTYgen*. Copy and paste the generated public key and click **Import Key Pair**.

	//_screenshot here_
 
4. Supply a database and a password and then click **Next**.

	//_screenshot here_

1. You will be prompted to add the Application you have created to the environment you selected. Click **Create**. 
 
	_screenshot here_



1. You will see that Vertica 7 Community Edition has been installed in the test1 environment. Note that the Environment has **not** been deployed yet.

	_screenshot here_

1. Click **Deploy This Environment**. The deployment process will take between 5 and 10 minutes. 

	_screenshot here_

1. When the deployment has completed, you will see that the Vertica 7 Community Edition is available for consumption. Connection information is given in the **last operation** column.

	_screenshot here_
 
###Deployment Notes<a name="notes"></a>
This section discusses some of the details of deployment that you may encounter.



1. Environments cannot be deployed unless there is at least one Application in the Environment. 
2. Deploying an Application to an Environment that has already been deployed follows the same flow as above.
	- In order to instantiate a newly-configured Application, re-deploy its Environment.
	- When an Environment is re-deployed, all Applications it contains will be re-deployed. 




