---
layout: default
title: "UNIX CLI Compute Examples"
permalink: /cli/unix/compute/
product: unix-cli

---
# UNIX CLI Compute Examples

<iframe src="http://player.vimeo.com/video/37689112?title=0&amp;byline=0&amp;portrait=0" width="580" height="420" frameborder="0"> </iframe>

This page gives you a few examples of how to perform various compute tasks using the HP Cloud service.  This page discusses the following tasks:

* [Flavor Commands](#FlavorCommands)
* [Image Commands](#ImageCommands)
* [Server Commands](#ServerCommands)
* [Key Pair Commands](#KeypairCommands)
* [Security Group Commands](#SecurityGroupCommands)
* [Security Group Rule Commands](#SecurityGroupRuleCommands)
* [Addresses or Floating IP Commands](#AddressesorFloatingIPCommands)

You can also find some good how-tos for the compute service on the [Using the Compute Service](compute/using) page.

Remember that you can get detailed help for any command or task with the following command:

    $ hpcloud help <TASK>

##Flavor Commands## {#FlavorCommands}

To list available flavors:

    $ hpcloud flavors
      +-----+---------+-------+------+
      | id  | name    | ram   | disk |
      +-----+---------+-------+------+
      | 100 | xsmall  | 1024  | 30   |
      | 101 | small   | 2048  | 60   |
      | 105 | 2xlarge | 32768 | 960  |
      | 103 | large   | 8192  | 240  |
      | 102 | medium  | 4096  | 120  |
      | 104 | xlarge  | 16384 | 480  |
      +-----+---------+-------+------+
    
To list one or more flavors (you can specify the flavors by name or ID):

    $ hpcloud flavors large
      +-----+-------+------+------+
      | id  | name  | ram  | disk |
      +-----+-------+------+------+
      | 103 | large | 8192 | 240  |
      +-----+-------+------+------+
    
##Image Commands## {#ImageCommands}

To list available images:

    $ hpcloud images
      +-------+------------------------------------------------------------------------+----------------------+--------+
      | id    | name                                                                   | created_at           | status |
      +-------+------------------------------------------------------------------------+----------------------+--------+
      | 75893 | BitNami DevPack 1.3-0-linux-ubuntu-12.04 64-bit - Partner Image        | 2012-12-12T08:28:56Z | ACTIVE |
      | 75845 | Ubuntu Precise 12.04 LTS Server 64-bit 20121026                        | 2012-12-11T15:35:38Z | ACTIVE |
      | 75839 | Ubuntu Quantal 12.10 Server 64-bit 20121017                            | 2012-12-11T15:20:20Z | ACTIVE |
      | 74707 | ActiveState Stackato v2.4.3 - Partner Image                            | 2012-11-06T12:38:37Z | ACTIVE |
      | 74661 | Windows Server 2008 Enterprise SP2 x86 Volume License 20121031         | 2012-11-05T11:13:41Z | ACTIVE |
      | 74659 | Windows Server 2008 Enterprise SP2 x64 Volume License 20121031         | 2012-11-05T11:03:22Z | ACTIVE |
      | 74563 | Windows Server 2008 R2 Enterprise SP1 x64 Volume License 20121005      | 2012-11-02T11:22:46Z | ACTIVE |
      | 66441 | TestImage1                                                             | 2012-10-18T21:31:46Z | ACTIVE |
      | 14345 | ActiveState Stackato v1.2.6 - Partner Image (deprecated)               | 2012-05-23T07:23:18Z | ACTIVE |
      | 9995  | EnterpriseDB PSQL 9.1.3 - Partner Image                                | 2012-05-11T04:26:51Z | ACTIVE |
      | 9953  | EnterpriseDB PPAS 9.1.2 - Partner Image                                | 2012-05-11T01:01:05Z | ACTIVE |
      +-------+------------------------------------------------------------------------+----------------------+--------+

To list one or more images (you can specify the images by name or ID):

    $ hpcloud images 9995
      +------+-----------------------------------------+----------------------+--------+
      | id   | name                                    | created_at           | status |
      +------+-----------------------------------------+----------------------+--------+
      | 9995 | EnterpriseDB PSQL 9.1.3 - Partner Image | 2012-05-11T04:26:51Z | ACTIVE |
      +------+-----------------------------------------+----------------------+--------+
    
To add a new snapshot image based on a server:

    $ hpcloud images:add myimage myserver
    Created image 'myimage' with id '121'.

To add metadata to an existing snapshot image (the metadata must be in a comma-separated list of key value pairs):

    $ hpcloud images:metadata:add myimage 'pv=nRT,e=mc2'
    Image 'myimage' set metadata 'pv=nRT,e=mc2'.

To update metadata to an existing image (the metadata must be in a comma-separated list of key value pairs):

    $ hpcloud images:metadata:update myimage 'pv=presentValue,e=eulers'
    Image 'myimage' set metadata 'pv=presentValue,e=eulers'.

To list the metadata for an existing image:

    $ hpcloud images:metadata myimage
       +-----+-------+
       | key | value |
       +-----+-------+
       | pv  | nRT   |
       | e   | mc2   |
       +-----+-------+


To remove metadata from an existing snapshot image:

    $ hpcloud images:metadata:remove myimage pv
    Removed metadata 'pv' from image 'myimage'.

To remove an existing snapshot image:

    $ hpcloud images:remove myimage
    Removed image 'myimage'.

##Server Commands## {#ServerCommands}

Newer versions of the CLI track private keys and the keys associated with servers so you can access those servers without manually specifying the key files.  The `keypairs:private` commands can be used to manage these private keys.

To list servers:

    $ hpcloud servers

To list one or more servers (you can specify the servers by name or ID):

    $ hpcloud servers mongo 1083654

To add a new server specifying an image and a flavor:

    $ hpcloud servers:add myserver 100 -i 227
    Created server 'myserver' with id '111'.

If you specify `preferred_flavor` and `preferred_image` specified in your account file, you do not need to specify them:

    $ hpcloud servers:add sameold
    Created server 'sameold' with id '112'.

To add a new server (specifying a flavor, an image, a keyname and a security group):

    $ hpcloud servers:add myserver 100 -i 227 -k mykey -s mysecgroup
    Created server 'myserver' with id '222'.

To add a new persistent server (specifying a flavor, a bootable volume, a keyname and a security group):

    $ hpcloud servers:add bat large -i 5575 -v bootable -k brat
    Created server 'bat' with id '535545'.

There is also an article about creating and [Accessing Servers with Managed Key Pairs](/cli/unix/articles/managedkeypairs).

Display the console of a server:

    $ hpcloud servers:console cli_test_srv1
    Console output for cli_test_srv1:
    * Starting regular background program processing daemon                 [ OK ]
    * Starting deferred execution scheduler                                 [ OK ]
    ...

Display the password of a windows server:

    $ hpcloud servers:console winserv4 -d

Use the secure shell to log in to a server:

    $ hpcloud servers:ssh cli_test_srv1
    Connecting to 'cli_test_srv1'...
    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-virtual x86_64)
    ...
    ubuntu@cli-test-srv1:~$

To change the password of an existing server:

    $ hpcloud servers:password myserver new_password
    Password changed for server 'myserver'.

To perform a soft or hard reboot of an existing server:

    $ hpcloud servers:reboot myserver
    Soft rebooting server 'myserver'.

    $ hpcloud servers:reboot myserver --hard
    Hard rebooting server 'myserver'.

To rebuild an existing server:

    $ hpcloud servers:rebuild myserver
    Server 'myserver' being rebuilt.

To add or update the metadata of an existing server (the metadata should be a comma-separated list of key value pairs):

    $ hpcloud servers:metadata:add myserver 'pv=nRT,e=mc2'
    Server 'myserver' set metadata 'pv=nRT,e=mc2'.

To update metadata to an existing server (the metadata should be a comma separated list of key value pairs):

    $ hpcloud servers:metadata:update myserver 'pv=presentValue,e=eulers'
    Server 'myserver' set metadata 'pv=presentValue,e=eulers'.

To list the metadata for an existing server:

    $ hpcloud servers:metadata myserver
       +-----+-------+
       | key | value |
       +-----+-------+
       | pv  | nRT   |
       | e   | mc2   |
       +-----+-------+

To remove metadata from an existing snapshot server:

    $ hpcloud servers:metadata:remove myserver pv
    Removed metadata 'pv' from server 'myserver'.

To remove an existing server or servers (you can specify one or more servers by name or ID):

    $ hpcloud servers:remove myserver 1089624
    Removed server 'myserver'.
    Removed server '1089624'.

###Creating a Windows Instance### {#WindowsServer}

There are some different parameters that must be specified to create a new windows server.  You need to specify the file that contains your private part of your key pair in PEM format and a security group with port 3389 open (for RDP). See [security group rules](/cli/unix/compute#SecurityGroupRuleCommands) on how to open a port on a security group.  Windows servers are a little slower to start up than other servers, so normally it will be a few minutes, but it may be up to fifteen minutes.

**Note**: The output for this command is the Windows Administrator password. In order to connect to the instance via the public IP and RDP, use Administrator as the `username` and the presented password for the `password`.

In the following example, `winserv` is the name of the server, `large` is the flavor name, `1000065672` is the Windows image identifier, `winpair` is the key pair name, `allowsRDP` is the security group with port 3389 open, and ` ./winpair.pem` is the .pem file location (in the current folder).

    $ hpcloud servers:add winserv large -i 1000065672 -k winpair -s allowsRDP -p ./winpair.pem
    Created server 'winserver' with id '222'.
    Retrieving password, this may take several minutes...
    Windows password: Hj67dgski)
    Make sure the security group has port 3389 open
    You may wish to change the password when you log in

An example of how to connect via a Windows RDP client is located [here](/compute/using#WindowsRDP).  You can use the `servers:console` command to extract the password if it is still available on the console.

##Key Pair Commands## {#KeypairCommands}

To list key pairs:

    $ hpcloud keypairs

To add a new key pair:

    $ hpcloud keypairs:add mykeypair
    
    -----BEGIN RSA PRIVATE KEY-----
    MIICXgIBAAKBgQC18ljyebY0GGKxLY6DHcKv1xXw3MCFaRhtXse7zgGjBejMjOz/
    ...
    /Fb5Ikzrhop4HukT/RoXeAlLegLtsLEhSJFw4W4HB/83/qsXB0/IXyG46T0FAkEA
    -----END RSA PRIVATE KEY-----
    Created key pair 'mykeypair'.

To add a new key pair and save it to a file:

    $ hpcloud keypairs:add mykeypair2 --output
    Created key pair 'mykeypair2' and saved it in a file at '/home/terry/.hpcloud/keypairs/mykeypair2.pem'.

There is also an article about creating and [Accessing Servers with Managed Key Pairs](/cli/unix/articles/managedkeypairs).

To add a new key pair by importing public key data:

    $ hpcloud keypairs:import mykeypair3 <public key data>
    Imported key pair 'mykeypair3'.

List the private keys for which the CLI has information:

    $ hpcloud keypairs:private
    cli_test_key1
    cli_test_key3
    cli_test_key4

Add a private key to the keys for which the CLI has information:

    $ hpcloud keypairs:private:add newkey ./private.pem
    Added private key '/home/terry/.hpcloud/keypairs/newkey.pem'.

Display the location of a private key associated with a server:

    $ hpcloud keypairs:private:location winserv4
    /home/terry/.hpcloud/keypairs/1664306.pem

Remove a private key:

    $ hpcloud keypairs:private:remove newkey 
    Removed private key '/home/terry/.hpcloud/keypairs/newkey.pem'.

Remove an existing key pair:

    $ hpcloud keypairs:remove mykeypair
    Removed key pair 'mykeypair'.

##Security Group Commands## {#SecurityGroupCommands}

To list security groups:

    $ hpcloud securitygroups

To add a new security group:

    $ hpcloud securitygroups:add mysecgroup "my sec group desciption"
    Created security group 'mysecgroup'.

To remove an existing security group:

    $ hpcloud securitygroups:remove mysecgroup
    Removed security group 'mysecgroup'.

##Security Group Rule Commands## {#SecurityGroupRuleCommands}

To list rules for an existing security group:

    $ hpcloud securitygroups:rules mysecgroup

To add a new rule to an existing security group:

    $ hpcloud securitygroups:rules:add mysecgroup icmp
    Created rule '1111' for security group 'mysecgroup'.

    $ hpcloud securitygroups:rules:add mysecgroup tcp -p 22..22
    Created rule '1112' for security group 'mysecgroup'.

    $ hpcloud securitygroups:rules:add mysecgroup tcp -p 80..80 -c "111.111.111.111/1"
    Created rule '1113' for security group 'mysecgroup'.

    $ hpcloud securitygroups:rules:add mysecgroup tcp -p 3389..3389 # Allow RDP
    Created rule '1113' for security group 'mysecgroup'.

To remove an existing rule from a security group:

    $ hpcloud securitygroups:rules:remove mysecgroup 1111
    Removed rule '1111' for security group 'mysecgroup'.

##Addresses or Floating IP Commands## {#AddressesorFloatingIPCommands}

To list addresses:

    $ hpcloud addresses

To add or allocate a new address:

    $ hpcloud addresses:add
    Created a public IP address '11.11.11.11'.

To associate an existing address to an existing server:

    $ hpcloud addresses:associate "11.11.11.11" myserver
    Associated address '11.11.11.11' to server 'myserver'.

To disassociate an existing address to an existing server:

    $ hpcloud addresses:disassociate "11.11.11.11" 
    Disassociated address '11.11.11.11' from any server instance.

To remove or release an existing address:

    $ hpcloud addresses:remove "11.11.11.11"
    Removed address '11.11.11.11'.
