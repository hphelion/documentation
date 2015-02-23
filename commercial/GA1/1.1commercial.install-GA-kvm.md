---
layout: default
title: "HP Helion OpenStack: Installation and Configuration"
permalink: /helion/openstack/1.1/install/kvm/
product: commercial.ga
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> &#9664; <a href="/helion/openstack/1.1/install/prereqs/">Prerequisites | <a href="/helion/openstack/1.1/install/overview/"> &#9650; Installation Overview</a> | <a href="/helion/openstack/1.1/install/post-kvm/">Post-Installation for KVM Hypervisor &#9654 </a></p> 

# HP Helion OpenStack&reg;:  Installation and Configuration for KVM Hypervisor 

HP Helion OpenStack allows you to manage a Kernel-based Virtual Machine (KVM) hypervisor and provision virtual machines. This document provides installation instructions for HP Helion OpenStack on a suitably specified and prepared system.

## Installing HP Helion OpenStack

The installation and configuration process for KVM consists of the following general steps: 


* Verify Prerequisites
* Downloading and extracting the installation packages
* Installing HP Helion OpenStack
	* Configure proxy information
	* Unpack the installation file
	* Install the seed VM and build your cloud
* Verifying your installation
* Create projects for LDAP users
* Next steps

## Verify Prerequisites {#pre}

To ensure successful installation, [perform required pre-installation tasks](/helion/openstack/1.1/install/prereqs/) before you start.


## Installing HP Helion OpenStack {#install}

Make sure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through the steps to be executed on the seed cloud host:

* [Configure proxy information](/helion/openstack/1.1/install/prereqs/#proxy)
* [Install the seed VM and building your cloud](#startseed)


### Install the seed VM and build your cloud {#startseed}

1. Make sure you are logged into the seed cloud host as root. If not:
 
		sudo su -

2. Execute the `kvm-custom-ips.json` file for the undercloud and overcloud nodes using the `source` command. The `source` command sets the environment variables in the JSON file within the current shell. 

	**Note**: You must use the source command to add variables to your existing deployment.

		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/kvm-custom-ips.json 

5. Start the seed VM installation by entering the following command:

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed |& tee seedinstall.log

	**Note**:The installation process takes approximately 10 minutes to complete. The output will be recorded in a file named *seedinstall.log*.

	When the seed VM startup is complete, you should see a message similar to the following:

		"Wed Oct 23 11:25:10 IST 2014 --- completed setup seed" 

	**Note:** If `hp_ced_host_manager.sh` fails to start the seed, restart the installation (step 1) and then follow the rest of the steps.


10. Make sure the information in the [`baremetal.csv` configuration file](/helion/openstack/1.1/install/csv/) file is correct and upload the file to `/root`.

	**Note:** For more information on creating this file, refer to [Creating the baremetal.csv file](/helion/openstack/1.1/install/prereqs/#csv) on the *Prerequisites* page.

11. If you are integrating LDAP into your environment, copy the configuration files, as described in [Integrating LDAP](/helion/openstack/1.1/services/identity/integrate-ldap/), to the seed cloud host.

	a. Copy the `overcloud_keystone_ldap.json` file to the `/root/tripleo/hp_passthrough` folder:

		scp overcloud_keystone_ldap.json root@<seed_VM_IP_address>:/root/tripleo/hp_passthrough/overcloud_keystone_ldap.json

	b. Export content of ldap.json file using the `OVERCLOUD_EXTRA_CONFIG` environment variable:

		export OVERCLOUD_EXTRA_CONFIG=$(cat ldap.json)

	c. Place overcloud-env.json file (if created) into `/root/tripleo` folder.

		scp overcloud-env.json root@<seed_VM_IP_address>:/root/tripleo/overcloud-env.json
		chmod 0600 $/root/tripleo/overcloud-env.json

6. To build the cloud, start by logging in to the seed VM. Run the following command from `/root` using the IP address of seed VM as defined in the `kvm_custom_ips.json` environment variables file. The IP address should be listed in the output, such as `to login ssh root@192.0.2.1.`:

		ssh root@<seed_VM_IP_address>

	**Note**: It might take a few moments for the seed VM to become reachable. 

7. When prompted for host authentication, type `yes` to allow the SSH connection to proceed.

	The prompt will change to `root@hLinux`.

12. **[Optional]** Use IPMItool to verify that network connectivity from the seed VM to each of the baremetal servers in your `baremetal.csv` is working.

		/usr/bin/ipmitool -U <ipmi_user> -P <ipmi_password> -H <ipmi_address> -I lanplus power status

		For example: root@hLinux:# /usr/bin/ipmitool -U admin -P password -H 10.20.50.25 -I lanplus power status

		Chassis Power is on.


13. The system will power off your computers. If you wish, you can optionally use the IPMI tool to manually power off each baremetal system specified in your `baremetal.csv` file before proceeding with the installation.


	**IMPORTANT:** Make sure that each system is configured in the BIOS to stay powered off in the event of being shutdown rather than automatically restarting.

14. Set the environment variables for the undercloud and overcloud nodes listed in the `kvm-custom-ips.json` file by executing the `source` command. The `source` command parses the json file and sets the environment variables listed there within the current shell.

		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/kvm-custom-ips.json 

14. Install and configure the undercloud and overcloud by running the following command from `/root`. This step creates a log file for the installation process which could be useful for debugging.

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh |& tee cloud_install.log
During this step, several important activities automatically occur:

	a. The input data is processed and validated. 
	For example:

	* Hardware details in baremetal.csv are validated, where possible

	* Node assignments are checked

	* IP address ranges are checked for validity

	* NTP servers are validated

	b. The seed is customized and its OpenStack services are configured and started. The undercloud node is registered with the seed's ironic service
	
	c. The undercloud is deployed, booted, and its heat stack is configured.
	The undercloud OpenStack services are then configured and started.
	The overcloud nodes are registered with the undercloud's ironic service.

	d. The overcloud controller heat stack is configured, booting and deploying images to the Overcloud Controller nodes and the SwiftStorage nodes.

	e. Booting and images are deployed to the individual stacks for the Overcloud compute and other nodes.

	f. Once all the overcloud heat stacks are configured, the overcloud is configured.

	g. Finally a demo VM is launched in the overcloud as a verification step.


	Output messages will indicate when the undercloud and overcloud controllers become active, services are created and configured, and other aspects of the installation are executed. 

10. When the deployment completes, a message displays asking you to submit information on the install to HP. Enter Y to submit or any other key to not submit.

	If your installation is successful, a message similar to the following is displayed:

		"HP - completed - Tue Oct 23 16:20:20 UTC 2014"

	**Note:** If the installation does not complete properly, refer to the [Troubleshooting](/helion/openstack/1.1/services/troubleshooting/) document.


## Verify your installation {#verifying-your-installation}

To verify that the installation is successful, connect to the HP Helion OpenStack dashboard and the undercloud dashboard as shown in [Verifying your installation](/helion/openstack/1.1/install/verify/).

<!-- Not needed in 1.1
## Create projects for LDAP users {#ldap}

If you are integrating LDAP into your environment, you need to configure the Horizon dashboard for users. For more information, see *Configure Horizon* on the [Integrating LDAP page](/helion/openstack/1.1/services/identity/integrate-ldap/#horizon).
-->

## Next Steps {#next-steps}

See [Post-Installation for KVM Hypervisor](/helion/openstack/1.1/install/post-kvm/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
