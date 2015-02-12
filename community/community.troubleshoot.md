---
layout: default
title: "HP Helion OpenStack&reg; Community Issues and troubleshooting"
permalink: /helion/community/troubleshooting/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/">&#9664; PREV</a> | <a href="/helion/community/">&#9650; UP</a> | <a href="/helion/community/install-overview/">NEXT &#9654;</a> </p>
-->

# HP Helion 1.0 OpenStack&reg; Community Issues and troubleshooting 

If you encounter any issues when installing HP Helion OpenStack Community, refer to the following troubleshooting tips.

* If the overcloud controller is rebooted (power issue, hardware upgrade, etc.), OpenStack compute tools such as `nova-list` report that the VMs are in an ERROR state, rendering the overcloud unusable. To restore the overcloud to an operational state, follow the steps below:
  1. As user root on the overcloud controller you must:
  
        a. Run the os-refresh-config scripts:

            os-refresh-config

        b. Restart the mysql service:

            service mysql restart

        c. Re-run the os-refresh-config scripts:

            os-refresh-config

        d. Restart all neutron services:

            service neutron-dhcp-agent restart
            service neutron-l3-agent restart
            service neutron-metadata-agent restart
            service neutron-openvswitch-agent restart
            service neutron-server restart

  2. On each overcloud node, restart the neutron and nova services:
  
            sudo service neutron-openvswitch-agent restart
            sudo service nova-compute restart
            sudo service nova-scheduler restart
            sudo service nova-conductor restart

* On the system on which the installer is run, the seed VM's networking is bridged onto the external LAN. If you remove HP Helion OpenStack Community, the network bridge persists. To revert the network configuration to its pre-installation state, run the following commands as user root: 

        ip addr add 192.168.185.131/16 dev eth0 scope global
        ip addr del 192.168.185.131/16 dev brbm
        ovs-vsctl del-port NIC

	where

	* eth0 is the external interface
	* 192.168.185.131 is the IP address on the external interface - you should replace this with your own IP address.
	* The baremetal bridge is always called 'brbm'


## Known issues and workarounds {#known}

- The following error has been intermittently observed on HP ProLiant SL390s systems on which installs are being performed:

		Fatal PCI Express Device Error PCI Slot ?
		B00/D00/F00

	To reset a system that experiences this error,
	1. Connect to the iLO using a web browser (https://<iLO IP address>)
	2. Navigate to Information / Diagnostics
	3. Reset iLO
	4. Log back into the iLO after 30 seconds
	5. Navigate to Remote Console / Remote Console
	6. Bring up integrated remote console (.NET)
	7. Click Power switch / Press and Hold
	8. Click Power switch / Momentary Press
	9. Wait for system to restart
	10. System should boot normally

- The BIOS must be set to the correct date and time on all systems.

	On HP ProLiant systems you can do the following:
	1. Power UP the server and configure the BIOS (press F9)
	2. Set Date and Time in the BIOS, and exit confirming your selection.
	3. Power the server off prior to installation

- On many HP systems, including HP servers running iLO 3 firmware, the
  iLO time can be set to propagate to the BIOS on powerup.
  You should disable propagation and set the BIOS time to the correct
  date and time on all systems.

	1. Connect to the iLO using a web browser (https://<iLO IP address>)
	2. Navigate to Network/Shared Network Port or the Network/Dedicated Network Port (Primary Time Server, Secondary Time Server, Time Zone, and Time Propagation settings are shared between all iLO Network Ports).
	3. Navigate to SNTP
	4. UNSET 'Propagate NTP Time to Host'
	5. Reset iLO
	6. Follow the steps above to set the time in the BIOS

- If the iLO time propagates to the BIOS, setting an incorrect time,
  the undercloud or overcloud may fail to initialize with the following message:

		Timing out after 60 seconds:
		11:46:38 COMMAND=wait_for_hypervisor_stats 8

	Follow the steps above to set the time in the BIOS correctly.

- The following error has also been observed on the console of a baremetal system during installation when the BIOS date/time are incorrect

		/etc/init.d/open-iscsi: 73: /etc/init.d/open-iscsi: cannot create /etc/iscsi/initiatorname.iscsi: Read-only file system

	Follow the steps above to set the time in the BIOS correctly.

- Filesystem checking on reboot is disabled by default for the seed, undercloud and overcloud nodes. We recommend periodically manually running fsck to verify filesystem integrity.

- These files contain credentials for the undercloud and the overcloud; you
  should ensure that they are securely stored separately from the seed.

		/root/stackrc
		/root/tripleo/tripleo_passwords

- On the seed cloud host (the system on which the installer is run), the seed VM's networking will be bridged onto the external LAN.

	To revert this change, reboot the system then execute this command on the console of the host:

		ovs-vsctl del-port eth0

	If you specified BRIDGE_INTERFACE as something other than eth0 then replace eth0 in the command above with that value.

- If the `hp_ced_host_manager` fails to start the seed, execute the command again (a failure could be the result of a race condition in libvirt).

- If the undercloud controller is rebooted, you must login to it and run the following command as root:

		os-refresh-config

	Failure to do this will prevent subsequent reboots of the overcloud nodes.

- The installation pauses 1-2 minutes loading images and pauses of 12 or more minutes building the undercloud and overcloud.

- The installer script will wait for os-collect-config to complete on the seed but times out after 10 minutes of waiting.

- The installer uses IPMI commands to reset nodes and change their power status. Some systems have been seen to get into a state where the Server Power status as reported by the iLO stays stuck in the "RESET" state. If this occurs, it is necessary to physically remove power from the server for 10 seconds. If the problem persists after that, contact HP Support - there might be a defective component in the system.

- If using the seed vm as your gateway (default setting), you will need to execute the following commands after you have run `hp_ced_host_manager.sh` on the host machine.

		MAC=$(virsh dumpxml --domain seed | grep "mac address" | head -1 | awk -F "'" '{print $2}')
		VM_IP=$(arp -n | grep $MAC | awk '{print $1}')
		ip route replace <BM_NETWORK_CIDR> dev virbr0 via $VM_IP

- The installer now includes an interactive query before running a hardware
  census script at the end of the install. This script is optional.

- ElasticSearch indexes are not deleted automatically. Log data will build up over time, potentially filling the space available, unless managed. To see the indexes, ssh to the undercloud node and run:

		curl "localhost:9200/_cat/indices?v"

	To remove indexes, run this (you must be on the undercloud node):

		curl -XDELETE "localhost:9200/logstash-<DATE>"

	Where <DATE> is in the format "YYYY.MM.DD" EG "2014.09.09".


 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
