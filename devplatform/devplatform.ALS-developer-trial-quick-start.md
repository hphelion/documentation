---
layout: trial-quick-start-devplatform
title: "Quick Start Developer Trial"
permalink: /helion/devplatform/ALS-developer-trial-quick-start/
product: devplatform

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

# HP Helion Development Platform: Quick Start Developer Trial {#top}
The Quick Start Developer Trial is the fastest way to create a sandbox environment to evaluate the HP Helion Development Platform. At the end of the Helion Development Platform Application Lifecycle Service (ALS) installation and configuration process, you will have an endpoint URL that you can use to deploy your apps.

1. [Before You Begin](#pre)
2. [Step-by-Step Installation Instructions](#install)
3. [After Installation](#after)
4. [Explore Sample Applications](#samples)
5. [Troubleshooting and Termination](#terminate)

##Before You Begin {#pre}
Before you can begin your Quick Start Developer Trial, you will need to do three things.

1. Register for your free <a href="https://horizon.hpcloud.com/register" target="_blank">HP Helion Public Cloud</a> account.
2. Download a copy of the ALS Constructor virtual machine image from your public cloud account.
3. [Download and install](/als/v1/client/download) the *cfmgmt* command-line tool appropriate for your operating system.

If you don't already have a user account on the <a href="https://horizon.hpcloud.com/register" target="_blank">HP Helion Public Cloud</a>, take advantage of the <a href="http://www.hpcloud.com/cloud-credit" target="_blank">free trial offer</a> to sign up now. You will be asked to provide a phone number for verification and a credit card during registration, but there is no charge. Please keep your username and password handy as you will be asked for them during installation.

##Step-by-Step Installation Instructions {#install}
1. Log into the [Horizon Console](https://horizon.hpcloud.com/) using the HP Helion Public Cloud username and password that you created during registration.
2. [Create a network with public internet access](https://community.hpcloud.com/article/how-create-or-delete-network#create) inside of your account. You may have done this already as part of the initial public cloud account configuration.
4. Change to the **US East Region** in the Horizon Console.<br /><img src="media/quickstartA11.png"/><br /><br />
5. If necessary, in the **US East section**, in the **Compute** row, click **Activate** to activate the Compute service.<br /><img src="media/quickstartB11.png"/><br /><br />
3. Click the **Project** panel and then the **Compute** sub-panel.<br /><img src="media/quickstartC11.png"/><br><br>
6. Download the configuration file that contains the service settings and environment variables specific to this project.
	1. Click **Access & Security** and then click the **API Access** tab.
	2. Click **Download OpenStack RC file**.<br><img src="media/quickstartDownloadRCFile.png"/><br /><br />

10. You will need to provide a key pair for this VM. <br /> For more details on key pairs in the public cloud, please read [the HPCloud Community article](http://community.hpcloud.com/article/managing-your-key-pairs-0)
	- **If you are using a tool** such as PuTTY (on a PC) or the *ssh-keygen* command (Linux), skip to step 8.
	- **If a key pair has already been created**, use the Horizon console to import it.
		12. Click the **Access & Security** sub-panel.
		13. Click the **Key Pairs** tab and then click **Import Key Pair**. <br /><img src="media/quickstartImportKeyPair11.png"/><br /><br /> 
		14. Enter a name for this key pair in the **Key Pair Name** field.
		15. Copy and paste the RSA public key into the **Public Key** field.
		16. Click **Import Key Pair**. <br /><img src="media/quickstartImportKeyPairName11.png"/><br /><br />
	- **If a key pair has not been created**, create a key pair using the Horizon console.
		18. Click on the **Compute** sub-panel and then click **Access & Security**.
		19. Click on the **Key Pairs** tab and then click **+ Create Key Pair**.<br /><img src="media/quickstartE11.png"/></br></br>
		20. Enter a name in the **Key Pair Name** field and then click **Create Key Pair**.<br /><img src="media/quickstartkeypair"/></br></br>
		21. When prompted, save the *keyPairName.pem* file. (If you are not automatically prompted to save the file, click the link to download it.) This file contains the RSA private key that you will need to SSH into your VM instance.</br></br>

8. Open a terminal window and change directory to the location where you installed the *cfmgmt* command-line tool.
9. Run the following commands:
 
		source <path to openstackrc file>
		./cfmgmt create-cluster
		keypair-name <name of keypair created earlier>
		admin-email <emailaddress for admin user>
		admin-password <password for admin user>
		load trial.yml

##After Installation {#after}
The cluster will be running on a single virtual machine in your account that will have the name ending in *cluster1-core*

After the *cfmgmt* tool creates the cluster, it presents you with the ALS Console URL. This URL will have the form *api.<*ipaddress*>.xip.io*  For example: *api.255.255.255.255.xip.io* <br /> Use this URL in your web browser to navigate to the web-based ALS management console and then log in using the first username and first password you specified in step 9. <br />**Note**: When launching the web-based ALS management console, you may be "warned" that the site has a self-signed certificate or that the site is "not trusted". These "warnings" can be safely ignored.

After you log into the Console, you may wish to access the [ALS User Documentation](/als/v1/user/) for further instructions for creating users and deploying applications.

## Explore Sample Applications {#samples}
Your infrastructure is now ready for development. You can find some simple sample applications in our [Application Developer](/helion/devplatform/appdev/) section. These sample applications provide insight on how to push applications and connect applications to HP Helion OpenStack&reg; services. 

## Troubleshooting and Termination {#terminate}
If an error occurs during installation, the easiest response is simply to terminate the cluster and start over. You can also terminate the cluster when you are done exploring your Developer Quick Start Trial.

These commands delete your VMs, release the floating IP addresses, and remove the cluster security groups.
		
	source <path to openstackrc file>
    ./cfmgmt delete-cluster
	keypair-name <name of keypair created earlier>
	load trial.yml