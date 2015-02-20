---
layout: default
title: "HP Helion OpenStack&#174; Enterprise Edition 1.1 : Installation on a laptop with i7/32GB/512GB"
 "
permalink: /helion/openstack/install/laptop/demo/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p> -->


# HP Helion OpenStack&#174; Enterprise Edition 1.1 : Installation on a laptop with i7/32GB/512GB

The purpose of this document is to provide a quick guide on how to setup Helion OpenStack Enterprise Edition 1.1 into a virtual environment running on a laptop suitable to demonstrate the basic usage of product.

This page covers the following topics: 

* [Intended Audience](#intended-auidence)
* [Architecture for the demo](#arch-demo)
* [Laptop installation](#laptop-install)
* [Helion OpenStack virtual installation](#helion-virtual-install)
* [Shutdown and recovery](#shutdown-recovery)

##Intended Audience {#intended-auidence}

This document is intended for solution, product managers and all people facing customers. You should be familiar with:

1.	Ubuntu Server installation process
2.	Linux command line interface
3.	Basic Linux networking 
4.	Helion OpenStack 


##Architecture for the demo {#arch-demo}

The suggested minimum setup for the demo: 

1.	A laptop running the cloud virtual installation
2.	A computer accessing the demo laptop via network with a browser


##Laptop installation {#laptop-install}

The following sections describe the basic steps required to install Ubuntu on a laptop computer. Ubuntu must be installed on a physical laptop and not on a virtual machine.

###Operation system install
1.	Install Ubuntu 14.04 server edition (recommended) or Ubuntu 14.04 Desktop on a laptop computer. 
2.	After the Ubuntu installation is successful, login to the laptop.
3.	Run the following all in one command to install the KVM pre requisites:

		sudo su -l -c "apt-get install -y ntp qemu-kvm libvirt-bin openvswitch-switch openvswitch-common python-libvirt qemu-system-x86 libssl-dev libffi-dev git python-virtualenv python-dev"

4.	After the pre requisites are installed, you must configure a local NTP server on the laptop. The NTP server is required for the under and overcloud installation. To configure the NTP server, follow these steps:

	a. Edit the NTP configuration file:
		
		 vi /etc/ntp.conf 

	b. Leave the default NTP servers for the NTP sync.

	c. Add or change the **restrict** line to match the following:

		restrict 192.0.2.0 mask 255.255.255.0 nomodify notrap

	d. Restart the NTP server: 

		sudo /etc/init.d/ntp restart 
	
	e. Verify the NTP status:

		ntpq -p

	The output of the command for a working NTP connection should resemble the example in Figure-1.

	**Figure-1: Successful NTP output**

	<img src="media/commercial-install-laptop-successful-ntp-output.png"/)>

	

	f. If you run `ntpq -p` and you receive a 'No association ID's returned' message, then you may have to reinstall the `ntp` package, To do this, enter the following commands pressing enter after each command: 

	i. `dpkg-reconfigure ntp`

	ii. `ntpq –p` 



## Helion OpenStack virtual installation {#helion-virtual-install}

###Install seed first stage of the Helion install

1.	Login to the laptop, and then elevate to root:

		sudo -i 
	
2.	Create a folder named work:
	
		 mkdir -p /root/work

3.	Download the Helion OpenStack Enterprise Edition from the official site.
4.	Extract the bits to `/root/work` folder: 

		tar -xzvf ee_installer-VER.tgz -C /root/work

5.	Create a file named `vm_plan.csv` to specify to the seed creation procedure, the number of vCPU's and the amount of RAM for the virtual machine. The process used to reduce the number of virtual machines is described in the second stage procedure. 
6.	After you create the `vm_plan.csv` file, you must add the following information to the `vm_plan.csv` file:

		
		,,,,2,5120,,Undercloud
		,,,,2,6144,,OvercloudControl
		,,,,2,6144,,OvercloudControl
		,,,,2,6144,,OvercloudControl
		,,,,2,3072,,OvercloudSwiftStorage
		,,,,2,3072,,OvercloudSwiftStorage
		,,,,4,6144,,OvercloudCompute
		,,,,4,6144,,OvercloudCompute

7. To set the amount of memory for the seed VM, run the following command, and then press Enter:

		export NODE_MEM=6144

8. Instruct the seed creation procedure to do a virtual installation:
export `HP_VM_MODE=y`

9. Specify the NTP server used in the seed creation by running the following command, The NTP server is  used for the undercloud and the overcloud: 

		export SEED_NTP_SERVER=<laptop IP>

8.	Run the following script to create the seed VM: 

		bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed -vm-plan /root/vm_plan.csv 2>&1|tee seedvminstall.log

	Successful seed creation will resemble the following example:

		+ echo 'to login:   ssh root@192.0.2.1'
		to login:   ssh root@192.0.2.1
		+ '[' -z y ']'
		+ copy_config_vm_baremetal
		+ echo 'Template baremetal.csv for VMs in tripleo/tripleo-incubator/scripts/../../../baremetal.csv.vm'
		Template baremetal.csv for VMs in tripleo/tripleo-incubator/scripts/../../../baremetal.csv.vm
		+ scp -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null tripleo/tripleo-incubator/scripts/../../../baremetal.csv.vm root@192.168.122.120:baremetal.csv
		Warning: Permanently added '192.168.122.120' (ECDSA) to the list of known hosts.
		baremetal.csv.vm                                                                                                                                                                                                                                         100%  628     0.6KB/s   00:00    
		++ date
		+ echo 'Wed Feb 18 14:56:46 GMT 2015 --- completed setup seed'
		Wed Feb 18 14:56:46 GMT 2015 --- completed setup seed
		+ exit 0

### Second stage of the Helion install (Under/Overcloud nodes install)

Second stage is the part of the installation process that create and configure under and overclouds using the seed machine.

1.	Log into the seed VM: 

		ssh root@192.0.2.1

2.	Reduce the number of controllers to 1: 

		export OVERCLOUD_CONTROLSCALE=1

3.	Reduce the number of swift nodes to 1: 

		export OVERCLOUD_SWIFTSTORAGESCALE=1

4.	Set swift to use just one replica: 

		export OVERCLOUD_SWIFT_REPLICA_COUNT=1

5.	Optionally disable centralized logging, this is default for virtual installations: 

		export ENABLE_CENTRALIZED_LOGGING=0

6.	Instruct installer not to use trickle: 

		export USE_TRICKLE=0

7.	You can start the second stage of the Helion OpenStack installation by running the following command:
	
		bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh  2>&1|tee stackinstall.log

	The underCloud and overCloud setup may take 60 to 90 minutes to complete.

8.	At the end of installation the system will ask to collect anonymous information, we recommend that you select **Agree**. This lets the installer provide useful information for remaining steps.

9.	After the installation completes successfully, you will see output that is similar to the following example:
		
		UNDERCLOUD Endpoint: http://192.0.2.2:5000/v2.0
		UND
		ERCLOUD IP: "192.0.2.2"
		OVERCLOUD Endpoint: https://192.0.2.21:5000/v2.0/
		OVERCLOUD IP: "192.0.2.21"
		++ date
		+ echo 'HP - completed - Wed Feb 18 16:21:59 UTC 2015'
		HP - completed - Wed Feb 18 16:21:59 UTC 2015
		+ exit 0

###Horizon access {#horizon-access}

The best way to view the Horizon dashboard is to connect from a remote computer other than the laptop that is running HP Helion OpenStack.

To connect to the Horizon dashboard from a remote computer, follow these steps: 

1.	Connect the Ubuntu laptop to the network.
2.	Login to the laptop, and then elevate to root:

		sudo -i

3.	Verify the IP address of the laptop NIC: 

		ip addr	

4.	Open and copy the overcloud admin password file to the laptop to login to the horizon with admin account:

		cat tripleo/tripleo-overcloud-passwords

	The output from cat command the will resemble the example in Figure-2,

	**Figure-2: Password File**

	<img src="media/commercial-horizon-password-file.png"/)>

5. Create a tunnel from the Horizon console to the laptop: 

		ssh 192.0.2.1 -R 443:<OVERCLOUD Endpoint IP>:443 -L <laptop IP>:443:127.0.0.1:443

6.	Open the browser on another machine that reach your demo laptop and enter: <br>

	https://&lt;**laptop IP Address**><br>
	**user name**: admin <br>
	**password**: Obtained from the above coped overcloud passwords file.

When you successfully login to the Horizon dashboard, you will see a web page that is similar to the following example:

<img src="media/horizon-dashboard.png"/)>

##Shutdown and recovery {#shutdown-recovery}

The following content describes how to to shutdown the laptop and recover HP OpenStack installation when the laptop restarts.

###Shutdown sequence for the Helion control plane

Before you shut down the laptop and if you would like to preserve the Helion OpenStack installation, you can use the host manager script to save the status of the virtual machines. To do this, follow these steps:

1.	On the laptop, close the existing ssh connection that you initiated in step 5 in the  section [Horizon access](#horizon-access) by running the following command: 

		exit

2.	On the laptop at the command prompt, run the following command:

		tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --save-vms

3.	Power off the physical laptop.


### Recover the Helion setup after restarting the laptop

To recover the HP Helion OpenStack setup after the laptop is powered up, follow these steps:

1.	Log on to the laptop and elevate to root: 

		sudo -i

2.	Issue the following command to restore the cloud:

		tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --resume-vms
	
3.	Repeat the steps in the section [Horizon access](#horizon-access).

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----

