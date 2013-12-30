---
layout: default
title: "Unix Command Line Interface: Generating custom reports"
permalink: /cli/unix/articles/reports
product: unix-cli
categories: cli linux object store compute reports
tags: cli linux object store compute reports
---
#UNIX CLI: Generating custom reports#

___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

After 6-months, access to online resources will still be available, but no support will be offered from HP Public Cloud, and the software download will be disabled—although you are most welcome to continue development at your discretion! HP Cloud has contributed the Unix CLI back to the open source community, and you can access the source code, documentation, and downloads [here](https://github.com/hpcloud/unix_cli).

_________________________________________

You can use the Unix command-line interface (CLI) for automating custom report generation.  Nearly all CLI reports support the `-c` (columns) and `-d` (delimiter) options which allow you to create your own reports and to pipe (`|`) these reports to other commands or import the report data into programs such as Excel.

The `-c` option allows you to specify the columns in report and the order in which they appear.  For example, if you want a report that only contained the public IP address, name, and ID of your servers:

    $ hpcloud servers -c public_ip,name,id


If you want only the names of your volumes:

    $ hpcloud volumes -c name

The `-d` option allows you to specify the delimiter of the report.  If you use the `d` option the report contains no headers, which allows you to pipe the report to another command.  (The default delimiter is a comma [`,`].)  You can use the output of the command to import the data into an external program (such as Excel):

    $ hpcloud volumes -d
    
You can then import the information this report's data by copying it from the display and pasting it into a different program, redirecting it to a file and accessing that file from another program, or however you wish.

You can change the delimeter of the report by passing it as an argument to the `-d` option:

    $ hpcloud servers -c name,public_ip -d ' '

You can pipe the output of this command to another command:

    $ hpcloud servers -c name,public_ip -d ' ' | while read NAME IP
    do
      ping -c 5 $IP || echo "${NAME} is down!!!"
    done


##For more information## {#articles}

For more tips and How-tos on using your UNIX command-line interface (CLI), see [UNIX CLI: Articles on to use the UNIX CLI](/cli/unix/articles/).
