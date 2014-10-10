---
layout: default-devplatform
title: "Creating a Database Instance"
permalink: /helion/devplatform/marketplace/
product: devplatform

---
<!--UNDER REVISION-->#The Marketplace (Beta)
The Marketplace, currently in beta, is a repository where teams can download the latest services they need to accelerate development of their applications. In its beta incarnation, the Marketplace has a single application, the Vertica 7 Community Edition. 

The following topics explain how to install and deploy an instance of Vertica 7 Community Edition:



- Marketplace concepts
- Installing an image
- Deploying an environment
- Deployment Notes



#Marketplace Concepts
The Marketplace deploys packages of services and applications to specified environments. 

- The term Application actually covers applications and services that can reside in the Marketplace. For the purposes of this documentation, we will use the term Application even though we are deploying a database, which is a service. 
- Packages are zip files that contain instructions for Application deployment.
- Environments are groups of Applications managed by a single tenant. Applications within a single Environment may be logically related to one other, but do not have to be.  Applications in different Environments are always independent from one another. 

##Pre-requisites
Install the Marketplace component of the HP Helion Development Platform during the Development Platform install process.

 
<TODO: LINK TO Helion Dev Platform Installation Page. The current one is misnamed.>
##Installing a Package
In this example the package being installed is the Vertica 7 Community Edition package. 

###Create a Target Environment




1. Log into Horizon and open the **Marketplace** panel under your Project. Click on the instances tab, then click on **Application Catalog**, and then click on the **Environments** tab.  

_screenshot here_

1. Click the Create Environment button.  

_screenshot here_

1. After the environment has been created, your view should look like this:

_screenshot here_ 
 

###Create a Deployed Instance of an Application
The following section will show how to create an instance of Vertica 7 Community Edition in the Environment created above.



1. Log into Horizon and open the **Marketplace** panel under your Project. Click on the instances tab, then click on **Application Catalog**, and finally click on the **Applications** tab. You will see the Vertica 7 Community Edition package.
 
	_screenshot here_ 



1. Click the **Add to Env** button from within the Vertica 7 Community Edition section. You will see an Add Application to <selected environment name> dialog. Agree to the Terms and Conditions, then scroll down to the bottom of the dialog and click on the **Next** button.

	-screenshot here_

 



1. The Add Application to <selected environment> dialog will come up. Fill out


	A. Application name – can be anything
	B. Flavor for instances, can be 
			1. m1.medium
			2. m1.large
			3. m1.xlarge


	C. Select the image to use. In this case there is only one image, the Vertica 7 Community Edition (Debian) image. 


	D. Add a keypair if you don’t have one already, by selecting the + link. If you are adding a keypair, you will be prompted to supply a name and a public key. You can generate a public key in *nix using ssh-keygen or windows using puTTYgen. Insert public key text and click the **Import Key Pair** button

	_screenshot here_

 



4. Supply a database and a password, complying with the on page instructions, then click the **Next** button.

	_screenshot here_

 



1. You will be prompted to add the Application you have created to the environment you selected. Click **Create** to continue. 
 
	_screenshot here_



1. You will see that Vertica 7 Community Edition has been installed in the test1 environment. But the environment hasn’t been deployed yet. That is the next step.

	_screenshot here_

 


1. To deploy the environment, click on the **Deploy This Environment** button.  Expect deployment to take between 5 and 10 minutes. 

	_screenshot here_

 


1. When this process is completed, you will see that the Vertica 7 Community Edition is available for consumption. Connection information is given in the ‘last operation’ column.

	_screenshot here_
 

 




###Deployment Notes
This section discusses some of the details of deployment that you may encounter.



1. Environments cannot be deployed unless there is at least one Application in the Environment. 
2. Deploying an Application to an Environment that has already been deployed follows the same flow as above. 

	A. In order to instantiate the newly configured application you will need to re-deploy the Environment.

	B. When the Environment is re-deployed, all applications will be re-deployed. 




