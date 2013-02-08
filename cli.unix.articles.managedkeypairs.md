---
layout: default
title: "Unix Command Line Interface: Accessing Servers with Managed Key Pairs"
permalink: /cli/unix/articles/managedkeypairs
product: unix-cli
categories: cli linux compute servers keypairs
tags: cli linux compute servers keypairs
---
#Accessing Servers with Managed Keypairs#

Accessing Linux instances with the Unix CLI is easier than ever with managed key pairs.  When you add a new key with the `-o` option, it will be saved in your home directory under `~/.hpcloud/keypairs/`.  When a server is created with that key pair, the CLI will save that information.  For example:

#Create your key pair using the `-o` flag:

    hpcloud keypairs:add -o KEYPAIR_NAME

Example command and output:    

    $ hpcloud keypairs:add -o myprecious
    Created key pair 'myprecious' and saved it to a file at '/home/terry/.hpcloud/keypairs/myprecious.pem'.

#Now create a server with that key pair:

    hpcloud servers:add NAME FLAVOR_ID -i IMAGE_ID -s SECURITY_GROUP -k KEYPAIR_NAME

*NOTE:* You can view more configurations and examples for the `hpcloud servers:add` in the [Unix CLI documentation](/cli/unix/compute#ServerCommands).

Example command and output:

    $ hpcloud servers:add Smeagol large -i 75845 -s default -k myprecious
    Created server 'Smeagol' with id '721935'.
