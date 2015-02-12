---
layout: default-devplatform
title: "Working with the Marketplace"
permalink: /helion/devplatform/marketplace/
product: devplatform
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Systems Administrator 
role2: System Engineer
role3: Cloud Administrator
role4: Network Administrator
role5: Application Developer
Role6: Security Engineer
role7: Application Developer 
role8: ISV Developer
role9: Service Developer

---
<!--UNDER REVISION-->
# HP Helion Development Platform: The Marketplace (Beta)
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

- The term **Application** covers both applications and services that can reside in the Marketplace. For the purposes of this documentation, we will use the term Application even though we are deploying a database, which is a service. 
- **Packages** are zip files that contain instructions for Application deployment.
- **Environments** are groups of Applications managed by a single tenant. Applications within a single Environment *may* be logically related to one another, but do not have to be.  Applications in different Environments are always independent from one another. 

##<a name="prereq"></a>Prerequisites
Install the Marketplace component of the [HP Helion Development Platform](/helion/devplatform/install/) during the Development Platform install process.

##<a name="install"></a>Installing a Package
In this example, the package being installed is the Vertica 7 Community Edition package.

Note that you must log out of the Horizon dashboard and then log back in at least once after Marketplace installation before installing any Marketplace packages. This will ensure that Horizon has properly loaded all Marketplace services prior to package installation.  

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


1. Click the Add to Env button from within the Vertica 7 Community Edition section. You will see an **Add Application to &lt;selected environment name&gt;** dialog. For this example, set the Environment Name to **Test1**. Agree to the Terms and Conditions, then scroll down to the bottom of the dialog and click **Next**.


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


10.	You can also implement additional security by modifying the access rules for the security group associated with the environment that the Vertica instance was deployed into. In the example, the environment name is **Test1**. The associated security group can be accessed from the Horizon panel as follows:
	1.	In the Horizon console under **Compute** -> **Access & Security**, go to the **Security Groups** tab.
	2.	Search for a group with the **Test1** string in the group name. Group names are auto-generated to ensure that they are unique.
	3.	Click **Manage Rules**.
		- 		To change the access rules for SSH, add a new security group allowing access on port 22 from the IP range you wish to grant access to.
		- 		To allow access to Vertica, add a new rule on port 5433 that specifies the IP range you wish to grant access to. You can then remove the corresponding default rule.
 

###<a name="notes"></a>Deployment Notes
This section discusses some of the details of deployment that you may encounter.

1. Environments cannot be deployed unless there is at least one Application in the Environment. 
2. Deploying an Application to an Environment that has already been deployed follows the same flow as above.
	- In order to instantiate a newly-configured application, re-deploy its Environment.
	- When an Environment is re-deployed, all applications it contains will be re-deployed. 
3. If a Vertica instance is restarted or power cycled, the Vertica database must be restarted manually once the instance is reachable. This is by design to avoid potential database corruption in the event of a power event. Note that **all** VMs are shut down and then restarted during the Helion upgrade process. 
	1. SSH into your instance
	1. Become the dbadmin user:

 			sudo su - dbadmin
	  
	1. Run the following command:
	 
			admintools -t stop_db --database=DB_NAME --password=DB_PASSWORD

 ----


