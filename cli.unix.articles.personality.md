---
layout: default
title: "Unix Command Line Interface: Creating Servers with Personality"
permalink: /cli/unix/articles/personality
product: unix-cli
categories: cli linux compute servers configure personality
tags: cli linux compute personality
---
#UNIX CLI: Creating servers with custom Personality#


You can use the Unix command-line interface (CLI) to create custom pre-configured servers with the [`servers:add`](/cli/unix/reference#servers:add) personality option.  The argument to the `--personality` option is a directory that contains the files you want to add to the newly created server.  The files should be stored in the directory as if the directory was the root file system of the server.  For example if you had a directory:

    terry@brat:~$ find rootdir/ -type f
    rootdir/etc/apache2/sites-available/100www
    rootdir/home/ubuntu/.profile

Use the `--personality` option to pass in the personality directory:

    $ hpcloud servers:add userver large -k kwikset -i 75845 --personality rootdir
    Created server 'userver' with id '973965'.

The server will be created with the files in your personality directory.  In this example, the `/etc/apache2/sites-available/100www` and `/home/ubuntu/.profile` files will be created.

There are limits to the number and size of the files that can be used with.  Use the `hpcloud servers:limits` command to see the personality limits.
