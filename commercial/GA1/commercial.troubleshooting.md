---
layout: default
title: "HP Helion OpenStack&#174; Orchestration High Availability Service Overview"
permalink: /helion/openstack/services/ga/troubleshooting/
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


# HP Helion OpenStack&#174;  Troubleshooting

HP Helion OpenStack&#174; is an OpenStack technology coupled with a version of Linux&reg; provided by HP. This topic describes all the known issues that you might encounter. To help you resolve these issues, we have provided possible solutions.

If you need further assistance, contact [HP Customer Support]([http://www.hpcloud.com/about/contact](http://www.hpcloud.com/about/contact)).


## Baremetal installation

* When installing on HP ProLiant SL390s and HP ProLiant BL490d systems, the following error has occasionally occurred:

    `Fatal PCI Express Device Error PCI Slot ?
     B00/D00/F00`

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


##Baremetal Installation

**IPMI fails with error- unable to establish IPMI v2 / RMCP+ session** 

When installing on HP ProLiant BL490c systems, the following error has occasionally occurred:


    unable to establish IPMI v2 / RMCP+ session

If you get this error, reset the system that experienced the error:

1. Ensure that the iLO user has administrator privileges, which is required by the IPMITOOL.
2. To check, from the iLO remote console, reboot the server and press **F8** to get to ILO management screen.
3. Click **User** in the menu-bar and select **Edit**. Edit User pop-up box displays .
4. If you are using a BL server in the QA C7000 enclosure, select the **cdl** user to edit.
5. Use &darr;(down arrow key) to go to the field **Administer User Accounts**. Use the space bar to set the value to YES.
6. Select **F10** to save.
7. Click **File** and select **Exit** to close.


##Installation
####Failure of Update Overcloud 

Update Overcloud fails with the following error:

 `  Inconsistency between heat description ($OVERCLOUD_NODES) and overcloud configuration ($OVERCLOUD_INSTANCES)`

IF you get this error, perform the below steps:

 1. Log in to Seed.
 
		# ssh root@<Seed IP address>

2. Edit `/root/tripleo/ce_env.json `and update the right variable for build&#95;number and installed&#95;build&#95;number.

The ce_env_json will be displayed as the sample below.

		  "host-ip": "192.168.122.1", 
		   "hp": { 
		     "build_number": 11, 
		     "installed_build_number": 11 

Note that  the build&#95;number is changed from null to the right variable.
 
3.Run the installer script to update the Overcloud. During the installation, the number of build number and installed build number that you specified are installed.
 
		# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update_cloud.log



## Baremetal installation

####PXE boot on target node keeps switching between interfaces


<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>When node boots up on iLO console it shows node waiting for PXE boot on multiple NICs.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Multiple NICs are enabled for Network Boot. &nbsp;</td></tr>
<tr style="background-color: white; color: black;">
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td>
<ul>
 <li>Reboot the node, using F9 to get to the BIOS configuration.
 <li>Assuming NIC1(eth0/em1) for the node is connected to a private network shared across node  enable it for Network Boot. </li><ul>
 	<li> Select System Options > Embedded NICs
<li> Set NIC 1 Boot Options = Network Boot
 <li>Set NIC 2 Boot Options = Disabled
</ul>
</td>
</table>





## Software Installation
####BIOS blocks are not set to correct date and time across all nodes


<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Nodes PXE boot but ISCSI does not start</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Time and date across nodes is incorrect</td></tr>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td>Reboot the node, using F9 to get to the BIOS configuration. BIOS date and time is set correctly and the same on all systems.
<ul><li>Select Date and Time
<li>Set the Date
<li>Set the Time
<li>Use the &lt;ENTER> key to accept the new date and time
<li>Save the BIOS, which reboots the node again
<li>Once the node has rebooted, you can confirm its data and time from the iLO Overview
</td>
</table>

##Installation
####iLO console shows hLinux daemon.err tgtd while PXE booting

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>PXE boot gets stuck after daemon.err tgtd</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Node does not have enough disk space</td></tr>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td><ul><li> Check if target node has disk space mentioned in baremetal.csv and is greater than Node_min_disk mentioned in tripleo/tripleo-incubator/scripts/hp_ced_functions.sh 
<li>If disk space is less than Node_min_disk, change Node_min_disk  along with DISK_SIZE in tripleo/tripleo-incubator/scripts/hp_ced_list_nodes.sh  on Seed 
<li> Re-run the installation script 
</ul></li>
</td>
</table>


##Installation
####iLO console shows null waiting for notice of completion while PXE booting


<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>Node is powered on and PXE booted but it is powered off after daemon.err and stack create fails.</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Node does not have enough disk space. SAN boot is enabled for node or local disk is not attached to /sda</td></tr>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td><ul><li> Installer expects that SAN boot option is disabled for nodes. Check if SAN boot is disabled for BL 490c </ul></li>

On virtual connect window, you would see the following UI. It should be marked as disabled. 
<b>I am not able to view the image</b>
<br><br>
Also, you can boot the targeted BL490c with Ubuntu or any Linux ISO to see what device it shows as the local disk. For the installer it should be /sda
</td>
</table>



## Baremetal Installation
####Failure of Hp&#95;ced_installer.sh

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td> Hp&#95;ced_installer.sh fails because of baremetal.csv /sda</td></tr>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td>Verify baremetal.csv for empty lines or special characters
</td>
</table>



## Baremetal Installation
####Failure of Seed Installation

<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td>Seed installation fails with no space left on device </td></tr>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td>Verify the tripleo directory User, Owner, and Group. It must be <b> root:root</b>. If it is not  <b> root:root</b> then change it to root using- <b> chown root:root tripleo<b>

</td>
</table>

##Installation
##NovaCompute node fails when installing overcloud


<table style="text-align: left; vertical-align: top; min-width: 700px;">
<tr style="background-color: #C8C8C8;">
<th colspan="2">Software Component: Installation Dashboard</th>
</tr>
<tr style="background-color: white; color: black;">
<td>System Behavior/Message</td>
<td>NovaCompute node fails with error: BadRequest: object of type 'NoneType' has no len() (HTTP 400)</td></tr>
<tr style="background-color: white; color: black;">
<td>Probable Cause</td>
<td></td></tr>
<tr style="background-color: white; color: black;">
<td>Resolution</td>
<td>
</td>
</table>



##Logging  
####Issue in Logging

The user needs to manually follow the below steps to re-configure Kibana for logging.

1. Log into undercloud and start screen session.
2. In the screen, start following command `sudo -u logstash /usr/bin/java -Xmx1g -Djava.io.tmpdir=/var/lib/logstash/ -jar /opt/logstash/logstash.jar agent -f /etc/logstash/conf.d -w 10 --log /var/log/logstash/logstash.log`
3. Press Control **&** '**a**', then '**c**' to create another shell.
4. In a new shell execute command `sudo -u logstash /usr/bin/java -Xmx1g -Djava.io.tmpdir=/var/lib/logstash/ -jar /opt/logstash/logstash.jar agent -f /etc/logstash/conf.d -w 10 --log /var/log/logstash/logstash.log`
5. Repeat steps from **3-4** two times
6. Press Control **&** '**a**' then '**d**' to detach.
 
Note: Unfortunately has to be repeated if node reboots ??? what has to be repeated entire steps??.

EDIT: Added 'sudo -u logstash' at beginning of commands










----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*