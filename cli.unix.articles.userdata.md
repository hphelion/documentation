---
layout: default
title: "Unix Command Line Interface: Creating Servers with Custom User Data"
permalink: /cli/unix/articles/userdata
product: unix-cli
categories: cli linux compute servers configure user data
tags: cli linux compute user data
---
#UNIX CLI: Creating Servers with Custom User Data#


The Unix command-line interface (CLI) can be used to create custom preconfigured servers with the [`servers:add`](/cli/unix/reference#servers:add) user data option.  The argument to the `--userdata` option is a file name that contains the configuration.  The format of the configuration data is described in the [CloudINit](https://help.ubuntu.com/community/CloudInit) site.

The simplest example of this would be to pass in a shell script to run when the server is booted.  The shell script must start with the file format "magic number" hash bang and the shell to run, for example `#!/bin/sh`.  If you wanted to create a server that had a custom /etc/motd and the Unix CLI installed on it, you might use a shell script like this:

    #!/bin/sh
    echo '**** Starting Create Unix CLI Server ****'
    cat >/etc/motd.tail <<!
    ####################################################
    Unix CLI Server
    ####################################################
    !
    apt-get update
    apt-get install -y ruby1.8 ruby-dev
    apt-get install -y rubygems
    apt-get install -y libxml2 libxml2-dev libxslt1-dev libxslt1.1 sgml-base xml-core
    gem install rdoc
    curl -sL https://docs.hpcloud.com/file/hpfog.gem >hpfog.gem
    gem install hpfog.gem
    curl -sL https://docs.hpcloud.com/file/hpcloud.gem >hpcloud.gem
    sudo gem install hpcloud.gem
    echo '**** Finished Create Unix CLI Server ****'


Use the `-u` option to pass in the file name for the user data:

    $ hpcloud servers:add userver large -k kwikset -i 75845 -u userdata.sh
    Created server 'userver' with id '973965'.


When you login, You will see the custom motd (message of the day).  You may use the [`servers:ssh`](/cli/unix/reference#servers:ssh) command to login:

    $ hpcloud servers:ssh userver
    Connecting to 'userver'...
    The authenticity of host '15.185.121.226 (15.185.121.226)' cannot be established.
    ECDSA key fingerprint is cf:05:ed:65:4b:77:11:35:9c:25:9b:92:4a:66:77:fa.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added '15.185.121.226' (ECDSA) to the list of known hosts.
    Welcome to Ubuntu 12.04.1 LTS (GNU/Linux 3.2.0-32-virtual x86_64)
    ...
    Get cloud support with Ubuntu Advantage Cloud Guest
      http://www.ubuntu.com/business/services/cloud
    ####################################################
    Unix CLI Server
    ####################################################
    ...
    ubuntu@userver:~$

The script may take a while to run, but once it is complete:

    ubuntu@userver:~$ hpcloud info
    ******************************************************************
     HP Cloud CLI
     Command-line interface for managing HP Cloud services
     Version: 1.7.0
        SHA1: 91548959da661762ca4e88d1a7ed8bf5046e5178
     Copyright (c) 2011 Hewlett-Packard Development Company, L.P.
    ******************************************************************

If there is any problem with the user data, the output may appear in the console.  Use the [`servers:console`](/cli/unix/reference#servers:console) command to dump the contents of the console:

    $ hpcloud servers:console userver 1000 >out
    
