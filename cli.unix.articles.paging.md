---
layout: default
title: "Unix Command Line Interface: Modifying Report Paging"
permalink: /cli/unix/articles/paging
product: unix-cli
categories: cli linux unix
tags: report paging
---
#UNIX CLI: Modifying Report Paging#

You can use the two command-line interface (CLI) configuration settings `report_page_length` and `storage_page_length` to change the way your reports are generated:

* `report_page_length` sets the number of records that are printed for each page of a report (default is 60 records per page)
* `storage_page-length`sets the number of records for each read (default is 10,000 records)

You can change the values with the `[config:set0(/cli/unix/reference#config:set)]` command.  To change the number of records per page to 120:

    hpcloud config:set report_page_length=120

This report_page_length is only used for container and object lists.  In general, reports are typically less than 60 records.  Setting `report_page_length` to a large value causes the CLI to buffer more records before displaying them, which slows down report generation.

To change the number of records for a particular read to a value other than the default of 10,000:

    hpcloud config:set storage_page_length=5000

Setting `storage_page_open` to a very small value creates more read calls to the server, and slows down report generation. 

In general, we suggest you leave these values set to their defaults.
