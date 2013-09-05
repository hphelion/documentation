---
layout: default
title: "UNIX CLI Compute Examples"
permalink: /cli/unix/2/compute/
product: unix-cli

---
# UNIX CLI Compute Examples

This page addresses perfoming compute tasks using HP Cloud with examples for the following command types:

* [Flavor Commands](#FlavorCommands)
* [Image Commands](#ImageCommands)
* [Key Pair Commands](#KeypairCommands)
* [Server Commands](#ServerCommands)

Get detailed help for any command or task by running:

    $ hpcloud help <TASK>

See the following for compute service how-tos [Using the compute service](/compute/using/) page.  


See the following articles for advanced compute features:

* [User Data aka Cloud Init](/cli/unix/articles/userdata)
* [Creating Servers with Personality](/cli/unix/articles/personality)
* [Accessing Servers with Managed Keypairs](/cli/unix/articles/managedkeypairs)



##Flavor Commands## {#FlavorCommands}

To list available flavors, run:

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
    
To list one or more flavors (you can specify the flavors by name or ID), run:

    $ hpcloud flavors large
      +-----+-------+------+------+
      | id  | name  | ram  | disk |
      +-----+-------+------+------+
      | 103 | large | 8192 | 240  |
      +-----+-------+------+------+
    
##Image Commands## {#ImageCommands}

To list available images, run:

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

To list one or more images (you can specify the images by name or ID), run:

    $ hpcloud images 9995
      +------+-----------------------------------------+----------------------+--------+
      | id   | name                                    | created_at           | status |
      +------+-----------------------------------------+----------------------+--------+
      | 9995 | EnterpriseDB PSQL 9.1.3 - Partner Image | 2012-05-11T04:26:51Z | ACTIVE |
      +------+-----------------------------------------+----------------------+--------+
    
To add a new snapshot image based on a server, run:

    $ hpcloud images:add myimage myserver
    Created image 'myimage' with id '121'.

To add metadata to an existing snapshot image (the metadata must be in a comma-separated list of key value pairs), run:

    $ hpcloud images:metadata:add myimage 'pv=nRT,e=mc2'
    Image 'myimage' set metadata 'pv=nRT,e=mc2'.

To update metadata to an existing image (the metadata must be in a comma-separated list of key value pairs), run:

    $ hpcloud images:metadata:update myimage 'pv=presentValue,e=eulers'
    Image 'myimage' set metadata 'pv=presentValue,e=eulers'.

To list the metadata for an existing image, run:

    $ hpcloud images:metadata myimage
       +-----+-------+
       | key | value |
       +-----+-------+
       | pv  | nRT   |
       | e   | mc2   |
       +-----+-------+

To remove metadata from an existing snapshot image, run:

    $ hpcloud images:metadata:remove myimage pv
    Removed metadata 'pv' from image 'myimage'.

To remove an existing snapshot image, run:

    $ hpcloud images:remove myimage
    Removed image 'myimage'.


##Key Pair Commands## {#KeypairCommands}

To list key pairs, run:

    $ hpcloud keypairs

To add a new key pair, run:

    $ hpcloud keypairs:add mykeypair
    
    -----BEGIN RSA PRIVATE KEY-----
    MIICXgIBAAKBgQC18ljyebY0GGKxLY6DHcKv1xXw3MCFaRhtXse7zgGjBejMjOz/
    ...
    /Fb5Ikzrhop4HukT/RoXeAlLegLtsLEhSJFw4W4HB/83/qsXB0/IXyG46T0FAkEA
    -----END RSA PRIVATE KEY-----
    Created key pair 'mykeypair'.

To add a new key pair and save it to a file, run:

    $ hpcloud keypairs:add mykeypair2 --output
    Created key pair 'mykeypair2' and saved it in a file at '/home/terry/.hpcloud/keypairs/mykeypair2.pem'.

For additional information, see [Accessing Servers with Managed Key Pairs](/cli/unix/articles/managedkeypairs/).

To add a new key pair by importing public key data, run:

    $ hpcloud keypairs:import mykeypair3 <public key data>
    Imported key pair 'mykeypair3'.

To list the private keys for which the CLI has information, run:

    $ hpcloud keypairs:private
    cli_test_key1
    cli_test_key3
    cli_test_key4

To add a private key to the keys for which the CLI has information, run:

    $ hpcloud keypairs:private:add newkey ./private.pem
    Added private key '/home/terry/.hpcloud/keypairs/newkey.pem'.

To display the location of a private key associated with a server, run:

    $ hpcloud keypairs:private:location winserv4
    /home/terry/.hpcloud/keypairs/1664306.pem

To remove a private key, run:

    $ hpcloud keypairs:private:remove newkey 
    Removed private key '/home/terry/.hpcloud/keypairs/newkey.pem'.

To remove an existing key pair, run:

    $ hpcloud keypairs:remove mykeypair
    Removed key pair 'mykeypair'.

##Server Commands## {#ServerCommands}

Newer versions of the CLI track private keys and the keys associated with servers so you can access those servers without manually specifying the key files.  Use the `[keypairs:private](/cli/unix/2/reference#keypairs/)` commands to manage these private keys.

To list servers, run:

    $ hpcloud servers

To list one or more servers (you can specify the servers by name or ID), run:

    $ hpcloud servers mongo 1083654

To add a new server specifying an image and a flavor, run:

    $ hpcloud servers:add myserver 100 -i 227
    Created server 'myserver' with id 'a376d55d'.

If `preferred_flavor` and `preferred_image` are defined in your account file, you do not need to specify them on the command line. Run the command as follows:

    $ hpcloud servers:add sameold
    Created server 'sameold' with id 'b0245877'.

To add a new server (specifying a flavor, an image, a keyname and a security group), run:

    $ hpcloud servers:add myserver 100 -i 227 -k mykey -s mysecgroup
    Created server 'myserver' with id '9d678495'.

To add a new persistent server (specifying a flavor, a bootable volume, a keyname and a security group), run:

    $ hpcloud servers:add bat large -i 5575 -v bootable -k brat
    Created server 'bat' with id '2f574231'.

Information at the following link provides information about creating and [Accessing Servers with Managed Key Pairs](/cli/unix/articles/managedkeypairs).

To display the console of a server, run:

    $ hpcloud servers:console cli_test_srv1
    Console output for cli_test_srv1:
    * Starting regular background program processing daemon                 [ OK ]
    * Starting deferred execution scheduler                                 [ OK ]
    ...

To display the password of a windows server, run:

    $ hpcloud servers:console winserv4 -d

To log in to a server using the secure shell, run:

    $ hpcloud servers:ssh cli_test_srv1
    Connecting to 'cli_test_srv1'...
    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-virtual x86_64)
    ...
    ubuntu@cli-test-srv1:~$

To change the password of an existing server, run:

    $ hpcloud servers:password myserver new_password
    Password changed for server 'myserver'.

To perform a soft or hard reboot of an existing server, run:

    $ hpcloud servers:reboot myserver
    Soft rebooting server 'myserver'.

    $ hpcloud servers:reboot myserver --hard
    Hard rebooting server 'myserver'.

To rebuild an existing server, run:

    $ hpcloud servers:rebuild myserver
    Server 'myserver' being rebuilt.

To add or update the metadata of an existing server (the metadata must be a comma-separated list of key value pairs), run:

    $ hpcloud servers:metadata:add myserver 'pv=nRT,e=mc2'
    Server 'myserver' set metadata 'pv=nRT,e=mc2'.

To update the metadata to an existing server (the metadata must be a comma-separated list of key value pairs), run:

    $ hpcloud servers:metadata:update myserver 'pv=presentValue,e=eulers'
    Server 'myserver' set metadata 'pv=presentValue,e=eulers'.

To list the metadata for an existing server, run:

    $ hpcloud servers:metadata myserver
       +-----+-------+
       | key | value |
       +-----+-------+
       | pv  | nRT   |
       | e   | mc2   |
       +-----+-------+

To remove metadata from an existing snapshot server, run:

    $ hpcloud servers:metadata:remove myserver pv
    Removed metadata 'pv' from server 'myserver'.

To remove an existing server or servers (you can specify one or more servers by name or ID), run:

    $ hpcloud servers:remove myserver c7e35261
    Removed server 'myserver'.
    Removed server 'c7e35261'.


###Creating a Windows Instance### {#WindowsServer}

To create a Windows compute instance, you need to specify:

* The file that contains the private segment of your key pair in PEM format
* A security group with port 3389 open (for RDP); see [security group rules](/cli/unix/2/compute#SecurityGroupRuleCommands) forinformation on opening a port on a security group.  

Windows servers are a little slower to start up than other servers, taking from only a few minutes up to fifteen minutes.

In the following example, `winserv` is the name of the server, `large` is the flavor name, `1000065672` is the Windows image identifier, `winpair` is the key pair name, `allowsRDP` is the security group with port 3389 open, and ` ./winpair.pem` is the .pem file location (in the current folder). Run:

    $ hpcloud servers:add winserv large -i 1000065672 -k winpair -s allowsRDP -p ./winpair.pem
    Created server 'winserver' with id '1db7ec91'.
    Retrieving password, this may take several minutes...
    Windows password: Hj67dgski)
    Make sure the security group has port 3389 open
    You may wish to change the password when you log in
    
**Note**: The output for this command is the Windows Administrator password. To connect to the instance via the public IP and RDP, use  `username` Administrator and the presented password for `password`.

See [on the How To page](/compute/using#WindowsRDP) for an example of how to connect via a Windows RDP client.  You can use the `servers:console` command to extract the password if it is still available on the console.
