---
layout: default
title: "Unix Command Line Interface: Creating Servers with Custom User Data"
permalink: /cli/unix/articles/userdata
product: unix-cli
categories: cli linux compute servers configure user data
tags: cli linux compute user data
---
#UNIX CLI: Creating servers with custom user data#


You can use the Unix command-line interface (CLI) to create custom pre-configured servers with the [`servers:add`](/cli/unix/reference#servers:add) user data option.  The argument to the `--userdata` option is a file name that contains the configuration.  The format of the configuration data is described in the [CloudInit](https://help.ubuntu.com/community/CloudInit) site.

The simplest example of this is to pass in a shell script to run when the server is booted.  The shell script must start with the file format "magic number" hash bang and the shell to run, for example `#!/bin/sh`.  To create a server with a custom "message of the day" (defined in the `/etc/motd` file) and Unix CLI installed, an example script is:

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


When you login, the custom message of the day (motd) is displayed.  You may use the [`servers:ssh`](/cli/unix/reference#servers:ssh) command to login:

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

The script may take some time to run, but once it is complete you see:

    ubuntu@userver:~$ hpcloud info
    ******************************************************************
     HP Cloud CLI
     Command-line interface for managing HP Cloud services
     Version: 1.7.0
        SHA1: 91548959da661762ca4e88d1a7ed8bf5046e5178
     Copyright (c) 2011 Hewlett-Packard Development Company, L.P.
    ******************************************************************

If there is any problem with the user data, information about the improper data is displayed in the system console.  Use the [`servers:console`](/cli/unix/reference#servers:console) command to display the contents:

    $ hpcloud servers:console userver 1000 >out
    
