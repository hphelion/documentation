

---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-helion-openstack-ceph-storage-administration servicesadministration/
product: commercial

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>--->

##HP Helion OpenStack Ceph Storage Administration services

Three services were developed by HP Helion to aid in the configuration, monitoring and management of the HP Helion OpenStack integration with Ceph Storage. Heartbeat queries HP Helion OpenStack and Ceph Services and health state and provides notifications to the pre-defined Administrator. It also controls the OpenStack and Ceph Service, with option for restarting down Services, and then triggering the Validation service. The Validation service queries the HP Helion OpenStack and Ceph configuration entries against a known good reference (created and validated at installation). If the configuration matches, this is passed back to the Heartbeat service and logged and emailed accordingly. If the configuration does not match, then there is an option to have the Configuration service automatically backup the existing configurations, re-apply the known good configuration and missing dependencies, and trigger the Heartbeat service to restart the associated HP Helion OpenStack and Ceph service(s).

###Helion Ceph Configuration Service

The Configuration service installs the correct dependencies for the Ceph Client on the HP Helion OpenStack Compute and Controller Nodes, copies and or updates the associated Ceph configuration files and Glance, Nova and Cinder configuration files from a pre-defined template.

###Helion Ceph Heartbeat Service

Once the Ceph client has been successfully integrated into the Glance, Nova and Cinder services running on the HP Helion OpenStack OverCloud systems periodic health checks of the system are monitored on a scheduled basis that triggers Ceph and HP Helion OpenStack commands to verify the system is fully functional on an ongoing basis. For example, the “ceph health”command can trigger false negatives due to state of the Ceph Cluster, the status of the OSDs and placement groups are checked as well. The various Glance, Nova, and Cinder commands that were used during each stage of the install are also referenced where appropriate to insure the HP Helion OpenStack side of things is functional as well with respect to the Ceph storage services.

###Helion OpenStack Ceph Validation Service

The current implementation of the Ceph client integration process includes replacing or augmenting configuration files that are typically initially deployed based on OpenStack Heat templates that are created when an image is constructed. Also, Customers or 3rd party software may make inadvertent changes to these crucial configuration files. In order to preserve or recover the OpenStack and Ceph services from a known good state, the

Validation service will run and validate dependencies and compare the configuration files. If variances are discovered, the Validation service either will notify the Heartbeat service which will in turn update the Administrators, and or trigger the Configuration service to re-instantiate the necessary Ceph client versions of the file and then restart services.

###Helion OpenStack Ceph Monitoring

Administrative monitoring is available via the Helion built-in monitoring packages running on the UnderCloud: Icinga. Icinga is configured as follows:

1. Icinga: This is the main alerting server that runs each check periodically on every host

2. Icinga-web: This is the UI tool used to view the monitoring results

3. Check_mk is the utility that runs on the undercloud controller and each of the hosts that must be monitored. This utility runs some local checks and send results back to the main server.

4. mk_livestatus gathers the results of the checks

Icinga-web can be accessed via http://<undercloudcontrollerip>/icinga

Login/password: icingaadmin/icingaadmin

The servers for Helion OpenStack Overcloud and the Undercloud are monitored. In the Service Details section on the UI, there is a list of the services and applications monitored by Icinga.

For Ceph Monitoring, the following scripts run on Helion OpenStack Overcloud controller nodes and report back the check results to the Icinga service:

1. check_ceph_osd_status.sh which monitors the status of the available OSDs (if all up and in the cluster)

2. check_ceph_pg_status.sh which monitors the status of the placement groups (if all are active and clean)

3. check_ceph_health.sh which monitors the overall health of the ceph storage cluster

The Ceph checks run every 10 secs and reported back in the Icinga UI as:

1. Ceph_OSD_Status 
2. Ceph_PG_Status 
3. Ceph_Cluster_Health

The ceph client installer script installs the ceph health monitoring scripts into /usr/lib/check_mk_agent/local/ directory. The check_mk utility detects the presence of those scripts automatically via a cron job that runs periodically and begins using them to add the reporting details into the UI.

<screenshot>

###BACKUP AND RESTORE USING DUPLICITY AND SWIFT API

**User File System access to Swift API**

The Use Cases for leveraging Ceph as an Object Store range from User driven archives of a small MySQL instance to a well-orchestrated LOB scripted backup consistency group spanning multiple VMs and external machines. For Applications and Customers who do not have existing integrations to Swift API and do not wish to leverage the existing Swift Client, often a watched mount point that auto-archives is required. For that Use Case, the Open Source Project Duplicity is recommended. Duplicity is a bandwidth efficient encrypted incremental backup tool that can be used with Swift API to archive, backup, and restore files. It archives directories by producing encrypted tar-format volumes and uploading them to the Swift API. Duplicity uses librsync and consequently the incremental archives are space efficient: only recording the parts of files that have changed since the last write. Duplicity uses GnuPG to encrypt and sign these archive files.

**Installing Duplicity**

Install Duplicity on any of the client User VM’s as below.

* apt-get install bzr

* bzr branch lp:~mhu-s/duplicity/swiftbackend

* sudo apt-get install librsync-dev

* sudo apt-get install python-dev

* pip install python-swiftclient

* pip install python-keystoneclient

* install duplicity: “cd swiftbackend && sudo python dist/setup.py install”

* You can now use duplicity to backup your files to Rados Gateway using Swift. As defined in the previous Rados section define the env variables.

Requirements:

* Python v2.4 or later

* librsync v0.9.6 or later

* GnuPG v1.x for encryption

To use Duplicity with Swift we need to set 4 environment variables:

* SWIFT_USERNAME: your username, in the form tenant:user

* SWIFT_PASSWORD: your password

* SWIFT_AUTHURL: URL to the Keystone service.

* SWIFT_AUTHVERSION: for keystone authentication, set it to 2.

Example

export SWIFT_USERNAME=admin:admin

export SWIFT_PASSWORD=c6ad5fa953d9e6b4e0593beea1bc9360c6ce3154

export SWIFT_AUTHURL=http://192.168.51.31:5000/v2.0

export SWIFT_AUTHVERSION=2

Make sure you also have the swift or Rados Gateway credentials sourced on the system where you have duplicity.

###MySQL Archive to Swift API Use Case

* Create Ceph pool, Ceph user as in the previous section for backup. Note: for large deployments where 100s of discrete Users and Pools will be created, managed, and audited, it is highly recommended that the Customer consider integration between the HP Helion OpenStack Tenant Project User, Keystone, and the Ceph User and associated Pool(s).

* Install on the User Client Virtual Machine the Swift client and other components installed as specified in the above Ceph Radosgw Client section.

* Fuse mount point is required.

Filesystem in Userspace (FUSE) is a simple interface for userspace programs to export a virtual filesystem to the Linux kernel. It also aims to provide a secure method for non-privileged users to create and mount their own filesystem implementations.

fusermount is a program to mount and unmount FUSE filesystems.

Below snapshot shows how a MySQL database is backed up and restored.

From mysql, listing the images (This example just happens to utilize the mySQL User Database Instance Glance).
<screenshot>

MySQL database is archived using Duplicity

<screenshot>

Using restore script, mysql database archive checksum is validated, and then it is restored

<screenshot>

MySQL Database Instance is created and archive file is restored.

<screenshot>

After restore, mySQL Database is up.

<screenshot>



##Ceph Administration

The following sections include useful commands and approaches to Managing and Administrating a growing Ceph Cluster.

###Block Device Commands

The rbd command enables you to create, list, introspect and remove block device images. You can also use it to clone images, create snapshots, rollback an image to a snapshot, view a snapshot, etc.

To use Ceph Block Device commands, you must have access to a running Ceph cluster.

**CREATING A BLOCK DEVICE IMAGE**

Before you can add a block device to a node, you must create an image for it in the Ceph Storage Cluster first. To create a block device image, execute the following:

	rbd create {image-name} --size {megabytes} --pool {pool-name}

For example, to create a 1GB image named image1 that stores information in a pool named imagelist, execute the following:

	rbd create image1 --size 1024
	rbd create bar --size 1024 --pool imagelist

Note - You must create a pool first before you can specify it as a source.

**LISTING BLOCK DEVICE IMAGES**

To list block devices in the rbd pool, execute the following (i.e., rbd is the default pool name):

rbd ls

To list block devices in a particular pool, execute the following, but replace {poolname} with the name of the pool:

	rbd ls {poolname}

For example:

	rbd ls imagelist

**RETRIEVING IMAGE INFORMATION**

To retrieve information from a particular image, execute the following, but replace {image-name} with the name for the image:

	rbd --image {image-name} info

For example:

	rbd --image image1 info

To retrieve information from an image within a pool, execute the following, but replace {image-name} with the name of the image and replace {pool-name} with the name of the pool:

	rbd --image {image-name} -p {pool-name} info

For example:

	rbd --image lin -p imagelist info

**RESIZING A BLOCK DEVICE IMAGE**

Ceph Block Device images are thin provisioned. They don’t actually use any physical storage until you begin saving data to them. However, they do have a maximum capacity that you set with the --size option. If you want to increase (or decrease) the maximum size of a Ceph Block Device image, execute the following:

	rbd resize --image image1 --size 2048


**REMOVING A BLOCK DEVICE IMAGE**

To remove a block device, execute the following, but replace {image-name} with the name of the image you want to remove:

	rbd rm {image-name}

For example:

	rbd rm image1

To remove a block device from a pool, execute the following, but replace {image-name} with the name of the image to remove and replace {pool-name} with the name of the pool:

	rbd rm {image-name} -p {pool-name}

For example:

	rbd rm lin -p imagelist

**KERNEL MODULE OPERATIONS**

Important - To use kernel module operations, you must have a running Ceph cluster.

**GET A LIST OF IMAGES**

To mount a block device image, first return a list of the images.

	rbd list

**MAP A BLOCK DEVICE**

Use rbd to map an image name to a kernel module. You must specify the image name, the pool name, and the user name. rbd will load RBD kernel module on your behalf if it’s not already loaded.

	sudo rbd map {image-name} --pool {pool-name} --id {user-name}

For example:

	sudo rbd map --pool rbd myimage --id admin

If you use cephx authentication, you must also specify a secret. It may come from a keyring or a file containing the secret.

	sudo rbd map --pool rbd myimage --id admin --keyring /path/to/keyring
	sudo rbd map --pool rbd myimage --id admin --keyfile /path/to/file

SHOW MAPPED BLOCK DEVICES

To show block device images mapped to kernel modules with the rbd command, specify the showmapped option.

	rbd showmapped
	UNMAPPING A BLOCK DEVICE

To unmap a block device image with the rbd command, specify the unmap option and the device name (i.e., by convention the same as the block device image name).

	sudo rbd unmap /dev/rbd/{poolname}/{imagename}

For example:

	sudo rbd unmap /dev/rbd/rbd/foo

**Control Commands**

**MONITOR COMMANDS**

Monitor commands are issued using the ceph utility:

	ceph [-m monhost] {command}

The command is usually (though not always) of the form:

	ceph {subsystem} {command}

**SYSTEM COMMANDS**

Execute the following to display the current status of the cluster.

	ceph -s

	ceph status

Execute the following to display a running summary of the status of the cluster, and major events.

	ceph -w

Execute the following to show the monitor quorum, including which monitors are participating and which one is the leader.

	ceph quorum_status

Execute the following to query the status of a single monitor, including whether or not it is in the quorum.

	ceph [-m monhost] mon_status

**AUTHENTICATION SUBSYSTEM**

To add a keyring for an OSD, execute the following:

	ceph auth add {osd} {--in-file|-i} {path-to-osd-keyring}

To list the cluster’s keys and their capabilities, execute the following:

	ceph auth list

**PLACEMENT GROUP SUBSYSTEM**

To display the statistics for all placement groups, execute the following:

	ceph pg dump [--format {format}]

The valid formats are plain (default) and json.

To display the statistics for all placement groups stuck in a specified state, execute the following:

	ceph pg dump_stuck inactive|unclean|stale [--format {format}] [-t|--threshold {seconds}]

	--format may be plain (default) or json

	--threshold defines how many seconds “stuck” is (default: 300)

Inactive Placement groups cannot process reads or writes because they are waiting for an OSD with the most up-to-date data to come back.

Unclean Placement groups contain objects that are not replicated the desired number of times. They should be recovering.

Stale Placement groups are in an unknown state - the OSDs that host them have not reported to the monitor cluster in a while (configured by mon_osd_report_timeout).

Revert “lost” objects to their prior state, either a previous version or delete them if they were just created.

ceph pg {pgid} mark_unfound_lost revert

**OSD SUBSYSTEM**

Query OSD subsystem status.

	ceph osd stat

Write a copy of the most recent OSD map to a file.

	ceph osd getmap -o file

Write a copy of the crush map from the most recent OSD map to file.

	ceph osd getcrushmap -o file

The foregoing functionally equivalent to

	ceph osd getmap -o /tmp/osdmap

osdmaptool /tmp/osdmap --export-crush file

Dump the OSD map. Valid formats for -f are plain and json. If no --format option is given, the OSD map is dumped as plain text.

	ceph osd dump [--format {format}]

Dump the OSD map as a tree with one line per OSD containing weight and state.

	ceph osd tree [--format {format}]

Find out where a specific object is or would be stored in the system:

	ceph osd map <pool-name> <object-name>

Add or move a new item (OSD) with the given id/name/weight at the specified location.

	ceph osd crush set {id} {weight} [{loc1} [{loc2} ...]]

Remove an existing item from the CRUSH map.

ceph osd crush remove {id}

Move an existing bucket from one position in the hierarchy to another.

ceph osd crush move {id} {loc1} [{loc2} ...]

Set the weight of the item given by {name} to {weight}.

	ceph osd crush reweight {name} {weight}

Create a cluster snapshot.

	ceph osd cluster_snap {name}

Mark an OSD as lost. This may result in permanent data loss. Use with caution.

	ceph osd lost {id} [--yes-i-really-mean-it]

Create a new OSD. If no UUID is given, it will be set automatically when the OSD starts up.

	ceph osd create [{uuid}]

Remove the given OSD(s).

	ceph osd rm [{id}...]

Query the current max_osd parameter in the OSD map.

	ceph osd getmaxosd

Import the given OSD map. Note that this can be a bit dangerous, since the OSD map includes dynamic state about which OSDs are current on or offline; only do this if you’ve just modified a (very) recent copy of the map.

	ceph osd setmap -i file

Import the given crush map.

	ceph osd setcrushmap -i file

Set the max_osd parameter in the OSD map. This is necessary when expanding the storage cluster.

	ceph osd setmaxosd

	Mark OSD {osd-num} down.

	ceph osd down {osd-num}

Mark OSD {osd-num} out of the distribution (i.e. allocated no data).

	ceph osd out {osd-num}

Mark {osd-num} in the distribution (i.e. allocated data).

	ceph osd in {osd-num}

List classes that are loaded in the ceph cluster.

	ceph class list

Set or clear the pause flags in the OSD map. If set, no IO requests will be sent to any OSD. Clearing the flags via unpause results in resending pending requests.

	ceph osd pause

	ceph osd unpause

Set the weight of {osd-num} to {weight}. Two OSDs with the same weight will receive roughly the same number of I/O requests and store approximately the same amount of data.

	ceph osd reweight {osd-num} {weight}

Reweights all the OSDs by reducing the weight of OSDs which are heavily overused. By default it will adjust the weights downward on OSDs which have 120% of the average utilization, but if you include threshold it will use that percentage instead.

	ceph osd reweight-by-utilization [threshold]

Adds/removes the address to/from the blacklist. When adding an address, you can specify how long it should be blacklisted in seconds; otherwise, it will default to 1 hour. A blacklisted 
address is prevented from connecting to any OSD. Blacklisting is most often used to prevent a lagging metadata server from making bad changes to data on the OSDs.

These commands are mostly only useful for failure testing, as blacklists are normally maintained automatically and shouldn’t need manual intervention.

	ceph osd blacklist add ADDRESS[:source_port] [TIME]
	
	ceph osd blacklist rm ADDRESS[:source_port]
	
Creates/deletes a snapshot of a pool.
	
	ceph osd pool mksnap {pool-name} {snap-name}
	
	ceph osd pool rmsnap {pool-name} {snap-name}
	
Creates/deletes/renames a storage pool.
	
	ceph osd pool create {pool-name} pg_num [pgp_num]
	
	ceph osd pool delete {pool-name} [{pool-name} --yes-i-really-really-mean-it]
	
	ceph osd pool rename {old-name} {new-name}
	
Changes a pool setting.
	
	ceph osd pool set {pool-name} {field} {value}
	
Valid fields are:

* size: Sets the number of copies of data in the pool.

* crash_replay_interval: The number of seconds to allow clients to replay acknowledged but 
uncommited requests.

* pg_num: The placement group number.

* pgp_num: Effective number when calculating pg placement.

* crush_ruleset: rule number for mapping placement.

Get the value of a pool setting.

	ceph osd pool get {pool-name} {field}

Valid fields are:

* pg_num: The placement group number.

* pgp_num: Effective number of placement groups when calculating placement.

* lpg_num: The number of local placement groups.

* lpgp_num: The number used for placing the local placement groups.

Sends a scrub command to OSD {osd-num}. To send the command to all OSDs, use *.

	ceph osd scrub {osd-num}

Sends a repair command to OSD.N. To send the command to all OSDs, use *.

	ceph osd repair N

Runs a simple throughput benchmark against OSD.N, writing TOTAL_BYTES in write requests of BYTES_PER_WRITE each. By default, the test writes 1 GB in total in 4-MB increments.

	ceph osd tell N bench [BYTES_PER_WRITE] [TOTAL_BYTES]

**MON SUBSYSTEM**

Show monitor stats:

	ceph mon stat

The quorum lists monitor nodes that are part of the current quorum.

	$ ./ceph quorum_status

For a status of just the monitor you connect to (use -m HOST:PORT to select):

	ceph mon_status

A dump of the monitor state:

	ceph mon dump

##TROUBLESHOOTING

* Ensure proper http proxy settings in both /etc/environment and /etc/apt/apt.conf for connecting to external resources

* Firefly version of Ceph packages has default replication set to 3x. Therefore have a minimum of 3 OSDs.

* If you see “Decrypt error” from any of helion node with glance, cinder, nova, make sure all the ceph cluster nodes are in same time zone. If needed have a NTP server specified in /etc/ntp.conf file on all the ceph cluster nodes. After making changes restart ntp [/etc/init.d/ntp restart]. Install ntp package if it is not there already.

* Ensure Ceph cluster to be on same IP range as Helion OpenStack Overcloud nodes. Ensure IP range for Ceph cluster does not conflict with those used Helion setup

* Log files in /var/log/ceph/ in each node is a good place for troubleshooting

* Any changes to Ceph configuration file should be followed by restarting Ceph services for changes to take affect

* You cannot change the default Cephx Authentication to “None” once the cluster is up and running. You will have to purge and reinstall the ceph packages again and build the cluster.

* Enable logging if problem is encountered in any of the steps

To do this, edit glance-api.conf , cinder.conf and nova.conf files with following in the default section.

	debug = True
	
	verbose = True

Restart Glance, Cinder and nova services respectively.

On HP Helion Commercial, logs for Glance and Cinder by default are stored in following directory structure

	Glance - /var/log/glance
	
	Cinder - /var/log/upstart

Gather these logs and contact HP support team for inputs.

* If you see any PG[Placement Group] related issue in the ceph cluster. Follow the below link .

http://docs.ceph.com/docs/master/rados/operations/placement-groups/

Choosing the number of placement groups

If you have more than 50 OSDs, we recommend approximately 50-100 placement groups per OSD to balance out resource usage, data durability and distribution. For a single pool of objects, you can use the following formula to get a baseline:

 (OSDs * 100)

Total PGs = ------------

pool size

Where pool size is either the number of replicas for replicated pools or the K+M sum for erasure coded pools (as returned by ceph osd erasure-code-profile get).

The result should be rounded up to the nearest power of two. Rounding up is optional, but recommended for CRUSH to evenly balance the number of objects among placement groups.

As an example, for a cluster with 200 OSDs and a pool size of 3 replicas, you would estimate your number of PGs as follows:

(200 * 100)

----------- = 6667. Nearest power of 2: 8192

3

##Ceph Configuration Recovery and backup procedure HP Helion nodes

1. Run ceph_client_setup script[Available in CODN] on each of the controller/compute node. Go through the README file on how to run the script and what files to be copied from ceph cluster node to the respective directory.

2. Ensure ceph health is ok - “ceph health”

3. If you happen to reboot your controller and compute node after running the ceph_client_setup script, the patch update on glance-api.conf, nova.conf, cinder.conf might be defaulted to original state. In that case do the below.

From each of the controller and compute node, go to

	“/home/ceph_client_setup/setup_scripts”

1. Run “sh patch_config_files.sh”

2. Run “sh helion_service_restarts.sh”

Sample files:

<table>
<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th > Helion Node</th>
	<th > Service/File name</th>	
	<th>File Attachment </th>
</tr>
	<tr>
<td>Controller node</td>
<td>/etc/glance/glance-api.conf /etc/cinder/cinder.conf /etc/nova/nova.conf</td>
<td>https://helion.hpwsportal.com Click on the workloads category on the left side and then you click on the storage subcategory to find all the Ceph related files.<tdt>
</tr>
<tr>
<td>Compute node</td>
<td>/etc/nova/nova.conf</td>
<td>https://helion.hpwsportal.com Click on the workloads category on
the left side and then you click on the storage subcategory to find all the Ceph related files. File Name:<tdt>
</tr>
  </table>



##REFERENCES

1. With increased density, efficiency, serviceability, and flexibility, the HP ProLiant SL4540 Gen8 Server, DL360/380 Gen8, BL460/660 Gen8 servers will be the perfect solution for scale-out storage needs. To learn more visit: hp.com/servers/sl4540.

2. HP Integrated Lights-Out simplifies server setup, promotes remote administration, engages health monitoring, and maintains power and thermal control. For more information see: hp.com/go/ilo.

3. HP Server Ceph on SL4540 Technical White Paper: http://h20195.www2.hp.com/V2/GetDocument.aspx?docname=4AA5-2799ENW&cc=us&lc=en

4. Ceph has good documentation available at its website. http://ceph.com/docs/master/

5. Introduction to OpenStack Block Storage using Cinder and Nova

6. HP ProLiant DL360p Generation 8 (Gen8) QuickSpec Sheet

7. HP ProLiant DL380p Generation8 (Gen8) QuickSpec Sheet

8. HP Proliant 3XSL4540 Gen8 1G Mezz HBA Server

9. http://h17007.www1.hp.com/us/en/networking/products/switches/HP_5900_Switch_Series/index.aspx#.VAeNxGXn9Co 10. http://duplicity.nongnu.org/