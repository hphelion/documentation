---
layout: default
title: "Unix Command Line Interface: Bash Command Completion"
permalink: /cli/unix/articles/complete
product: unix-cli
categories: cli linux bash
tags: cli linux bash
---
#UNIX CLI: Using Bash Shell Command Completion#

The Unix CLI supports bash shell command completion.  This page covers the following topics:

* [Enabling Bash Command Completion](#Enabling)
* [Using Bash Command Completion](#Using)
* [Troubleshooting](#Troubleshooting)
* [Uninstalling](#Uninstalling)

##Enabling Bash Command Completion## {#Enabling}

Bash shell command completion allows you to use the tab key to complete commands and options.  Execute the `hpcloud complete` command to enable this functionality:

    $ hpcloud complete
    The system wide /etc/bash_completion.d/ directory exists, but is not writable.
    You may need to manually execute the bash completion script in your .bashrc
    Attempting to copy /home/terry/hp/unix_cli/completion/hpcloud file to /home/terry/.bash_completion.d/hpcloud
    Success
    $

If command completion using the tab key does not work immediately, you must either create a new terminal session, or log out and log back in again.

##Using Bash Completion## {#Using}

To use bash command completion, just hit the tab key when you have a command partially entered:

    $ hpcloud se<TAB>
    securitygroups               servers:metadata
    securitygroups:add           servers:metadata:add
    securitygroups:remove        servers:metadata:remove
    securitygroups:rules         servers:password
    securitygroups:rules:add     servers:reboot
    securitygroups:rules:remove  servers:rebuild
    servers                      servers:remove
    servers:add                  servers:ssh
    servers:console
    $ hpcloud se

The same works for options:

    $ hpcloud servers:add --<TAB>
    --account-name       --image              --private-key-file
    --availability-zone  --key-name           --security-group
    --debug              --metadata           --volume
    $ hpcloud servers:add --

When you enter enough of the command or option for it to be unique, it completes.  For example, for the `security<TAB>` example shown above, `hpcloud servers:c<TAB>` is enough to use tab completion to get the command `hpcloud servers:console`.

##Troubleshooting## {#Using}

If you run the `hpcloud complete` command as the root user, the bash completion file is installed in the system-wide completion directory.  If you run the command as a regular user, it is installed in a user-specific completion directory.  Many operating systems today come with bash completion activated, but you may need to run it manually.  You may want to add something like this to your `.bashrc` file in your home directory:

    test -f ~/.bash_completion.d/hpcloud &&  source ~/.bash_completion.d/hpcloud

Test your changes to the bashrc file before closing your current terminal session:

    source ~/.bashrc
    hpcloud servers<TAB>
    
If the `source` command gives you an error message, or the tab completion doesn't function, you may not have set up your `.bashrc` file correctly.  See your operating system documentation for more details on the how to set up your `.bashrc` file.

##Uninstalling## {#Uninstalling}

The gem uninstall does not uninstall the bash completion file, so if you uninstall the CLI, you must manually uninstall it.  The completion file is installed in either `/etc/bash_completion.d/hpcloud` or `~/.bash_completion.d/hpcloud`.
