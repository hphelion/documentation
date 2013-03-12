---
layout: default
title: "Unix Command Line Interface: Paging"
permalink: /cli/unix/articles/paging
product: unix-cli
categories: cli linux unix
tags: report paging
---
#UNIX CLI: Paging#

There are two configuration settings you can use to change the way the Unix command-line interface (CLI) pages reports report_page_length and storage_page_length.  The report_page_length is the number of records that will be printed in each page of a report.  It defaults to 60 records per page.  The value can be changed with the config:set command, for example:

    hpcloud config:set report_page_length=120

This report_page_length is only used for container and object lists at the moment.  Most other reports will most likely be less than 60 records anyway.  A large report_page_length will cause the CLI to have to buffer up more records before printing them out.

The storage_page_length is used to set the number of records in each read.  The default value is 10,000, but it can be changed with a command similar to:

    hpcloud config:set storage_page_length=5000

Setting the value to a very small number will slow down reports because there will be more reads from the server.
