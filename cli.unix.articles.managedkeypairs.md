---
layout: default
title: "Unix Command Line Interface: Accessing Servers with Managed Key Pairs"
permalink: /cli/unix/articles/managedkeypairs
product: unix-cli
categories: cli linux compute servers keypairs
tags: cli linux compute servers keypairs
---
#Accessing Servers with Managed Keypairs#

Accessing Linux instances with the Unix CLI is easier than ever with managed key pairs.  When you add a new key with the `-o` option, it is saved in your home directory under `~/.hpcloud/keypairs/`.  When you create a server with that key pair, the CLI saves that information.  For example:

* [Creating a key pair using the -o flag](#CreatingaNewKeyPair)
* [Creating a server using that new key pair](#CreatingaServer)

##Creating a Key Pair Using the -o Flag## {#CreatingaNewKeyPair}

To create a key pair using the `-o` flag with the [`keypairs:add`](/cli/unix/reference#keypairs:add):

    hpcloud keypairs:add -o KEYPAIR_NAME

Example command and output:    

    $ hpcloud keypairs:add -o myprecious
    Created key pair 'myprecious' and saved it to a file at '/home/terry/.hpcloud/keypairs/myprecious.pem'.

##Creating a Server with Your New Key Pair## {#CreatingaServer}

to create a server using the new key pair that you created in the previous example, you need to use the [`servers:add`](/cli/unix/reference#servers:add) command:

    hpcloud servers:add NAME FLAVOR_ID -i IMAGE_ID -s SECURITY_GROUP -k KEYPAIR_NAME

**Note**: You can view more configurations and examples for the `hpcloud servers:add` on the [Unix CLI compute page](/cli/unix/compute#ServerCommands).

So to create a server named `Smeagol` with the ID `721935` and the key pair with the name `myprecious`:

    $ hpcloud servers:add Smeagol large -i 75845 -s default -k myprecious
    Created server 'Smeagol' with id '721935'.
    
