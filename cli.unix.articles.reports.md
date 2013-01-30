---
layout: default
title: "Unix Command Line Interface: Automation and Report Customization"
permalink: /cli/unix/articles/reports
product: unix-cli
categories: cli linux object store compute reports
tags: cli linux object store compute reports
---
It is now easier than ever to use the Unix CLI for automation with custom reports.  Nearly all CLI reports now support the `-c` and `-d` options which give you the capability to create your own reports and also to pipe these reports to other commands or import data into programs such as Excel.

The `-c` option allows you to specify the columns in report and the order in which they appear.  For example, if you wanted a report that only contained the server public IP address, name, and id of your servers

    $ hpcloud servers -c public_ip,name,id


If you wanted only the names of your volumes:

    $ hpcloud volumes -c name

The `-d` option allows you to specify the delimiter of the report.  If you use t the option, the report will contain no headers so you can pipe the report to another command.  If you do not give the option and argument, it defaults to a comma.  You could use the output of the command to import the data into a program such as Excel:

    $ hpcloud volumes -d
    

You can change the delimeter of the report by passing it as an argument to the `-d` option:

    $ hpcloud servers -c name,public_ip -d ' '

You could pipe the output of this command to another command:

    $ hpcloud servers -c name,public_ip -d ' ' | while read NAME IP
    do
      ping -c 5 $IP || echo "${NAME} is down!!!"
    done

