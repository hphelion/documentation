---
layout: default
title: "HP Helion OpenStack&#174; Orchestration High Availability Service Overview"
permalink: /helion/openstack/services/troubleshooting/
product: commercial.ga

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--

<p style="font-size: small;"> <a href="/helion/openstack/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/reporting/overview/"> NEXT &#9654</a> </p> --->


# HP Helion 1.0 1.0 OpenStack&#174;  Troubleshooting

HP Helion OpenStack&#174; is an OpenStack technology coupled with a version of Linux&reg; provided by HP. This topic describes all the known issues that you might encounter. To help you resolve these issues, we have provided possible solutions.

For easy reference, we categorized the known issues and solutions as follows:

* [Baremetal installation](#baremetal-install)
	* [KVM](#kvm)
	* [ESX and OVSvAPP](#esx-ovsvapp)
* [VSA](#vsa)
* [Failure of newly added compute or VSA node during Scale-out](#failnew)
* [Scale-out nodes : os-refresh-configuration fails on Controller Node](#refreshfails)
* [Configuring the dnsmasq_dns_servers list for the undercloud and overcloud](#config_dnas)
* [Logging](#logging)

If you need further assistance, contact [HP Customer Support](http://www.hpcloud.com/about/contact).


## Baremetal installation {#baremetal-install}

###KVM {#kvm}

1. [Fatal PCI Express Device Error](#fatal-pci)
2. [IPMI fails with error- unable to establish IPMI v2 / RMCP+ session](#IPMI-fails)
3. [Failure of Update overcloud](#failure-update-overcloud)
4. [Installation failure as the flavor to be used for overcloud nodes does not match](#installation-failure)
5. [PXE boot on target node keeps switching between interfaces](#PXE-boot-on-target)
6. [BIOS blocks are not set to correct date and time across all nodes](#BIOS-blocks-are-not-set-to-correct-date)
7. [iLO console shows hLinux daemon.err tgtd while PXE booting](#ilo-console)
8. [iLO console shows null waiting for notice of completion while PXE booting](#ilo-show-null)
9. [Failure of Hp_ced_installer.sh](#failure-installer)
10. [Failure of Seed Installation](#seed-install-failure)
11. [Ironic intermitently set maintenance mode to True during update](#ironic)

###Fatal PCI Express Device Error {#fatal-pci}

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


###IPMI fails with an error- unable to establish IPMI v2 / RMCP+ session {#IPMI-fails}

**System Behavior/Message**

When installing on HP ProLiant BL490c systems, the following error has occasionally occurred:


    unable to establish IPMI v2 / RMCP+ session

**Resolution**

If you get this error, perform the following steps:

1. Ensure that the iLO user has administrator privileges, which is required by the IPMITOOL.
2. To check from the iLO remote console, reboot the server and press **F8** to get to ILO Management screen.
3. Click **User** in the menu-bar and select **Edit**. Edit User pop-up box displays .
4. If you are using a BL server in the QA C7000 enclosure, select the **cdl** user to edit.
5. Use &darr;(down arrow key) to select **Administer User Accounts**. 
6. Use the space bar to set the value to **YES**.
7. Select **F10** to save.
8. Click **File** and select **Exit** to close.
<br><br>
<hr>


### Failure of Update overcloud {#failure-update-overcloud}

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


### Installation failure as the flavor to be used for overcloud nodes does not match {#installation-failure}

**System Behavior/Message**

If you have a set of Baremetal servers which differ in specifications (e.g. memory and disk), the installation will fail as the flavor to be used for overcloud nodes does not match with the server that has the lowest specification for memory, disk, and CPU. 

**Probable Cause**

 The 2nd row in `baremetal.csv` which corresponds to the overcloud Controller node is used to create a flavor for the overcloud nodes.  

**Resolution**

Edit the **baremetal.csv** file to define the lowest specification server in the second row.
<br><br>
<hr>



####PXE boot on target node keeps switching between interfaces {#PXE-boot-on-target}

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

####BIOS blocks are not set to correct date and time across all nodes {#bios-blocks-are-not-set-to-correct-date}


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

####iLO console shows hLinux daemon.err tgtd while PXE booting {#ilo-console}

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

####iLO console shows null waiting for notice of completion while PXE booting {#ilo-show-null}

**System Behavior/Message**

Node is powered on and PXE booted but it is powered off after `daemon.err` and stack create fails.

**Probable Cause**

Node does not have enough disk space. SAN boot is enabled for node or local disk is not attached to `/sda`

**Resolution**

Installer expects that SAN boot option is disabled for nodes. Verify whether SAN boot is disabled for BL 490c.

Also, you can boot the targeted BL490c with Ubuntu or any Linux ISO to see what device is shown as the local disk. For the installer it should be `/sda`.

<br>
<hr>

####Failure of Hp&#95;ced_installer.sh {#failure-installer}

**System Behavior/Message**

`Hp_ced_installer.sh` fails because of `baremetal.csv /sda`.


**Resolution**

Verify `baremetal.csv` for empty lines or special characters.
<br><br>
<hr>
####Failure of Seed Installation {#seed-install-failure}


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

<br><br>
<hr>

## Ironic intermitently set maintenance mode to True during installation {#ironic}

This issue can happen during the update of undercloud or overcloud nodes. The update will fail for one or more nodes. <!-- CORE-2082 -->

**System Behavior/Message:**

If the update fails, from undercloud node:

1. Source the stackrc file:
 
		source stackrc 

2. Execute the `nova list` command to determine which Compute node(s) is in an error state. The node will have a status of ERROR.

		nova list

3. Execute the `heat stack-list` command to determine which Heat stack is in an error state. The stack will have a status of `CREATE_FAILED`.

		heat stack-list

3. Execute the `ironic node-list` command to determine which node(s) is in maintenance mode. The stack will have a maintenance of `TRUE`.

		ironic node-list

3. Execute the `ironic node-show` command for the node that is node(s) is in maintenance mode. The stack will have a maintenance of `TRUE`.

		ironic node-show <UUID>

	In the output, check the `last_error` field for an error similar to the following:

		During sync_power_state, max retries exceeded for node 81baacd5-657e-476f-b7ef, node state None does not match expected state

		'None'. Updating DB state to 'None' Switching node to maintenance mode. 


**Solution**

1. Remove the node in maintenance mode using the following command:

		nova node-delete <ID of error node>

2. List the stacks using the following command:

		heat stack-list


3. Delete the stack with the failed Nova node.

		heat stack-delete <ID of failed node>

4. Change the node(s) to false for the maintenance option, using the following command:
		
		`ironic node-update <id> replace maintenance=False`


## ESX and OVSvAPP {#esx-ovsvapp}

1. [nova-manage service list does not list the compute service as running](#nova-compute)
2. [Unable to login to vCenter proxy agent](#unable-login-vcenter)
3. [Unable to backup volumes using Cinder backup](#unable-cinder-backup)
4. [Failure of OVSvAPP deployment](#fails-ovsvapp)


###nova-manage service list does not list the compute service as running {#nova-compute}

**System Behavior/Message**

There can be multiple reason why nova-compute service is not listed or has a :) as status.

**Resolution**

To resolve the above issue verify the following:

1.	The ESX Management Network is able to reach the Helion Management Network.
2.	nova-compute service is running (os-svc-restart &#45;n nova-compute).
3.	Verify `/etc/nova/nova-compute.conf` has the right entries.
<br>
<hr>

### Unable to login to vCenter proxy agent {#unable-login-vcenter}

**System Behavior/Message**

 Unable to login to vCenter proxy agent through the console.

**Resolution** 

Users can login to the system using the user `heat-admin ` and the authorized key in the Seed VM.
<br><br>
<hr>

### Unable to backup volumes using Cinder backup {#unable-cinder-backup}

**System Behavior/Message**

 Unable to backup volumes using Cinder backup.

**Resolution**

Cinder-backup is not supported.
<br><br>
<hr>

###Failure of OVSvAPP deployment {#fails-ovsvapp}

**System Behavior/Message**

Failure of OVSvAPP deployment.

**Resolution**

Verify `tripleo/hp-ovsvapp/log/ovs_vapp.log` in the installer directory.

<br><br>
<hr>

**System Behavior/Message**

After reboot of Controller that has the VIP assigned, the hpvcn agent, nova-compute service, nova compute service in the proxy node and HCN agent in OVSvAPP needs to be restarted manually to resume normal operations.

**Resolution**

* To restart nova-compute, execute the following command in compute proxies

		# service nova-compute restart  

* To restart HP VCN agent, execute the following command in OVSvAPP vm's

		#service hpvcn-neutron-agent restart 
<br><br>
<hr>
##VSA {#vsa}

1. [Failure to retrieve netmask from vsa-bridge](#fails-retrieve-netmask)
2. [Installation script detects more than 7 available drive](install-script-detect)
3. [Failure of script due to less than two drives](#failure-script)
4. [Cannot enable AO as only one disk is available](#cannot-enable-ao)
5. [Unable to update the default input json file ](#unable-update-json)
6. [Virtual bridge creation failed for interface <NIC>](#fail-virtual-bridge)
7. [Creation of storage pool failed](#storage-pool-fail)
8. [Failed during post VSA deployment](#post-vsa-fail)
9. [vsa&#95;network cannot be destroyed](#vsa-network)
10. [vsa&#95;storage&#95;pool pool cannot be destroyed](#vsa-pool-cannot-destroy)



###Failure to retrieve netmask from vsa-bridge {#fails-retrieve-netmask}

**System Behavior/Message**
 
Cannot retrieve netmask from interface vsa-bridge

**Probable Cause**

VSA deployment script determines the net-mask and gateway details from the provided interface. When there is no IP address assigned to the VSA bridge, this error may occur.

**Resolution**

To resolve this issue, perform the following steps:

* Check whether the IP address is allocated for the VSA bridge 

* Verify the VSA IP address by using the following command:

  		ifconfig vsa-bridge

<br>
<hr>

###Installation script detects more than 7 available drive {#install-script-detect}

**System Behavior/Message**

Maximum supported devices 7.

**Probable Cause**

This issue occurs when there are more than 7 available drives detected by the installation script to deploy StoreVirtual.

**Resolution**

Perform the following steps:

* HP StoreVirtual VSA supports up to 7 disks

* Execute `fdisk &#45;l` and check for number of available drives in the machine other than `/dev/sda`

<br>
<hr>

###Failure of script due to less than two drives {#failure-script}

**System Behavior/Message**

Minimum number of disks must be 2. No disks are available.

**Probable Cause**
When there are less than two drives in the machine, the script will fail to execute.

**Resolution**

To resolve, perform the following steps:

* Execute `fdisk &#45;l`

* Minimum two drives and maximum of 7 drives should be available for the StoreVirtual deployment other than boot disk(`/dev/sda`)

* At least three drives required for enabling AO
<br>
<hr>

### Cannot enable AO as only one disk is available {#cannot-enable-ao}

**Probable Cause**

For Adaptive Optimization to be enabled, at least three drives must be available. `/dev/sdb` must be SSD drive(Tier 0) and the remaining will be Tier 1.

**Resolution**

To resolve the issue, do the following:

* Use RAID controllers to create RAID groups.

* Ensure that you create the RAID group for SSD drives immediately after creating the RAID group for boot volume. For example: If three RAID groups are to be created. The following is recommended :
	
	* **Step 1** : Create the first RAID group for HDD drives and mark this as boot volume(/dev/sda)

	* **Step 2**: Create the second RAID group for SSD drives which should be used as Tier 0 for AO (/dev/sdb)

	* **Step 3**: Create the third RAID group for HDD drives which will be used as Tier 1(/dev/sdc)

<br><hr>


### Unable to update the default input json file {#unable-update-json}

**System Behavior/Message**

Parsing the default JSON file failed. Unable to update the default input json file.

**Probable Cause**

The script will parse the configuration file and update the values based on the network and configuration files.

**Resolution**

Perform the following steps:

* Verify whether the JSON content is valid in the following files:

	* `/home/vsa-installer/pyVins/etc/vsa/vsa_config.json`

	* `/etc/vsa/vsa_network_config.json`

<br><hr>
###Creation of storage pool failed {#storage-pool-fail}

**Probable Cause**

Virtual storage pool will be created for placing the extracted VSA VM image. The storage pool will be created based on local directory  on `/mnt/state/vsa-kvm-storage`

**Resolution**

Perform the following steps:

* Check whether `/mnt/state/vsa-kvm-storage` directory is available.

* Verify for available space to create storage pool in the system.

* Check the libvirt logs for more errors

Refer `/var/log/libvirt/libvirt.log` on VSA system.
 
<br><hr>

###Failed during post VSA deployment {#post-vsa-fail}

**Probable Cause**

The script will persist required files in `/mnt/state/vsa` which will be used for recreating the VSA VM during re-imaging scenario

**Resolution**

This error will occur if the script fails to find `network_vsa.xml`, `storagepool_vsa.xml` and other configuration files which has to be preserved.

* Check for the configuration files on &rdquo;/&lsquo; path.

* On success, the script updates the `/mnt/state/vsa/vsa_config.json` file with the updated and created time.

<br><hr>

###VSA installation failed {#vsa-install-fail}

**Probable Cause**

When VSA installation fails for any of the above reasons, the script will rollback the network and storage pool.

**Resolution**

Verify the `/installer.log`

<br><hr>


###vsa&#95;network cannot be destroyed {#vsa-network}

**Probable Cause**

VSA network will be destroyed when the VSA installation fails.

**Resolution**

Perform the following steps:

* Check whether the network is already undefined

* Check whether the network name in `<PYVINS_DIRS>/etc/vsa/vsa_config.json` is the same as in the output of `virsh net-list -all` command

<br><hr>

### vsa&#95;storage&#95;pool pool cannot be destroyed {#vsa-pool-cannot-destroy}

**Probable Cause**

The storage pool will be destroyed when VSA installation fails

**Resolution**

Perform the following:

* Verify whether the storage pool is already undefined

* Verify whether the pool name is same as in `<PYVINS_DIRS>/etc/vsa/vsa_config.json`

* Virsh command to list the pools

        Virsh pool-list --all

<br><hr>



<!---
##Configuring the dnsmasq_dns_servers list for the undercloud and overcloud {#config_dnas}
=======
## Failure of newly added compute or VSA node during Scale-out {#failnew}

**System Behavior/Message**

The newly added compute node or VSA node fails during scale-out.

**Resolution**

You must remove a failed compute or VSA node before adding a new compute node.

Perform the following steps to remove a failed compute node:

1. Run `heat stacklist`on the undercloud node and search for the failed stack.

2. Delete the failed stack using the following command:

		# heat stackdelete <stackname or uuid>

3. List the newly added nova node which is created during scale-out.

		# novalist

4. Execute the following command to delete nova node. Node name and the Node ID can be obtained from the above steps.

		# nova delete <node name or node id>

5. View a newly added node using the following command:

		# ironic nodelist

6. If newly added node is in ERROR state or if the maintenance mode is True then remove those node(s) using the following command.

		# ironic nodedelete <uuid>

	where uuid is the ID of the node

<HR>

## Scale-out nodes : os-refresh-configuration fails on Controller Nodes {#refreshfails}

**System Behavior/Message**

The os-refresh-config on the controller Nodes fail during scale-out.

**Probable Cause**

The controller nodes can fail due to following reasons:

* RabbitMQ clustering
* MySQL clustering

**Resolution**

To resolve RabbitMQ cluster issue:

* Use the following command and verify the running status of RabbitMQ.

	status rabbitmqserver

If RabbitMQ is not running, start RabbitMQ using the `start rabbitmqserver` command.

* Verify that the `rabbitmqctl cluster_status` displays all 3 nodes in `running_nodes` and disc. If it does not display one or more nodes in running nodes then restart RabbitMQ and run the following command on the missing nodes:

	rabbitmqctl join_cluster <clusternode>

* If rabbitmqctl cluster_status displays expected output but there is an issue with one or more node(s) for joining RabbitMQ cluster, do the following:

	1. Execute the following commands on all controller nodes:

			pkill u rabbitmq

	2. Run `osrefreshconfig` command first on the `cluster_name` (`rabbitmqctl cluster_status` output) and then on the remaining controller nodes.

**To resolve MySQL cluster issue**

1. Use the following command and verify the running status of MySQL on the node.

		/etc/init.d/mysql status

	If mysql has stopped, restart it.

2. If MySQL fails to restart, perform the following instructions:

* Run mysqld_safe wsreprecover on all the controller nodes.
* Compare the output from all controller nodes for last committed transaction sequence number. For example:

		root@overcloudcecontrollercontroller0defen5afl75f:~#
		mysqld_safe wsreprecover
		sed: -e expression #1, char 25: unknown option to `s'
		sed: -e expression #1, char 24: unknown option to `s'
		141113 01:00:36 mysqld_safe Logging to '/mnt/state/var/log/mysql/error.log'.
		141113 01:00:36 mysqld_safe Starting mysqld daemon with databases from /mnt/state/var
		141113 01:00:36 mysqld_safe Skipping wsreprecover for 1e9d939a6a0711e49c28aa3122
		141113 01:00:36 mysqld_safe Assigning 1e9d939a6a0711e49c28aa31223485e0:220764 to 141113 01:00:38 mysqld_safe mysqld from pid file /var/run/mysqld/mysqld.pid ended 

	So the last committed transaction sequence number on this node is 220764.

* Compare the last committed transaction sequence number across all 3 nodes and bootstrap from the latest node using `/etc/init.d/mysql bootstrappxc` or `/etc/init.d/mysql restart` and start MySQL on the remaining nodes.

<HR>

##Configuring the `dnsmasq_dns_servers` list for the undercloud and overcloud {#config_dnas}
>>>>>>> b9d57eb337ad163596659fb19b8dbd01770325a1

To enable name resolution from tenant VMs in the overcloud, it is necessary
to configure the DNS servers which will be used by `dnsmasq` as forwarders.  To
perform this:

1. Edit the `overcloud_neutron_dhcp_agent.json` file in the
`ce-installer/tripleo/hp_passthrough` directory to add the desired `dnsmasq_dns_servers`
items. 
2. Copy the `overcloud_neutron_dhcp_agent.json` file to a
new file named `undercloud_neutron_dhcp_agent.json` and configure the same
forwarders for the undercloud.

	
		{"dhcp_agent":
		  {"config":
		    [
		      {"section":"DEFAULT",
		        "values":
		          [
		            {"option":"dhcp_delete_namespaces","value":"True"},
		            {"option":"dnsmasq_dns_servers", "value":"0.0.0.0"}  <----set the value to the ip
		                                                                      address of the DNS server
		                                                                      to use.  Multiple DNS
		                                                                      servers can be specified
		                                                                      as a comma separated list.
		          ]
		      }
		    ]
		  }
		}

<hr>
---->

##Recovery when Scale-out nodes of newly added compute node or VSA

***System Behavior/Message***

The newly added compute node or VSA node fails during scale-out.


**Resolution**

You must remove a failed compute node before adding a new compute node.

Perform the following steps to remove a failed compute node:

1. Run `heat stack-list` on the undercloud node and search for failed stack.
2. Delete the failed stack using the following command:
		
		# heat stack-delete <stackname or uuid>

3. List the newly added nova node which is created during scale-out.

		# nova-list

4. Execute the following command to delete nova node. Node name and ID is obtained from step 3.
 	
		# nova delete <name or id>

5. View a newly added node using the following command:

		# ironic node-list
 
6. If newly added node is in **ERROR** state or it has maintenance as **True** then remove those node(s) using following command.

		# ironic node-delete <uuid>, where uuid is the ID of the node

<hr>

##Scale-out nodes : os-refresh-config on Controller Nodes Fail

***System Behavior/Message***

The os-refresh-config on controller Nodes fail during scale-out.

***Probable Cause***

The controller nodes can fail due to following reasons:

* wrong user input

* rabbitmq clustering

* mysql clustering

**Resolution**

**To resolve rabbitmq cluster issue** 

* Use the following command and verify the running status of rabbitmq.
 
		status rabbitmq-server 

 If rabbitmq is not running, start rabbitmq  using `start rabbitmq-server` command.

* Verify that the `rabbitmqctl cluster_status` displays all 3 nodes in `running_nodes`, disc. If it does not display one or more nodes in running nodes then restart rabbitmq and run the following command on the missing nodes:

		rabbitmqctl join_cluster <clusternode>


* If `rabbitmqctl cluster_status` shows expected output but there is an issue with one or more node(s) for joining rabbitmq cluster, do the following:

	1. Execute the following commands on all controller nodes:
		
			pkill -u rabbitmq  
 
	2. Run `os-refresh-config`  command first on the `cluster_name` (rabbitmqctl cluster_status output) and on the remaining controller nodes.




**Resolve mysql cluster issue**

1. Use the following command and verify the running status of mysql on the node.

		/etc/init.d/mysql status

	If mysql has stopped, restart it.
 
4.  If mysql fails to restart, perform the following instructions:

	* Run  `mysqld_safe --wsrep-recover` on all controller nodes.
	* Compare the output from all controller nodes for last committed transaction sequence number. For example:

			root@overcloud-ce-controller-controller0-defen5afl75f:~# mysqld_safe --wsrep-recover
			sed: -e expression #1, char 25: unknown option to `s'
			sed: -e expression #1, char 24: unknown option to `s'
			141113 01:00:36 mysqld_safe Logging to '/mnt/state/var/log/mysql/error.log'.
			141113 01:00:36 mysqld_safe Starting mysqld daemon with databases from /mnt/state/var/lib/mysql/
			141113 01:00:36 mysqld_safe Skipping wsrep-recover for 1e9d939a-6a07-11e4-9c28-aa31223485e0:220764 pair
			141113 01:00:36 mysqld_safe Assigning 1e9d939a-6a07-11e4-9c28-aa31223485e0:220764 to wsrep_start_position
			141113 01:00:38 mysqld_safe mysqld from pid file /var/run/mysqld/mysqld.pid ended
 
 	So the last committed transaction sequence number on this node is 220764. 

	* Compare the last committed transaction sequence number across all 3 nodes and bootstrap from the latest node using `/etc/init.d/mysql bootstrap-pxc` or `/etc/init.d/mysql restart` and start mysql on the remaining nodes.



##Logging  {#logging}

####Issue in Logging {#issue-in-logging}

The user needs to manually follow the below steps to re-configure Kibana for logging.

1. Log in to the undercloud and start screen session.
2. In the screen, start following command `sudo -u logstash /usr/bin/java -Xmx1g -Djava.io.tmpdir=/var/lib/logstash/ -jar /opt/logstash/logstash.jar agent -f /etc/logstash/conf.d -w 10 --log /var/log/logstash/logstash.log`
3. Press Control **&** '**a**', then '**c**' to create another shell.
4. In a new shell execute command `sudo -u logstash /usr/bin/java -Xmx1g -Djava.io.tmpdir=/var/lib/logstash/ -jar /opt/logstash/logstash.jar agent -f /etc/logstash/conf.d -w 10 --log /var/log/logstash/logstash.log`
5. Repeat steps from **3-4** two times
6. Press Control **&** '**a**' then '**d**' to detach.
 
**Note**: If node reboots repeat the step from **1-6**.

**EDIT**: Added `sudo -u logstash` at beginning of commands. 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>








----
