---
layout: default
title: "HP Helion OpenStack&#174; Troubleshooting the Installation"
permalink: /helion/openstack/services/troubleshooting/install/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--

<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/reporting/overview/"> NEXT &#9654</a> </p> --->


# HP Helion OpenStack&#174;  Troubleshooting the Installation

HP Helion OpenStack&#174; is an OpenStack technology coupled with a version of Linux&reg; provided by HP. This topic describes all the known issues that you might encounter. To help you resolve these issues, we have provided possible solutions.

##KVM baremetal issues{#kvm}

* [Fatal PCI Express Device Error](#fatal-pci)
* [IPMI fails with error- unable to establish IPMI v2 / RMCP+ session](#IPMI-fails)
* [Failure of Update overcloud](#failure-update-overcloud)
*  [Installation failure as the flavor to be used for overcloud nodes does not match](#installation-failure)
*  [PXE boot on target node keeps switching between interfaces](#PXE-boot-on-target)
*  [BIOS clocks are not set to correct date and time across all nodes](#BIOS-clocks-are-not-set-to-correct-date)
*  [iLO console shows hLinux daemon.err tgtd while PXE booting](#ilo-console)
*  [iLO console shows null waiting for notice of completion while PXE booting](#ilo-show-null)
*  [Failure of Hp_ced_installer.sh](#failure-installer)
*  [Failure of Seed Installation](#seed-install-failure)

##Fatal PCI Express Device Error {#fatal-pci}

**System Behavior/Message**

When installing on HP ProLiant SL390s and HP ProLiant BL490d systems, the following error has occasionally occurred:

    `Fatal PCI Express Device Error PCI Slot ?
     B00/D00/F00`


**Resolution**

If you get this error, reset the system that experienced the error:

   1. Connect to the iLO using Internet Explorer:
        `https://<iLO IP address>`
   2. Navigate to Information / Diagnostics.
   3. Reset iLO.
   4. Log back into the iLO after 30 seconds.
   5. Navigate to Remote Console / Remote Console.
   6. Open the integrated remote console (.NET).
   7. Click Power switch / Press and Hold.
   8. Click Power switch / Momentary Press, and wait for the system to restart.

   The system should now boot normally.

* If the overcloud controller is rebooted (due to a power issue, hardware upgrade, or similar event), OpenStack compute tools such as `nova-list` might report that the VMs are in an ERROR state, rendering the overcloud unusable. To restore the overcloud to an operational state, follow the steps below:
 
  1. As user `root` on the overcloud controller you must:
  
        A. Run the `os-refresh-config` scripts:

            # os-refresh-config

        B. Restart the `mysql` service:

            # service mysql restart

        C. Re-run the `os-refresh-config` scripts:

            # os-refresh-config

        D. Restart all Networking Operations (Neutron) services:

            # service neutron-dhcp-agent restart
            # service neutron-l3-agent restart
            # service neutron-metadata-agent restart
            # service neutron-openvswitch-agent restart
            # service neutron-server restart

  2. On each overcloud node, restart the Neutron and Nova services:
  
            $ sudo service neutron-openvswitch-agent restart
            $ sudo service nova-compute restart
            $ sudo service nova-scheduler restart
            $ sudo service nova-conductor restart


* The installer uses IPMI commands to reset nodes and change their power status. Some systems change to a state in which the `Server Power` status as reported by the iLO is stuck in `RESET`. If this occurs, you must physically disconnect the power from the server for 10 seconds. If the problem persists after that, contact HP Support as there might be a defective component in the system.

* On the system on which the installer is run, the seed VM's networking is bridged onto the external LAN. If you remove HP Helion OpenStack, the network bridge persists. To revert the network configuration to its pre-installation state, run the following commands as user root: 

        # ip addr add 192.168.185.131/16 dev eth0 scope global
        # ip addr del 192.168.185.131/16 dev brbm
        # ovs-vsctl del-port NIC

     where
       * eth0 is the external interface     
       * 192.168.185.131 is the IP address on the external interface - you should replace this with your own IP address.
       * The baremetal bridge is always called 'brbm'

* Before you install the HP Helion OpenStack DNSaaS or if you want to use Heat with HP Helion OpenStack, you **must** modify the /etc/heat/heat.conf file on the overcloud controller as follows.

    **Important**: The installation of the HP Helion OpenStack DNSaaS fails if you do not make these modifications.

    1. Make sure the IP address in the following settings reflects the IP address of the overcloud controller, for example:
    
            heat_metadata_server_url = http://192.0.202.2:8000
            heat_waitcondition_server_url = http://192.0.202.2:8000/v1/waitcondition
            heat_watch_server_url = http://192.0.202.2:8003

        **Note**: You must have admin ssh access to the overcloud controller.

    2. Save the file.
    3. Restart the Heat-related services &ndash; heat-api, heat-api-cfn, heat-api-cloudwatch, and heat-engine.

    4. Ensure there are no Heat resources in an error state, and then delete any stale or corrupted Heat-related stacks.
<br><br>
<hr>


##IPMI fails with an error- unable to establish IPMI v2 / RMCP+ session {#IPMI-fails}

**System Behavior/Message**

When installing on HP ProLiant BL490c systems, the following error has occasionally occurred:


    unable to establish IPMI v2 / RMCP+ session

**Resolution**

If you get this error, perform the following steps:

1. Ensure that the iLO user has administrator privileges, which is required by the IPMITOOL.
2. To check from the iLO remote console, reboot the server and press **F8** to get to iLO Management screen.
3. Click **User** in the menu-bar and select **Edit**. Edit User pop-up box displays .
4. If you are using a BL server in the QA C7000 enclosure, select the **cdl** user to edit.
5. Use &darr;(down arrow key) to select **Administer User Accounts**. 
6. Use the space bar to set the value to **YES**.
7. Select **F10** to save.
8. Click **File** and select **Exit** to close.
<br><br>
<hr>


## Failure of Update overcloud {#failure-update-overcloud}

**System Behavior/Message**

Update overcloud fails with the following error:

 `  Inconsistency between heat description ($OVERCLOUD_NODES) and overcloud configuration ($OVERCLOUD_INSTANCES)`

**Resolution**

If you get this error, perform the below steps:

 1. Log in to Seed.
 
		# ssh root@<Seed IP address>

2. Edit `/root/tripleo/ce_env.json `and update the right variable for build&#95;number and installed&#95;build&#95;number. <!-- (CORE-1697) -->

The ce&#95;env&#95;json will be displayed as the sample below.

		  "host-ip": "192.168.122.1", 
		   "hp": { 
		     "build_number": 11, 
		     "installed_build_number": 11 

  Note that  the build&#95;number is changed from null to the right variable.
 
3.Run the installer script to update the overcloud. 
 
		# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update_cloud.log

During the installation, the number of build&#95;number and installed&#95;build&#95;number that you specified are installed.
<br>
<hr>


## Installation failure as the flavor to be used for overcloud nodes does not match {#installation-failure}

**System Behavior/Message**

If you have a set of Baremetal servers which differ in specifications (e.g. memory and disk), the installation will fail as the flavor to be used for overcloud nodes does not match with the server that has the lowest specification for memory, disk, and CPU. 

**Probable Cause**

 The 2nd row in `baremetal.csv` which corresponds to the overcloud Controller node is used to create a flavor for the overcloud nodes.  

**Resolution**

Edit the **baremetal.csv** file to define the lowest specification server in the second row.
<br><br>
<hr>

###PXE boot on target node keeps switching between interfaces {#PXE-boot-on-target}

**System Behavior/Message**

When node boots up on iLO console it shows node waiting for PXE boot on multiple NICs.


**Probable Cause**

 Multiple NICs are enabled for Network Boot.


**Resolution**

* Reboot the node, using **F9** to get to the BIOS configuration.
* Assuming NIC1(eth0/em1) for the node is connected to a private network shared across node enable it for Network Boot.
* Select System Options > Embedded NICs.
* Set NIC 1 Boot Options = Network Boot.
* Set NIC 2 Boot Options = Disabled.
<br><br>
<hr>

### BIOS clocks are not set to correct date and time across all nodes {#bios-clocks-are-not-set-to-correct-date}


**System Behavior/Message**

Nodes PXE boot but ISCSI does not start.


**Probable Cause**

Time and date across nodes are incorrect.


**Resolution**

Reboot the node, using **F9** to get to the BIOS configuration. BIOS date and time are set correctly and the same on all the systems.

* Select Date and Time.
* Set the Date.
* Set the Time.
* Use the &lt;ENTER> key to accept the new date and time.
* Save the BIOS, which reboots the node again.
* Once the node has rebooted, you can confirm its data and time from the iLO Overview.
<br><br>
<hr>

### iLO console shows hLinux daemon.err tgtd while PXE booting {#ilo-console}

**System Behavior/Message**

PXE boot gets stuck after `daemon.err tgtd`


**Probable Cause**

Node does not have enough disk space


**Resolution**

* Check if target node has disk space mentioned in `baremetal.csv` and is greater than Node_min_disk mentioned in `tripleo/tripleo-incubator/scripts/hp_ced_functions.sh`.
* If disk space is less than Node&#95;min&#95;disk, change Node&#95;min&#95;disk along with DISK&#95;SIZE in `tripleo/tripleo-incubator/scripts/hp_ced_list_nodes.sh` on Seed.
* Re-run the installation script.
<br>
<hr>

### iLO console shows null waiting for notice of completion while PXE booting {#ilo-show-null}

**System Behavior/Message**

Node is powered on and PXE booted but it is powered off after `daemon.err` and stack create fails.

**Probable Cause**

Node does not have enough disk space. SAN boot is enabled for node or local disk is not attached to `/sda`

**Resolution**

Installer expects that SAN boot option is disabled for nodes. Verify whether SAN boot is disabled for BL 490c.

Also, you can boot the targeted BL490c with Ubuntu or any Linux ISO to see what device is shown as the local disk. For the installer it should be `/sda`.

<hr>

### Failure of Hp&#95;ced_installer.sh {#failure-installer}

**System Behavior/Message**

`Hp_ced_installer.sh` fails because of `baremetal.csv /sda`.


**Resolution**

Verify `baremetal.csv` for empty lines or special characters.
<br><br>
<hr>
### Failure of Seed Installation {#seed-install-failure}


**System Behavior/Message**

Seed installation fails with no space left on device.


**Resolution**

Verify the tripleo directory- user owner and group. It must be **root:root**. Incase it is not set as **root:root** then edit it to root using- `chown root:root tripleo`

<br><br>
<hr>

**System Behavior/Message**

Inconsistent Rabbitmq failure seen on controller nodes while listing queues 

	rabbitmqctl list_queues


**Resolution**

Restart the Rabbitmq service.

<hr>

**System Behavior/Message**

Node goes into ERROR state and/or Ironic commands may result in a 400 or a 403 error code.
A a node being controlled bye the seed or undercloud may not be able to control either through Ironic or Nova.

**Resolution**

Check to be made:
Run the following command:

	$mysql --defaults-file=/mnt/state/root/metadata.my.cnf   
	--socket /var/run/mysqld/mysqld.sock ironic -e 
	"select reservation from nodes;"


If the return form the command was not Null repeat the command to see if ironic is legitimately holding the lock.

If on the second attempt the Lock was was still not NULL run the following:

	mysql --defaults-file=/mnt/state/root/metadata.my.cnf \
    --socket /var/run/mysqld/mysqld.sock ironic \
     -e 'update nodes set reservation=NULL where reservation is not null;'

Repeat the tests on the ironic reservation:

	$mysql --defaults-file=/mnt/state/root/metadata.my.cnf   
	--socket /var/run/mysqld/mysqld.sock ironic -e "select reservation from nodes;"

You should now be able to once again use ironic commands for the node.

If you were using Nova and the node when to ERROR use 

	nova reset-state 

to clear the error and rerun the original Nova command.



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>


