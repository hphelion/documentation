---
layout: default
title: "Unix Command Line Interface: Large File Uploads"
permalink: /cli/unix/articles/large
product: unix-cli
categories: cli linux unix
tags: large file upload download
---
#UNIX CLI: Large File Uploads#

The Unix CLI is the perfect way to upload large files.  This article contains some troubleshooting and tuning tips for uploading large files.

If you upload files larger than 1 gigabyte with the Unix CLI, they will be segmented into 1 gigabyte segments and a manifest file will be created to paste the segments back together.  If all goes well, the manifest file will be copied to a regular object and the segments and manifest will be cleaned up.

* [Tuning](#Tuning)
* [Restarting an Upload](#Restarting)
* [Manifest](#Manifest)

##Tuning## {#Tuning}

There are three configuration settings that may need tuning if you are uploading or downloading large files.  These settings are:

* read_timeout : The timeout in seconds to complete a read (default 240 seconds)
* write_timeout : The timeout in seconds to complete a write (default 240 seconds)
* storage_segment_size : The size in bytes of each segement uploaded (default one gigabyte)

Older versions of the CLI used a fairly low value for read and write time outs, so you may want to set that if you configuration files have been around a while.  If you are on an unreliable connection, you may wish to set the segment size smaller so you can have a better chance of getting a segment uploaded.  The segment size works only for uploads.  A segment size larger than five gigabytes will fail.

##Restarting an Upload## {#Restarting}

If a large file upload fails for any reason, you may retry it.  First you will need to clean up any partial segments:

    $  hpcloud list :databases -l
      +---------------------------------+------------+--...
      | sname                           | size       | t...
      +---------------------------------+------------+--...
      | three_gig.db.segment.0000000001 | 1073741824 | a...
      | three_gig.db.segment.0000000002 | 1073741824 | a...
      | three_gig.db.segment.0000000003 | 4202023    | a...
      +---------------------------------+------------+--...

Remove the partial segments:

    $ hpcloud remove :databases/three_gig.db.segment.0000000003
    Removed :databases/three_gig.db.segment.0000000003

And retry with the -r option:

    $ hpcloud copy -r three_gig.db :databases
    three_gig.db: |====================================================|
    Copied three_gig.db => :databases
    $

##Manifest## {#Manifest}

The manifest file is a virtual representation of all of the segments, so it can be used as a regular object.  If copying the manifest file to a regular object fails, you can use the manifest file instead.  If you are using the manifest file, do not remove the segments.

If your file uploaded succeeded, but the manifest copy did not work, you can attempt to just copy the manifest file.

    hpcloud copy :databases/three_gig.db.manifest :databases/three_gig.db

