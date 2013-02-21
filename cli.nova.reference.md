---
layout: default
title: "Python Novaclient CLI: Command Line Reference"
permalink: /cli/nova/reference/
product: nova-cli

---
#Python Novaclient CLI: Command Line Reference# 

Below you can find a full reference of supported Python Novaclient command-line interface (CLI) commands. The commands are alphabetized.  You can also use the <font face="Courier">nova help [<em>command</em>]</font> tool (where <em>command</em> is the name of the command on which you want help, for example:

    nova help volume-create
    
provides you the usage, description, and option information for the [`volume-create`](#volume-create) command.  `nova help` without any arguments provides you a list of all the available Novaclient commands.


##add-floating-ip## {#add-floating-ip}
Add a floating IP address to a server
###Syntax
`nova add-floating-ip <server> <address>`

**server**
:  Name or ID of a server

**address**
:  IP address to be added

###Example
Add the floating IP address 15.185.105.97 to instance ID 694541:

    nova add-floating-ip 694541 15.185.105.97

##add-security-group## {#add-security-group}
Adds a security group to an instance
###Syntax
`nova add-security-group <server> <secgroup>`

**server**
:  Name or ID of a server

**secgroup**
:  IP address of a server

###Example
Add the security group `default' to instance ID 694541:

    nova add-security-group 694541 default


##backup-create## {#backup-create}
Creates a backup of a Volume.
###Syntax
`nova backup-create [--container <container>] [--display_name <display_name>] [--display_description <display_description>] <volume_id>`

**container**
: Name of the container (default is `hpvolumebackups`).

**display_name**
: Name of the backup (default is none).

**display_description**
: Description of the backup (default is none).

**volume_id**
: ID of the volume to back up.

###Example
Creates a backup of volume 68453 to a container named `my-backup-container` in your HP Cloud Object Storage account:

    nova backup-create --container my-backup-container 68453

This example creates a backup of volume `68453` to a directory in the container `my-backup-container`. If you do not specify a container name, the default container name `hpvolumebackups` is used. The directory name consists of the volume ID, a timestamp, the availability zone and the backup ID.

##backup-delete## {#backup-delete}
Remove a backup.
###Syntax
`nova backup-delete <backup_id>`

**backup_id**
: ID of the volume to delete.

###Example
Delete backup ID `3` from your account:

    nova backup-delete 3


##backup-list## {#backup-list}
List all the backups
###Syntax
`nova backup-list`
###Example
Display all the created backups:

    ~$ nova backup-list
    +-----------+------+-----------+-------------+-------------+-----------------+---------------------+---------+--------------------+-----------+------+
    | Backup ID | Name |   Status  | Fail Reason | Description | Swift Container |      Created At     | Size GB | Swift Object Count | Volume ID |  AZ  |
    +-----------+------+-----------+-------------+-------------+-----------------+---------------------+---------+--------------------+-----------+------+
    | 37        | None | creating  | None        | None        | backup          | 2013-01-17 18:29:11 | 10      | None               | 68453     | None |
    +-----------+------+-----------+-------------+-------------+-----------------+---------------------+---------+--------------------+-----------+------+
    

    $ nova backup-list
    +-----------+------+-----------+-------------+-------------+-----------------+---------------------+---------+--------------------+-----------+-----+
    | Backup ID | Name |   Status  | Fail Reason | Description | Swift Container |      Created At     | Size GB | Swift Object Count | Volume ID |  AZ |
    +-----------+------+-----------+-------------+-------------+-----------------+---------------------+---------+--------------------+-----------+-----+
    | 37        | None | available | None        | None        | backup          | 2013-01-17 18:29:11 | 10      | 206                | 68453     | az1 |
    +-----------+------+-----------+-------------+-------------+-----------------+---------------------+---------+--------------------+-----------+-----+



##backup-restore## {#backup-restore}
Restore a backup
###Syntax
`nova backup-restore [--volume_id <volume_id>] <backup_id>`

**backup_id**
:  ID of the backup  to restore.

**volume_id**
:  ID of the restore target volume (optional) 

###Example
Restore backup ID `37` to volume ID `68495`:

    nova backup-restore --volume_id 68495 37

**Note**:  If you specify a `volume_id`, the contents of the referenced volume are over-written with the restored backup.


##backup-show## {#backup-show}
Show details about a backup.
###Syntax
`nova backup-show <backup_id>`

**backup_id**
:  ID of the backup  to display.

###Example
List the details about backup `37`:

    $ nova backup-show 37
    +---------------------+---------------------+
    |       Property      |        Value        |
    +---------------------+---------------------+
    | availability_zone   | az1                 |
    | container           | backup              |
    | created_at          | 2013-01-17 18:29:11 |
    | display_description | None                |
    | display_name        | None                |
    | fail_reason         | None                |
    | id                  | 37                  |
    | object_count        | 206                 |
    | size                | 10                  |
    | status              | available           |
    | volume_id           | 68453               |
    +---------------------+---------------------+
 

##boot## {#boot}
Boot a new server
###Syntax
`nova boot [--flavor <flavor>] [--image <image>] [--meta <key=value>] [--file <dst-path=src-path>] [--key_name <key_name>] [--user_data <user-data>] [--security_groups <security_groups>] [--block_device_mapping <dev_name=mapping>] [--nic <net-id=net-uuid,v4-fixed-ip=ip-addr>] [--config-drive <value>] <backup>`

**backup**
:  Name for the new server.

**flavor**
:  Flavor ID (see `nova flavor-list`).

**image**
:  Image ID (see 'nova image-list').

**meta**
: Record arbitrary key/value metadata. May be give multiple times.

**file**
:  Store arbitrary files from <src-path> locally to <dst-path> on the new server. You may store up to 5 files.

**key_name**
:  Key name of keypair that should be created earlier with the command keypair-add.
                        
**user_data**
:  User data file to pass to be exposed by the metadata server.

**security_groups**
:  Comma-separated list of security group names.
                        
**block_device_mapping**
:  Block device mapping in the format <dev_name=<id>:<type>:<size(GB)>:<delete_on_terminate>.

**nic**
:  Create a NIC on the server. Specify option multiple times to create multiple NICs. net-id: attach NIC to network with this UUID (optional) v4-fixed-ip: IPv4 fixed address for NIC (optional).

**config-drive**
:  Enable the configuration drive.

###Example
Create an XSmall Ubuntu 12.04 instance with key pair `az1` and Security Group `default` bound to it with a display name of `test`:

    $ nova boot --flavor "100" --image "75845" --key_name "az1" --security_groups "default" test
    +-----------------+----------------------------------------------------------+
    |     Property    |                          Value                           |
    +-----------------+----------------------------------------------------------+
    | accessIPv4      |                                                          |
    | accessIPv6      |                                                          |
    | adminPass       | U7ptPHdygX2YnyTy                                         |
    | config_drive    |                                                          |
    | created         | 2013-01-17T18:55:07Z                                     |
    | flavor          | standard.xsmall                                          |
    | hostId          | 6689454bf62324974d5d9d8bf62e8fbe0587530328d421044a0c8232 |
    | id              | 703829                                                   |
    | image           | Ubuntu Precise 12.04 LTS Server 64-bit 20121026          |
    | key_name        | az1                                                      |
    | metadata        | {}                                                       |
    | name            | test                                                     |
    | security_groups | default                                                  |
    | status          | BUILD(networking)                                        |
    | tenant_id       | 65589599430509                                           |
    | updated         | 2013-01-17T18:55:08Z                                     |
    | user_id         | 52552375567809                                           |
    | uuid            | d41ecb12-b232-444a-8580-6f2e3fbcb33a                     |
    +-----------------+----------------------------------------------------------+


##delete## {#delete}
Immediately shut down and delete a server.
###Syntax
`nova delete <server>`

**server**
:  Name or ID of the server.

###Example
Delete instance 703829 from your account:

    nova delete 703829


##flavor-list## {#flavor-list}
Print a list of available 'flavors' (sizes of servers).
###Syntax
`nova flavor-list`
###Example
List all available flavors:

    $ nova flavor-list
    +-----+------------------+-----------+------+----------+-------+------------+----------+
    |  ID |       Name       | Memory_MB | Swap | Local_GB | VCPUs | RXTX_Quota | RXTX_Cap |
    +-----+------------------+-----------+------+----------+-------+------------+----------+
    | 100 | standard.xsmall  | 1024      | 0    | 30       | 1     | 0          | 0        |
    | 101 | standard.small   | 2048      | 0    | 60       | 2     | 0          | 0        |
    | 102 | standard.medium  | 4096      | 0    | 120      | 2     | 0          | 0        |
    | 103 | standard.large   | 8192      | 0    | 240      | 4     | 0          | 0        |
    | 104 | standard.xlarge  | 16384     | 0    | 480      | 4     | 0          | 0        |
    | 105 | standard.2xlarge | 32768     | 0    | 960      | 8     | 0          | 0        |
    +-----+------------------+-----------+------+----------+-------+------------+----------+


##floating-ip-create## {#floating-ip-create}
Allocate a floating IP for the current tenant.
###Syntax
`nova floating-ip-create`
###Example
Allocate a floating IP for the current tenant:

    $ nova floating-ip-create
    +---------------+-------------+----------+
    |       Ip      | Instance Id | Fixed Ip |
    +---------------+-------------+----------+
    | 15.185.100.75 | None        | None     |
    +---------------+-------------+----------+


##floating-ip-delete## {#floating-ip-delete}
De-allocate a floating IP.
###Syntax
`nova floating-ip-delete <address>`

**address**
:  Address of the floating IP to be deleted.

###Example
Remove floating IP 15.185.100.75 from your account:

    nova floating-ip-delete 15.185.100.75


##floating-ip-list## {#floating-ip-list}
List floating IPs for the current tenant.
###Syntax
`nova floating-ip-list`
###Example
List the floating IPs for the current tenant:

    $ nova floating-ip-list
    +----------------+-------------+--------------+
    |       Ip       | Instance Id |   Fixed Ip   |
    +----------------+-------------+--------------+
    | 15.185.100.75  | None        | None         |
    +----------------+-------------+--------------+



##get-console-output## {#get-console-output}
Retrieves server log.
###Syntax
`nova get-console-output [--lines <lines>] <server>`

**server**
:  Name or ID of the server.

**lines**
:  Number of lines to be displayed.

###Example
Display the first 10 lines of your console output:

    $ nova get-console-output --lines 10 703829
    [    0.000000] Initializing cgroup subsys cpuset
    [    0.000000] Initializing cgroup subsys cpu
    [    0.000000] Linux version 3.2.0-32-virtual (buildd@batsu) (gcc version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) ) #51-Ubuntu SMP Wed Sep 26 21:53:42 UTC 2012 (Ubuntu 3.2.0-32.51-virtual 3.2.30)
    [    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-3.2.0-32-virtual root=LABEL=cloudimg-rootfs ro console=ttyS0
    [    0.000000] KERNEL supported cpus:
    [    0.000000]   Intel GenuineIntel
    [    0.000000]   AMD AuthenticAMD
    [    0.000000]   Centaur CentaurHauls
    [    0.000000] BIOS-provided physical RAM map:
    [    0.000000]  BIOS-e820: 0000000000000000 - 000000000009bc00 (usable)


##image-create## {#image-create}
Create a new image by taking a snapshot of a running server.
###Syntax
`nova image-create <server> <name>`

**server**
:  Name or ID of server.
**name**
:  Name of snapshot.

###Example
Create a snapshot of your instance ID 703829 with a display name of `testimage`:

    nova image-create 703829 testimage


##image-delete## {#image-delete}
Delete an image.
###Syntax
`nova image-delete <image>`

**image**
:  Name or ID of the image to delete.

###Example
Delete the snapshot image `77935`:

    nova image-delete 77935


##image-list## {#image-list}
Display a list of available images to boot from.
###Syntax
`nova image-list`
###Examples
Display a list of the available bootable images:

    $ nova image-list
    +-------+------------------------------------------------------------------------    +--------+--------------------------------------+
    |   ID  |                                  Name                                  | Status |                Server                |
    +-------+------------------------------------------------------------------------+--------+--------------------------------------+
    | 1232  | CentOS 5.6 Server 64-bit 20111207 (Kernel) (deprecated)                | ACTIVE |                                      |
    | 1233  | CentOS 5.6 Server 64-bit 20111207 (Ramdisk) (deprecated)               | ACTIVE |                                      |
    | 1234  | CentOS 5.6 Server 64-bit 20111207 (deprecated)                         | ACTIVE |                                      |
    | 1235  | Ubuntu Lucid 10.04 LTS Server 64-bit 20111212 (Kernel)                 | ACTIVE |                                      |
    | 1236  | Ubuntu Lucid 10.04 LTS Server 64-bit 20111212                          | ACTIVE |                                      |
    | 1237  | Ubuntu Maverick 10.10 Server 64-bit 20111212 (Kernel)                  | ACTIVE |                                      |
    | 1238  | Ubuntu Maverick 10.10 Server 64-bit 20111212                           | ACTIVE |                                      |
    | 1239  | Ubuntu Natty 11.04 Server 64-bit 20111212 (Kernel)                     | ACTIVE |                                      |
    | 9127  | ActiveState Stackato v1.2.5 - Partner Image (deprecated)               | ACTIVE |                                      |
    | 9953  | EnterpriseDB PPAS 9.1.2 - Partner Image                                | ACTIVE |                                      |
    | 9995  | EnterpriseDB PSQL 9.1.3 - Partner Image                                | ACTIVE |                                      |
    +-------+------------------------------------------------------------------------+--------+--------------------------------------+


##image-meta## {#image-meta}
Set or Delete metadata on an image.
###Syntax
`nova image-meta  <image> [<action> <key=value> [<key=value> …]]`

**image**
:  Name or ID of image.

**action**
:  Actions: `set` or `delete`.

**key=value**
:  Metadata to add/update or delete.

###Example
Set a metadata key `purpose` with value `test` on image ID 77937

    nova image-meta 77937 set purpose=test


##image-show## {#image-show}
Display details about the given image.
###Syntax
`nova image-show <image>`

**image**
:  Name or ID of the image.

###Example
Display details of your image including all set metadata values:

    $ nova image-show 77937
    +-------------------------+------------------------------------------------------------------------------------------------------+
    |         Property        |                                                Value                                                 |
    +-------------------------+------------------------------------------------------------------------------------------------------+
    | created                 | 2013-01-17T19:08:10Z                                                                                 |
    | id                      | 77937                                                                                                |
    | metadata architecture   | amd64                                                                                                |
    | metadata backup_type    | None                                                                                                     |
    | metadata image_location | snapshot                                                                                             |
    | metadata image_state    | available                                                                                            |
    | metadata image_type     | snapshot                                                                                             |
    | metadata instance_ref   | https://az-1.region-a.geo-1.compute.hpcloudsvc.com/v1.1/servers/d41ecb12-b232-444a-8580-6f2e3fbcb33a |
    | metadata instance_uuid  | d41ecb12-b232-444a-8580-6f2e3fbcb33a                                                                 |
    | metadata kernel_id      | None                                                                                                 |
    | metadata min_disk       | 0                                                                                                    |
    | metadata min_ram        | 0                                                                                                    |
    | metadata owner          | 65589599430509                                                                                       |
    | metadata owner_id       | 65589599430509                                                                                       |
    | metadata purpose        | test                                                                                                 |
    | metadata ramdisk_id     | None                                                                                                 |
    | metadata true           | false                                                                                                |
    | metadata user_id        | 52552375567809                                                                                       |
    | name                    | testimage                                                                                            |
    | progress                | 100                                                                                                  |
    | server                  | d41ecb12-b232-444a-8580-6f2e3fbcb33a                                                                 |
    | status                  | ACTIVE                                                                                               |
    | updated                 | 2013-01-17T19:08:38Z                                                                                 |
    +-------------------------+------------------------------------------------------------------------------------------------------+


##keypair-add## {#keypair-add}
Create a new key pair for use with instances
###Syntax
`nova keypair-add <name>`

**name**
:  Name of the key pair.

###Example
Create a new key pair to use with instances:

    $ nova keypair-add testkeypair
    -----BEGIN RSA PRIVATE KEY-----
    MIICXQIBAAKBgQC4H2v8lZAgikx/1hYX/cfoDT7Z9JbxVyTYS31urEZMa07qh8MT
    76VudZbWkZZ8nw38nQEqVChhhxUXLUdUbzWboIytx/JJETbiEF9sfUj9nQe4I81C
    dll0cTYSREUmwmbZgXXXXXXSIiT0uTRia6E2SL6m3PVaURThkqz+G9EjswIDAQAB
    AoGBAIgt9Vij5i2rHFmQplaoRSrEYTAjT2DA62durh8lG/l5hKzCLO6Z2OmR3zZk
    B8G0gkvMdAgypos7tcWmn5M7jZGDvlTjQNC7rizN6mOvLJ8haGFI6xiq898uVzi+
    K+syLjxvVO1lzcaIV/3abhMlXXXXXX9+Ve01gLELzlu11ReBAkEA5lHeAgh4cwjR
    pZz/j+gs48SjdEebVK6fplftUedyqfD9F9chlAPXPr6oOhPGEqhu6YzT6hCYhA1K
    gC6u5TsR2wJBAMym7dj7Exj3uf3h5OmS7yeqwELJX4aqe2CSei5hX0PjFnG0TMTz
    Llw0HSmXGIv0N/gpNDRP4ylGbOGXXXXXXXXCQBxeKQIHGQ7SH0BOvgtzhVPofFlu
    GGuttmw+mDRmVXEpBYNSNAiPEIvh38aHePYDWOXbOp6xvJdHK83t8gy54dECQBVH
    Leengz7PUvlAXXXXXXXXXXJAubvosddCo4169kq6q7S6yFiZ6DISAQ439YdnpwIY
    VqMxwy6hceSuoo4WgvECQQC1eZgEGoRqrOK7XEfc3zDrJa6iXILmhUQhIQEXgxyB
    c5S1JbVjp8HwF+imbEz5rSxjqOSniY1aFbYWQmzW/cqM
    -----END RSA PRIVATE KEY-----


##keypair-delete## {#keypair-delete}
Delete a key pair (designatedby its ID).
###Syntax
`nova keypair-delete <name>`

**name**
:  Name of the key pair.

###Example
Delete the key pair `testkeypair`:
    
    nova keypair-delete testkeypair


##keypair-list## {#keypair-list}
Display the key pairs for a user
###Syntax
`nova keypair-list`
###Example
Display the key pairs:

    $ nova keypair-list
    +-------------+-------------------------------------------------+
    |     Name    |                   Fingerprint                   |
    +-------------+-------------------------------------------------+
    | testkeypair | 02:fb:dc:3d:e9:c8:26:29:f9:0e:9d:53:71:5c:05:92 |
    +-------------+-------------------------------------------------+


##list## {#list}
List active servers.
###Syntax
`nova list [--reservation_id <reservation_id>] [--recurse_zones <0|1>] [--ip <ip_regexp>] [--ip6 <ip6_regexp>] [--name <name_regexp>] [--instance_name <name_regexp>] [--status <status>] [--flavor <flavor>] [--image <image>] [--host <hostname>]`

**reservation_id**
:  Only return instances that match reservation_id.

**recurse_zones**
:  Recurse through all zones if set.

**ip**
:  Search with regular expression match by IP address.

**ip6**
:  Search with regular expression match by IPv6 address.

**name**
:  Search with regular expression match by name.

**instance_name**
:  Search with regular expression match by instance name.

**status**
:  Search by server status. 

**flavor**
:  Search by flavor ID.

**image**
:  Search by image ID.

**host**
:  Search instances by hostname to which they are assigned

###Example
List the active servers:

    $ nova list
    +--------+---------------------------------------+--------+-----------------------------------------------------------------------------------+
    |   ID   |                  Name                 | Status |                                      Networks                                     |
    +--------+---------------------------------------+--------+-----------------------------------------------------------------------------------+
    | 703829 | test                                  | ACTIVE | private=10.4.160.226, 15.185.102.46                                               |
    +--------+---------------------------------------+--------+-----------------------------------------------------------------------------------+


##meta## {#meta}
Set or Delete metadata on a server.
###Syntax
`nova meta  <server> [<action> <key=value> [<key=value> …]]`

**server**
:  Name or ID of server.

**action**
:  Actions: `set` or `delete`.

**key=value**
:  Metadata to add/update or delete.

###Example
Set metadata for server `703829` for test purposes:

    nova meta 703829 set purpose=test


##reboot## {#reboot}
Reboot a server.
###Syntax
`nova reboot [--hard] <server>`

**hard**
:  Perform a hard reboot of the server.

###Example
Perform a hard reboot on the server 703829:

    nova reboot 703829


##rebuild## {#rebuild}
Shutdown, re-image, and re-boot a server.
###Syntax
`nova rebuild [--rebuild_password <rebuild_password>] <server> <image>`

**rebuild_password**
:  Password for the rebuild instance.

**server**
:  Name or ID of the server.

**image**
:  Name or ID of the new image.

###Example
Rebuild serveer 703829 with image 75845:

    $ nova rebuild 703829 75845
    +-----------------+----------------------------------------------------------+
    |     Property    |                          Value                           |
    +-----------------+----------------------------------------------------------+
    | accessIPv4      |                                                          |
    | accessIPv6      |                                                          |
    | adminPass       | vhDogQ6Y2pfqbGDP                                         |
    | config_drive    |                                                          |
    | created         | 2013-01-17T18:55:07Z                                     |
    | flavor          | standard.xsmall                                          |
    | hostId          | 6689454bf62324974d5d9d8bf62e8fbe0587530328d421044a0c8232 |
    | id              | 703829                                                   |
    | image           | Ubuntu Precise 12.04 LTS Server 64-bit 20121026          |
    | key_name        | az1                                                      |
    | metadata        | {}                                                       |
    | name            | test                                                     |
    | private network | 10.4.160.226, 15.185.102.46                              |
    | security_groups | default                                                  |
    | status          | REBUILD                                                  |
    | tenant_id       | 65589599430509                                           |
    | updated         | 2013-01-17T19:15:30Z                                     |
    | user_id         | 52552375567809                                           |
    | uuid            | d41ecb12-b232-444a-8580-6f2e3fbcb33a                     |
    +-----------------+----------------------------------------------------------+


##remove-floating-ip## {#remove-floating-ip}
Remove a floating IP address from a server.
###Syntax
`nova remove-floating-ip <server> <address>`

**server**
:  Name or ID of the server.

**address**
:  IP address.

###Example
Remove floating IP value `15.185.105.97` from server `694541`:

    nova remove-floating-ip 694541 15.185.105.97


##remove-security-group## {#remove-security-group}
Removes a security group from an instance
###Syntax
`nova remove-security-group <server> <secgroup>`

**server**
:  Name or ID of the server.

**secgroup**
:  Name of the security group.

###Example
Remove security group default from server `703829`:

     nova remove-security-group 703829 default


##rename## {#rename}
Rename a server.
###Syntax
`nova rename <server> <name>`

**server**
:  The current name of the server you want to change.

**name**
:  New name for the server.

###Example
Rename server `703829` to `test`:

    nova rename 703829 test


<!--##root-password## {#root-password}
Change the root password for a server.
###Syntax
`nova root-password <server>`

**server**
:  Name or ID of the server.

###Examples-->


##secgroup-add-group-rule## {#secgroup-add-group-rule}
Add a source group rule to a security group.
###Syntax
`nova secgroup-add-group-rule  [--ip_proto <ip_proto>] [--from_port <from_port>] [--to_port <to_port>] <secgroup> <source_group>`

**secgroup**
:  ID of the security group.

**source_group**
:  ID of source group.

**ip_proto**
:  IP protocol type (ICMP, TCP, or UDP).

**from_port**
:  Port at start of range.

**to_port**
:  Port at the end of range.

###Examples
Example 1

Add a single rule to the `pgroup` security group to allows all traffic between instances that are associated with it:

    $ nova secgroup-add-group-rule pgroup pgroup
    +-------------+-----------+---------+----------+--------------+
    | IP Protocol | From Port | To Port | IP Range | Source Group |
    +-------------+-----------+---------+----------+--------------+
    |             |           |         |          | pgroup       |
    +-------------+-----------+---------+----------+--------------+
    
Example 2

Enable any instance assigned the `default` security group to access any instance assigned the `pgroup` security group over TCP Port 80:

    $ nova secgroup-add-group-rule --ip_proto "TCP" --from_port "80" --to_port "80" pgroup default
    +-------------+-----------+---------+----------+--------------+
    | IP Protocol | From Port | To Port | IP Range | Source Group |
    +-------------+-----------+---------+----------+--------------+
    | tcp         | 80        | 80      |          | default      |
    +-------------+-----------+---------+----------+--------------+


##secgroup-add-rule## {#secgroup-add-rule}
Add a rule to a security group.
###Syntax
`nova secgroup-add-rule <secgroup> <ip_proto> <from_port> <to_port> <cidr>`

**secgroup**
:  ID of the security group.

**ip_proto**
:  IP protocol type (ICMP, TCP, or UDP).

**from_port**
:  Port at start of range.

**to_port**
:  Port at the end of range.

**cidr**
:  Classless inter-domain routing (CIDR) for the address range.

###Examples
Add a rule to group `pgroup`:

    $ nova secgroup-add-rule pgroup TCP 80 80 0.0.0.0/0
    +-------------+-----------+---------+-----------+--------------+
    | IP Protocol | From Port | To Port |  IP Range | Source Group |
    +-------------+-----------+---------+-----------+--------------+
    | tcp         | 80        | 80      | 0.0.0.0/0 |              |
    +-------------+-----------+---------+-----------+--------------+


##secgroup-create## {#secgroup-create}
Create a security group.
###Syntax
`nova secgroup-create <name> <description>`

**name**
:  Name of the security group.

**description**
:  Description of the security group.

###Examples
Create a security group `pgroup    `:

    $ nova secgroup-create pgroup testing
    +--------+-------------+
    |  Name  | Description |
    +--------+-------------+
    | pgroup | testing     |
    +--------+-------------+


##secgroup-delete## {#secgroup-delete}
Delete a security group.
###Syntax
`nova secgroup-delete <secgroup>`

**secgroup**
:  Name of the security group.

###Examples
Delete the security group `pgroup`:

    nova secgroup-delete pgroup


##secgroup-delete-group-rule## {#secgroup-delete-group-rule}
Delete a source group rule from a security group.
###Syntax
`nova secgroup-delete-group-rule[--ip_proto <ip_proto>] [--from_port <from_port>] [--to_port <to_port>] <secgroup> <source_group>`

**secgroup**
:  ID of the security group.

**source_group**
:  ID of source group.

**ip_proto**
:  IP protocol type (ICMP, TCP, or UDP).

**from_port**
:  Port at start of range.

**to_port**
:  Port at the end of range.

###Examples
Delete a group rule from security group `pgroup`:

    nova secgroup-delete-group-rule pgroup pgroup


##secgroup-delete-rule## {#secgroup-delete-rule}
Delete a rule from a security group.
###Syntax
`nova secgroup-delete-rule <secgroup> <ip_proto> <from_port> <to_port> <cidr>`

**secgroup**
:  ID of the security group.

**ip_proto**
:  IP protocol type (ICMP, TCP, or UDP).

**from_port**
:  Port at start of range.

**to_port**
:  Port at the end of range.

**cidr**
:  Classless inter-domain routing (CIDR) for the address range.

###Examples
Delete a rule from security group `pgroup`:

    nova secgroup-delete-rule pgroup tcp 22 22 0.0.0.0/0


##secgroup-list## {#secgroup-list}
List security groups for the curent tenant.
###Syntax
`nova secgroup-list`
###Examples
List the security groups for the current tenant:

    $ nova secgroup-list
    +-----------+-----------------------------------------------------+
    |    Name   |                     Description                     |
    +-----------+-----------------------------------------------------+
    | default   | default                                             |
    | pgroup    | testing                                             |
    +-----------+-----------------------------------------------------+


##secgroup-list-rules## {#secgroup-list-rules}
List rules for a security group.
###Syntax
`nova secgroup-list-rules <secgroup>`

**secgroup**
:  Name of the security group

###Examples
List the rules for security group `pgroup`:

    $ nova secgroup-list-rules pgroup
    +-------------+-----------+---------+-----------+--------------+
    | IP Protocol | From Port | To Port |  IP Range | Source Group |
    +-------------+-----------+---------+-----------+--------------+
    |             |           |         |           | pgroup       |
    | tcp         | 80        | 80      |           | default      |
    | tcp         | 80        | 80      | 0.0.0.0/0 |              |
    +-------------+-----------+---------+-----------+--------------+


##show## {#show}
Display details about the given server.
###Syntax
`nova show <server>`

**server**
:  Name or ID of the server.

###Examples
Display the details for server `703829`:

    $ nova show 703829
    +-----------------+----------------------------------------------------------+
    |     Property    |                          Value                           |
    +-----------------+----------------------------------------------------------+
    | accessIPv4      |                                                          |
    | accessIPv6      |                                                          |
    | config_drive    |                                                          |
    | created         | 2013-01-17T18:55:07Z                                     |
    | flavor          | standard.xsmall                                          |
    | hostId          | 6689454bf62324974d5d9d8bf62e8fbe0587530328d421044a0c8232 |
    | id              | 703829                                                   |
    | image           | Ubuntu Precise 12.04 LTS Server 64-bit 20121026          |
    | key_name        | az1                                                      |
    | metadata        | {u'purpose': u'test'}                                    |
    | name            | test                                                     |
    | private network | 10.4.160.226, 15.185.102.46                              |
    | progress        | 100                                                      |
    | security_groups | default                                                  |
    | status          | ACTIVE                                                   |
    | tenant_id       | 65589599430509                                           |
    | updated         | 2013-01-17T19:08:42Z                                     |
    | user_id         | 52552375567809                                           |
    | uuid            | d41ecb12-b232-444a-8580-6f2e3fbcb33a                     |
    +-----------------+----------------------------------------------------------+


##volume-attach## {#volume-attach}
Attach a volume to a server.
###Syntax
`nova volume-attach <server> <volume> <device>`

**server**
:  Name or ID of the server.

**volume**
:  ID of the volume to attach.

**device**
:  Name of the device; for example `/dev/vdb`.

###Examples
Attach volume `68453` to server `703663`:

    nova volume-attach 703663 68453 /dev/vdc


##volume-create## {#volume-create}
Add a new volume.
###Syntax
`nova volume-create [--snapshot_id <snapshot_id>] [--image_id <image_id>] [--display_name <display_name>] [--display_description <display_description>] <size>`

**size**
:  Size of volume in gigabytes (GB).

**snapshot_id**
:  Snapshot ID from which to create the volume. (Default=`None`)

**image_id**
:  Image ID from which to create the volume. (Default=`None`)

**display_name**
:  Volume name. (Default=None)

**display_description**
:  Volume description. (Default=None)

###Examples
Add a 10GB volume with the name `volsnaptest` to the volume with the snapshot ID `939`: 

    nova volume-create --snapshot_id 939 --display_name volsnaptest 10


##volume-delete## {#volume-delete}
Remove a volume.
###Syntax
`nova volume-delete <volume>`

**volume**
:  ID of the volume to delete.

###Examples
Delete volume `76677`:

    nova volume-delete 7667


##volume-detach## {#volume-detach}
Detach a volume from a server.
###Syntax
`nova volume-detach <server> <volume>`

**server**
:  Name or ID of the server.

**volume**
:  Attachment ID of the volume.

###Examples
Detatch volume `68453` from server `703663

    nova volume-detach 703663 68453


##volume-list## {#volume-list}
List all the volumes
###Syntax
`nova volume-list`
###Examples
List all the volumes:

    $ nova volume-list
    +-------+-----------+--------------+------+-------------+
    |   ID  |   Status  | Display Name | Size | Attached to |
    +-------+-----------+--------------+------+-------------+
    | 76677 | available | voltest      | 10   | None        |
    +-------+-----------+--------------+------+-------------+


##volume-show## {#volume-show}
Display details about a volume.
###Syntax
`nova volume-show <volume>`

**volume**
:  ID of the volume.

###Examples
Display the details for volume `76677`:

    $ nova volume-show 76677
    +--------------------+---------------------+
    |      Property      |        Value        |
    +--------------------+---------------------+
    | attachments        | [{}]                |
    | availabilityZone   | nova                |
    | createdAt          | 2013-01-17 21:00:38 |
    | displayDescription | None                |
    | displayName        | voltest             |
    | id                 | 76677               |
    | metadata           | {}                  |
    | size               | 10                  |
    | snapshotId         |                     |
    | status             | available           |
    | volumeType         | None                |
    +--------------------+---------------------+


##volume-snapshot-create## {#volume-snapshot-create}
Add a new snapshot.
###Syntax
`nova volume-snapshot-create [--force <True|False>] [--display_name <display_name>] [--display_description <display_description>] <volume_id>`
                                   
**volume_id**
:  ID of the volume to snapshot

**force**
:  Indicate whether to take a snapshot of a volume even if its attached to an instance. (Default=`False`)

**display_name**
:  Snapshot name. (Default=`None`)

**display_description**
:  Snapshot description. (Default=None)
                                   
###Examples
Create a new snapshot for volume `76677`:

    nova volume-snapshot-create 76677


##volume-snapshot-delete## {#volume-snapshot-delete}
Remove a snapshot.
###Syntax
`nova volume-snapshot-delete <snapshot_id>`

**snapshot_id**
:  ID of the snapshot to delete.

###Examples
Remove snapshot `939`:

    nova volume-snapshot-delete 939


##volume-snapshot-list## {#volume-snapshot-list}
List all the snapshots.
###Syntax
`nova volume-snapshot-list`
###Examples
List all the snapshots:

    $ nova volume-snapshot-list
    +-----+-----------+----------------+--------------+------+
    |  ID | Volume ID |     Status     | Display Name | Size |
    +-----+-----------+----------------+--------------+------+
    | 939 | 76677     | available      | None         | 10   |
    +-----+-----------+----------------+--------------+------+


##volume-snapshot-show## {#volume-snapshot-show}
Display details about a snapshot.
###Syntax
`nova volume-snapshot-show <snapshot>`

**snapshot**
:  ID of the snapshot.

###Examples
Display the details for snapsot `939`:

    $ nova volume-snapshot-show 939
    +--------------------+---------------------+
    |      Property      |        Value        |
    +--------------------+---------------------+
    | createdAt          | 2013-01-17 21:02:29 |
    | displayDescription | None                |
    | displayName        | None                |
    | id                 | 939                 |
    | size               | 10                  |
    | status             | available           |
    | volumeId           | 76677               |
    +--------------------+---------------------+