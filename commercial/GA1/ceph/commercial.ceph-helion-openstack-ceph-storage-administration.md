---
layout: default
title: "HP Helion OpenStack&#174; Edition: HP Helion Ceph"
permalink: /helion/openstack/ceph-helion-openstack-ceph-storage-administration-services/
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

HP Helion developed three services to aid in the configuration, monitoring, and management of HP Helion OpenStack integration with Ceph Storage. Heartbeat queries HP Helion OpenStack, Ceph Services and health state, and provides notifications to the pre-defined Administrator. It also controls the OpenStack and Ceph services with an option for  restarting down services and then triggering the validation service. The validation service queries the HP Helion OpenStack and Ceph configuration entries against a known good reference (created and validated at installation). If the configuration matches, this is passed back to the heartbeat service and logged and emailed accordingly. If the configuration does not match, then there is an option to have the Configuration service automatically backup the existing configurations, re-apply the known good configuration and missing dependencies, and trigger the heartbeat service to restart the associated HP Helion OpenStack and Ceph service(s).

###Helion Ceph Configuration Service

The Configuration service installs the correct dependencies for the Ceph Client on the HP Helion OpenStack Compute and Controller nodes, copies and or updates the associated Ceph configuration files and Glance, Nova and Cinder configuration files from a pre-defined template.

###Helion Ceph Heartbeat Service


Once the Ceph client has been successfully integrated in the Glance, Nova and Cinder services running on the HP Helion OpenStack overcloud systems, periodic health checks of the system are monitored on a scheduled basis. This triggers the Ceph and HP Helion OpenStack commands to verify the system is fully functional on an ongoing basis. For example, the `ceph health` command can trigger false negatives due to the state of the Ceph Cluster, the status of the OSDs and placement groups are verified as well. The various Glance, Nova, and Cinder commands that were used during each stage of the install are also referenced where appropriate to insure the HP Helion OpenStack side of things [**colloquial** verify this sentence] is functional as well with respect to the Ceph storage services.


###Helion OpenStack Ceph Validation Service

The current implementation of the Ceph client integration process includes replacing or augmenting configuration files that are typically deployed based on OpenStack Heat templates that are created when an image is constructed. Also, customers or 3rd party software can make inadvertent changes to these crucial configuration files. To preserve or recover the OpenStack and Ceph services from a known good state, the validation service are ran and validate dependencies and compare the configuration files. If variances are discovered, the validation service either notifies the Heartbeat service which in turns update the Administrators, or triggers the configuration service to re-instantiate the necessary Ceph client versions of the file and then restart services.

###Helion OpenStack Ceph monitoring

The Icinga, which run in the undercloud helps to monitor the packages. Icinga is configured as follows:

1. **Icinga**: This is the main alerting server that runs each check periodically on every host.

2. **Icinga-web**: This is the UI tool used to view the monitoring results.

3. `Check_mk` is the utility that runs on the undercloud controller and each of the hosts that must be monitored. This utility runs some local checks and send results back to the main server.

4. `mk_livestatus` gathers the results of the checks.



You can access the Icinga Dashboard through  (http://&lt;undercloudcontrollerip&gt;/icinga). The default login credentials are as follows:

- Username: icingaadmin
- Password: icingaadmin

The servers for Helion OpenStack Overcloud and the undercloud are monitored. In the Service Details section on the UI, there is a list of the services and applications monitored by Icinga.

For Ceph Monitoring, run the following scripts on Helion OpenStack Overcloud controller nodes and report back the check results to the Icinga service:

1. `check_ceph_osd_status.sh` which monitors the status of the available OSDs (if all up and in the cluster).

2. `check_ceph_pg_status.sh` which monitors the status of the placement groups (if all are active and clean).

3. `check_ceph_health.sh` which monitors the overall health of the ceph storage cluster.

The Ceph checks run every 10 secs and report back in the Icinga UI as:

1. `Ceph_OSD_Status` 
2. `Ceph_PG_Status` 
3. `Ceph_Cluster_Health`

The ceph client installer script installs the ceph health monitoring scripts into `/usr/lib/check_mk_agent/local/ `directory. The `check_mk` utility detects the presence of those scripts automatically through a cron job that runs periodically and begins using them to add the reporting details into the UI.

<**Can i get a better screenshot**>

###Backup and Restore using Duplicity and Swift API
 
#####User File System access to Swift API <**refer again**>

The use cases for leveraging Ceph as an Object Store range from user-driven archives of a small MySQL instance to a well-orchestrated LOB scripted backup consistency group spanning multiple VMs and external machines.**[scripted backup consistency group? how about saying that in common venacular?]** For applications and customers who do not have existing integrations to the Swift API and do not wish to leverage the existing Swift Client, often a watched **[monitored?]** mount point that auto-archives is required. For that use case, the Open Source Project Duplicity is recommended.**[in general, this is overly passive. Use active voice. Talk directly to the user. You can say: For that use case, HP recommends Duplicity.]** Duplicity is an Open Source, bandwidth efficient, encrypted incremental backup tool that can be used with Swift API to archive, backup, and restore files. It archives directories by producing encrypted tar-format volumes and uploading them to the Swift API. Duplicity uses `librsync` and consequently the incremental archives are space efficient: only recording the parts of files that have changed since the last write. Duplicity uses GnuPG to encrypt and sign these archive files.

#####Installing Duplicity

Install Duplicity on any of the client user VMs as below. (**Please provide command and steps for this?**)

* `apt-get install bzr`

* `bzr branch lp:~mhu-s/duplicity/swiftbackend`

* `sudo apt-get install librsync-dev`

* `sudo apt-get install python-dev`

* `pip install python-swiftclient`

* `pip install python-keystoneclient`

* install Duplicity: `cd swiftbackend && sudo python dist/setup.py install`

* You can now use Duplicity to backup your files to the Rados Gateway using Swift. As defined in the previous Rados section, define the environmental variables (**look for that section?for me**).

#####Requirements

* Python v2.4 or later

* librsync v0.9.6 or later

* GnuPG v1.x for encryption

To use Duplicity with Swift, set four environment variables: 

1. SWIFT_USERNAME: your username, in the form tenant:user

2. SWIFT_PASSWORD: your password

3. SWIFT_AUTHURL: URL to the Keystone service.

4. SWIFT_AUTHVERSION: for keystone authentication, set it to 2.

####Example:


    export SWIFT_USERNAME=admin:admin
    export SWIFT_PASSWORD=c6ad5fa953d9e6b4e0593beea1bc9360c6ce3154
    export SWIFT_AUTHURL=http://192.168.51.31:5000/v2.0
    export SWIFT_AUTHVERSION=2

Make sure you also have the Swift or Rados Gateway credentials sourced on the system where you have Duplicity.

###MySQL Archive to Swift API use case

Perform the following steps:

* Create Ceph pool, Ceph user as in the previous section for backup <**placeholder of the backup**>. Note: for large deployments where hundreds of discrete users and pools will be created, managed, and audited, consider integrating the HP Helion OpenStack Tenant Project User, Keystone, and the Ceph User and associated pool(s).

* Install on the user client Virtual Machine the Swift client and other components installed as specified in the above Ceph Radosgw Client section. **[be direct. recommend rewriting this as: Install the Swift client (and other components as specified in the Ceph RADOSGW Client section) on the user client Virtual Machine.]**

* Fuse mount point is required.

Filesystem in Userspace (FUSE) is a simple interface for userspace programs to export a virtual filesystem to the Linux kernel. It also provides a secure method for non-privileged users to create and mount their own filesystems.
`fusermount` is a program to mount and unmount FUSE filesystems.


#####Snapshot for backed up and restored

The following snapshot shows how a MySQL database is backed up and restored.

From mysql, listing the images (This example utilizes the mySQL User Database Instance Glance).

<img src="media/communication_diagram_from_helion_ceph.png"/)>

MySQL database is archived using Duplicity.

<screenshot>

Using restore script, mysql database archive checksum is validated, and then it is restored.

<screenshot>

MySQL Database Instance is created and archive file is restored.

<screenshot>

After restore, the mySQL Database is up.

<screenshot>



##Ceph Administration

The following sections include useful commands and approaches to mange and administrator a growing Ceph cluster.

###Block Device Commands

The `rbd` command enables you to create, list, introspect and remove block device images. You can also use it to clone images, create snapshots, rollback an image to a snapshot, view a snapshot, etc.

To use Ceph Block Device commands, you must have access to a running Ceph cluster.

#####Creating a block device name

Before adding a block device to a node, you must first create an image for it in the Ceph Storage Cluster. To create a block device image, execute the following command:

	rbd create {image-name} --size {megabytes} --pool {pool-name}

For example, to create a 1GB image named image1 that stores information in a pool named imagelist, and execute the following command:

	rbd create image1 --size 1024
	rbd create bar --size 1024 --pool imagelist

**Note**: You must first create a pool before you can specify it as a source.

#####Listing block device images

* To list block devices in the `rbd` pool, (where rbd is the default pool name), execute the following command:

	rbd ls

* To list block devices in a particular pool, execute the following command:

	rbd ls {poolname}

For example:

	rbd ls imagelist

#####Retrieving image information

* To retrieve information from a particular image, execute the following command:

	rbd --image {image-name} info

For example:

	rbd --image image1 info

* To retrieve information from an image within a pool, execute the following command:

	rbd --image {image-name} -p {pool-name} info

For example:

	rbd --image lin -p imagelist info

#####Resizing a block device image

Ceph Block Device images are thin provisioned. They do not actually use any physical storage until you begin saving data to them. However, they do have a maximum capacity that you set with the `--size` option. If you want to increase (or decrease) the maximum size of a Ceph Block Device image, execute the following command:

	rbd resize --image image1 --size 2048


#####Removing a block device image 

To remove a block device, execute the following command:

	rbd rm {image-name}

For example:

	rbd rm image1

To remove a block device from a pool, execute the following command:

	rbd rm {image-name} -p {pool-name}

For example:

	rbd rm lin -p imagelist

#####Kernel module operations

**Important** - To use kernel module operations, you must have a running Ceph cluster.

######Get a list of images

To mount a block device image, return a list of the images.

	rbd list

######Map a block device

Use `rbd` to map an image name to a kernel module. You must specify the image name, the pool name, and the user name. `rbd` loads the RBD kernel module, if it is not already loaded.

	sudo rbd map {image-name} --pool {pool-name} --id {user-name}

For example:

	sudo rbd map --pool rbd myimage --id admin

If you use cephx authentication, you must also specify a secret. It may come from a keyring or a file containing the secret.

	sudo rbd map --pool rbd myimage --id admin --keyring /path/to/keyring
	sudo rbd map --pool rbd myimage --id admin --keyfile /path/to/file


######Show Mapped block devices

To show block device images mapped to kernel modules with the `rbd` command, use the showmapped option.

	rbd showmapped
	UNMAPPING A BLOCK DEVICE

To unmap a block device image with the `rbd` command, use the unmap option and the device name. (By convention, the device name is the same as the block device image name).

	sudo rbd unmap /dev/rbd/{poolname}/{imagename}

For example:

	sudo rbd unmap /dev/rbd/rbd/foo

####Control Commands

#####Monitor commands 

Use the ceph utility to issue the monitor commands:

	ceph [-m monhost] {command}

The command is usually (though not always) of the form:

	ceph {subsystem} {command}

####System Command

* To display the current status of the cluster, execute the following command:

		ceph -s
		ceph status

* To display a running summary of the status of the cluster, and major events, execute the following command:

		ceph -w

* To show the monitor quorum, including which monitors are participating and which one is the leader, execute the following command::

		ceph quorum_status

* To query the status of a single monitor, including whether or not it is in the quorum, execute the following command::

		ceph [-m monhost] mon_status

####Authentication subsystem

* To add a keyring for an OSD, execute the following command::

		ceph auth add {osd} {--in-file|-i} {path-to-osd-keyring}

* To list the cluster's keys and their capabilities, execute the following command::

		ceph auth list

####Placement group subsystem

* To display the statistics for all placement groups, execute the following command::

		ceph pg dump [--format {format}]

The valid formats are plain (default) and JSON. 

* To display the statistics for all placement groups stuck in a specified state, execute the following command::

		ceph pg dump_stuck inactive|unclean|stale [--format {format}] [-t|--threshold {seconds}]

	`--format` may be plain (default) or JSON

	`--threshold` defines how many seconds “stuck”. The default value is 300.

* Inactive placement groups cannot process reads or writes because they are waiting for an OSD with the most up-to-date data to come back.

* Unclean placement groups contain objects that are not replicated the desired number of times. They should be  in the state of recover.

* Stale Placement groups are in an unknown state - the OSDs that host them have not reported to the monitor cluster in a while (configured by `mon_osd_report_timeout`).

* To revert "lost" objects to their prior state, either a previous version or delete them if they were just created, execute the following command:

		ceph pg {pgid} mark_unfound_lost revert


####OSD subsystem

* To query the OSD subsystem status, execute the following command:

		ceph osd stat

* To write a copy of the most recent OSD map to a file, execute the following command:

		ceph osd getmap -o file

* To write a copy of the crush map from the most recent OSD map to file, execute the following command:

		ceph osd getcrushmap -o file

Which is functionally equivalent to:

		ceph osd getmap -o /tmp/osdmap
		osdmaptool /tmp/osdmap --export-crush file 

* To dump the OSD map, execute the following command:

		ceph osd dump [--format {format}]

Valid formats for `--format` are plain and JSON. If you do not specify a format, the OSD map is dumped as plain text.

* To dump the OSD map as a tree with one line per OSD containing weight and state, execute the following command:

		ceph osd tree [--format {format}]

* To find out where a specific object is or would be stored in the system, execute the following command:

		ceph osd map <pool-name> <object-name>

* To add or move a new item (OSD) with the given `id/name/weight` at the specified location, execute the following command:

		ceph osd crush set {id} {weight} [{loc1} [{loc2} ...]]

* To remove an existing item from the CRUSH map, execute the following command:

		ceph osd crush remove {id} 

* To move an existing bucket from one position in the hierarchy to another, execute the following command:

		ceph osd crush move {id} {loc1} [{loc2} ...] 

* To set the weight of the item given by {name} to {weight}, execute the following command:

		ceph osd crush reweight {name} {weight}

* To create a cluster snapshot, execute the following command:

		ceph osd cluster_snap {name}

* To mark an OSD as lost, execute the following command:

		ceph osd lost {id} [--yes-i-really-mean-it]

**Caution**: This may result in a permanent data loss. 

* To create a new OSD, execute the following command: 

		ceph osd create [{uuid}]

* If you do not provide a UUID, it will be set automatically when the OSD starts up.

* To remove the given OSD(s), execute the following command:

		ceph osd rm [{id}...]

* To query the current `max_osd` parameter in the OSD map,execute the following command:

		ceph osd getmaxosd

* To import the given OSD map, execute the following command:

		ceph osd setmap -i file

 **Caution**: Since the OSD map includes the dynamic state about which OSDs are current on or offline, only use this command if you have just modified a (very) recent copy of the map.

* To import the given crush map, execute the following command:

		ceph osd setcrushmap -i file

* To set the `max_osd` parameter in the OSD map, execute the following command: 

		ceph osd setmaxosd

* To mark OSD `{osd-num}` down

		 osd down {osd-num} 

**Note**: This is necessary when expanding the storage cluster.

* To mark the OSD `{osd-num}` out of the distribution (that is, allocated no data), execute the following command:

		ceph osd out {osd-num}

* To mark `{osd-num}` in the distribution (that is, allocated data), execute the following command:

		ceph osd in {osd-num}

* To list classes that are loaded in the Ceph cluster, execute the following command:

		ceph class list

* To set or clear the pause flags in the OSD map, execute the following command: 

		ceph osd pause
		ceph osd unpause

**Note**: If set, no IO requests are sent to any OSD. Clearing the flags through unpause results in resending pending requests.

* To set the weight of `{osd-num}` to `{weight}`, execute the following command: 

		ceph osd reweight {osd-num} {weight}

**Note**: Two OSDs with the same weight receives approximately the similar number of I/O requests and store the similar amount of data.

* To reduce the weight of OSDs which are heavily overused, execute the following command:

		ceph osd reweight-by-utilization [threshold]

Note: By default, this command will adjust the weights downward on OSDs which have 120% of the average utilization, but if you include threshold it will use that percentage instead.

* To add/remove an address to/from the blacklist, execute the following command:

	ceph osd blacklist add ADDRESS[:source_port] [TIME]
	ceph osd blacklist rm ADDRESS[:source_port]
	
**Note**: When adding an address, you can specify the time (in seconds) to be blacklisted; otherwise, it will configure a default time to 1 hour. A blacklisted address is prevented from connecting to any OSD. Blacklisting is most often used to prevent a lagging metadata server from making unwanted changes to data on the OSDs.

These commands are useful for failure testing, as blacklists are normally maintained automatically and does not need manual intervention.

* To create/delete a snapshot of a pool, execute the following command:
	
		ceph osd pool mksnap {pool-name} {snap-name}
	
* To delete a snapshot of a pool, execute the following command:

		ceph osd pool rmsnap {pool-name} {snap-name}
	
* To create a storage pool, execute the following command:
	
		ceph osd pool create {pool-name} pg_num [pgp_num]

Where, pg_num: placement group number.
	
* To delete a storage pool, execute the following command:
	
		ceph osd pool delete {pool-name} [{pool-name} --yes-i-really-really-mean-it]

* To rename a storage pool, execute the following command:
	
		ceph osd pool rename {old-name} {new-name}

* To change a pool setting, execute the following command:
	
		ceph osd pool set {pool-name} {field} {value}
	
Where:
**[these are not listed in this command. Locate these variables with their commands:** Please let me know waht are the commands for the following variables.

* size: Sets the number of copies of data in the pool.

* crash_replay_interval: The number of seconds to allow clients to replay acknowledged but 
uncommited requests.

* pg_num: The placement group number.

* pgp_num: Effective number when calculating pg placement.

* crush_ruleset: rule number for mapping placement.

**end variable list]**

* To get the value of a pool setting, execute the following command:

	ceph osd pool get {pool-name} {field}

Where:
**[locate these with proper command**

* pg_num: The placement group number.

* pgp_num: Effective number of placement groups when calculating placement.

* lpg_num: The number of local placement groups.

* lpgp_num: The number used for placing the local placement groups.

**end locate variables.]**

* To send a scrub command to OSD `{osd-num}`, execute the following command:

		ceph osd scrub {osd-num}


**Note**: To send the command to all OSDs, use <b>*</b>.

* To send a repair command to `OSD.N`, execute the following command:

		ceph osd repair N

**Note**: To send the command to all OSDs, use *.

* To run a simple throughput benchmark against `OSD.N`, execute the following command: 

		ceph osd tell N bench [BYTES_PER_WRITE] [TOTAL_BYTES]

**Note**: This writes `TOTAL_BYTES` in write requests of `BYTES_PER_WRITE` each. By default, the test writes 1 GB in total in 4-MB increments. (**can i get some more description here?**)

####MON SUBSYSTEM

The following commands shows the status of the monitor.

* To show monitor statistics, execute the following command:

		ceph mon stat

* To list the monitor nodes that are part of the current quorum, execute the following command:

		$ ./ceph quorum_status

* To get a status of just the monitor you connect to (use -m HOST:PORT to select), execute the following command:

		ceph mon_status

* To get a dump of the monitor state, execute the following command:

		ceph mon dump



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


