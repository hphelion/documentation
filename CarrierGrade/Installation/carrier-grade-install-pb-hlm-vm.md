---
layout: default
title: "HP Helion OpenStack&#174; Carrier Grade (Beta): Creating the HLM Virtual Machine"
permalink: /helion/openstack/carrier/install/pb/hlm-vm/
product: carrier-grade

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"><a href="/helion/openstack/carrier/install/pb/network/prepare/">&#9664; Preparing the Network for Installation</a> | <a href="/helion/openstack/carrier/install/pb/overview/">&#9650; Installation Overview</a> | <a href="/helion/openstack/carrier/install/pb/workarounds/"> HLM Post-Installation Tasks &#9654;</a> </p> 



# HP Helion OpenStack&#174; Carrier Grade (Beta): Creating the HLM Virtual Machine

Helion Lifecycle Management (HLM) consists of the ongoing operations/maintenance as well as the initial deployment of the HP Helion OpenStack Carrier Grade system.

HLM consists of initial HLM node deployment followed by Helion cloud nodes deployment. 

## Logging

For all scripts that are executed (including `hlm-build` and `h*` scripts below), separate log files are generated on `/var/log/hlm/` folder.

For example, if you run the `hprovsion` command, all command line output will also be logged in `/var/log/hlm/hprovision.log` file.

The following is the list of scripts for which logging is implemented:

* hlm_updatepackages.sh
* hlm_initcobbler.sh
* hlm_importiso.sh
* hlm_prepareenv.sh
* hnewcloud
* hprovision
* hcfgproc
* hnetinit

## Prepare the system for deployment {#prepare}

Use the following steps to prepare the KVM host to deploy the VMs.

1. Copy the installer files and Ansible playbooks to KVM host. 


	a. Copy the `cg-hlm.qcow2` file to `/home/images`.

	b. Copy the `cg-hos-dcn-vsd.tar.gz.gpg` to the `/home/images` directory.

	c. Decrypt and untar the PGP file using password `cghelion` when prompted. 

		gpg -d cg-hos-dcn.tar.gz.gpg | tar -xzvf


	d. Copy the `infra-ansible-playbooks` file to `/root`. 
	e. Decrypt and untar the file using password `cghelion` when prompted. 

	f. Copy the `cg-hos.tar.gz.gpg` file to `/root/cg`. Create the directory if it does not exist. 

	g. Copy the `cg-hos-dcn-vsc.tar.gz.gpg` file to `/root/cg`. 

	h. Copy the files from the `Patches/build-33` folder

		hnewcloud.sh
		ansible.cfg
		ilopxebootonce.py
		venom-patch.tar.gz

	i. Extract the `venom-patch.tar.gz` and follow the readme file.

	The `cg-hlm.qcow2` and `VSD-3.0.0_HP_r3.0_16.qcow2` are in the `/home/images` folder. Refer to the `group_vars/all` file on the KVM host if you need the location of the `/home/images` file. 

2. Edit the `/root/infra-ansible-playbooks/group_vars/all` file for you environment. Comments added in the file explain each variable.

3. Check the hosts file `/root/infra-ansible-playbooks/hosts` file and make sure it appears similar to the following. Make sure the VSD IP (DCM network) is correct.

		Update the vsd CLM IP in this file
		[vsd]
		10.200.50.21 ansible_ssh_user=root ansible_ssh_pass=Alcateldc
		
		[hlm]
		
		[hlm_kvm_host]
		192.168.122.1 

## Deploy the HLM and VSD VM 

The steps provided below will get you to use ansible playbook and bring up HLM and VSD VM up on the HLM KVM Host.

1. Make sure the Ansible playbook file is not in executable mode.

2. Execute the following command:

		ansible-playbook -i hosts setup_hlm_onBM.yml

	The above command will do the following :

		a. Copy both installation files (tar balls) to your HLM, decrypt, and extract the files.
		b. Execute the `updatepackages` command.
		c. Execute the `prepareenv` command.
		d. Execute the `Init cobbler` command.
		e. Execute the `Importiso` command.

	You will see similar message when the playbook is run successful.

	<img src="media/CGH-Install-Ansible.png">

## Apply the patch to fix QEMU Venom vulnerability


There is a [known vulnerability](https://bugs.launchpad.net/openstack-ansible/+bug/1454677) in [QEMU](http://wiki.qemu.org/Main_Page).

Use the following steps to patch the vulnerability:

1.	Copy `venom-patch.tar.gz` to the HLM VM and extract the files. Follow instructions in Readme.txt file that is in the extracted files.

2. Copy the `packages-patch.tar.gz.gpg` to `/root` directory on HLM VM.

3. Decrypt and extract the `packages-patch.tar.gz.gpg` file, using the password `cghelion` when prompted:

		gpg -d packages-patch.tar.gz.gpg | tar -xzvf -

3. Execute the following command to update the package list on the HLM VM:

		rm /root/packages/repo/debian/qemu*2.1.3*.deb
		apt-get update
		apt-get -y --force-yes install dpkg-dev
 		cd /root/packages/repo/debian
		dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz

4. Execute the following command to update the package repository on the HLM VM:

		cd /root/cg-hlm/hlm-build
		./hlm_updatepackages.sh

## Logging into VSD node, creating user and applying License

VSD node provisioning happens as part of Infrastructure Ansible playbook run.


You can SSH to the VSD VM from HLM KVM host using the DCM IP.

		virsh console vsd

If everything is installed correctly, you should see the status as below from VSD VM.

<img src="media/CGH-install-virsh-vsd.png">


## VSD Performance workaround

By default VSD has only 8G memory. For better performance behavior, you can update the VSD memory to 16G.

1. From KVM host,use the following command to bring down the VSD VM: 

		virsh destroy vsd

2. Use the following command to edit the memory setting in the VSD XML file: 

		virsh edit vsd 

		Current value 
			<memory unit='KiB'>8388608</memory>
			<currentMemory unit='KiB'>8388608</currentMemory>

		Change to 
			<memory unit='KiB'>16777216</memory>
  			<currentMemory unit='KiB'>16777216</currentMemory>

3. Save the value 

		virsh save vsd

4. Use the following command to start the VM: 

		virsh start vsd

	It might take 15 min or more to sync with NTP and to get all the other VSD services up.

## Launch VSD Dashboard 

As VSD VM has DCM interface to HLM KVM host, you should be able to XRDP from jump server to the HLM KVM host and can launch the dash board.

1. Using an internet browser such as Chrome or FireFox, navigate to the DCM IP of VSD.

2. In the log in page, enter the default credentials:

		User Name: Csproot 
		Password: csproot 
		Org: csp 
		VSD Server : auto 

## Applying the License

To install the required DCN license:

1. From VSD Dashboard, click the **Open VSP Configuration** tab on the top right corner of the dashboard.  

2. Click the **Licenses** tab and click **+**. 

3. Copy and paste the license that you have receive into the screen that displays.

## Create User for Plugin Login 

You must create a user and add it to CMS Group.

1. From VSD Dashboard, click the **Open VSP Configuration** tab on the top right corner of the dashboard.  

2. Click the **CSP Users** tab and click **+**. 

3. Create a user named `OSadmin` with the password `OSadmin`. 

2. Add the user to the `CMS Group`. 

## Configure a JSON file for installation 

The HLM VM deployment requires a JSON file. Use the following steps to install and edit the file.

1. On the KVM host, change to the home directory.

		cd ~

2. Provision and configure your HLM VM.

		hnewcloud  <cloudname> <cloud_template>

	Where:
	* cloudname is the name of the cloud to create
	* cloud_template is the name of the template to use.

	The command creates the `<cloudname>` directory, which will contain a JSON template file `node-provision.json`. This template supplies input values to the `hprovision` script, later in the installation. 

3. Edit `node-provision.json` file based on following guidelines:

	<table>
	<tr><th>Field</th><th>Baremetal</th></tr>
	<tr><td>name</td><td>Name of the system you want to add in cobbler</td></tr>
	<tr><td>Pxe-mac-address</td><td>MAC address of the interface you want to pxe boot onto. This is not same as iLO MAC address,</td></tr>
	<tr><td>Pxe-interface</td><td>nterface name on which pxe boot should occur. For example: `eth0`</td></tr>
	<tr><td>pm_type</td><td>ipmilan
	<tr><td>pm_ip</td><td>Power management IP:ilo ip</td></tr>
	<tr><td>pm_user</td><td>Power management user: ilo username</td></tr>
	<tr><td>pm_pass</td><td>Power management password: ilo password</td></tr>
	<tr><td>node_group</td><td>For now, this should have the same value as `node-type` in the `nodes.json` file. For example: `CCN-001-001`.</td></tr>
	<tr><td>failure_zone, vendor, model, os_partition_size, data_partition_size</td><td>These fields have same significance as they have in the `nodes.json` used during cloud deployment</td></tr>
	</table>

	To see a sample `node-provision.json` file, see [Create the HLM Virtual Machine](/helion/openstack/carrier/install/pb/hlm-vm/json-sample/).

## Create new cloud template and bring the cloud nodes up

After you edit the `node-provision.json` file, you must enable one-time PXE boot on cloud nodes to set the correct boot order. Execute the following on the HLM VM

1. Use the following command to install the `python-hpilo` module on HLM VM:

		pip install python-hpilo

	`python-hpilo` is a python library and command-line tool for iLO.


2. Copy the `ilopxebootonce.py` from the `Patches/build-33 folder` you [downloaded earlier](#prepare) to directory where you have `node-provision.json`.

3. Execute the following script

		python ilopxebootonce.py node-provision.json

After the script is run, the `Current One-Time Boot Option` is set to `Network Device 1` on all the servers listed in `node-provision.json` file.

## Create new cloud template and bring the cloud nodes up

1. Use the following script to start the provisioning of the HLM VM:

	hprovision `<cloudname>`

	Where:
	* cloudname is the name of the cloud to create

	This script will PXE boot the nodes specified in `node-provision.json` file. The script alsos track the PXE boot completion process and will create the `nodes.json` file in the <cloudname> directory. 

2. Update the `node-provision.json` files used in the previous step.

	a. Change to the <cloudname> directory:

		cd ~/<cloudname>

	b. Verify that the each PXE-booted nodes has an IP address that matches the IP address specified in the `node-provision.json` file.

3. Modify the `environment.json` file to configure the VLANs and network addresses that need to be configured for respective cloud nodes. 

		"cidr": 
		"start-address": 

	* The three controller nodes should have CLM, CAN, EXT, BLS on eth0 and TUL on eth1. 
	
	* The two compute nodes should have CLM, EXT, BLS on eth0 and TUL on eth1.  

	**Example:**

		"cidr": "192.168.101.0/24",
		"start-address": "192.168.101.100"

	**NOTE:** The Helion Configuration Processor assigns the first address of the CLM address range to itself for serving python and debian repositories. Make sure that you set the first IP address of the CLM range for the eth2 (CLM) address of the HLM node.

4. Modify the `definition.json` file: 

		a. Set the number of compute systems to 2.

			"count": 2, //number of computes in the resource pool.

		b. Update `ansible-vars` section with all the information based on your setup.

		c. Make sure you have two NTP entries at the end of this `definition.json` file as seen in the snapshot. If you have only one NTP server in your environment, specify the same NTP server twice.

8. Once you have correctly edited all the json "Cloud Model" files, run the Helion Configuration Processor on these

		cd /usr/local/bin

		hcfgproc -d definition.json

	The `hcfgproc` script gets installed in `/usr/local/bin` by the `prepare-env` script. The script generates a `clouds/` directory within the <cloudname> directory.

9. Review the CloudDiagram, `hosts.hf`, and `net/interfaces.d/eth.cfg` files to make sure the network settings are correct.

10. Initialize network interfaces on all the cloud nodes using the following command:

		hnetinit <cloudname> 

	You can run this command from any directory. 

After this command completes, all cloud nodes and CLM network interfaces should be set correctly. 


## Next Step

[HLM Post-Installation Tasks](/helion/openstack/carrier/install/pb/workarounds/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---


