---
layout: default
title: "Unix Command Line Interface: Automation and Report Customization"
permalink: /cli/unix/articles/reports
product: unix-cli
categories: cli linux object store compute reports
tags: cli linux object store compute reports
---
#UNIX CLI: Using Automation and Peforming Report Customization#

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

