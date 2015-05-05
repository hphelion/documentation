---
layout: default-devplatform
permalink: /helion/devplatform/als/user/reference/troubleshoot/
product: devplatform2.0
title: "HP Helion 1.2 Development Platform: Troubleshooting"
product-version1: HP Helion Development Platform
product-version2: HP Helion Development Platform 1.1
role1: Application Developer 
role2: ISV Developer
role3: Service Developer
role4: Systems Administrator
authors: Jayme P

---
<!--UNDER REVISION-->

# HP Helion 1.2 Development Platform: Troubleshooting[](#troubleshooting "Permalink to this headline")
[See the Helion 1.0 Development Platform version of this page](/als/v1/user/reference/troubleshoot/)

## SSH to Failed Containers[](#ssh-to-failed-containers "Permalink to this headline")

For troubleshooting and diagnostic purposes, it is possible to use helion ssh to access a [container](/helion/devplatform/als/user/reference/glossary/#term-container) that has recently failed or did not start correctly. Containers are kept for one hour before being reclaimed. See the [Command Reference](/helion/devplatform/als/user/reference/client-ref/) for details on the `helion ssh` command.

## Checking the Logs[](#checking-the-logs "Permalink to this headline")

Most Application Lifecycle Service users will not have administrative access to the server. If you need to troubleshoot an application deployment or runtime failure, you can use the helion client to view the `stderr` and `stdout` log files. For example, if an application called `myapp` did not deploy correctly, run the command:

    helion logs myapp --all

This will generally show all errors encountered during deployment.

If you need to view another log file (e.g. one specific to your
application), use the files command to explore the remote filesystem and
return the contents of the files:

    helion files myapp logs
    stderr.log                                 44B
    stdout.log                                101B
    myapp-err.log                             189B

    helion files myapp logs/myapp-err.log

If that command should fail, try using the run command in combination
with ls or cat:

    helion run myapp cat ../logs/myapp-err.log

## Specific Cases[](#specific-cases "Permalink to this headline")

**When pushing an app, the Application Lifecycle Service Client reports OK but app isn't running.**

The final output from pushing an app should look like:

    Staging Application: OK
    Starting Application: OK

If the app is being pushed to multiple instances, the client waits until at least one instance is running, and exits at that point (it does not wait until all instances are active). If afterwards you run `helion apps` and find the Health status at 0%, it is because the app crashed after starting successfully, not because the Application Lifecycle Service client reported incorrectly.

**DNS queries returning "connection refused"**

This error is reported when the Application Lifecycle Service server does not have an IP Address. To investigate and resolve, try the following:



- Verify the ARP tables on the hypervisor host, and on the Application Lifecycle Service server through its [tty console](/helion/devplatform/als/user/reference/glossary/#term-tty-console):

        arp -n



- Check that the DHCP client is running:

        pgrep dhclient
        grep dhclient /var/log/syslog



- Connect to the DHCP server and verify that it is receiving client requests from the Application Lifecycle Service server.

- If your network is statically configured, assign an IP address on the Application Lifecycle Service server by editing the [interfaces](http://manpages.ubuntu.com/manpages/man5/interfaces.5) file:

        /etc/network/interfaces
