---
layout: default
title: "Unix Command Line Interface: Bash Command Completion"
permalink: /cli/unix/articles/complete
product: unix-cli
categories: cli linux bash
tags: cli linux bash
---
The Unix CLI now supports bash completion so that you can tab complete on commands and options.  You must activate the command completion by running the command:

    $ hpcloud complete
    The system wide /etc/bash_completion.d/ directory exists, but is not writable.
    You may need to manually execute the bash completion script in your .bashrc
    Attempting to copy /home/terry/hp/unix_cli/completion/hpcloud file to /home/terry/.bash_completion.d/hpcloud
    Success
    $

You will probably have to create a new terminal session to activate the bash completion or you may need to logout and log back in.

##Using Bash Completion

To use the bash completion, just hit the tab key when you have a command partially typed in:

    $ hpcloud se&lt;TAB&gt;&lt;TAB&gt;
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

    $ hpcloud servers:add --&lt;TAB&gt;&lt;TAB&gt;
    --account-name       --image              --private-key-file
    --availability-zone  --key-name           --security-group
    --debug              --metadata           --volume
    $ hpcloud servers:add --

If you have enough of the command typed in to be unique, it will complete.

##Troubleshooting

If you run the command as root, the bash completion file will be installed in the system wide completion directory.   If you run the command as a regular user, it will be installed in a user specific completion directory.  Many operating systems today come with bash completion activated, but you may need to run it manually.  You may want to add something like this to your `.bashrc`

    test -f ~/.bash_completion.d/hpcloud &&  source ~/.bash_completion.d/hpcloud

Test your changes to the bashrc file before closing your current terminal session.

    source ~/.bashrc

##Uninstall

The gem uninstall does not uninstall the bash completion file, so if you uninstall the CLI, you will need to manually uninstall the completion file.  The completion file will be installed in either `/etc/bash_completion.d/hpcloud` or `~/.bash_completion.d/hpcloud`.
