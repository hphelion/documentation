---
layout: default
title: "HP Helion OpenStack&#174; Edition: VSA Support"
permalink: /helion/openstack/ga/backup.restore/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<p style="font-size: small;"> <a href="/helion/openstack/install/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/install/esx/">NEXT &#9654;</a> </p>


# HP Helion OpenStack&#174; Back Up and Restore

This page provides detailed information on how to back up and restore the Seed VM, the undercloud and the Overcloud Management Controller node. 

## Back Up

In case of the Seed VM, the Undercloud or the Overcloud Management Controller node fails you cannot bring the node back on line, we would need a mechanism to restore these 3 nodes. 

The failures and the strategy for backup and restore the nodes is given below:

- Backup the Seed VM
- Backup the undercloud
- Backup CODN in the overcloud 
- Backup MySQL in the overcloud
- Restore the seed VM
- Restore the undercloud
- Restore CODN in the overcloud 
- Restore MySQL in the overcloud
- Re-create overcloud Management Controller
- Re-create overcloud `controller0` / `controller1`


## Restore the Seed VM ## {#seed} 

Since SEED alone failed we would be restoring the SEED QCOW2 and hence customer would get back exactly the same VM that he lost. The Undercloud and Overcloud would not be touched.
Manual steps --- Virtual Mode

1. Run the ce-installer.

		cd ${TRIPLEO_ROOT}/build
		export HOME=/root
		export HP_VM_MODE=y  // Create a set of VMs for when not testing on real hardware, otherwise you will need to provide the baremetal.csv file - see the appropriate READMEs
		sudo -E bash -x tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed
		// Substitute correct NTP servers if known
		sudo ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@192.0.2.1 'export OVERCLOUD_NTP_SERVER=192.0.1.128 UNDERCLOUD_NTP_SERVER=192.0.1.128; bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh'

2. Verify functionality.

		ssh 192.0.2.1
		root@hLinux:~# source stackrc
		root@hLinux:~# nova list
		root@hLinux:~# neutron net-list
		root@hLinux:~# glance image-list
		root@undercloud-undercloud-zwgqfk75uxhb:~# source stackrc
		root@undercloud-undercloud-zwgqfk75uxhb:~# nova list
		root@undercloud-undercloud-zwgqfk75uxhb:~# neutron net-list
		root@undercloud-undercloud-zwgqfk75uxhb:~# glance image-list

3. Make dummy file for restore testing.

		root@hLinux:/mnt/state/root# cat restore.txt
		testing 1
		testing 2
		testing 3

4. Simulate seed being shutdown.

	Use the following command to shut down the Seed VM.

	**Note:** If the seed VM is shut down, skip this step.

		virsh shutdown seed

	If status doesn't change to "shut off" in 5 minutes, quit the script and manually shutdown seed on virt-manger. 

5. Backup `seed.qcow2`.

		mkdir /home/ubuntu/seed_backup
		cp /var/lib/libvirt/images/seed.qcow2 /home/ubuntu/seed_backup/

6. Undefine the seed VM.

		virsh undefine seed

7. Modify the `hp_ced_host_manager.sh` and rename it to `hp_ced_host_manager_new.sh`.

		// Add this right after IMAGE_CACHE_FILE declaration: IMAGE_BACKUP_FILE=/home/ubuntu/seed_backup/seed.qcow2
		// Comment out: cp $IMAGE_CACHE_FILE ${IMAGES_DIR}/$IMAGE_NAME.qcow2
		// Add this right below: cp $IMAGE_BACKUP_FILE ${IMAGES_DIR}/$IMAGE_NAME.qcow2
		// In the function create_seed():
		// Comment out: [ -z "$HP_VM_MODE" ] || config_vm_baremetal
		// Comment out: wait_seed_vm
		// Comment out: [ -z "$HP_VM_MODE" ] || copy_config_vm_baremetal

8. Start creating seed

		cd ${TRIPLEO_ROOT}/build
		export HOME=/root
		export HP_VM_MODE=y 
		sudo -E bash -x tripleo/tripleo-incubator/scripts/hp_ced_host_manager_new.sh --create-seed

9. Network fixes]

	At this point, seed is not reachable vi the default 192.0.2.1, we need to fix network settings by logging into seed with another IP.
	
	Seed VM guest has two interfaces – one is connected to brbm (baremetal network) and the other is to default net (virbr0) provided by KVM host that provides dynamic IP addresses to the guest.

	Use the following command to find out the dynamic IP.

		arp | grep virbr0 | awk '{print $1}'

	You receive a response similar to the following:

		ssh DYNAMIC_IP (e.g. ssh 192.168.122.207)
		root@hLinux:~# vi /etc/udev/rules.d/70-persistent-net.rules

	Find the line (normally the last entry) with the correct NIC MAC address of seed, change the line's NAME="eth2" to NAME="eth1", comment out any other entries whose NAME="eth1", save & quit

	In virt-manager, force off seed then restart, wait for seed up and running

	Add route to 192.0.2.1

		route add -net $BM_NETWORK_CIDR gw $BM_NETWORK_GATEWAY

	Defaults are as follows

		route add -net 192.0.2.0/24 gw 192.168.122.1

10. Verify successful data restore and same output as step 1]

		ssh 192.0.2.1
		root@hLinux:~# cat /mnt/state/root/restore.txt
		root@hLinux:~# service mysql start
		root@hLinux:~# os-refresh-config
		root@hLinux:~# source stackrc
		root@hLinux:~# nova list
		root@hLinux:~# neutron net-list
		root@hLinux:~# glance image-list
		root@undercloud-undercloud-zwgqfk75uxhb:~# source stackrc
		root@undercloud-undercloud-zwgqfk75uxhb:~# nova list
		root@undercloud-undercloud-zwgqfk75uxhb:~# neutron net-list
		root@undercloud-undercloud-zwgqfk75uxhb:~# glance image-list

## Restore to the same host

Use the following steps to restore to the same host:

	bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --export-seed
	virsh undefine seed
	bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --import-seed

## Restore a different host

Use the following steps to restore a different host: from host_1 to host_2.

1. On host_1 make sure the seed VM is shutdown.

2. Perform the following:

		scp /var/lib/libvirt/images/seed.qcow2 ubuntu@15.126.52.77:backup
		scp /var/lib/libvirt/images/seed_options ubuntu@15.126.52.77:backup
		scp /root/.ssh/id_rsa ubuntu@15.126.52.77:backup
		scp /root/.ssh/id_rsa.pub ubuntu@15.126.52.77:backup
		virsh undefine seed

3. On host_2 (no seed vm on host)

		mkdir /home/ubuntu/backup
		*** modify hp_ced_host_manager.sh to be hp_ced_host_manager_new.sh with this line changed ----> export IMAGE_CACHE_FILE=/home/ubuntu/backup/seed.qcow2
		cp /home/ubuntu/backup/id_rsa /root/.ssh
		cp /home/ubuntu/backup/id_rsa.pub /root/.ssh
		export BRIDGE_INTERFACE=brbm
		bash -x /root/work/tripleo/tripleo-incubator/scripts/hp_ced_host_manager_new.sh --create-seed
		SEED_IP=`arp | grep virbr0 | awk '{print $1}'`
		ssh $SEED_IP touch /etc/udev/rules.d/70-persistent-net.rules
		ssh $SEED_IP "echo `tail -1 /etc/udev/rules.d/70-persistent-net.rules | sed 's/eth2/eth1/g'` > /etc/udev/rules.d/70-persistent-net.rules"
		virsh destroy seed
		virsh start seed
		route add -net 192.0.2.0 netmask 255.255.255.0 gw 192.168.122.1


## Automatic steps

When Seed is shutdown due to disaster, run the following scripts 

		cd ${TRIPLEO_ROOT}/build
		./tripleo/tripleo-incubator/scripts/hp_ced_backup.sh --seed -f dest_host_folder [-H dest_host_ip] [-u dest_host_user] [-i identity_file]
		./tripleo/tripleo-incubator/scripts/seed_restore.sh --seed -f source_host_folder [-H source_host_ip] [-u source_host_user] [-i identity_file]

Now Seed shall be restored

hp_ced_backup.sh

hp_ced_restore.sh

Note: After taking the latest looks like community has solved this problem and we have an to export the Seed and import it again. All functionality on VM mode seems to be working. We need to test the communities solution so that the new Seed VM is recreated on a different host. 

 
## Restore the undercloud 

If the undercloud server fails, the approach is to recreate both the seed and undercloud in ordeer to retain networking details and it is quicker to restore both. 

The backup tool will backup following data:

- From the seed VM: 
	- the tripleo/tripleo-undercloud-passwords files
	- tripleo-overcloud-passwords password files
	- testenv.json file
	- undercloud-env.json file

- From the Undercloud machine 

		- backup /mnt file
		- /tftpboot file
		- ls /etc/mysql/static-dbusers.json file

The tool will backup the current undercloud image.


1. Destroy SCC and UCC.

	When the restore process needs to be executed, run the following on on the seed VM:

		virsh destroy seed
		virsh undefine seed
		virsh destroy baremetal_0
		virsh undefine baremetal_0

2. Recreate the seed VM.

	Recreate the undercloud vm in case using vm mode of install.

	On a virtual server, run the following command:

		HP_VM_MODE=y bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_start_seed.sh

	On a baremetal server, use the following command: 

	bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_start_seed.sh

3. Copy over the `tripleo/tripleo-undercloud-passwords` and `tripleo-overcloud-passwords` password files from the desired backup folder

4. Recreate UCC.

	Run the installer script with the skip overcloud option:

		bash -x ~root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-overcloud --skip-demo

5. Stop services on UCC.

	Once the undercloud is up and running stop the following services 

		service keystone stop
		service nova-api stop
		service rabbitmq-server stop
		service mysql stop

6. Restore `/mnt` and `/tftpboot` on UCC.

		cd /mnt
		sudo rm -r /state

7. Copy the `state.tar` for the backed-up `mnt` file to the `/mnt` directory.

		cd /tftpboot
		sudo rm -r *

8. Copy the `tftpboot.tar` file for the backed-up `tftpboot` file to the `/tftpboot` directory.

9. Restart all services.

		service mysql start
		os-refresh-config
		service mysql restart
		os-refresh-config

10. Verify UCC.

	Verify if the newly installed undercloud is working fine. From the seed VM run

		. stackrc
		nova list

	The nova list should give all the old overcloud nodes

		heat stack-list

	Above command should give back the old heat list

11. Now perform some lifecycle operations using `nova reboot`.

	A soft reboot attempts a graceful shut down and restart of the instance. By default, when you reboot a server, it is a soft reboot. 

		nova --reboot idofovercloudcontroller

	The overcloud controller should get rebooted and should get back the same ip as it had earlier


Now we need to restore the Undercloud image if it was upgraded by Sherpa

We already have the backup of the undercloud image that was backed up

Follow "Updating the undercloud" link to restore the upgraded image



## Restore the overcloud management controller ## 

1. Remove the failed node from RabbitMQ.

	From the seed node, ssh to one of the remaining controllers (any one) and remove the failed controller from the RabbitMQ cluster.

		ssh heat-admin@<node> 'rabbitmqctl cluster_status (to check status)'
		ssh heat-admin@<node> 'sudo rabbitmqctl forget_cluster_node <down node>'
		ssh heat-adimn@<node> 'sudo rabbitmqctl cluster_status (to verify removal)'

2. Generate heat template.

	Generate heat template (yaml file) to pass to the heat stack-update command for dropping a controller node. From the seed VM run the following:

		cd ~/tripleo/tripleo-heat-templates/
		python ./tripleo_heat_merge/merge.py --scale controller=1 --scale NovaCompute=1 --scale SwiftStorage=2 --scale BlockStorage=0 overcloud-source.yaml block-storage.yaml swift-source-ce.yaml swift-storage-server.yaml ssl-source.yaml nova-compute-config.yaml overcloud-controller-mgmt-ce.yaml overcloud-sherpa.yaml > overcloud-ce-drop-ctrlnode.yaml

	The example above drops the `controller1` node. 

	Heat template for controller management node : Need to hand edit overcloud-ce.yaml file  .( Example : see the attachment )


3. Stack update.

	From the seed VM run the following

		source ~root/tripleo/tripleo-undercloud-passwords
		TE_DATAFILE=~root/tripleo/ce_env.json
		source ~root/tripleo/tripleo-incubator/undercloudrc
 
		heat stack-update -e /root/tripleo/overcloud-env.json -t 360 -f /root/tripleo/tripleo-heat-templates/overcloud-ce-drop-ctrlnode.yaml -P 'ExtraConfig= ....' -P controllerImage=<ctrlImageid> -P controllerMgmtImage=<ctrlMgmtImageid> overcloud

	The example above drops the `controller1` node.


      ExtraConfig : these are config parameters that are passed during installation steps   

      controllerImage : is the imageid of controller that is in your glance,

      controllerMgmtImage: is the imageid of controllerMgmt that is in your glance   )

4. Check the status of the nodes: 

		node status - Status/Power State   :   ACTIVE/Running:
    
5. Update these files on all controller nodes and compute nodes that are in overcloud stack. 

	a. From the seed node run the following: 

		ssh heat-admin@<node> 'sudo sed -i "/diff/ s/$/ \&\& true/" /opt/stack/os-config-refresh/configure.d/51-hosts'

	Example: 

		ssh heat-admin@192.0.2.43 'sudo sed -i "/diff/ s/$/ \&\& true/" /opt/stack/os-config-refresh/configure.d/51-hosts') 

	b. From the seed node run the following: 

		ssh heat-admin@<node> 'sudo pkill -u rabbitmq'

6. Add Controller Nodes :

	a. Generate heat template:  

		cd ~/tripleo/tripleo-heat-templates/
		python ./tripleo_heat_merge/merge.py --scale controller=1 --scale NovaCompute=1 --scale SwiftStorage=2 --scale BlockStorage=0 overcloud-source.yaml block-storage.yaml swift-source-ce.yaml swift-storage-server.yaml ssl-source.yaml nova-compute-config.yaml overcloud-controller-mgmt-ce.yaml overcloud-sherpa.yaml > overcloud-ce-drop-ctrlnode.yaml

	The example above drops the `controller1` node. 

	b. Follow the above step " To Drop Controller Nodes - [1. Generate heat template]"  to generate new template by increasing scale count "--scale controller= .. " . 

		TODO: cater for controller 0 and mgmt controller (either by trickle or prebuilt templates

7. Add Controller management node -  use original(during installation) template - /root/tripleo/tripleo-heat-templates/overcloud-ce.yaml.

	From the seed node run the following:

		cd ~root/tripleo/tripleo-heat-templates/
		python ./tripleo_heat_merge/merge.py --scale controller=2 --scale NovaCompute=1 --scale SwiftStorage=2 --scale BlockStorage=0 overcloud-source.yaml block-storage.yaml swift-source-ce.yaml swift-storage-server.yaml ssl-source.yaml nova-compute-config.yaml overcloud-controller-mgmt-ce.yaml overcloud-sherpa.yaml > overcloud-ce.yaml
 
		source ~root/tripleo/tripleo-undercloud-passwords
		TE_DATAFILE=~root/tripleo/ce_env.json
		source ~root/tripleo/tripleo-incubator/undercloudrc
 
		heat stack-update -e /root/tripleo/overcloud-env.json -t 360 -f /root/tripleo/tripleo-heat-templates/overcloud-ce.yaml -P 'ExtraConfig= ....' -P controllerImage=<ctrlImageid> -P controllerMgmtImage=<ctrlMgmtImageid> overcloud
 

	 ( ExtraConfig : these are config parameters that are passed during installation steps( Example: Attached file ),

		controllerImage : is the imageid of controller that is in your glance,

		controllerMgmtImage: is the imageid of controllerMgmt that is in your glance )

	TODO: Avoid the use of heat stack-update directly: use the installer script, avoiding the need for ExtraConfig, and imageId's

8. Run these commands on nodes:

	Follow above steps "To Drop Controller Nodes - [3. Run these commands on nodes ]  "


## Backup and restore the MySQL cluster on the Overcloud ##

This section deals with the disaster recovery scenarios of the 3 node Mysql cluster (Percona XtraDB Cluster) that runs in overcloud controller nodes. Percona Cluster takes care of syncup of the data between nodes if one of the nodes goes down and comes up later. But if the whole cluster goes down due to some issue (like data corruption or mysql bug etc) and the cluster does not come up, we need a way to restore it to a previous well known state (backup) and start the cluster from that point. 

The solution is to use the Percona Xtrabackup utility to take full backups of the mysql instance (tested only full backups as of now but can be exteneded to incremental backups as well) frequently like 1 per day on one of the active cluster nodes. Whenever the cluster goes down or some data corruption occurs, delete the current data in all of the 3 nodes of mysql (present in /mnt/state/var/lib/mysql) and restore the backup copy on the same node on which backup is taken and bootstrap the percona cluster. Later bring up rest of the nodes so that they sync the data from the recovered node of cluster.

The whole process is given in detail at : http://fromdual.com/xtrabackup_in_a_nutshell

Here are the specific commands used for backup and recovery:

### Backup the MySQL cluster:

1. Use ssh to access one of the active nodes of cluster as the `heat-admin` user.

		ssh heat-admin@<controller node IP> 

	Use the IP of controller node of your environment.

2. Run the `innobackup` Perl script, which uses Percona XtraBackup internally.

		sudo innobackupex --galera-info /mnt/state/backups (replace /mnt/state/backups with the backup location of your environment)

	This creates a timestamped folder (for ex. "2013-11-06_00-00-00")  to contain all backup files.

 For more information about `innobackupex`, see: http://www.percona.com/doc/percona-xtrabackup/2.1/innobackupex/innobackupex_option_reference.html

3. Prepare the backup to be consistent at a point-in-time.

		sudo innobackupex  --apply-log /mnt/state/backups/<timestamped-folder-path> (use the timestamped path generated in above step)

4. Copy the backup to a remote location.

### Recover the MySQL cluster:

1. Use SSH to access each of the three nodes using `heat-admin` and elevate to root, and delete the MySQL data directory on each node using the following command: 

		ssh heat-admin@192.0.2.24 (replace 192.0.2.24 with controller1 ip address) 'sudo rm -rf /mnt/state/var/lib/mysql'

		ssh heat-admin@192.0.2.25 (replace 192.0.2.25 with controller0 ip address) 'sudo rm -rf /mnt/state/var/lib/mysql'

		ssh heat-admin@192.0.2.26 (replace 192.0.2.25 with mgmt controller ip address) 'sudo rm -rf /mnt/state/var/lib/mysql'

2. Copy the backup from remote location to a local location on controller0 (controller on which the backup is taken).

3. Run the Percona Xtrabackup utility using the innobackupex command

		sudo innobackupex --copy-back /mnt/state/backups/<timestamped-folder-path> (replace /mnt/state/backups/<timestamped-folder-path> with actual local location)

4. Change the permissions of MySQL data directory to the `mysql` user and group.

		sudo chown -R mysql:mysql /mnt/state/var/lib/mysql

5. Bootstrap the MySQL cluster on controller0.

		sudo /etc/init.d/mysql bootstrap-pxc

6. Start the MySQL services on the other controller nodes so that they can sync up their data with the restored MySQL cluster.

		sudo service mysql start