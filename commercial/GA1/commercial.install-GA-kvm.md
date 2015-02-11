---
layout: default
title: "HP Helion OpenStack: Installation and Configuration"
permalink: /helion/openstack/install/kvm/
product: commercial.ga
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, 

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> &#9664; <a href="/helion/openstack/install/prereqs/">Prerequisites | <a href="/helion/openstack/install/overview/test/"> &#9650; Installation Overview</a> | <a href="/helion/openstack/install/post-kvm/">Post-Installation for KVM Hypervisor &#9654 </a></p> 

# HP Helion OpenStack&reg;:  Installation and Configuration for KVM Hypervisor 

HP Helion OpenStack allows you to manage a Kernel-based Virtual Machine (KVM) hypervisor and provision virtual machines. This document provides installation instructions for HP Helion OpenStack on a suitably specified and prepared system.

## Installing HP Helion OpenStack

The installation and configuration process for KVM consists of the following general steps: 


* Verify Prerequisites
* Downloading and extracting the installation packages
* Installing HP Helion OpenStack
	* Configure proxy information
	* Unpack the installation file
	* Install the seed VM and building your cloud
* Verifying your installation
* Create projects for LDAP users
* Next steps

## Verify Prerequisites {#pre}

To ensure successful installation, [perform required pre-installation tasks](/helion/openstack/install/prereqs/) before you start.


## Installing HP Helion OpenStack {#install}

Make sure you have met all the hardware requirements and have completed the required tasks before you begin your installation. The following sections walk you through the steps to be executed on the seed cloud host:

* [Configure proxy information](#proxy)
* [Install the seed VM and building your cloud](#startseed)


### Install the seed VM and build your cloud {#startseed}

1. Make sure you are logged into the seed cloud host as root. If not:
 
		sudo su -

2. Execute the `kvm-custom-ips.json` file using the `source` command. The `source` command executes the content of the file passed as argument, in the current shell.

		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/kvm-custom-ips.json 

5. Start the seed VM installation by entering the following command:

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed |& tee seedinstall.log

	**Note**:The installation process takes approximately 10 minutes to complete. The output will be recorded in a file named *seedinstall.log*.

	When the seed VM startup is complete, you should see a message similar to the following:

		"Wed Oct 23 11:25:10 IST 2014 --- completed setup seed" 

	**Note:** If `hp_ced_host_manager.sh` fails to start the seed, restart the installation (step 1) and then follow the rest of the steps.

6. To build the cloud, start by logging in to the seed VM. Run the following command from `/root` using the IP address of seed VM as defined in the `kvm_custom_ips.json` environment variables file. The IP address should be listed in the output, such as `to login ssh root@192.0.2.1.`:

		ssh root@<seed_VM_IP_address>

	**Note**: It might take a few moments for the seed VM to become reachable. 

7. When prompted for host authentication, type `yes` to allow the SSH connection to proceed.

	The prompt will change to `root@hLinux`.

10. Make sure the information in the [`baremetal.csv` configuration file](/helion/openstack/install/prereqs/#csv) file is correct and upload the file to `/root`.

	**Note:** For more information on creating this file, refer to [Creating the baremetal.csv file](/helion/openstack/install/prereqs/#csv) on the *Prerequisites* page.

11. If you are integrating LDAP into your environment, copy the configuration files, as described in [Integrating LDAP](/helion/openstack/install/ldap/), to the seed cloud host.

	a. Copy the `overcloud_keystone_ldap.json` file to the `/root/tripleo/hp_passthrough` folder:

		scp overcloud_keystone_ldap.json root@<seed_VM_IP_address>:/root/tripleo/hp_passthrough/overcloud_keystone_ldap.json

	b. Place overcloud-env.json file (if created) into `/root/tripleo` folder.

		scp overcloud-env.json root@<seed_VM_IP_address>:/root/tripleo/overcloud-env.json


12. **[Optional]** Use IPMItool to verify that network connectivity from the seed VM to each of the baremetal servers in your `baremetal.csv` is working.

13. Use the IPMItool to manually power off each baremetal system specified in your `baremetal.csv` file before proceeding with the installation. 

	**IMPORTANT:** Make sure that each system is configured in the BIOS to stay powered off in the event of being shutdown rather than automatically restarting.

14. Execute the `kvm-custom-ips.json` file for the undercloud and overcloud nodes using the `source` command. The `source` command executes the content of the file passed as argument, in the current shell.

		source tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh tripleo/configs/kvm-custom-ips.json 

14. Install and configure the undercloud and overcloud by running the following command from `/root`. This step creates a log file for the installation process which could be useful for debugging.

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh |& tee cloud_install.log

	Output messages will indicate when the undercloud and overcloud controllers become active, services are created and configured, and other aspects of the installation are executed. 

10. When the deployment completes, a message displays asking you to submit information on the install to HP. Enter Y to submit or any other key to not submit.

	If your installation is successful, a message similar to the following is displayed:

		"HP - completed - Tue Oct 23 16:20:20 UTC 2014"

	**Note:** If the installation does not complete properly, refer to the [Troubleshooting](/helion/openstack/services/troubleshooting/) document.


## Verify your installation {#verifying-your-installation}

To verify that the installation is successful, connect to the HP Helion OpenStack dashboard and the undercloud dashboard as shown in [Verifying your installation](/helion/openstack/install/verify/).

<!-- Hiding until I determine if linked doc will work

### Connect to the undercloud Horizon console {#connectconsoleunder}

Make sure you can access the undercloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, run the following command.

		. /root/stackrc

2. Assign the undercloud IP address to a variable.

		UNDERCLOUD_IP=$(nova list | awk '/\| undercloud/{print $12}' | sed 's/ctlplane=//'); echo $UNDERCLOUD_IP

3. Determine the undercloud IP from the output of step 2 using the following command. It is in the last line returned.
  
		echo ${UNDERCLOUD_IP}

4. Obtain the undercloud admin password using the following command:

		UNDERCLOUD_ADMIN_PASSWORD=$(grep UNDERCLOUD_ADMIN_PASSWORD /root/tripleo/tripleo-undercloud-passwords | sed 's/UNDERCLOUD_ADMIN_PASSWORD=//'); echo $UNDERCLOUD_ADMIN_PASSWORD

5. From your install system, open a web browser and point to:

		http://<undercloud_IP>

6. Log in as user 'admin' with the admin password from step 4.

### Connect to the overcloud Horizon console {#connectconsoleover}

Make sure you can access the overcloud Horizon dashboard. To do this, follow the steps below:

1. From the seed, export the overcloud passwords:

		. /root/tripleo/tripleo-overcloud-passwords

2. Export the overcloud users:

		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc

3. Assign the overcloud IP address to a variable:

		OVERCLOUD_IP=$(jq '.overcloud.endpointhost' /root/tripleo/ce_env.json); echo ${OVERCLOUD_IP}

	Remove per Divaker
	4. With the IP address and root password, log in as the main user, root using the following command 

		ssh root@${DEMO_IP}

	If the optional second network was configured, the overcloud controller IP is the value set for `NeutronPublicInterfaceIP`. 

4.	Obtain the overcloud admin password using the following command:

		OVERCLOUD_ADMIN_PASSWORD=$(grep OVERCLOUD_ADMIN_PASSWORD /root/tripleo/tripleo-overcloud-passwords | sed 's/OVERCLOUD_ADMIN_PASSWORD=//'); echo $OVERCLOUD_ADMIN_PASSWORD

5. From your install system, open a web browser and point to:

		http://<overcloud_IP>/

6. Log in to the overcloud as user `admin` with the password you obtained from the `/root/tripleo/tripleo-overcloud-passwords` file in step 4.

	**Note:** If you are unable to connect to the Horizon console, check your proxy settings to ensure that access to the controller VM is successfully redirected through a proxy.

### Connect to the demo VM ### {#connectvm}

From the seed cloud host, you can connect to the demo VM using the following steps:

Steps 1-5 Maybe not needed per Chris Cannon
1. Export the overcloud passwords:

	`. /root/tripleo/tripleo-overcloud-passwords`

2. Export the overcloud users:

	`TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc-user`

3. Verify you can view the nova instances:

	`nova list`

4. Assign the demo VM IP address to a variable:

	`DEMO_IP=$(nova list | grep " demo " | awk ' { print $13 } ')`

5. Connect to the demo VM using the IP address you obtained from the Horizon console:

	`ssh debian@${DEMO_IP}`

	**Note:** It might take a few minutes for the demo vm to become available using ssh after finishing the installation.

	If the prompt changes to `debian@demo`, you have successfully connected to the demo VM.

6. Before proceeding, enter `exit` to disconnect from the demo VM.


### Connect to the monitoring interface {#connectmonitor}

1. Retrieve the undercloud IP by entering the following commands on the seed VM: 

		. /root/stackrc
		UNDERCLOUD_IP=$(nova list | grep "undercloud" | awk ' { print $12 } ' | sed s/ctlplane=// )
		echo $UNDERCLOUD_IP

	Note: The `echo $UNDERCLOUD_IP` command prints the IP address of the undercloud to the screen.

2. Open a web browser and point to:

		http://<undercloud IP>/icinga/

3. Log in as user `icingaadmin` with the password `icingaadmin`.

### Connect to the logging interface {#connectlogging}

1. Retrieve the undercloud IP by entering the following commands on the seed VM: 

		. /root/stackrc
		UNDERCLOUD_IP=$(nova list | grep "undercloud" | awk ' { print $12 } ' | sed s/ctlplane=// )
		echo $UNDERCLOUD_IP

	Note: The `echo $UNDERCLOUD_IP` command prints the IP address of the undercloud to the screen.

2. Obtain the logging interface password using the following command:

		UNDERCLOUD_KIBANA_PASSWORD=$(grep UNDERCLOUD_KIBANA_PASSWORD /root/tripleo/tripleo-undercloud-passwords | sed 's/UNDERCLOUD_ KIBANA _PASSWORD=//'); echo $UNDERCLOUD_ KIBANA _PASSWORD

3. Open a web browser and point to:

		http://<undercloud IP>:81/
 

4. Log in as user `kibana` and the password from Step 4.
-->
## Create projects for LDAP users {#ldap}

If you are integrating LDAP into your environment, you need to configure the Horizon dashboard for users. For more information, see *Configure Horizon* on the [Integrating LDAP page](/helion/openstack/install/ldap/#horizon).


## Next Steps {#next-steps}

See [Post-Installation for KVM Hypervisor](/helion/openstack/install/post-kvm/).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
