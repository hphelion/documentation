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

##Image Commands## {#ImageCommands}

To list available images:

        $ hpcloud images

To add a new snapshot image based on a server:

        $ hpcloud images:add myimage myserver
        Created image 'myimage' with id '111'.

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

To list servers:

        $ hpcloud servers

To list one or more servers (you can specify the servers by name or ID):

        $ hpcloud servers mongo 1083654

To add a new server (specifying an image and a flavor):

        $ hpcloud servers:add myserver 100 -i 227
        Created server 'myserver' with id '111'.

To add a new server (specifying a flavor, an image, a keyname and a security group):

        $ hpcloud servers:add myserver 100 -i 227 -k mykey -s mysecgroup
        Created server 'myserver' with id '222'.

To add a new persistent server (specifying a flavor, a bootable volume, a keyname and a security group):

        $ hpcloud servers:add bat large -v bootable -k brat
        Created server 'bat' with id '535545'.

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

An example of how to connect via a Windows RDP client is located [here](/compute/using#WindowsRDP).

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
        Created key pair 'mykeypair2' and saved it in a file at './mykeypair2.pem'.

To add a new key pair by importing public key data:

        $ hpcloud keypairs:import mykeypair3 <public key data>
        Imported key pair 'mykeypair3'.

To remove an existing key pair:

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
